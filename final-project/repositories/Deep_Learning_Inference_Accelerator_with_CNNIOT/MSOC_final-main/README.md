# Deep Learning Inference Accelerator with CNNIOT

### About the Project
Implement a lightweight deep learning framework in python. The framework supports major functions of CNN, such as convolution, max pooling and fully connected layer. The framework is implemented to support embedded platforms such as the Xilinx PYNQ FPGA which makes it fast and energy efficient.

### Model Overview
![image](https://github.com/jennyjentsai/MSOC_final/blob/main/model_overview.png.jpg)

### Usage   
#### HLS 
Open vivado HLS
Open project
Select the $directory (e.g. finalconv_hls, finalpool_hls, finalwrapup_hls )

  
#### PYNQ    
##### How to define Convolution Layer

conv=CNNIOT.Convolution2D(In.Planes, Out.Planes, Filter.H,Filter.W ,Stride.H, Stride.W, Padding,Relu,Weight, Bias,Precision)

Output= Conv.forward(data,CNNIOT.dma,Load.Input)

* In.Planes: Number of channels in the input tensor
* Out.Planes: Number of channels produced by the convolution
* Filter.H \& Filter.W:  size of the convolution kernel or filter's dimensions
* Stride size: stride of the convolution 
* Padding: get the size of padding for input tensor
* Relu: by setting this value to one, Relu function will be applied to the result of this layer.
* Weight: accept weight tensor in Numpy tensor array format 
* Bias: accept bias tensor in Numpy tensor array format 
* precision: user can control the float number precision of input and output of layer
* Input data: the input tensor
* CNNIOT.dma: user can use the default bitsteram or their own bitstream 

##### How to define Pooling Layer

pool=CNNIOT.Pool(P.H,P.W,S.H,S.W,Pooling,Padding,Relu,Precision)

Output= pool.forward(data,CNNIOT.dma)

* Input data:the input Tensor
* Window size: window size of the pooling function 
* Stride size: stride size  of the pooling function 
* Pooling: Max as setting pooling layer as max pooling function or Avg as setting the layer as average pooling
* Relu: by setting this switch on, Relu function will be applied to the result of this layer
* Padding: get the size of padding for the input tensor
* precision: user can control the float number precision of input and output of layer
* item CNNIOT.dma: user can go with the default bitsteram or use their own bitstream 

##### How to define fully connected Layer

FC=CNNIOT.FC(Input Size,Output Size,Relu,Weight,Bias,precision)

Output= FC.forward(data,CNNIOT.dma)

* Input Size: configure layer to accept specific input
* Output Size: configure output size of layer
* Relu: by setting this value to one then Relu function will be applied to the result of this layer
* Weight: the tensor of weights in numpy tensor array format and it's dimension and size should be Output Size * Input Size
* Bias: the bias tensor in numpy tensor array format and it's dimension and size should be Output Size
* precision: user can control the float number precision of input and output of layer
* CNNIOT.dma: user can go with the default bitsteram or use their own bitstream
### References
[https://github.com/mfarhadi/CNNIOT](https://github.com/mfarhadi/CNNIOT)  
[https://github.com/lirui-shanghaitech/A-convolution-kernel-implemented-by-Vivado-HLS](https://github.com/lirui-shanghaitech/A-convolution-kernel-implemented-by-Vivado-HLS)
