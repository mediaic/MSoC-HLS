open_project hls_ecdsa_verify_prj -reset
add_files  src/ecdsa_tb.cpp
add_files -tb src/ecdsa_tb.cpp
set_top ecdsa_verify

open_solution "solution0" -reset
set_part {xc7z020clg484-1}
create_clock -period 5 -name default
csim_design -ldflags "-lcrypto -lssl"
csynth_design 
cosim_design -ldflags "-lcrypto -lssl"
export_design -format ip_catalog
close_project
