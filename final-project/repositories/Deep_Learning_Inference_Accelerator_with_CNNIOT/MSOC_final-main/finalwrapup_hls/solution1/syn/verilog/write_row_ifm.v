// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and OpenCL
// Version: 2019.2
// Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module write_row_ifm (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        cifm_TDATA,
        cifm_TVALID,
        cifm_TREADY,
        ifm_buff0_0_address0,
        ifm_buff0_0_ce0,
        ifm_buff0_0_we0,
        ifm_buff0_0_d0,
        ifm_buff0_1_address0,
        ifm_buff0_1_ce0,
        ifm_buff0_1_we0,
        ifm_buff0_1_d0,
        ifm_buff0_2_address0,
        ifm_buff0_2_ce0,
        ifm_buff0_2_we0,
        ifm_buff0_2_d0,
        ifm_buff0_3_address0,
        ifm_buff0_3_ce0,
        ifm_buff0_3_we0,
        ifm_buff0_3_d0,
        ifm_buff0_4_address0,
        ifm_buff0_4_ce0,
        ifm_buff0_4_we0,
        ifm_buff0_4_d0,
        ifm_buff0_5_address0,
        ifm_buff0_5_ce0,
        ifm_buff0_5_we0,
        ifm_buff0_5_d0,
        ifm_buff0_6_address0,
        ifm_buff0_6_ce0,
        ifm_buff0_6_we0,
        ifm_buff0_6_d0,
        ifm_buff0_7_address0,
        ifm_buff0_7_ce0,
        ifm_buff0_7_we0,
        ifm_buff0_7_d0,
        ifm_buff0_8_address0,
        ifm_buff0_8_ce0,
        ifm_buff0_8_we0,
        ifm_buff0_8_d0,
        ifm_buff0_9_address0,
        ifm_buff0_9_ce0,
        ifm_buff0_9_we0,
        ifm_buff0_9_d0,
        ifm_buff0_10_address0,
        ifm_buff0_10_ce0,
        ifm_buff0_10_we0,
        ifm_buff0_10_d0,
        ifm_buff0_11_address0,
        ifm_buff0_11_ce0,
        ifm_buff0_11_we0,
        ifm_buff0_11_d0,
        ifm_buff0_12_address0,
        ifm_buff0_12_ce0,
        ifm_buff0_12_we0,
        ifm_buff0_12_d0,
        ifm_buff0_13_address0,
        ifm_buff0_13_ce0,
        ifm_buff0_13_we0,
        ifm_buff0_13_d0,
        ifm_buff0_14_address0,
        ifm_buff0_14_ce0,
        ifm_buff0_14_we0,
        ifm_buff0_14_d0,
        ifm_buff0_15_address0,
        ifm_buff0_15_ce0,
        ifm_buff0_15_we0,
        ifm_buff0_15_d0,
        cifm_counter_read,
        enable,
        ap_return
);

