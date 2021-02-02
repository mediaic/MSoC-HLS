open_project hls_final_prj -reset
add_files  "test.cpp"
add_files -tb "test.cpp"
set_top ecc_dec

open_solution "solution0" -reset
set_part {xc7z020clg484-1}
create_clock -period 5 -name default
csim_design -ldflags "-lcrypto -lssl"
csynth_design 
cosim_design -ldflags "-lcrypto -lssl"
export_design -format ip_catalog
close_project
