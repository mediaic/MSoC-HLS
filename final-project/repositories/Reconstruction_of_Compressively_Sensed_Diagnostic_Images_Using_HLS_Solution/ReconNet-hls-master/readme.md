
# Reconstruction of Compressively Sensed Diagnostic Images Using HLS Solution

## Introduction

In order to reduce the trassmission storage for high resolution images, the compressive sensing techniques is usually applied. For a high resolution image (or data), we can measure it by a sensing matrix to form a compressed signal y with much less size (Fig. 1). By trasmitting this compressed signal, the trassmission storage can be drastically reduce. <br>

![](https://i.imgur.com/WlAZTM9.jpg)

However, The difficulties for compressive sensing is to recover the orignal signal x from the compressed signal, since the linear system to solve is under-determined. <br>

There are varities of methods for solving the compressive sensing problem. The conventional methods usually solved it by approximating it into a convex programming problem and this can get quite good performance. These days, deep learning methods are applied for solving this problem and get even better performance. Thus, we aim to implement by a so called ReconNet model (Fig. 2).<br>

![](https://i.imgur.com/pJOhbHd.jpg)

The ReconNet structure is consist of several convolution blocks. Each convolutional block is has three convolution layers with 11x11x64, 1x1x32, 7x7x1 size. Fig. 3 shows a ReconNet with two conv. blocks, which is also the structure choose to accelerate by hls solution.<br>

![](https://i.imgur.com/G4MZyL8.jpg)

## Model training 
The source code of the training process is at [this respository](https://github.com/tingyungchen/ReconNet).

## HLS implementation
**Model quantization**
Since directly implementing the solution by floating point exceeds the resource of Zedboard, we try to reduce the word length of the datatype. We've tried fixed point data-type; however, still 32-bit (8-bit int & 24-bit fraction) fixed point is required for tolerable errors. We then analyze the data distribution between layers and find that the range vaires between layers. Thus, we finally implement if by float-16 datatype and find that the error is tolerable (Fig. 4). <br>
![](https://i.imgur.com/leRwG7c.jpg)

**HLS pragma**
The dataflow pragma is add and the data buffer between submodules is set to implement by FIFO to get higher throughput and lower resources. More details are shown in the slides.<br>
![](https://i.imgur.com/Amxama7.jpg)


## File description

**Software simulation**<br>

1. ReconNet.m: Generate random weight test pattern and save to "weights.h"<br>
2. ReconNet_fixed_point.m: Simulate performance of float-16 and fixed point datatype.<br>
3. chop.m: Convert floating point to float-16.<br>
4. roundit.m: Round matrix to integer value.<br>

**Test pattern generating**<br>

1. read_weights.py: read model weights in "model_weights/" with ".txt" format into "weights.h" file.<br>
2. read_img.py:

**Vivado_HLS & Vivado**

1. hls_script.tcl: hls script<br>
2. vvd_script.tcl: vivado script <br>
3. MakeBit.bat: rename bit and hwh file. <br>

# Reference
[1] S. Lohit, K. Kulkarni, R. Kerviche, P. Turaga and A. Ashok, "Convolutional Neural Networks for Noniterative Reconstruction of Compressively Sensed Images," in IEEE Transactions on Computational Imaging, vol. 4, no. 3, pp. 326-340, Sept. 2018