parameter    ap_ST_fsm_state1 = 3'd1;
parameter    ap_ST_fsm_state2 = 3'd2;
parameter    ap_ST_fsm_state3 = 3'd4;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [511:0] cifm_TDATA;
input   cifm_TVALID;
output   cifm_TREADY;
output  [5:0] ifm_buff0_0_address0;
output   ifm_buff0_0_ce0;
output   ifm_buff0_0_we0;
output  [31:0] ifm_buff0_0_d0;
output  [5:0] ifm_buff0_1_address0;
output   ifm_buff0_1_ce0;
output   ifm_buff0_1_we0;
output  [31:0] ifm_buff0_1_d0;
output  [5:0] ifm_buff0_2_address0;
output   ifm_buff0_2_ce0;
output   ifm_buff0_2_we0;
output  [31:0] ifm_buff0_2_d0;
output  [5:0] ifm_buff0_3_address0;
output   ifm_buff0_3_ce0;
output   ifm_buff0_3_we0;
output  [31:0] ifm_buff0_3_d0;
output  [5:0] ifm_buff0_4_address0;
output   ifm_buff0_4_ce0;
output   ifm_buff0_4_we0;
output  [31:0] ifm_buff0_4_d0;
output  [5:0] ifm_buff0_5_address0;
output   ifm_buff0_5_ce0;
output   ifm_buff0_5_we0;
output  [31:0] ifm_buff0_5_d0;
output  [5:0] ifm_buff0_6_address0;
output   ifm_buff0_6_ce0;
output   ifm_buff0_6_we0;
output  [31:0] ifm_buff0_6_d0;
output  [5:0] ifm_buff0_7_address0;
output   ifm_buff0_7_ce0;
output   ifm_buff0_7_we0;
output  [31:0] ifm_buff0_7_d0;
output  [5:0] ifm_buff0_8_address0;
output   ifm_buff0_8_ce0;
output   ifm_buff0_8_we0;
output  [31:0] ifm_buff0_8_d0;
output  [5:0] ifm_buff0_9_address0;
output   ifm_buff0_9_ce0;
output   ifm_buff0_9_we0;
output  [31:0] ifm_buff0_9_d0;
output  [5:0] ifm_buff0_10_address0;
output   ifm_buff0_10_ce0;
output   ifm_buff0_10_we0;
output  [31:0] ifm_buff0_10_d0;
output  [5:0] ifm_buff0_11_address0;
output   ifm_buff0_11_ce0;
output   ifm_buff0_11_we0;
output  [31:0] ifm_buff0_11_d0;
output  [5:0] ifm_buff0_12_address0;
output   ifm_buff0_12_ce0;
output   ifm_buff0_12_we0;
output  [31:0] ifm_buff0_12_d0;
output  [5:0] ifm_buff0_13_address0;
output   ifm_buff0_13_ce0;
output   ifm_buff0_13_we0;
output  [31:0] ifm_buff0_13_d0;
output  [5:0] ifm_buff0_14_address0;
output   ifm_buff0_14_ce0;
output   ifm_buff0_14_we0;
output  [31:0] ifm_buff0_14_d0;
output  [5:0] ifm_buff0_15_address0;
output   ifm_buff0_15_ce0;
output   ifm_buff0_15_we0;
output  [31:0] ifm_buff0_15_d0;
input  [31:0] cifm_counter_read;
input   enable;
output  [31:0] ap_return;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg cifm_TREADY;
reg ifm_buff0_0_ce0;
reg ifm_buff0_0_we0;
reg ifm_buff0_1_ce0;
reg ifm_buff0_1_we0;
reg ifm_buff0_2_ce0;
reg ifm_buff0_2_we0;
reg ifm_buff0_3_ce0;
reg ifm_buff0_3_we0;
reg ifm_buff0_4_ce0;
reg ifm_buff0_4_we0;
reg ifm_buff0_5_ce0;
reg ifm_buff0_5_we0;
reg ifm_buff0_6_ce0;
reg ifm_buff0_6_we0;
reg ifm_buff0_7_ce0;
reg ifm_buff0_7_we0;
reg ifm_buff0_8_ce0;
reg ifm_buff0_8_we0;
reg ifm_buff0_9_ce0;
reg ifm_buff0_9_we0;
reg ifm_buff0_10_ce0;
reg ifm_buff0_10_we0;
reg ifm_buff0_11_ce0;
reg ifm_buff0_11_we0;
reg ifm_buff0_12_ce0;
reg ifm_buff0_12_we0;
reg ifm_buff0_13_ce0;
reg ifm_buff0_13_we0;
reg ifm_buff0_14_ce0;
reg ifm_buff0_14_we0;
reg ifm_buff0_15_ce0;
reg ifm_buff0_15_we0;
reg[31:0] ap_return;

