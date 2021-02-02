# MSOC_Final_Pairhmm

# HLS and RTL Implementation in Pair-HMM Algorithm for Sequencing Data Analysis


<br />
<p align="center">

  <h3 align="center">MSOC-HLS Final Project </h3>
  
</p>


<!-- TABLE OF CONTENTS -->
## Table of Contents

* [About the Project](#about-the-project)
* [Usage](#usage)
* [Algorithm](#Algorithm)
* [References](#References)
* [Contact](#contact)


<!-- ABOUT THE PROJECT -->
## About The Project
The github repository for 109-1 MSOC Final Project HLS projects - High Level Synthesis (HLS) and RTL Implementation in Pair-HMM Algorithm for Sequencing Data Analysis

**Directory structure**
* **README.md** - introduce the project, algorithm, usage, reference and contact information
* **code/**
  * HLS_pairhmm/
    * original_software/  
        pairhmm.cpp - baseline pairhmm software code
    * optimized_software/  
        - pairhmm.cpp - software code written in more hardware-friendly way  
        - pairhmm_unroll.cpp  
        - pairhmm_arraypartition.cpp  
        - pairhmm_final.cpp - final version
    * pairhmm_test.cpp - for verifying the function of pairhmm.cpp 
  * RTL_pairhmm/ 
    * Verilog_pairhmm/ - RTL code of Pairhmm
    * Verilog_SRAM/ - RTL code for SRAM 
    * Verilog_DRAM/ - RTL code for DRAM 
    * testdata/ - one testing pattern for hardware simulation
    * GATK_TOP.v - Top module
    * TESTBED_GATK_AXI.v - Testbench for hardware simulation
  * Firmware/
    * main.cpp - the firmware code for giving inputs, executing FPGA, and recieving results  
* **impl/** - result of the HLS synthesis implementation, e.g. HLS csynth reports for different design exploration
    * pairhmm_baseline_csynth.rpt
    * pairhmm_optimized_csynth.rpt
    * pairhmm_optimized_unroll_initialization.rpt

     
<!-- USAGE EXAMPLES -->
## Usage
1. Open Vivado HLS
    * We use **Xilinx ZedBoard Evaluation and Development Kit** to evaulate this project (board: Alveo U250)
    * Add pairhmm.cpp, into **Source file**
    * Add pairhmm_test.cpp into **Test Bench**

2. Run C Simulation, Run Synthesis, Run Cosimulation, Export IP
3. Open Vivado 2019.2
4. Import IP and create Block design
5. Generate Bitstream
6. Programmed U250 with the result bistream file
7. Using the main.cpp in Firmware directory to control FPGA


## Algorithm
For each active region, the program performs a pairwise alignment of each read against each haplotype using the PairHMM algorithm.  
This produces a matrix of likelihoods of haplotypes given the read data.  
These likelihoods are then marginalized to obtain the likelihoods of alleles for each potentially variant site given the read data.
  
PairHMMs are designed to fulfill different purposes: by using the Viterbi algorithm we can infer the optimal sequence alignment while using the forward algorithm we deduce the overall alignment probability.  
To model an alignment based on edit-distance, as opposed to Hamming distance, the model has match, insert
and delete states.  

It allows us to draw inferences about the alignment quality of a pair of sequences under the assumption that the sequence pair was emitted by itself.  
In the HaplotypeCaller, the overall alignment quality between a candidate haplotype and an input
read is computed using the Pair-HMM.



## References
* [GATK - HaplotypeCaller](https://gatk.broadinstitute.org/hc/en-us/articles/360037064452-HaplotypeCaller)
* [FPGA-based PairHMM Forward Algorithm for
DNA Variant Calling](https://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=8445119)
* [Maximizing Systolic Array Efficiency to Accelerate
the PairHMM Forward Algorithm](https://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=7822616)
* [Hardware Acceleration of the Pair-HMM Algorithm for DNA
Variant Calling](https://dl.acm.org/doi/pdf/10.1145/3020078.3021749)
* [Alveo U250 Data Center Accelerator Card](https://www.xilinx.com/products/boards-and-kits/alveo/u250.html)

<!-- CONTACT -->
## Contact
* Chung-Hsuan Yang - F07943023@ntu.edu.tw
* Yi-Yen Hsieh - d06943001@ntu.edu.tw
* Yi-Chung Wu - d04943027@ntu.edu.tw
