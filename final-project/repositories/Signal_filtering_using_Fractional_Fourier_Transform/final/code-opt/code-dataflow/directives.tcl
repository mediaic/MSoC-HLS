############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
############################################################
set_directive_interface -mode s_axilite "frft"
set_directive_interface -mode s_axilite "frft" rotation_angle
set_directive_interface -mode m_axi -depth 256 -offset slave -bundle re "frft" data_re_out_o
set_directive_interface -mode m_axi -depth 256 -offset slave -bundle im "frft" data_im_out_o
set_directive_interface -mode m_axi -depth 256 -offset slave -bundle re "frft" data_re_in_i
set_directive_interface -mode m_axi -depth 256 -offset slave -bundle im "frft" data_im_in_i
set_directive_latency -min 2 "frft/cmplxmul"
set_directive_dataflow "frft"
