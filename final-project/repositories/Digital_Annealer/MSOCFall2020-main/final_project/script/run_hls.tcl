############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
############################################################
open_project -reset da_final
set_top DigitalAnnealer
add_files da.cpp
add_files da.h
add_files node.h
add_files typedefs.h
add_files -tb main.cpp
add_files -tb easy.tsp
 
#Solution
open_solution  -reset opt_1
set_part {xcu250-figd2104-2L-e}
create_clock -period 10 -name default

source "directives1.tcl"

csim_design
csynth_design
cosim_design -trace_level all  -disable_depchk

exit