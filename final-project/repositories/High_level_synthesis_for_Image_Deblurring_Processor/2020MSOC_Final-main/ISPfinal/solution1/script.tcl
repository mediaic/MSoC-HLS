############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
############################################################
open_project ISPfinal
set_top DEBLUR
add_files deblur.cpp
add_files deblur.h
add_files divergent.cpp
add_files divergent.h
add_files fft_top.cpp
add_files fft_top.h
add_files proximal.cpp
add_files proximal.h
add_files -tb tb_files/DeconvolutionColorPrior/DENOM.txt
add_files -tb CPUfft-final/DENOM2.txt
add_files -tb CPUfft-final/DENOM3.txt
add_files -tb tb_files/DeconvolutionColorPrior/IMAGINARY.txt
add_files -tb CPUfft-final/IMAGINARY2.txt
add_files -tb CPUfft-final/IMAGINARY3.txt
add_files -tb tb_files/I_blurred_B.txt
add_files -tb tb_files/I_blurred_G.txt
add_files -tb tb_files/I_blurred_R.txt
add_files -tb tb_files/DeconvolutionColorPrior/REAL.txt
add_files -tb CPUfft-final/REAL2.txt
add_files -tb CPUfft-final/REAL3.txt
add_files -tb tb_files/ground_truth_B.txt
add_files -tb tb_files/ground_truth_G.txt
add_files -tb tb_files/ground_truth_R.txt
add_files -tb tb.cpp
open_solution "solution1"
set_part {xc7z020-clg400-1}
create_clock -period 10 -name default
#source "./ISPfinal/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog
