
# Create project
create_project vvd_ReconNet C:/Users/USER/ReconNet-hls/vvd_ReconNet -part xc7z020clg484-1

# Update IP
set_property board_part em.avnet.com:zed:part0:1.4 [current_project]
set_property  ip_repo_paths  C:/Users/USER/Desktop/ReconNet-hls/hls_ReconNet [current_project]
update_ip_catalog

# Create block design
create_bd_design "design_1"
update_compile_order -fileset sources_1

startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:ReconNet:1.0 ReconNet_0
endgroup

# video timing controller
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:v_tc:6.2 v_tc_0
endgroup

# video to AXI
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:v_axi4s_vid_out:4.0 v_axi4s_vid_out_0
endgroup
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:v_vid_in_axi4s:4.0 v_vid_in_axi4s_0
endgroup

# video DMA
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_vdma:6.3 axi_vdma_0
endgroup
set_property -dict [list CONFIG.c_mm2s_genlock_mode {0} CONFIG.c_include_mm2s {0}] [get_bd_cells axi_vdma_0]
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_vdma:6.3 axi_vdma_1
endgroup
set_property -dict [list CONFIG.c_s2mm_genlock_mode {0} CONFIG.c_include_s2mm {0}] [get_bd_cells axi_vdma_1]

apply_bd_automation -rule xilinx.com:bd_rule:processing_system7 -config {make_external "FIXED_IO, DDR" apply_board_preset "1" Master "Disable" Slave "Disable" }  [get_bd_cells processing_system7_0]

startgroup
set_property -dict [list CONFIG.PCW_FPGA0_PERIPHERAL_FREQMHZ {100} CONFIG.PCW_QSPI_GRP_SINGLE_SS_ENABLE {1}] [get_bd_cells processing_system7_0]
endgroup


# make_wrapper -files [get_files C:/Users/USER/Desktop/MSOC2020/$FOLDER/$FILENAME/$FILENAME.srcs/sources_1/bd/design_1/design_1.bd] -top
# add_files -norecurse C:/Users/USER/Desktop/MSOC2020/$FOLDER/$FILENAME/$FILENAME.srcs/sources_1/bd/design_1/hdl/design_1_wrapper.v

# launch_runs impl_1 -to_step write_bitstream -jobs 2