(* fsm_encoding = "none" *) reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    cifm_TDATA_blk_n;
wire    ap_CS_fsm_state2;
wire   [0:0] icmp_ln61_fu_394_p2;
wire   [0:0] enable_read_read_fu_142_p2;
wire   [31:0] add_ln61_fu_388_p2;
reg   [31:0] add_ln61_reg_669;
wire   [5:0] j_fu_400_p2;
reg    ap_block_state2;
reg   [5:0] j_0_reg_368;
reg   [31:0] ap_phi_mux_cifm_counter_1_phi_fu_382_p4;
reg   [31:0] cifm_counter_1_reg_379;
wire    ap_CS_fsm_state3;
wire   [63:0] zext_ln64_fu_415_p1;
wire   [31:0] trunc_ln64_fu_406_p1;
wire   [31:0] cifm_a1_load_new6_fu_435_p4;
wire   [31:0] cifm_a2_load_new_fu_450_p4;
wire   [31:0] cifm_a3_load_new_fu_465_p4;
wire   [31:0] cifm_a4_load_new_fu_480_p4;
wire   [31:0] cifm_a5_load_new_fu_495_p4;
wire   [31:0] cifm_a6_load_new_fu_510_p4;
wire   [31:0] cifm_a7_load_new_fu_525_p4;
wire   [31:0] cifm_a8_load_new_fu_540_p4;
wire   [31:0] cifm_a9_load_new_fu_555_p4;
wire   [31:0] cifm_a10_load_new_fu_570_p4;
wire   [31:0] cifm_a11_load_new_fu_585_p4;
wire   [31:0] cifm_a12_load_new_fu_600_p4;
wire   [31:0] cifm_a13_load_new_fu_615_p4;
wire   [31:0] cifm_a14_load_new_fu_630_p4;
wire   [31:0] cifm_a15_load_new_fu_645_p4;
reg   [31:0] ap_return_preg;
reg   [2:0] ap_NS_fsm;

// power-on initialization
initial begin
#0 ap_CS_fsm = 3'd1;
#0 ap_return_preg = 32'd0;
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_return_preg <= 32'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state3)) begin
            ap_return_preg <= ap_phi_mux_cifm_counter_1_phi_fu_382_p4;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state3) & (enable_read_read_fu_142_p2 == 1'd1))) begin
        cifm_counter_1_reg_379 <= add_ln61_reg_669;
    end else if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1) & (enable_read_read_fu_142_p2 == 1'd0))) begin
        cifm_counter_1_reg_379 <= cifm_counter_read;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1) & (enable_read_read_fu_142_p2 == 1'd1))) begin
        j_0_reg_368 <= 6'd0;
    end else if ((~((cifm_TVALID == 1'b0) & (icmp_ln61_fu_394_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln61_fu_394_p2 == 1'd0))) begin
        j_0_reg_368 <= j_fu_400_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1) & (enable_read_read_fu_142_p2 == 1'd1))) begin
        add_ln61_reg_669 <= add_ln61_fu_388_p2;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) | ((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1)))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) & (enable_read_read_fu_142_p2 == 1'd1))) begin
        ap_phi_mux_cifm_counter_1_phi_fu_382_p4 = add_ln61_reg_669;
    end else begin
        ap_phi_mux_cifm_counter_1_phi_fu_382_p4 = cifm_counter_1_reg_379;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        ap_return = ap_phi_mux_cifm_counter_1_phi_fu_382_p4;
    end else begin
        ap_return = ap_return_preg;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) & (icmp_ln61_fu_394_p2 == 1'd0))) begin
        cifm_TDATA_blk_n = cifm_TVALID;
    end else begin
        cifm_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((cifm_TVALID == 1'b0) & (icmp_ln61_fu_394_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln61_fu_394_p2 == 1'd0))) begin
        cifm_TREADY = 1'b1;
    end else begin
        cifm_TREADY = 1'b0;
    end
end

