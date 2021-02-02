// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.2 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================

`timescale 1ns/1ps

module fft_config1_s
#(parameter
    INPUT_WIDTH  = 64,
    OUTPUT_WIDTH = 64,
    CONFIG_WIDTH = 16,
    STATUS_WIDTH = 8
)
(
    input  wire                    ap_clk,
    input  wire                    ap_rst,
    input  wire                    ap_start,
    input  wire                    ap_continue,
    input  wire                    ap_ce,
    output reg                     ap_done,
    output reg                     ap_ready,
    output wire                    ap_idle,
    input  wire [CONFIG_WIDTH-1:0] config_ch_data_V_dout,
    input  wire                    config_ch_data_V_empty_n,
    output wire                    config_ch_data_V_read,
    input  wire [INPUT_WIDTH-1:0]  xn_dout,
    input  wire                    xn_empty_n,
    output wire                    xn_read,
    output wire [OUTPUT_WIDTH-1:0] xk_din,
    input  wire                    xk_full_n,
    output wire                    xk_write,
    output wire [STATUS_WIDTH-1:0] status_data_V_din,
    input  wire                    status_data_V_full_n,
    output wire                    status_data_V_write
);
//------------------------Local signal-------------------
wire aresetn;
wire config_tready;
wire xn_tready;
wire xk_tvalid;
wire xk_tlast;
wire xk_full_n_i;
wire xn_empty_n_i;
wire status_tvalid;
//------------------------Instantiation------------------
fft_config1_s_core inst (
  .aclk                        ( ap_clk ),
  .aclken                      ( ap_ce ),
  .aresetn                     ( aresetn ),
  .s_axis_config_tdata         ( config_ch_data_V_dout ),
  .s_axis_config_tvalid        ( config_ch_data_V_empty_n ),
  .s_axis_config_tready        ( config_tready ),
  .s_axis_data_tdata           ( xn_dout ),
  .s_axis_data_tvalid          ( xn_empty_n_i ),
  .s_axis_data_tready          ( xn_tready ),
  .s_axis_data_tlast           ( 1'b0 ),
  .m_axis_data_tdata           ( xk_din ),
  .m_axis_data_tuser           (  ),
  .m_axis_data_tvalid          ( xk_tvalid ),
  .m_axis_data_tready          ( xk_full_n_i ),
  .m_axis_data_tlast           ( xk_tlast ),
  .m_axis_status_tdata         ( status_data_V_din ),
  .m_axis_status_tvalid        ( status_tvalid ),
  .m_axis_status_tready        ( status_data_V_full_n ),
  .event_frame_started         (  ),
  .event_tlast_unexpected      (  ),
  .event_tlast_missing         (  ),
  .event_status_channel_halt   (  ),
  .event_data_in_channel_halt  (  ),
  .event_data_out_channel_halt (  )
);

//------------------------Body---------------------------
assign aresetn                 = ap_rst ^ 1'b1;
assign config_ch_data_V_read = ap_ce & config_ch_data_V_empty_n & config_tready;
assign xn_read        = ap_ce & xn_empty_n_i & xn_tready;
assign xk_write       = ap_ce & xk_full_n_i & xk_tvalid;
assign xn_empty_n_i   = xn_empty_n & ap_start;
assign xk_full_n_i    = xk_full_n & (!ap_done | ap_continue);
assign status_data_V_write          = ap_ce & status_data_V_full_n & status_tvalid;

always @(posedge ap_clk) begin
    if (ap_rst == 1'b1)
        ap_done <= 1'b0;
    else if (ap_ce) begin
        if (xk_write & xk_tlast)
            ap_done <= 1'b1;
        else if (ap_continue)
            ap_done <= 1'b0;
    end
end

always @(posedge ap_clk) begin
    if (ap_rst == 1'b1)
        ap_ready <= 1'b0;
    else if (ap_ce) begin
        if (xk_write & xk_tlast)
            ap_ready <= 1'b1;
        else
            ap_ready <= 1'b0;
    end
end

endmodule
