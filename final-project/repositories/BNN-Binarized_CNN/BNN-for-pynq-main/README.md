# BNN-for-pynq

<!-- TABLE OF CONTENTS -->
## Table of Contents

* [About the Project](#about-the-project)
* [Usage](#usage)
* [References](#references)
* [Contributing](#contributing)
* [Hardware design rebuild](#Hardware-design-rebuild)



<!-- ABOUT THE PROJECT -->
## About The Project
We introduce a method to train Binarized Neural Networks (BNNs) - neural networks with binary weights and activations at run-time. At training-time the binary weights and activations are used for computing the parameters gradients. During the forward pass, BNNs drastically
reduce memory size and accesses, and replace most arithmetic operations with bit-wise operations, which is expected to substantially improve power-efficiency.

There are multiple implementations available supporting different precision for weights and activation:

1 bit weights and 1 bit activation (W1A1) for conv and fully-connected
1 bit weights and 2 bit activation (W1A2) for conv and fully-connected
2 bit weights and 2 bit activation (W2A2) for conv

We support 3 boards for hardware acceleration which are Pynq-Z1, Pynq-Z2 and Ultra96 (with PYNQ image).

**Directory structure**
* **README.md** - introduce the project, algorithm, reference ....
The repo is organized as follows:

-	bnn: contains the LfcClassifier and CnvClassifier python class description
	-	src: contains the sources of the different precision networks, the libraries to rebuild them, and scripts to train and pack the weights:
		- library: FINN library for HLS QNN descriptions, host code, script to rebuilt and drivers for the PYNQ and Ultra96 (please refer to README for more details)
		- network: HLS top functions for QNN topologies (CNV and LFC) with different implementations for weight and activation precision, host code and make script for HW and SW build (please refer to README for more details)
		- training: scripts to train on the Cifar10, GTSRB and MNIST datasets and scripts to pack the weights in a binary format which can be read by the overlay
	-	bitstreams: contains the bitstreams for the 5 overlays
		- pynqZ1-Z2: bitstreams for Pynq devices
		- ultra96: bitstreams for Ultra96 devices
	-	libraries: pre-compiled shared objects for low-level driver of the 5 overlays each for hardware and software runtime
		- pynqZ1-Z2: shared objects used by Pynq devices
		- ultra96: shared objects used by ultra96
	-	params: set of trained parameters for the 5 overlays:
		-  MNIST  and MNIST  dataset for LFC network. Note that NIST dataset is only applicable to LFC-W1A1 by default.
		-  Cifar10 , SVHN  and  German Road Signs dataset for CNV network. Note that SVHN and German Road Signs databases are only applicable to CNV-W1A1 by default.
-	notebooks: lists a set of python notebooks examples, that during installation will be moved in `/home/xilinx/jupyter_notebooks/bnn/` folder
-	tests: contains test script and test images
      
## Hardware design rebuild

In order to rebuild the hardware designs, the repo should be cloned in a machine with installation of the Vivado Design Suite (tested with 2018.2). 
Following the step-by-step instructions:

1.	Clone the repository on your linux machine: `git clone https://github.com/siangyang/BNN-for-pynq.git`;
2.	Move to `<clone_path>/BNN-for-pynq/bnn/src/network/`
3.	Set the XILINX_BNN_ROOT environment variable to `<clone_path>/BNN-for-pynq/bnn/src/`
4.	Launch the shell script make-hw.sh with passing parameters for target network, target platform and mode, with the command `./make-hw.sh {network} {platform} {mode}` where:
	- network can be cnvW1A1, cnvW1A2, cnvW2A2 or lfcW1A1, lfcW1A2;
	- platform can be pynqZ1-Z2 or ultra96;
	- mode can be `h` to launch Vivado HLS synthesis, `b` to launch the Vivado project (needs HLS synthesis results), `a` to launch both;
5.	The results will be visible in `<clone_path>/BNN-for-pynq/bnn/src/network/output/` that is organized as follows:
	- bitstream: contains the generated bitstream(s);
	- hls-syn: contains the Vivado HLS generated RTL and IP (in the subfolder named as the target network and target platform);
	- report: contains the Vivado and Vivado HLS reports;
	- vivado: contains the Vivado project;
6.	Copy the generated bitstream, hwh and tcl script on the PYNQ board `pip_installation_path/bnn/bitstreams/`



<!-- USAGE EXAMPLES -->
## Usage
* **build process**
  ```sh
  cd bnn
  python bnn.py
  ```

<!-- References -->
## References
[1]FINN: A Framework for Fast, Scalable Binarized Neural Network Inference
	https://arxiv.org/abs/1612.07119
[2]rosetta BNN  https://github.com/cornell-zhang/rosetta
[3]BNN-pynq  https://github.com/Xilinx/BNN-PYNQ
[4]M. Courbariaux and Y. Bengio. Binarynet: Training deep neural networks with weights and activations constrained to +1 or -1. CoRR, abs/1602.02830, 2016
[5]CNN using HLS https://github.com/amiq-consulting/CNN-using-HLS

<!-- CONTRIBUTING -->
## Contributing
* fix the resource problem for Pynq-Z2
* fix the negative slack problem for Pynq-Z2



