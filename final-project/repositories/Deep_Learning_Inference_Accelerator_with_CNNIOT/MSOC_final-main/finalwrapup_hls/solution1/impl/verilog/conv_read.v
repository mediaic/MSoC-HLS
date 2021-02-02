// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and OpenCL
// Version: 2019.2
// Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module conv_read (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        cofm_TDATA,
        cofm_TVALID,
        cofm_TREADY,
        ofm_buff0_0_address0,
        ofm_buff0_0_ce0,
        ofm_buff0_0_q0,
        ofm_buff0_1_address0,
        ofm_buff0_1_ce0,
        ofm_buff0_1_q0,
        ofm_buff0_2_address0,
        ofm_buff0_2_ce0,
        ofm_buff0_2_q0,
        ofm_buff0_3_address0,
        ofm_buff0_3_ce0,
        ofm_buff0_3_q0,
        ofm_buff0_4_address0,
        ofm_buff0_4_ce0,
        ofm_buff0_4_q0,
        ofm_buff0_5_address0,
        ofm_buff0_5_ce0,
        ofm_buff0_5_q0,
        ofm_buff0_6_address0,
        ofm_buff0_6_ce0,
        ofm_buff0_6_q0,
        ofm_buff0_7_address0,
        ofm_buff0_7_ce0,
        ofm_buff0_7_q0,
        ofm_buff0_8_address0,
        ofm_buff0_8_ce0,
        ofm_buff0_8_q0,
        ofm_buff0_9_address0,
        ofm_buff0_9_ce0,
        ofm_buff0_9_q0,
        ofm_buff0_10_address0,
        ofm_buff0_10_ce0,
        ofm_buff0_10_q0,
        ofm_buff0_11_address0,
        ofm_buff0_11_ce0,
        ofm_buff0_11_q0,
        ofm_buff0_12_address0,
        ofm_buff0_12_ce0,
        ofm_buff0_12_q0,
        ofm_buff0_13_address0,
        ofm_buff0_13_ce0,
        ofm_buff0_13_q0,
        ofm_buff0_14_address0,
        ofm_buff0_14_ce0,
        ofm_buff0_14_q0,
        ofm_buff0_15_address0,
        ofm_buff0_15_ce0,
        ofm_buff0_15_q0,
        cofm_counter_read,
        enable,
        ap_return
);

parameter    ap_ST_fsm_state1 = 3'd1;
parameter    ap_ST_fsm_pp0_stage0 = 3'd2;
parameter    ap_ST_fsm_state4 = 3'd4;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [511:0] cofm_TDATA;
output   cofm_TVALID;
input   cofm_TREADY;
output  [5:0] ofm_buff0_0_address0;
output   ofm_buff0_0_ce0;
input  [31:0] ofm_buff0_0_q0;
output  [5:0] ofm_buff0_1_address0;
output   ofm_buff0_1_ce0;
input  [31:0] ofm_buff0_1_q0;
output  [5:0] ofm_buff0_2_address0;
output   ofm_buff0_2_ce0;
input  [31:0] ofm_buff0_2_q0;
output  [5:0] ofm_buff0_3_address0;
output   ofm_buff0_3_ce0;
input  [31:0] ofm_buff0_3_q0;
output  [5:0] ofm_buff0_4_address0;
output   ofm_buff0_4_ce0;
input  [31:0] ofm_buff0_4_q0;
output  [5:0] ofm_buff0_5_address0;
output   ofm_buff0_5_ce0;
input  [31:0] ofm_buff0_5_q0;
output  [5:0] ofm_buff0_6_address0;
output   ofm_buff0_6_ce0;
input  [31:0] ofm_buff0_6_q0;
output  [5:0] ofm_buff0_7_address0;
output   ofm_buff0_7_ce0;
input  [31:0] ofm_buff0_7_q0;
output  [5:0] ofm_buff0_8_address0;
output   ofm_buff0_8_ce0;
input  [31:0] ofm_buff0_8_q0;
output  [5:0] ofm_buff0_9_address0;
output   ofm_buff0_9_ce0;
input  [31:0] ofm_buff0_9_q0;
output  [5:0] ofm_buff0_10_address0;
output   ofm_buff0_10_ce0;
input  [31:0] ofm_buff0_10_q0;
output  [5:0] ofm_buff0_11_address0;
output   ofm_buff0_11_ce0;
input  [31:0] ofm_buff0_11_q0;
output  [5:0] ofm_buff0_12_address0;
output   ofm_buff0_12_ce0;
input  [31:0] ofm_buff0_12_q0;
output  [5:0] ofm_buff0_13_address0;
output   ofm_buff0_13_ce0;
input  [31:0] ofm_buff0_13_q0;
output  [5:0] ofm_buff0_14_address0;
output   ofm_buff0_14_ce0;
input  [31:0] ofm_buff0_14_q0;
output  [5:0] ofm_buff0_15_address0;
output   ofm_buff0_15_ce0;
input  [31:0] ofm_buff0_15_q0;
input  [31:0] cofm_counter_read;
input   enable;
output  [31:0] ap_return;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg cofm_TVALID;
reg ofm_buff0_0_ce0;
reg ofm_buff0_1_ce0;
reg ofm_buff0_2_ce0;
reg ofm_buff0_3_ce0;
reg ofm_buff0_4_ce0;
reg ofm_buff0_5_ce0;
reg ofm_buff0_6_ce0;
reg ofm_buff0_7_ce0;
reg ofm_buff0_8_ce0;
reg ofm_buff0_9_ce0;
reg ofm_buff0_10_ce0;
reg ofm_buff0_11_ce0;
reg ofm_buff0_12_ce0;
reg ofm_buff0_13_ce0;
reg ofm_buff0_14_ce0;
reg ofm_buff0_15_ce0;
reg[31:0] ap_return;

