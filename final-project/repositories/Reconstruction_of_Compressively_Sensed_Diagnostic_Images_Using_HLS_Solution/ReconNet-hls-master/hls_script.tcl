open_project hls_ReconNet
add_files ReconNet.cpp
add_files -tb  ReconNet_test.cpp
add_files -tb  golden/barbara.txt
add_files -tb  golden/img_in.txt
add_files -tb  golden/img_out.txt
add_files -tb  test_image/barbara.tif
set_top ReconNet
open_solution "solution10"
# source "directives.tcl"
set_part {xc7z020clg484-1}
create_clock -period 10

csim_design
csynth_design
cosim_design -tool xsim
export_design -rtl verilog -format ip_catalog
close_project
quit