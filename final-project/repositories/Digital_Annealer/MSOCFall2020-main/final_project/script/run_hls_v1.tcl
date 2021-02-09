############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
############################################################
open_project -reset danew_v1
set_top DigitalAnnealer
add_files danew_v1.cpp
add_files danew_v1.h
add_files node_v1.h
add_files -tb da_top_v1.cpp
add_files -tb easy.tsp


#Solution
open_solution  -reset sol2
set_part {xcu50-fsvh2104-2-e}
create_clock -period 10 -name default

csim_design
csynth_design
cosim_design -trace_level all -tool xsim

exit