(* fsm_encoding = "none" *) reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    cofm_TDATA_blk_n;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter1;
wire    ap_block_pp0_stage0;
reg   [0:0] icmp_ln199_reg_482;
reg   [5:0] j_0_reg_309;
wire   [0:0] enable_read_read_fu_82_p2;
wire   [31:0] add_ln199_fu_329_p2;
reg   [31:0] add_ln199_reg_477;
wire   [0:0] icmp_ln199_fu_335_p2;
wire    ap_block_state2_pp0_stage0_iter0;
wire    ap_block_state3_pp0_stage0_iter1;
reg    ap_block_state3_io;
reg    ap_block_pp0_stage0_11001;
wire   [5:0] j_fu_341_p2;
reg    ap_enable_reg_pp0_iter0;
reg    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_exit_iter0_state2;
reg   [31:0] ap_phi_mux_cofm_counter_1_phi_fu_323_p4;
reg   [31:0] cofm_counter_1_reg_320;
wire    ap_CS_fsm_state4;
wire   [63:0] zext_ln202_fu_347_p1;
wire    ap_block_pp0_stage0_01001;
wire   [31:0] bitcast_ln217_fu_427_p1;
wire   [31:0] bitcast_ln216_fu_423_p1;
wire   [31:0] bitcast_ln215_fu_419_p1;
wire   [31:0] bitcast_ln214_fu_415_p1;
wire   [31:0] bitcast_ln213_fu_411_p1;
wire   [31:0] bitcast_ln212_fu_407_p1;
wire   [31:0] bitcast_ln211_fu_403_p1;
wire   [31:0] bitcast_ln210_fu_399_p1;
wire   [31:0] bitcast_ln209_fu_395_p1;
wire   [31:0] bitcast_ln208_fu_391_p1;
wire   [31:0] bitcast_ln207_fu_387_p1;
wire   [31:0] bitcast_ln206_fu_383_p1;
wire   [31:0] bitcast_ln205_fu_379_p1;
wire   [31:0] bitcast_ln204_fu_375_p1;
wire   [31:0] bitcast_ln203_fu_371_p1;
wire   [31:0] bitcast_ln202_fu_367_p1;
reg   [31:0] ap_return_preg;
reg   [2:0] ap_NS_fsm;
reg    ap_idle_pp0;
wire    ap_enable_pp0;