always @ (*) begin
    if ((~((cifm_TVALID == 1'b0) & (icmp_ln61_fu_394_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state2))) begin
        ifm_buff0_0_ce0 = 1'b1;
    end else begin
        ifm_buff0_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((cifm_TVALID == 1'b0) & (icmp_ln61_fu_394_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln61_fu_394_p2 == 1'd0))) begin
        ifm_buff0_0_we0 = 1'b1;
    end else begin
        ifm_buff0_0_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((cifm_TVALID == 1'b0) & (icmp_ln61_fu_394_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state2))) begin
        ifm_buff0_10_ce0 = 1'b1;
    end else begin
        ifm_buff0_10_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((cifm_TVALID == 1'b0) & (icmp_ln61_fu_394_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln61_fu_394_p2 == 1'd0))) begin
        ifm_buff0_10_we0 = 1'b1;
    end else begin
        ifm_buff0_10_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((cifm_TVALID == 1'b0) & (icmp_ln61_fu_394_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state2))) begin
        ifm_buff0_11_ce0 = 1'b1;
    end else begin
        ifm_buff0_11_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((cifm_TVALID == 1'b0) & (icmp_ln61_fu_394_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln61_fu_394_p2 == 1'd0))) begin
        ifm_buff0_11_we0 = 1'b1;
    end else begin
        ifm_buff0_11_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((cifm_TVALID == 1'b0) & (icmp_ln61_fu_394_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state2))) begin
        ifm_buff0_12_ce0 = 1'b1;
    end else begin
        ifm_buff0_12_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((cifm_TVALID == 1'b0) & (icmp_ln61_fu_394_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln61_fu_394_p2 == 1'd0))) begin
        ifm_buff0_12_we0 = 1'b1;
    end else begin
        ifm_buff0_12_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((cifm_TVALID == 1'b0) & (icmp_ln61_fu_394_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state2))) begin
        ifm_buff0_13_ce0 = 1'b1;
    end else begin
        ifm_buff0_13_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((cifm_TVALID == 1'b0) & (icmp_ln61_fu_394_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln61_fu_394_p2 == 1'd0))) begin
        ifm_buff0_13_we0 = 1'b1;
    end else begin
        ifm_buff0_13_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((cifm_TVALID == 1'b0) & (icmp_ln61_fu_394_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state2))) begin
        ifm_buff0_14_ce0 = 1'b1;
    end else begin
        ifm_buff0_14_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((cifm_TVALID == 1'b0) & (icmp_ln61_fu_394_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln61_fu_394_p2 == 1'd0))) begin
        ifm_buff0_14_we0 = 1'b1;
    end else begin
        ifm_buff0_14_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((cifm_TVALID == 1'b0) & (icmp_ln61_fu_394_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state2))) begin
        ifm_buff0_15_ce0 = 1'b1;
    end else begin
        ifm_buff0_15_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((cifm_TVALID == 1'b0) & (icmp_ln61_fu_394_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln61_fu_394_p2 == 1'd0))) begin
        ifm_buff0_15_we0 = 1'b1;
    end else begin
        ifm_buff0_15_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((cifm_TVALID == 1'b0) & (icmp_ln61_fu_394_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state2))) begin
        ifm_buff0_1_ce0 = 1'b1;
    end else begin
        ifm_buff0_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((cifm_TVALID == 1'b0) & (icmp_ln61_fu_394_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln61_fu_394_p2 == 1'd0))) begin
        ifm_buff0_1_we0 = 1'b1;
    end else begin
        ifm_buff0_1_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((cifm_TVALID == 1'b0) & (icmp_ln61_fu_394_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state2))) begin
        ifm_buff0_2_ce0 = 1'b1;
    end else begin
        ifm_buff0_2_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((cifm_TVALID == 1'b0) & (icmp_ln61_fu_394_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln61_fu_394_p2 == 1'd0))) begin
        ifm_buff0_2_we0 = 1'b1;
    end else begin
        ifm_buff0_2_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((cifm_TVALID == 1'b0) & (icmp_ln61_fu_394_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state2))) begin
        ifm_buff0_3_ce0 = 1'b1;
    end else begin
        ifm_buff0_3_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((cifm_TVALID == 1'b0) & (icmp_ln61_fu_394_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln61_fu_394_p2 == 1'd0))) begin
        ifm_buff0_3_we0 = 1'b1;
    end else begin
        ifm_buff0_3_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((cifm_TVALID == 1'b0) & (icmp_ln61_fu_394_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state2))) begin
        ifm_buff0_4_ce0 = 1'b1;
    end else begin
        ifm_buff0_4_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((cifm_TVALID == 1'b0) & (icmp_ln61_fu_394_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln61_fu_394_p2 == 1'd0))) begin
        ifm_buff0_4_we0 = 1'b1;
    end else begin
        ifm_buff0_4_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((cifm_TVALID == 1'b0) & (icmp_ln61_fu_394_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state2))) begin
        ifm_buff0_5_ce0 = 1'b1;
    end else begin
        ifm_buff0_5_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((cifm_TVALID == 1'b0) & (icmp_ln61_fu_394_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln61_fu_394_p2 == 1'd0))) begin
        ifm_buff0_5_we0 = 1'b1;
    end else begin
        ifm_buff0_5_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((cifm_TVALID == 1'b0) & (icmp_ln61_fu_394_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state2))) begin
        ifm_buff0_6_ce0 = 1'b1;
    end else begin
        ifm_buff0_6_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((cifm_TVALID == 1'b0) & (icmp_ln61_fu_394_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln61_fu_394_p2 == 1'd0))) begin
        ifm_buff0_6_we0 = 1'b1;
    end else begin
        ifm_buff0_6_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((cifm_TVALID == 1'b0) & (icmp_ln61_fu_394_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state2))) begin
        ifm_buff0_7_ce0 = 1'b1;
    end else begin
        ifm_buff0_7_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((cifm_TVALID == 1'b0) & (icmp_ln61_fu_394_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln61_fu_394_p2 == 1'd0))) begin
        ifm_buff0_7_we0 = 1'b1;
    end else begin
        ifm_buff0_7_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((cifm_TVALID == 1'b0) & (icmp_ln61_fu_394_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state2))) begin
        ifm_buff0_8_ce0 = 1'b1;
    end else begin
        ifm_buff0_8_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((cifm_TVALID == 1'b0) & (icmp_ln61_fu_394_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln61_fu_394_p2 == 1'd0))) begin
        ifm_buff0_8_we0 = 1'b1;
    end else begin
        ifm_buff0_8_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((cifm_TVALID == 1'b0) & (icmp_ln61_fu_394_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state2))) begin
        ifm_buff0_9_ce0 = 1'b1;
    end else begin
        ifm_buff0_9_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((cifm_TVALID == 1'b0) & (icmp_ln61_fu_394_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln61_fu_394_p2 == 1'd0))) begin
        ifm_buff0_9_we0 = 1'b1;
    end else begin
        ifm_buff0_9_we0 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1) & (enable_read_read_fu_142_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1) & (enable_read_read_fu_142_p2 == 1'd0))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if ((~((cifm_TVALID == 1'b0) & (icmp_ln61_fu_394_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln61_fu_394_p2 == 1'd0))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else if ((~((cifm_TVALID == 1'b0) & (icmp_ln61_fu_394_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln61_fu_394_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln61_fu_388_p2 = (cifm_counter_read + 32'd58);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

always @ (*) begin
    ap_block_state2 = ((cifm_TVALID == 1'b0) & (icmp_ln61_fu_394_p2 == 1'd0));
end

assign cifm_a10_load_new_fu_570_p4 = {{cifm_TDATA[351:320]}};

assign cifm_a11_load_new_fu_585_p4 = {{cifm_TDATA[383:352]}};

assign cifm_a12_load_new_fu_600_p4 = {{cifm_TDATA[415:384]}};

assign cifm_a13_load_new_fu_615_p4 = {{cifm_TDATA[447:416]}};

assign cifm_a14_load_new_fu_630_p4 = {{cifm_TDATA[479:448]}};

assign cifm_a15_load_new_fu_645_p4 = {{cifm_TDATA[511:480]}};

assign cifm_a1_load_new6_fu_435_p4 = {{cifm_TDATA[63:32]}};

assign cifm_a2_load_new_fu_450_p4 = {{cifm_TDATA[95:64]}};

assign cifm_a3_load_new_fu_465_p4 = {{cifm_TDATA[127:96]}};

assign cifm_a4_load_new_fu_480_p4 = {{cifm_TDATA[159:128]}};

assign cifm_a5_load_new_fu_495_p4 = {{cifm_TDATA[191:160]}};

assign cifm_a6_load_new_fu_510_p4 = {{cifm_TDATA[223:192]}};

assign cifm_a7_load_new_fu_525_p4 = {{cifm_TDATA[255:224]}};

assign cifm_a8_load_new_fu_540_p4 = {{cifm_TDATA[287:256]}};

assign cifm_a9_load_new_fu_555_p4 = {{cifm_TDATA[319:288]}};

assign enable_read_read_fu_142_p2 = enable;

assign icmp_ln61_fu_394_p2 = ((j_0_reg_368 == 6'd58) ? 1'b1 : 1'b0);

assign ifm_buff0_0_address0 = zext_ln64_fu_415_p1;

assign ifm_buff0_0_d0 = trunc_ln64_fu_406_p1;

assign ifm_buff0_10_address0 = zext_ln64_fu_415_p1;

assign ifm_buff0_10_d0 = cifm_a10_load_new_fu_570_p4;

assign ifm_buff0_11_address0 = zext_ln64_fu_415_p1;

assign ifm_buff0_11_d0 = cifm_a11_load_new_fu_585_p4;

assign ifm_buff0_12_address0 = zext_ln64_fu_415_p1;

assign ifm_buff0_12_d0 = cifm_a12_load_new_fu_600_p4;

assign ifm_buff0_13_address0 = zext_ln64_fu_415_p1;

assign ifm_buff0_13_d0 = cifm_a13_load_new_fu_615_p4;

assign ifm_buff0_14_address0 = zext_ln64_fu_415_p1;

assign ifm_buff0_14_d0 = cifm_a14_load_new_fu_630_p4;

assign ifm_buff0_15_address0 = zext_ln64_fu_415_p1;

assign ifm_buff0_15_d0 = cifm_a15_load_new_fu_645_p4;

assign ifm_buff0_1_address0 = zext_ln64_fu_415_p1;

assign ifm_buff0_1_d0 = cifm_a1_load_new6_fu_435_p4;

assign ifm_buff0_2_address0 = zext_ln64_fu_415_p1;

assign ifm_buff0_2_d0 = cifm_a2_load_new_fu_450_p4;

assign ifm_buff0_3_address0 = zext_ln64_fu_415_p1;

assign ifm_buff0_3_d0 = cifm_a3_load_new_fu_465_p4;

assign ifm_buff0_4_address0 = zext_ln64_fu_415_p1;

assign ifm_buff0_4_d0 = cifm_a4_load_new_fu_480_p4;

assign ifm_buff0_5_address0 = zext_ln64_fu_415_p1;

assign ifm_buff0_5_d0 = cifm_a5_load_new_fu_495_p4;

assign ifm_buff0_6_address0 = zext_ln64_fu_415_p1;

assign ifm_buff0_6_d0 = cifm_a6_load_new_fu_510_p4;

assign ifm_buff0_7_address0 = zext_ln64_fu_415_p1;

assign ifm_buff0_7_d0 = cifm_a7_load_new_fu_525_p4;

assign ifm_buff0_8_address0 = zext_ln64_fu_415_p1;

assign ifm_buff0_8_d0 = cifm_a8_load_new_fu_540_p4;

assign ifm_buff0_9_address0 = zext_ln64_fu_415_p1;

assign ifm_buff0_9_d0 = cifm_a9_load_new_fu_555_p4;

assign j_fu_400_p2 = (j_0_reg_368 + 6'd1);

assign trunc_ln64_fu_406_p1 = cifm_TDATA[31:0];

assign zext_ln64_fu_415_p1 = j_0_reg_368;

endmodule //write_row_ifm
