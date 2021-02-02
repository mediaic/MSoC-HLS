#
# This script rebuilds the project from just the source files
#
#cd ../
open_project -reset hls_sha256
set_top sha256
add_files src/sha256.c
add_files src/sha256.h
add_files src/sha256_impl.c
add_files src/sha256_impl.h
add_files -tb src/sha256_tb.c

#cd wssha256_hls

# get solutions
set solutions [glob solution*]

# loop through and add each solution
foreach solution $solutions {
    open_solution -reset $solution
    set_part {xc7z020clg484-1} -tool vivado
    create_clock -period 5 -name default
    source "$solution/directives.tcl"
}

puts "\nProject generation complete!\n"
puts "To open this project: \n\t- run this command: /path/to/vivado_hls -p `pwd`\n\t- open this folder in the Vivado HLS gui"



# NOTE: Uncomment below if you want to push the synthesis
# runs through before opening in project mode

csim_design -clean -compiler gcc
csynth_design
cosim_design
export_design -rtl verilog -format ip_catalog
close_project
exit