// power-on initialization
initial begin
#0 ap_CS_fsm = 3'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter0 = 1'b0;
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
        ap_enable_reg_pp0_iter0 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_condition_pp0_exit_iter0_state2) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter0 <= 1'b0;
        end else if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1) & (enable_read_read_fu_82_p2 == 1'd1))) begin
            ap_enable_reg_pp0_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_condition_pp0_exit_iter0_state2))) begin
            ap_enable_reg_pp0_iter1 <= (1'b1 ^ ap_condition_pp0_exit_iter0_state2);
        end else if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
        end else if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1) & (enable_read_read_fu_82_p2 == 1'd1))) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_return_preg <= 32'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state4)) begin
            ap_return_preg <= ap_phi_mux_cofm_counter_1_phi_fu_323_p4;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state4) & (enable_read_read_fu_82_p2 == 1'd1))) begin
        cofm_counter_1_reg_320 <= add_ln199_reg_477;
    end else if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1) & (enable_read_read_fu_82_p2 == 1'd0))) begin
        cofm_counter_1_reg_320 <= cofm_counter_read;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1) & (enable_read_read_fu_82_p2 == 1'd1))) begin
        j_0_reg_309 <= 6'd0;
    end else if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln199_fu_335_p2 == 1'd0))) begin
        j_0_reg_309 <= j_fu_341_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1) & (enable_read_read_fu_82_p2 == 1'd1))) begin
        add_ln199_reg_477 <= add_ln199_fu_329_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        icmp_ln199_reg_482 <= icmp_ln199_fu_335_p2;
    end
end

always @ (*) begin
    if ((icmp_ln199_fu_335_p2 == 1'd1)) begin
        ap_condition_pp0_exit_iter0_state2 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter0_state2 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) | ((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1)))) begin
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
    if (((ap_enable_reg_pp0_iter0 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) & (enable_read_read_fu_82_p2 == 1'd1))) begin
        ap_phi_mux_cofm_counter_1_phi_fu_323_p4 = add_ln199_reg_477;
    end else begin
        ap_phi_mux_cofm_counter_1_phi_fu_323_p4 = cofm_counter_1_reg_320;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        ap_return = ap_phi_mux_cofm_counter_1_phi_fu_323_p4;
    end else begin
        ap_return = ap_return_preg;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln199_reg_482 == 1'd0) & (1'b0 == ap_block_pp0_stage0))) begin
        cofm_TDATA_blk_n = cofm_TREADY;
    end else begin
        cofm_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln199_reg_482 == 1'd0))) begin
        cofm_TVALID = 1'b1;
    end else begin
        cofm_TVALID = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ofm_buff0_0_ce0 = 1'b1;
    end else begin
        ofm_buff0_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ofm_buff0_10_ce0 = 1'b1;
    end else begin
        ofm_buff0_10_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ofm_buff0_11_ce0 = 1'b1;
    end else begin
        ofm_buff0_11_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ofm_buff0_12_ce0 = 1'b1;
    end else begin
        ofm_buff0_12_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ofm_buff0_13_ce0 = 1'b1;
    end else begin
        ofm_buff0_13_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ofm_buff0_14_ce0 = 1'b1;
    end else begin
        ofm_buff0_14_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ofm_buff0_15_ce0 = 1'b1;
    end else begin
        ofm_buff0_15_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ofm_buff0_1_ce0 = 1'b1;
    end else begin
        ofm_buff0_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ofm_buff0_2_ce0 = 1'b1;
    end else begin
        ofm_buff0_2_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ofm_buff0_3_ce0 = 1'b1;
    end else begin
        ofm_buff0_3_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ofm_buff0_4_ce0 = 1'b1;
    end else begin
        ofm_buff0_4_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ofm_buff0_5_ce0 = 1'b1;
    end else begin
        ofm_buff0_5_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ofm_buff0_6_ce0 = 1'b1;
    end else begin
        ofm_buff0_6_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ofm_buff0_7_ce0 = 1'b1;
    end else begin
        ofm_buff0_7_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ofm_buff0_8_ce0 = 1'b1;
    end else begin
        ofm_buff0_8_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ofm_buff0_9_ce0 = 1'b1;
    end else begin
        ofm_buff0_9_ce0 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1) & (enable_read_read_fu_82_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1) & (enable_read_read_fu_82_p2 == 1'd0))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_pp0_stage0 : begin
            if (~((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (icmp_ln199_fu_335_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (icmp_ln199_fu_335_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln199_fu_329_p2 = (cofm_counter_read + 32'd56);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd2];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_01001 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_block_state3_io));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_block_state3_io));
end

assign ap_block_state2_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state3_io = ((cofm_TREADY == 1'b0) & (icmp_ln199_reg_482 == 1'd0));
end

assign ap_block_state3_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign bitcast_ln202_fu_367_p1 = ofm_buff0_0_q0;

assign bitcast_ln203_fu_371_p1 = ofm_buff0_1_q0;

assign bitcast_ln204_fu_375_p1 = ofm_buff0_2_q0;

assign bitcast_ln205_fu_379_p1 = ofm_buff0_3_q0;

assign bitcast_ln206_fu_383_p1 = ofm_buff0_4_q0;

assign bitcast_ln207_fu_387_p1 = ofm_buff0_5_q0;

assign bitcast_ln208_fu_391_p1 = ofm_buff0_6_q0;

assign bitcast_ln209_fu_395_p1 = ofm_buff0_7_q0;

assign bitcast_ln210_fu_399_p1 = ofm_buff0_8_q0;

assign bitcast_ln211_fu_403_p1 = ofm_buff0_9_q0;

assign bitcast_ln212_fu_407_p1 = ofm_buff0_10_q0;

assign bitcast_ln213_fu_411_p1 = ofm_buff0_11_q0;

assign bitcast_ln214_fu_415_p1 = ofm_buff0_12_q0;

assign bitcast_ln215_fu_419_p1 = ofm_buff0_13_q0;

assign bitcast_ln216_fu_423_p1 = ofm_buff0_14_q0;

assign bitcast_ln217_fu_427_p1 = ofm_buff0_15_q0;

assign cofm_TDATA = {{{{{{{{{{{{{{{{bitcast_ln217_fu_427_p1}, {bitcast_ln216_fu_423_p1}}, {bitcast_ln215_fu_419_p1}}, {bitcast_ln214_fu_415_p1}}, {bitcast_ln213_fu_411_p1}}, {bitcast_ln212_fu_407_p1}}, {bitcast_ln211_fu_403_p1}}, {bitcast_ln210_fu_399_p1}}, {bitcast_ln209_fu_395_p1}}, {bitcast_ln208_fu_391_p1}}, {bitcast_ln207_fu_387_p1}}, {bitcast_ln206_fu_383_p1}}, {bitcast_ln205_fu_379_p1}}, {bitcast_ln204_fu_375_p1}}, {bitcast_ln203_fu_371_p1}}, {bitcast_ln202_fu_367_p1}};

assign enable_read_read_fu_82_p2 = enable;

assign icmp_ln199_fu_335_p2 = ((j_0_reg_309 == 6'd56) ? 1'b1 : 1'b0);

assign j_fu_341_p2 = (j_0_reg_309 + 6'd1);

assign ofm_buff0_0_address0 = zext_ln202_fu_347_p1;

assign ofm_buff0_10_address0 = zext_ln202_fu_347_p1;

assign ofm_buff0_11_address0 = zext_ln202_fu_347_p1;

assign ofm_buff0_12_address0 = zext_ln202_fu_347_p1;

assign ofm_buff0_13_address0 = zext_ln202_fu_347_p1;

assign ofm_buff0_14_address0 = zext_ln202_fu_347_p1;

assign ofm_buff0_15_address0 = zext_ln202_fu_347_p1;

assign ofm_buff0_1_address0 = zext_ln202_fu_347_p1;

assign ofm_buff0_2_address0 = zext_ln202_fu_347_p1;

assign ofm_buff0_3_address0 = zext_ln202_fu_347_p1;

assign ofm_buff0_4_address0 = zext_ln202_fu_347_p1;

assign ofm_buff0_5_address0 = zext_ln202_fu_347_p1;

assign ofm_buff0_6_address0 = zext_ln202_fu_347_p1;

assign ofm_buff0_7_address0 = zext_ln202_fu_347_p1;

assign ofm_buff0_8_address0 = zext_ln202_fu_347_p1;

assign ofm_buff0_9_address0 = zext_ln202_fu_347_p1;

assign zext_ln202_fu_347_p1 = j_0_reg_309;

endmodule //conv_read
