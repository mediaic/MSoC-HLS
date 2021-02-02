# Specify vivado project filename
set FOLDER ReconNet-hls
set FILENAME vvd_ReconNet_non_vid
set DesignName hls_ReconNet

# Create project
create_project $FILENAME C:/Users/USER/Desktop/$FOLDER/$FILENAME -part xc7z020clg484-1

# Update IP
set_property board_part em.avnet.com:zed:part0:1.4 [current_project]
set_property  ip_repo_paths  C:/Users/USER/Desktop/$FOLDER/$DesignName [current_project]
update_ip_catalog

# Create block design
create_bd_design "design_1"
update_compile_order -fileset sources_1

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 processing_system7_0
endgroup

startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:ReconNet:1.0 ReconNet_0
endgroup


apply_bd_automation -rule xilinx.com:bd_rule:processing_system7 -config {make_external "FIXED_IO, DDR" apply_board_preset "1" Master "Disable" Slave "Disable" }  [get_bd_cells processing_system7_0]

startgroup
set_property -dict [list CONFIG.PCW_FPGA0_PERIPHERAL_FREQMHZ {100} CONFIG.PCW_USE_S_AXI_HP0 {1} CONFIG.PCW_QSPI_GRP_SINGLE_SS_ENABLE {1}] [get_bd_cells processing_system7_0]
endgroup

# Call DMA_IN
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_dma:7.1 axi_dma_0
endgroup
set_property -dict [list CONFIG.c_include_sg {0} CONFIG.c_sg_length_width {26} CONFIG.c_sg_include_stscntrl_strm {0} CONFIG.c_include_s2mm {0}] [get_bd_cells axi_dma_0]
set_property name axi_dma_in_0 [get_bd_cells axi_dma_0]
startgroup

# Connect DMA_IN
connect_bd_intf_net [get_bd_intf_pins ReconNet_0/AXI_video_stream_in] [get_bd_intf_pins axi_dma_in_0/M_AXIS_MM2S]
startgroup
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config { Clk_master {Auto} Clk_slave {Auto} Clk_xbar {Auto} Master {/processing_system7_0/M_AXI_GP0} Slave {/axi_dma_in_0/S_AXI_LITE} ddr_seg {Auto} intc_ip {New AXI Interconnect} master_apm {0}}  [get_bd_intf_pins axi_dma_in_0/S_AXI_LITE]
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config { Clk_master {Auto} Clk_slave {Auto} Clk_xbar {Auto} Master {/axi_dma_in_0/M_AXI_MM2S} Slave {/processing_system7_0/S_AXI_HP0} ddr_seg {Auto} intc_ip {New AXI Interconnect} master_apm {0}}  [get_bd_intf_pins processing_system7_0/S_AXI_HP0]
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config { Clk_master {Auto} Clk_slave {Auto} Clk_xbar {Auto} Master {/processing_system7_0/M_AXI_GP0} Slave {/ReconNet_0/s_axi_CONTROL} ddr_seg {Auto} intc_ip {New AXI Interconnect} master_apm {0}}  [get_bd_intf_pins ReconNet_0/s_axi_CONTROL]
endgroup

# Call DMA_OUT
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_dma:7.1 axi_dma_0
endgroup
set_property -dict [list CONFIG.c_include_sg {0} CONFIG.c_sg_length_width {26} CONFIG.c_sg_include_stscntrl_strm {0} CONFIG.c_include_mm2s {0}] [get_bd_cells axi_dma_0]
set_property name axi_dma_out_0 [get_bd_cells axi_dma_0]
set_property location {5 1606 38} [get_bd_cells axi_dma_out_0]

# Connect DMA_OUT
connect_bd_intf_net [get_bd_intf_pins ReconNet_0/AXI_video_stream_out] [get_bd_intf_pins axi_dma_out_0/S_AXIS_S2MM]
startgroup
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config { Clk_master {Auto} Clk_slave {/processing_system7_0/FCLK_CLK0 (100 MHz)} Clk_xbar {/processing_system7_0/FCLK_CLK0 (100 MHz)} Master {/axi_dma_out_0/M_AXI_S2MM} Slave {/processing_system7_0/S_AXI_HP0} ddr_seg {Auto} intc_ip {/axi_mem_intercon} master_apm {0}}  [get_bd_intf_pins axi_dma_out_0/M_AXI_S2MM]
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config { Clk_master {/processing_system7_0/FCLK_CLK0 (100 MHz)} Clk_slave {Auto} Clk_xbar {/processing_system7_0/FCLK_CLK0 (100 MHz)} Master {/processing_system7_0/M_AXI_GP0} Slave {/axi_dma_out_0/S_AXI_LITE} ddr_seg {Auto} intc_ip {/ps7_0_axi_periph} master_apm {0}}  [get_bd_intf_pins axi_dma_out_0/S_AXI_LITE]
endgroup
regenerate_bd_layout

make_wrapper -files [get_files C:/Users/USER/Desktop/$FOLDER/$FILENAME/$FILENAME.srcs/sources_1/bd/design_1/design_1.bd] -top
add_files -norecurse C:/Users/USER/Desktop/$FOLDER/$FILENAME/$FILENAME.srcs/sources_1/bd/design_1/hdl/design_1_wrapper.v

launch_runs impl_1 -to_step write_bitstream -jobs 4

# Report Timing
# open_run impl_1
# report_timing_summary -delay_type min_max -report_unconstrained -check_timing_verbose -max_paths 10 -input_pins -routable_nets -name timing_1