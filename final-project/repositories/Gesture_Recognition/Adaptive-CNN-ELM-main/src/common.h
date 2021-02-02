#ifndef SRC_LENET5_COMMON_H_
#define SRC_LENET5_COMMON_H_
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>
#include <float.h>

// Environment Option
// ===============================================

#include <ap_int.h>
#include <ap_fixed.h>
typedef float float_type;


//#define image_test 7172
#define image_test 500
//#define image_train 27455
#define image_train 200
#define image_Batch 1
#define label_type int

/////////////////////// Layer config ///////////////////

// Input
#define MNIST_WH 28
#define MNIST_SIZE 784
#define MNIST_PAD_SIZE 1024
#define MNIST_LABEL_SIZE 26
#define INPUT_WH 32
#define INPUT_SIZE 1024
#define INPUT_DEPTH 1

// Conv1
#define CONV_1_INPUT_WH 32
#define CONV_1_INPUT_SIZE 1024
#define CONV_1_OUTPUT_WH 28
#define CONV_1_OUTPUT_SIZE 784
#define CONV_1_WH 5
#define CONV_1_SIZE 25
#define CONV_1_TYPE 6

// Pool1
#define POOL_1_INPUT_WH 28
#define POOL_1_INPUT_SIZE 784
#define POOL_1_OUTPUT_WH 14
#define POOL_1_OUTPUT_SIZE 196
#define POOL_1_SIZE 4
#define POOL_1_TYPE 6

// Conv2
#define CONV_2_INPUT_WH 14
#define CONV_2_INPUT_SIZE 196
#define CONV_2_OUTPUT_WH 10
#define CONV_2_OUTPUT_SIZE 100
#define CONV_2_WH 5
#define CONV_2_SIZE 25
#define CONV_2_TYPE 16

// Pool2
#define POOL_2_INPUT_WH 10
#define POOL_2_INPUT_SIZE 100
#define POOL_2_OUTPUT_WH 5
#define POOL_2_OUTPUT_SIZE 25
#define POOL_2_SIZE 4
#define POOL_2_TYPE 16

// Conv3 (fc)
#define CONV_3_INPUT_WH 5
#define CONV_3_INPUT_SIZE 25
#define CONV_3_OUTPUT_WH 1
#define CONV_3_OUTPUT_SIZE 1
#define CONV_3_WH 5
#define CONV_3_SIZE 25
#define CONV_3_TYPE 128

#define NN_INPUT_N 128

// FC1
#define INPUT_NN_1_SIZE 128
#define FILTER_NN_1_SIZE 128 * 84
#define BIAS_NN_1_SIZE 84
#define OUTPUT_NN_1_SIZE 84

// FC2
#define INPUT_NN_2_SIZE 84
#define FILTER_NN_2_SIZE 84 * 26
#define OUTPUT_NN_2_SIZE 26
#define BIAS_NN_2_SIZE 26

// ELM
#define INPUT_ELM_SIZE 128
#define HIDDEN_ELM_SIZE 168
#define OUTPUT_ELM_SIZE 26

#define FILTER_ELM_SIZE 128*168
#define BIAS_ELM_SIZE 168
#define BETA_ELM_SIZE 168*26


#endif
