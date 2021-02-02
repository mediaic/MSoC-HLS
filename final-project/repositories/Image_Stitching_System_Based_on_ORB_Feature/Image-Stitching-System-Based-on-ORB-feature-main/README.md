# Image-Stitching-System-Based-on-ORB-feature
Acceleration of application for ORB-based Image Stitching using Vivado HLS

## About the Project
This is an implementation of image stitching system on PYNQ platform.
* README.md
* MATLAB/
<br />MATLAB implementation of image stitching
* ip/
<br />Vivado HLS code and testbench of ORB kernel and feature matching kernel
* host_program/
<br /> testdata/
<br />Host program run on PYNQ platform
* overlays/
<br />bitstream of ORB kernel and feature matching kernel


## Usage
Run python main program on jupyter notebook

## Algorithm
Image stitching is the process of combining multiple photographic images with overlapping regions to produce a panorama image.
The image stitching process can be divided into several stages:
* cylindrical projection
* corner detection and feature description (using ORB)
* feature matching
* RANSAC 
* image blending

We implement the image stitching system on PYNQ platform and accelerate ORB and feature matching phases with Vivado HLS.

## Result
Stitching 9*450x278 images

![image](https://github.com/RitaWen/Image-Stitching-System-Based-on-ORB-feature/blob/main/result.jpg)

## Reference
ORB_FPGA:
https://github.com/Siudya/ORB_FPGA?fbclid=IwAR3j4uoTPw_2FZh24xS1qVgnz4C3wclwXm9ZgUTw7_qJV7wVTXbjUrBJzDY 
