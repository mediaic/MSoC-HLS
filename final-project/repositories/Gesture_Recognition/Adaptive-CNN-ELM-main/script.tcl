############################################################
## Lenet5-ELM

## wilbur@access.ee.ntu.edu.tw

## 20 January 2021
############################################################


open_project hls_lenet5_elm
set_top proposed_model

add_files src/train/PE.cpp
add_files src/train/my_cordic.cpp
add_files src/train/QRD-RLS.cpp
add_files src/inference/image_convolution_hw.cpp
add_files src/inference/image_elm_infer_hw.cpp
add_files src/inference/image_fullyconnected_hw.cpp
add_files src/inference/image_pool_hw.cpp
add_files src/inference/model.cpp

add_files -tb main.cpp

# baseline solution1: no directives
open_solution "solution1"
set_part {xc7z020clg484-1}
create_clock -period 20.0 -name default
csim_design -clean
csynth_design
# cosim_design -disable_depchk
