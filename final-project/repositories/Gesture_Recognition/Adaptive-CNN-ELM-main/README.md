# 2020 NTU MSoC Final Project - Trainable Lenet5-ELM

<!-- TABLE OF CONTENTS -->
## Table of Contents

* [About the Project](#about-the-project)
* [Dataset](#Dataset)
* [Algorithm](#algorithm)
* [Enviroments](#enviroments)
* [Usage](#usage)
* [References](#references)
* [Contributing](#contributing)
* [Contact](#contact)

<!-- ABOUT THE PROJECT -->
## About The Project
「Sign language」is a major way that the hearing-impaired communicate with other. However, except for the hearing-impaired there are not many people have learned sign language in their lifetime. Hence, communications between both of them are difficult.
Inspired by this situation, we want to devise a system on FPGA(ZedBoard) that can bridge the communication by a local device.
The system on board can recognize the meaning of the user’s gesture. The user can “retrain” their gestures on board to make the system adapt for the user’s physical habit and let recognition of gestures be more accurate.
Then the prediction of gestures can be downstream for other IPs to be converted to output signals (may be image, text, or sound) and convey the idea of the hearing- impaired user to others. But this part is not included in our project this time.


**Directory structure**
* **README.md** - Introduce the project, algorithm, reference ....
* **main.cpp** - Testbench used in this project
* **script.tcl** - Script for running this project (Detail will be shown below)
* **MNIST_DATA/** - Normalized features and labels seperated into training and testing dataset
* **Param/** - Pre-trained parameters of CNN and ELM in software

* **src/** - HLS codes
  * **inference/** - Codes related to the inference including CNN-based feature extractor and ELM inference
  * **train/** - Codes related to the training including QRD-ELM (This part research is undergoing, so will be releaesed later)
  * Other codes are used in testbench

* **ipy_Host/** - System-level implementation
  * The jupyter notebook code to control the system between host and IP
  * The bitstream of the IP 

<!-- Dataset -->
## Dataset
Original dataset "Sign Language MNIST" from Kaggle website
![Dataset](/img/Dataset.png "Dataset")
Link: https://www.kaggle.com/datamunge/sign-language-mnist

In this project, we have processed the zero-padding on the image to the size of 32X32, and also normalized the scale into the range from -1 to 1.

<!-- Algorithm -->
## Algorithm
![Adaptive-CNN-ELM](/img/Adaptive-CNN-ELM.png "Adaptive-CNN-ELM")

CNN-based feature extractor is used to extract the important info from 1024 features to 128 features.<br />
Extreme learning machine (ELM) is a light-weight NN model, which has the property of fast training. Therefore, ELM is used for adaptation.
 
Model Architecture <br />
Input : -1.0 to 1.0  
Conv1 : 1x32x32 -> 6x28x28, ksize = 1x6x5x5, stride = 1  
Pool1 : 6x28x28 -> 6x14x14, Max pooling, window size = 2x2, stride = 2  
Conv2 : 6x14x14 -> 16x10x10, ksize = 6x16x5x5, stride = 1  
Pool2 : 16x10x10 -> 16x5x5, Max pooling, window size = 2x2, stride = 2  
Conv3 : 16x5x5 -> 128x1x1, ksize = 16x120x25, stride = 1  
ELM   : 128 -> 26, Num of hidden nodes = 168   
 
<!-- Enviroments -->
## Enviroments
Zedboard(Xynp 7z020) is used in this project
      
<!-- USAGE EXAMPLES -->
## Usage
* **Preparation**
	* Step1: Download the dataset from this link: https://drive.google.com/file/d/1uuevUSQEew2KiXiNsO_NxAr4zXbopWC6/view?usp=sharing
	* Step2: Upzip the "Dataset.zip"
	* Step3: Copy the all files to the **MNIST_DATA/** file
	
* **Reproduce the HLS flow**
	* Open the Vivado HLS command Prompt, and enter the following command
	```sh
	vivado_hls -f script.tcl 
	```
	
* **Host Program**
  * Step1: Upload all the files in **ipy_Host/** to the board
  * Step2: Open the "proposed_model.ipynb" to run the program

<!-- References -->
## References
Source code from: https://github.com/changwoolee/lenet5_hls

<!-- CONTRIBUTING -->
## Contributing
* Chi-Wei Chen (National Taiwan University, Taipei, Taiwan)
* Max (National Taiwan University, Taipei, Taiwan)
* Lisheng (National Taiwan University, Taipei, Taiwan)

<!-- CONTACT -->
## Contact
* Chi-Wei Chen (National Taiwan University, Taipei, Taiwan) r09943008@ntu.edu.tw



