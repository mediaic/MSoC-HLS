# NTU MSOC team17 Final Project


## Table of Contents

 - [About The Project](https://github.com/R09943156/MSOC/tree/main/final#about-the-project)
 - [Usage](https://github.com/R09943156/MSOC/tree/main/final#usage)
 - [Algorithm](https://github.com/R09943156/MSOC/tree/main/final#Algorithm)
 - [References](https://github.com/R09943156/MSOC/tree/main/final#references)
 - [Contributing](https://github.com/R09943156/MSOC/tree/main/final#contributing)
 - [Contact](https://github.com/R09943156/MSOC/tree/main/final#contact)


## About The Project

 - README.md
 - code/
   - final/
     - cordic.cpp
     - cordic.h
     - datatype.h
     - directives.tcl
     - frft.cpp
     - frft.h
     - frft_test.cpp
     - hermite_gaussian.h
     - read_file.h
 - code-opt/
   - code-dataflow/
   - code-init/
   - code-unroll/
 - testdata/ 
   - input_angle.txt
   - input_data.txt
   - ref_result.txt
 - ipy_script/
   - filter.ipynb
   - verify.ipynb
   - check_filter.m
   - filtered.m
 - impl/
   - frft_csynth.rpt
 - MATLAB_Simulation/
   - filtering.m
   - frft_video.m
   - gen_data.m
   - Kernel.m
   - write_coeff.m

## Usage
   synthesis by Vivado HLS 2019.2\
   generate bitstream by Vivado 2019.2\
   implement on Zedboard


## Algorithm
  The fractional fourier transform is a generalization of ordinary fourier transform with a tunable parameter "a", whose meaning is to perform "a" times of fourier transform.\
  This project implements the eigenvalue decomposition-type descrete fractional fourier fransform which is the most friendly for hardware implementation.\
  The eigenvalue decomposition-type descrete fractional fourier fransform simplifies the algorithm into eigenspace mapping/demapping and one element-wise complex-variable vector multiplication.


## References
  [1] M. V. N. V. Prasad, K. C. Ray and A. S. Dhar, "FPGA implementation of discrete fractional Fourier transform," 2010 International Conference on Signal Processing and Communications (SPCOM), Bangalore, 2010, pp. 1-5, doi: 10.1109/SPCOM.2010.5560491. \
  [2] C. Candan, M. A. Kutay and H. M. Ozaktas, "The discrete fractional Fourier transform," in IEEE Transactions on Signal Processing, vol. 48, no. 5, pp. 1329-1337, May 2000, doi: 10.1109/78.839980.

## Contributing
  Implement 256-point Discrete fractional Fourier Transform on FPGA and achieve real-time computation. \
  Denoise the signal in whole system including host code and HLS. 

## Contact
郭冠緯 r09943156@ntu.edu.tw   \
朱柏彥 r08943178@ntu.edu.tw   \
陳帝宇 r09943018@ntu.edu.tw
