#BSD 3-Clause License
#=======
#
#Copyright (c) 2017, Xilinx Inc.
#All rights reserved.
#
#Based Matthieu Courbariaux's MNIST example code
#Copyright (c) 2015-2016, Matthieu Courbariaux
#All rights reserved.
#
#Redistribution and use in source and binary forms, with or without
#modification, are permitted provided that the following conditions are met:
#
#    * Redistributions of source code must retain the above copyright
#      notice, this list of conditions and the following disclaimer.
#    * Redistributions in binary form must reproduce the above copyright
#      notice, this list of conditions and the following disclaimer in the
#      documentation and/or other materials provided with the distribution.
#    * Neither the name of the copyright holder nor the names of its 
#      contributors may be used to endorse or promote products derived from 
#      this software without specific prior written permission.
#
#THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS ''AS IS'' AND ANY
#EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
#WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
#DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS BE LIABLE FOR ANY
#DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
#(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
#LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
#ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
#(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
#SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

from __future__ import print_function

import sys
import os
import time
from argparse import ArgumentParser

import numpy as np
np.random.seed(1234)  # for reproducibility

# specifying the gpu to use
# import theano.sandbox.cuda
# theano.sandbox.cuda.use('gpu1') 
import theano
import theano.tensor as T

import lasagne

import cPickle as pickle
import gzip

import quantized_net
import lfc

from pylearn2.datasets.mnist import MNIST
from pylearn2.utils import serial

from collections import OrderedDict

if __name__ == "__main__":
    # Parse some command line options
    parser = ArgumentParser(
        description="Train the LFC network on the MNIST dataset")
    parser.add_argument('-ab', '--activation-bits', type=int, default=1, choices=[1, 2],
        help="Quantized the activations to the specified number of bits, default: %(default)s")
    parser.add_argument('-wb', '--weight-bits', type=int, default=1, choices=[1],
        help="Quantized the weights to the specified number of bits, default: %(default)s")
    args = parser.parse_args()

    learning_parameters = OrderedDict()

    # Quantization parameters
    learning_parameters.activation_bits = args.activation_bits
    print("activation_bits = "+str(learning_parameters.activation_bits))
    learning_parameters.weight_bits = args.weight_bits
    print("weight_bits = "+str(learning_parameters.weight_bits))

    # BN parameters
    batch_size = 100
    print("batch_size = "+str(batch_size))
    # alpha is the exponential moving average factor
    # alpha = .15
    learning_parameters.alpha = .1
    print("alpha = "+str(learning_parameters.alpha))
    learning_parameters.epsilon = 1e-4
    print("epsilon = "+str(learning_parameters.epsilon))
    
    # Training parameters
    num_epochs = 1000
    print("num_epochs = "+str(num_epochs))
    
    # Dropout parameters
    learning_parameters.dropout_in = .2 # 0. means no dropout
    print("dropout_in = "+str(learning_parameters.dropout_in))
    learning_parameters.dropout_hidden = .5
    print("dropout_hidden = "+str(learning_parameters.dropout_hidden))
    
    # W_LR_scale = 1.    
    learning_parameters.W_LR_scale = "Glorot" # "Glorot" means we are using the coefficients from Glorot's paper
    print("W_LR_scale = "+str(learning_parameters.W_LR_scale))
    
    # Decaying LR 
    LR_start = .003
    print("LR_start = "+str(LR_start))
    LR_fin = 0.0000003
    print("LR_fin = "+str(LR_fin))
    LR_decay = (LR_fin/LR_start)**(1./num_epochs)
    print("LR_decay = "+str(LR_decay))
    # BTW, LR decay might good for the BN moving average...
    
    save_path = "mnist-%dw-%da.npz" % (learning_parameters.weight_bits, learning_parameters.activation_bits)
    print("save_path = "+str(save_path))
    
    shuffle_parts = 1
    print("shuffle_parts = "+str(shuffle_parts))
    
    print('Loading MNIST dataset...')
    
    train_set = MNIST(which_set= 'train', start=0, stop = 50000, center = False)
    valid_set = MNIST(which_set= 'train', start=50000, stop = 60000, center = False)
    test_set = MNIST(which_set= 'test', center = False)
    
    # bc01 format    
    # Inputs in the range [-1,+1]
    # print("Inputs in the range [-1,+1]")
    train_set.X = 2* train_set.X.reshape(-1, 1, 28, 28) - 1.
    valid_set.X = 2* valid_set.X.reshape(-1, 1, 28, 28) - 1.
    test_set.X = 2* test_set.X.reshape(-1, 1, 28, 28) - 1.
    
    # Binarise the inputs.
    train_set.X = np.where(train_set.X < 0, -1, 1).astype(theano.config.floatX)
    valid_set.X = np.where(valid_set.X < 0, -1, 1).astype(theano.config.floatX)
    test_set.X = np.where(test_set.X < 0, -1, 1).astype(theano.config.floatX)

    # flatten targets
    train_set.y = np.hstack(train_set.y)
    valid_set.y = np.hstack(valid_set.y)
    test_set.y = np.hstack(test_set.y)
    
    # Onehot the targets
    train_set.y = np.float32(np.eye(10)[train_set.y])    
    valid_set.y = np.float32(np.eye(10)[valid_set.y])
    test_set.y = np.float32(np.eye(10)[test_set.y])
    
    # for hinge loss
    train_set.y = 2* train_set.y - 1.
    valid_set.y = 2* valid_set.y - 1.
    test_set.y = 2* test_set.y - 1.

    print('Building the MLP...') 
    
    # Prepare Theano variables for inputs and targets
    input = T.tensor4('inputs')
    target = T.matrix('targets')
    LR = T.scalar('LR', dtype=theano.config.floatX)

    mlp = lfc.genLfc(input, 10, learning_parameters)

    train_output = lasagne.layers.get_output(mlp, deterministic=False)
    
    # squared hinge loss
    loss = T.mean(T.sqr(T.maximum(0.,1.-target*train_output)))
    
    # W updates
    W = lasagne.layers.get_all_params(mlp, quantized=True)
    W_grads = quantized_net.compute_grads(loss,mlp)
    updates = lasagne.updates.adam(loss_or_grads=W_grads, params=W, learning_rate=LR)
    updates = quantized_net.clipping_scaling(updates,mlp)
    
    # other parameters updates
    params = lasagne.layers.get_all_params(mlp, trainable=True, quantized=False)
    updates = OrderedDict(updates.items() + lasagne.updates.adam(loss_or_grads=loss, params=params, learning_rate=LR).items())
        
    test_output = lasagne.layers.get_output(mlp, deterministic=True)
    test_loss = T.mean(T.sqr(T.maximum(0.,1.-target*test_output)))
    test_err = T.mean(T.neq(T.argmax(test_output, axis=1), T.argmax(target, axis=1)),dtype=theano.config.floatX)
    
    # Compile a function performing a training step on a mini-batch (by giving the updates dictionary) 
    # and returning the corresponding training loss:
    train_fn = theano.function([input, target, LR], loss, updates=updates)

    # Compile a second function computing the validation loss and accuracy:
    val_fn = theano.function([input, target], [test_loss, test_err])

    print('Training...')
    
    quantized_net.train(
            train_fn,val_fn,
            mlp,
            batch_size,
            LR_start,LR_decay,
            num_epochs,
            train_set.X,train_set.y,
            valid_set.X,valid_set.y,
            test_set.X,test_set.y,
            save_path,
            shuffle_parts)
