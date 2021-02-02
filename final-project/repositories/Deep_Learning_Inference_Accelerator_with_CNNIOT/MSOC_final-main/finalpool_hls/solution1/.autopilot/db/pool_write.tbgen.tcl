set moduleName pool_write
set isTopModule 0
set isTaskLevelControl 1
set isCombinational 0
set isDatapathOnly 0
set isFreeRunPipelineModule 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {pool_write}
set C_modelType { void 0 }
set C_modelArgList {
	{ ifm_buff0_0 float 32 regular {array 58 { 1 1 } 1 1 }  }
	{ ifm_buff0_1 float 32 regular {array 58 { 1 1 } 1 1 }  }
	{ ifm_buff0_2 float 32 regular {array 58 { 1 1 } 1 1 }  }
	{ ifm_buff0_3 float 32 regular {array 58 { 1 1 } 1 1 }  }
	{ ifm_buff0_4 float 32 regular {array 58 { 1 1 } 1 1 }  }
	{ ifm_buff0_5 float 32 regular {array 58 { 1 1 } 1 1 }  }
	{ ifm_buff0_6 float 32 regular {array 58 { 1 1 } 1 1 }  }
	{ ifm_buff0_7 float 32 regular {array 58 { 1 1 } 1 1 }  }
	{ ifm_buff0_8 float 32 regular {array 58 { 1 1 } 1 1 }  }
	{ ifm_buff0_9 float 32 regular {array 58 { 1 1 } 1 1 }  }
	{ ifm_buff0_10 float 32 regular {array 58 { 1 1 } 1 1 }  }
	{ ifm_buff0_11 float 32 regular {array 58 { 1 1 } 1 1 }  }
	{ ifm_buff0_12 float 32 regular {array 58 { 1 1 } 1 1 }  }
	{ ifm_buff0_13 float 32 regular {array 58 { 1 1 } 1 1 }  }
	{ ifm_buff0_14 float 32 regular {array 58 { 1 1 } 1 1 }  }
	{ ifm_buff0_15 float 32 regular {array 58 { 1 1 } 1 1 }  }
	{ ifm_buff1_0 float 32 regular {array 58 { 1 1 } 1 1 }  }
	{ ifm_buff1_1 float 32 regular {array 58 { 1 1 } 1 1 }  }
	{ ifm_buff1_2 float 32 regular {array 58 { 1 1 } 1 1 }  }
	{ ifm_buff1_3 float 32 regular {array 58 { 1 1 } 1 1 }  }
	{ ifm_buff1_4 float 32 regular {array 58 { 1 1 } 1 1 }  }
	{ ifm_buff1_5 float 32 regular {array 58 { 1 1 } 1 1 }  }
	{ ifm_buff1_6 float 32 regular {array 58 { 1 1 } 1 1 }  }
	{ ifm_buff1_7 float 32 regular {array 58 { 1 1 } 1 1 }  }
	{ ifm_buff1_8 float 32 regular {array 58 { 1 1 } 1 1 }  }
	{ ifm_buff1_9 float 32 regular {array 58 { 1 1 } 1 1 }  }
	{ ifm_buff1_10 float 32 regular {array 58 { 1 1 } 1 1 }  }
	{ ifm_buff1_11 float 32 regular {array 58 { 1 1 } 1 1 }  }
	{ ifm_buff1_12 float 32 regular {array 58 { 1 1 } 1 1 }  }
	{ ifm_buff1_13 float 32 regular {array 58 { 1 1 } 1 1 }  }
	{ ifm_buff1_14 float 32 regular {array 58 { 1 1 } 1 1 }  }
	{ ifm_buff1_15 float 32 regular {array 58 { 1 1 } 1 1 }  }
	{ ofm_buff0_0 float 32 regular {array 56 { 0 3 } 0 1 }  }
	{ ofm_buff0_1 float 32 regular {array 56 { 0 3 } 0 1 }  }
	{ ofm_buff0_2 float 32 regular {array 56 { 0 3 } 0 1 }  }
	{ ofm_buff0_3 float 32 regular {array 56 { 0 3 } 0 1 }  }
	{ ofm_buff0_4 float 32 regular {array 56 { 0 3 } 0 1 }  }
	{ ofm_buff0_5 float 32 regular {array 56 { 0 3 } 0 1 }  }
	{ ofm_buff0_6 float 32 regular {array 56 { 0 3 } 0 1 }  }
	{ ofm_buff0_7 float 32 regular {array 56 { 0 3 } 0 1 }  }
	{ ofm_buff0_8 float 32 regular {array 56 { 0 3 } 0 1 }  }
	{ ofm_buff0_9 float 32 regular {array 56 { 0 3 } 0 1 }  }
	{ ofm_buff0_10 float 32 regular {array 56 { 0 3 } 0 1 }  }
	{ ofm_buff0_11 float 32 regular {array 56 { 0 3 } 0 1 }  }
	{ ofm_buff0_12 float 32 regular {array 56 { 0 3 } 0 1 }  }
	{ ofm_buff0_13 float 32 regular {array 56 { 0 3 } 0 1 }  }
	{ ofm_buff0_14 float 32 regular {array 56 { 0 3 } 0 1 }  }
	{ ofm_buff0_15 float 32 regular {array 56 { 0 3 } 0 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "ifm_buff0_0", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "ifm_buff0_1", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "ifm_buff0_2", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "ifm_buff0_3", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "ifm_buff0_4", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "ifm_buff0_5", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "ifm_buff0_6", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "ifm_buff0_7", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "ifm_buff0_8", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "ifm_buff0_9", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "ifm_buff0_10", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "ifm_buff0_11", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "ifm_buff0_12", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "ifm_buff0_13", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "ifm_buff0_14", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "ifm_buff0_15", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "ifm_buff1_0", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "ifm_buff1_1", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "ifm_buff1_2", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "ifm_buff1_3", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "ifm_buff1_4", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "ifm_buff1_5", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "ifm_buff1_6", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "ifm_buff1_7", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "ifm_buff1_8", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "ifm_buff1_9", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "ifm_buff1_10", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "ifm_buff1_11", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "ifm_buff1_12", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "ifm_buff1_13", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "ifm_buff1_14", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "ifm_buff1_15", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "ofm_buff0_0", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "ofm_buff0_1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "ofm_buff0_2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "ofm_buff0_3", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "ofm_buff0_4", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "ofm_buff0_5", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "ofm_buff0_6", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "ofm_buff0_7", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "ofm_buff0_8", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "ofm_buff0_9", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "ofm_buff0_10", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "ofm_buff0_11", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "ofm_buff0_12", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "ofm_buff0_13", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "ofm_buff0_14", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "ofm_buff0_15", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 262
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ ifm_buff0_0_address0 sc_out sc_lv 6 signal 0 } 
	{ ifm_buff0_0_ce0 sc_out sc_logic 1 signal 0 } 
	{ ifm_buff0_0_q0 sc_in sc_lv 32 signal 0 } 
	{ ifm_buff0_0_address1 sc_out sc_lv 6 signal 0 } 
	{ ifm_buff0_0_ce1 sc_out sc_logic 1 signal 0 } 
	{ ifm_buff0_0_q1 sc_in sc_lv 32 signal 0 } 
	{ ifm_buff0_1_address0 sc_out sc_lv 6 signal 1 } 
	{ ifm_buff0_1_ce0 sc_out sc_logic 1 signal 1 } 
	{ ifm_buff0_1_q0 sc_in sc_lv 32 signal 1 } 
	{ ifm_buff0_1_address1 sc_out sc_lv 6 signal 1 } 
	{ ifm_buff0_1_ce1 sc_out sc_logic 1 signal 1 } 
	{ ifm_buff0_1_q1 sc_in sc_lv 32 signal 1 } 
	{ ifm_buff0_2_address0 sc_out sc_lv 6 signal 2 } 
	{ ifm_buff0_2_ce0 sc_out sc_logic 1 signal 2 } 
	{ ifm_buff0_2_q0 sc_in sc_lv 32 signal 2 } 
	{ ifm_buff0_2_address1 sc_out sc_lv 6 signal 2 } 
	{ ifm_buff0_2_ce1 sc_out sc_logic 1 signal 2 } 
	{ ifm_buff0_2_q1 sc_in sc_lv 32 signal 2 } 
	{ ifm_buff0_3_address0 sc_out sc_lv 6 signal 3 } 
	{ ifm_buff0_3_ce0 sc_out sc_logic 1 signal 3 } 
	{ ifm_buff0_3_q0 sc_in sc_lv 32 signal 3 } 
	{ ifm_buff0_3_address1 sc_out sc_lv 6 signal 3 } 
	{ ifm_buff0_3_ce1 sc_out sc_logic 1 signal 3 } 
	{ ifm_buff0_3_q1 sc_in sc_lv 32 signal 3 } 
	{ ifm_buff0_4_address0 sc_out sc_lv 6 signal 4 } 
	{ ifm_buff0_4_ce0 sc_out sc_logic 1 signal 4 } 
	{ ifm_buff0_4_q0 sc_in sc_lv 32 signal 4 } 
	{ ifm_buff0_4_address1 sc_out sc_lv 6 signal 4 } 
	{ ifm_buff0_4_ce1 sc_out sc_logic 1 signal 4 } 
	{ ifm_buff0_4_q1 sc_in sc_lv 32 signal 4 } 
	{ ifm_buff0_5_address0 sc_out sc_lv 6 signal 5 } 
	{ ifm_buff0_5_ce0 sc_out sc_logic 1 signal 5 } 
	{ ifm_buff0_5_q0 sc_in sc_lv 32 signal 5 } 
	{ ifm_buff0_5_address1 sc_out sc_lv 6 signal 5 } 
	{ ifm_buff0_5_ce1 sc_out sc_logic 1 signal 5 } 
	{ ifm_buff0_5_q1 sc_in sc_lv 32 signal 5 } 
	{ ifm_buff0_6_address0 sc_out sc_lv 6 signal 6 } 
	{ ifm_buff0_6_ce0 sc_out sc_logic 1 signal 6 } 
	{ ifm_buff0_6_q0 sc_in sc_lv 32 signal 6 } 
	{ ifm_buff0_6_address1 sc_out sc_lv 6 signal 6 } 
	{ ifm_buff0_6_ce1 sc_out sc_logic 1 signal 6 } 
	{ ifm_buff0_6_q1 sc_in sc_lv 32 signal 6 } 
	{ ifm_buff0_7_address0 sc_out sc_lv 6 signal 7 } 
	{ ifm_buff0_7_ce0 sc_out sc_logic 1 signal 7 } 
	{ ifm_buff0_7_q0 sc_in sc_lv 32 signal 7 } 
	{ ifm_buff0_7_address1 sc_out sc_lv 6 signal 7 } 
	{ ifm_buff0_7_ce1 sc_out sc_logic 1 signal 7 } 
	{ ifm_buff0_7_q1 sc_in sc_lv 32 signal 7 } 
	{ ifm_buff0_8_address0 sc_out sc_lv 6 signal 8 } 
	{ ifm_buff0_8_ce0 sc_out sc_logic 1 signal 8 } 
	{ ifm_buff0_8_q0 sc_in sc_lv 32 signal 8 } 
	{ ifm_buff0_8_address1 sc_out sc_lv 6 signal 8 } 
	{ ifm_buff0_8_ce1 sc_out sc_logic 1 signal 8 } 
	{ ifm_buff0_8_q1 sc_in sc_lv 32 signal 8 } 
	{ ifm_buff0_9_address0 sc_out sc_lv 6 signal 9 } 
	{ ifm_buff0_9_ce0 sc_out sc_logic 1 signal 9 } 
	{ ifm_buff0_9_q0 sc_in sc_lv 32 signal 9 } 
	{ ifm_buff0_9_address1 sc_out sc_lv 6 signal 9 } 
	{ ifm_buff0_9_ce1 sc_out sc_logic 1 signal 9 } 
	{ ifm_buff0_9_q1 sc_in sc_lv 32 signal 9 } 
	{ ifm_buff0_10_address0 sc_out sc_lv 6 signal 10 } 
	{ ifm_buff0_10_ce0 sc_out sc_logic 1 signal 10 } 
	{ ifm_buff0_10_q0 sc_in sc_lv 32 signal 10 } 
	{ ifm_buff0_10_address1 sc_out sc_lv 6 signal 10 } 
	{ ifm_buff0_10_ce1 sc_out sc_logic 1 signal 10 } 
	{ ifm_buff0_10_q1 sc_in sc_lv 32 signal 10 } 
	{ ifm_buff0_11_address0 sc_out sc_lv 6 signal 11 } 
	{ ifm_buff0_11_ce0 sc_out sc_logic 1 signal 11 } 
	{ ifm_buff0_11_q0 sc_in sc_lv 32 signal 11 } 
	{ ifm_buff0_11_address1 sc_out sc_lv 6 signal 11 } 
	{ ifm_buff0_11_ce1 sc_out sc_logic 1 signal 11 } 
	{ ifm_buff0_11_q1 sc_in sc_lv 32 signal 11 } 
	{ ifm_buff0_12_address0 sc_out sc_lv 6 signal 12 } 
	{ ifm_buff0_12_ce0 sc_out sc_logic 1 signal 12 } 
	{ ifm_buff0_12_q0 sc_in sc_lv 32 signal 12 } 
	{ ifm_buff0_12_address1 sc_out sc_lv 6 signal 12 } 
	{ ifm_buff0_12_ce1 sc_out sc_logic 1 signal 12 } 
	{ ifm_buff0_12_q1 sc_in sc_lv 32 signal 12 } 
	{ ifm_buff0_13_address0 sc_out sc_lv 6 signal 13 } 
	{ ifm_buff0_13_ce0 sc_out sc_logic 1 signal 13 } 
	{ ifm_buff0_13_q0 sc_in sc_lv 32 signal 13 } 
	{ ifm_buff0_13_address1 sc_out sc_lv 6 signal 13 } 
	{ ifm_buff0_13_ce1 sc_out sc_logic 1 signal 13 } 
	{ ifm_buff0_13_q1 sc_in sc_lv 32 signal 13 } 
	{ ifm_buff0_14_address0 sc_out sc_lv 6 signal 14 } 
	{ ifm_buff0_14_ce0 sc_out sc_logic 1 signal 14 } 
	{ ifm_buff0_14_q0 sc_in sc_lv 32 signal 14 } 
	{ ifm_buff0_14_address1 sc_out sc_lv 6 signal 14 } 
	{ ifm_buff0_14_ce1 sc_out sc_logic 1 signal 14 } 
	{ ifm_buff0_14_q1 sc_in sc_lv 32 signal 14 } 
	{ ifm_buff0_15_address0 sc_out sc_lv 6 signal 15 } 
	{ ifm_buff0_15_ce0 sc_out sc_logic 1 signal 15 } 
	{ ifm_buff0_15_q0 sc_in sc_lv 32 signal 15 } 
	{ ifm_buff0_15_address1 sc_out sc_lv 6 signal 15 } 
	{ ifm_buff0_15_ce1 sc_out sc_logic 1 signal 15 } 
	{ ifm_buff0_15_q1 sc_in sc_lv 32 signal 15 } 
	{ ifm_buff1_0_address0 sc_out sc_lv 6 signal 16 } 
	{ ifm_buff1_0_ce0 sc_out sc_logic 1 signal 16 } 
	{ ifm_buff1_0_q0 sc_in sc_lv 32 signal 16 } 
	{ ifm_buff1_0_address1 sc_out sc_lv 6 signal 16 } 
	{ ifm_buff1_0_ce1 sc_out sc_logic 1 signal 16 } 
	{ ifm_buff1_0_q1 sc_in sc_lv 32 signal 16 } 
	{ ifm_buff1_1_address0 sc_out sc_lv 6 signal 17 } 
	{ ifm_buff1_1_ce0 sc_out sc_logic 1 signal 17 } 
	{ ifm_buff1_1_q0 sc_in sc_lv 32 signal 17 } 
	{ ifm_buff1_1_address1 sc_out sc_lv 6 signal 17 } 
	{ ifm_buff1_1_ce1 sc_out sc_logic 1 signal 17 } 
	{ ifm_buff1_1_q1 sc_in sc_lv 32 signal 17 } 
	{ ifm_buff1_2_address0 sc_out sc_lv 6 signal 18 } 
	{ ifm_buff1_2_ce0 sc_out sc_logic 1 signal 18 } 
	{ ifm_buff1_2_q0 sc_in sc_lv 32 signal 18 } 
	{ ifm_buff1_2_address1 sc_out sc_lv 6 signal 18 } 
	{ ifm_buff1_2_ce1 sc_out sc_logic 1 signal 18 } 
	{ ifm_buff1_2_q1 sc_in sc_lv 32 signal 18 } 
	{ ifm_buff1_3_address0 sc_out sc_lv 6 signal 19 } 
	{ ifm_buff1_3_ce0 sc_out sc_logic 1 signal 19 } 
	{ ifm_buff1_3_q0 sc_in sc_lv 32 signal 19 } 
	{ ifm_buff1_3_address1 sc_out sc_lv 6 signal 19 } 
	{ ifm_buff1_3_ce1 sc_out sc_logic 1 signal 19 } 
	{ ifm_buff1_3_q1 sc_in sc_lv 32 signal 19 } 
	{ ifm_buff1_4_address0 sc_out sc_lv 6 signal 20 } 
	{ ifm_buff1_4_ce0 sc_out sc_logic 1 signal 20 } 
	{ ifm_buff1_4_q0 sc_in sc_lv 32 signal 20 } 
	{ ifm_buff1_4_address1 sc_out sc_lv 6 signal 20 } 
	{ ifm_buff1_4_ce1 sc_out sc_logic 1 signal 20 } 
	{ ifm_buff1_4_q1 sc_in sc_lv 32 signal 20 } 
	{ ifm_buff1_5_address0 sc_out sc_lv 6 signal 21 } 
	{ ifm_buff1_5_ce0 sc_out sc_logic 1 signal 21 } 
	{ ifm_buff1_5_q0 sc_in sc_lv 32 signal 21 } 
	{ ifm_buff1_5_address1 sc_out sc_lv 6 signal 21 } 
	{ ifm_buff1_5_ce1 sc_out sc_logic 1 signal 21 } 
	{ ifm_buff1_5_q1 sc_in sc_lv 32 signal 21 } 
	{ ifm_buff1_6_address0 sc_out sc_lv 6 signal 22 } 
	{ ifm_buff1_6_ce0 sc_out sc_logic 1 signal 22 } 
	{ ifm_buff1_6_q0 sc_in sc_lv 32 signal 22 } 
	{ ifm_buff1_6_address1 sc_out sc_lv 6 signal 22 } 
	{ ifm_buff1_6_ce1 sc_out sc_logic 1 signal 22 } 
	{ ifm_buff1_6_q1 sc_in sc_lv 32 signal 22 } 
	{ ifm_buff1_7_address0 sc_out sc_lv 6 signal 23 } 
	{ ifm_buff1_7_ce0 sc_out sc_logic 1 signal 23 } 
	{ ifm_buff1_7_q0 sc_in sc_lv 32 signal 23 } 
	{ ifm_buff1_7_address1 sc_out sc_lv 6 signal 23 } 
	{ ifm_buff1_7_ce1 sc_out sc_logic 1 signal 23 } 
	{ ifm_buff1_7_q1 sc_in sc_lv 32 signal 23 } 
	{ ifm_buff1_8_address0 sc_out sc_lv 6 signal 24 } 
	{ ifm_buff1_8_ce0 sc_out sc_logic 1 signal 24 } 
	{ ifm_buff1_8_q0 sc_in sc_lv 32 signal 24 } 
	{ ifm_buff1_8_address1 sc_out sc_lv 6 signal 24 } 
	{ ifm_buff1_8_ce1 sc_out sc_logic 1 signal 24 } 
	{ ifm_buff1_8_q1 sc_in sc_lv 32 signal 24 } 
	{ ifm_buff1_9_address0 sc_out sc_lv 6 signal 25 } 
	{ ifm_buff1_9_ce0 sc_out sc_logic 1 signal 25 } 
	{ ifm_buff1_9_q0 sc_in sc_lv 32 signal 25 } 
	{ ifm_buff1_9_address1 sc_out sc_lv 6 signal 25 } 
	{ ifm_buff1_9_ce1 sc_out sc_logic 1 signal 25 } 
	{ ifm_buff1_9_q1 sc_in sc_lv 32 signal 25 } 
	{ ifm_buff1_10_address0 sc_out sc_lv 6 signal 26 } 
	{ ifm_buff1_10_ce0 sc_out sc_logic 1 signal 26 } 
	{ ifm_buff1_10_q0 sc_in sc_lv 32 signal 26 } 
	{ ifm_buff1_10_address1 sc_out sc_lv 6 signal 26 } 
	{ ifm_buff1_10_ce1 sc_out sc_logic 1 signal 26 } 
	{ ifm_buff1_10_q1 sc_in sc_lv 32 signal 26 } 
	{ ifm_buff1_11_address0 sc_out sc_lv 6 signal 27 } 
	{ ifm_buff1_11_ce0 sc_out sc_logic 1 signal 27 } 
	{ ifm_buff1_11_q0 sc_in sc_lv 32 signal 27 } 
	{ ifm_buff1_11_address1 sc_out sc_lv 6 signal 27 } 
	{ ifm_buff1_11_ce1 sc_out sc_logic 1 signal 27 } 
	{ ifm_buff1_11_q1 sc_in sc_lv 32 signal 27 } 
	{ ifm_buff1_12_address0 sc_out sc_lv 6 signal 28 } 
	{ ifm_buff1_12_ce0 sc_out sc_logic 1 signal 28 } 
	{ ifm_buff1_12_q0 sc_in sc_lv 32 signal 28 } 
	{ ifm_buff1_12_address1 sc_out sc_lv 6 signal 28 } 
	{ ifm_buff1_12_ce1 sc_out sc_logic 1 signal 28 } 
	{ ifm_buff1_12_q1 sc_in sc_lv 32 signal 28 } 
	{ ifm_buff1_13_address0 sc_out sc_lv 6 signal 29 } 
	{ ifm_buff1_13_ce0 sc_out sc_logic 1 signal 29 } 
	{ ifm_buff1_13_q0 sc_in sc_lv 32 signal 29 } 
	{ ifm_buff1_13_address1 sc_out sc_lv 6 signal 29 } 
	{ ifm_buff1_13_ce1 sc_out sc_logic 1 signal 29 } 
	{ ifm_buff1_13_q1 sc_in sc_lv 32 signal 29 } 
	{ ifm_buff1_14_address0 sc_out sc_lv 6 signal 30 } 
	{ ifm_buff1_14_ce0 sc_out sc_logic 1 signal 30 } 
	{ ifm_buff1_14_q0 sc_in sc_lv 32 signal 30 } 
	{ ifm_buff1_14_address1 sc_out sc_lv 6 signal 30 } 
	{ ifm_buff1_14_ce1 sc_out sc_logic 1 signal 30 } 
	{ ifm_buff1_14_q1 sc_in sc_lv 32 signal 30 } 
	{ ifm_buff1_15_address0 sc_out sc_lv 6 signal 31 } 
	{ ifm_buff1_15_ce0 sc_out sc_logic 1 signal 31 } 
	{ ifm_buff1_15_q0 sc_in sc_lv 32 signal 31 } 
	{ ifm_buff1_15_address1 sc_out sc_lv 6 signal 31 } 
	{ ifm_buff1_15_ce1 sc_out sc_logic 1 signal 31 } 
	{ ifm_buff1_15_q1 sc_in sc_lv 32 signal 31 } 
	{ ofm_buff0_0_address0 sc_out sc_lv 6 signal 32 } 
	{ ofm_buff0_0_ce0 sc_out sc_logic 1 signal 32 } 
	{ ofm_buff0_0_we0 sc_out sc_logic 1 signal 32 } 
	{ ofm_buff0_0_d0 sc_out sc_lv 32 signal 32 } 
	{ ofm_buff0_1_address0 sc_out sc_lv 6 signal 33 } 
	{ ofm_buff0_1_ce0 sc_out sc_logic 1 signal 33 } 
	{ ofm_buff0_1_we0 sc_out sc_logic 1 signal 33 } 
	{ ofm_buff0_1_d0 sc_out sc_lv 32 signal 33 } 
	{ ofm_buff0_2_address0 sc_out sc_lv 6 signal 34 } 
	{ ofm_buff0_2_ce0 sc_out sc_logic 1 signal 34 } 
	{ ofm_buff0_2_we0 sc_out sc_logic 1 signal 34 } 
	{ ofm_buff0_2_d0 sc_out sc_lv 32 signal 34 } 
	{ ofm_buff0_3_address0 sc_out sc_lv 6 signal 35 } 
	{ ofm_buff0_3_ce0 sc_out sc_logic 1 signal 35 } 
	{ ofm_buff0_3_we0 sc_out sc_logic 1 signal 35 } 
	{ ofm_buff0_3_d0 sc_out sc_lv 32 signal 35 } 
	{ ofm_buff0_4_address0 sc_out sc_lv 6 signal 36 } 
	{ ofm_buff0_4_ce0 sc_out sc_logic 1 signal 36 } 
	{ ofm_buff0_4_we0 sc_out sc_logic 1 signal 36 } 
	{ ofm_buff0_4_d0 sc_out sc_lv 32 signal 36 } 
	{ ofm_buff0_5_address0 sc_out sc_lv 6 signal 37 } 
	{ ofm_buff0_5_ce0 sc_out sc_logic 1 signal 37 } 
	{ ofm_buff0_5_we0 sc_out sc_logic 1 signal 37 } 
	{ ofm_buff0_5_d0 sc_out sc_lv 32 signal 37 } 
	{ ofm_buff0_6_address0 sc_out sc_lv 6 signal 38 } 
	{ ofm_buff0_6_ce0 sc_out sc_logic 1 signal 38 } 
	{ ofm_buff0_6_we0 sc_out sc_logic 1 signal 38 } 
	{ ofm_buff0_6_d0 sc_out sc_lv 32 signal 38 } 
	{ ofm_buff0_7_address0 sc_out sc_lv 6 signal 39 } 
	{ ofm_buff0_7_ce0 sc_out sc_logic 1 signal 39 } 
	{ ofm_buff0_7_we0 sc_out sc_logic 1 signal 39 } 
	{ ofm_buff0_7_d0 sc_out sc_lv 32 signal 39 } 
	{ ofm_buff0_8_address0 sc_out sc_lv 6 signal 40 } 
	{ ofm_buff0_8_ce0 sc_out sc_logic 1 signal 40 } 
	{ ofm_buff0_8_we0 sc_out sc_logic 1 signal 40 } 
	{ ofm_buff0_8_d0 sc_out sc_lv 32 signal 40 } 
	{ ofm_buff0_9_address0 sc_out sc_lv 6 signal 41 } 
	{ ofm_buff0_9_ce0 sc_out sc_logic 1 signal 41 } 
	{ ofm_buff0_9_we0 sc_out sc_logic 1 signal 41 } 
	{ ofm_buff0_9_d0 sc_out sc_lv 32 signal 41 } 
	{ ofm_buff0_10_address0 sc_out sc_lv 6 signal 42 } 
	{ ofm_buff0_10_ce0 sc_out sc_logic 1 signal 42 } 
	{ ofm_buff0_10_we0 sc_out sc_logic 1 signal 42 } 
	{ ofm_buff0_10_d0 sc_out sc_lv 32 signal 42 } 
	{ ofm_buff0_11_address0 sc_out sc_lv 6 signal 43 } 
	{ ofm_buff0_11_ce0 sc_out sc_logic 1 signal 43 } 
	{ ofm_buff0_11_we0 sc_out sc_logic 1 signal 43 } 
	{ ofm_buff0_11_d0 sc_out sc_lv 32 signal 43 } 
	{ ofm_buff0_12_address0 sc_out sc_lv 6 signal 44 } 
	{ ofm_buff0_12_ce0 sc_out sc_logic 1 signal 44 } 
	{ ofm_buff0_12_we0 sc_out sc_logic 1 signal 44 } 
	{ ofm_buff0_12_d0 sc_out sc_lv 32 signal 44 } 
	{ ofm_buff0_13_address0 sc_out sc_lv 6 signal 45 } 
	{ ofm_buff0_13_ce0 sc_out sc_logic 1 signal 45 } 
	{ ofm_buff0_13_we0 sc_out sc_logic 1 signal 45 } 
	{ ofm_buff0_13_d0 sc_out sc_lv 32 signal 45 } 
	{ ofm_buff0_14_address0 sc_out sc_lv 6 signal 46 } 
	{ ofm_buff0_14_ce0 sc_out sc_logic 1 signal 46 } 
	{ ofm_buff0_14_we0 sc_out sc_logic 1 signal 46 } 
	{ ofm_buff0_14_d0 sc_out sc_lv 32 signal 46 } 
	{ ofm_buff0_15_address0 sc_out sc_lv 6 signal 47 } 
	{ ofm_buff0_15_ce0 sc_out sc_logic 1 signal 47 } 
	{ ofm_buff0_15_we0 sc_out sc_logic 1 signal 47 } 
	{ ofm_buff0_15_d0 sc_out sc_lv 32 signal 47 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "ifm_buff0_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff0_0", "role": "address0" }} , 
 	{ "name": "ifm_buff0_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff0_0", "role": "ce0" }} , 
 	{ "name": "ifm_buff0_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff0_0", "role": "q0" }} , 
 	{ "name": "ifm_buff0_0_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff0_0", "role": "address1" }} , 
 	{ "name": "ifm_buff0_0_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff0_0", "role": "ce1" }} , 
 	{ "name": "ifm_buff0_0_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff0_0", "role": "q1" }} , 
 	{ "name": "ifm_buff0_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff0_1", "role": "address0" }} , 
 	{ "name": "ifm_buff0_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff0_1", "role": "ce0" }} , 
 	{ "name": "ifm_buff0_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff0_1", "role": "q0" }} , 
 	{ "name": "ifm_buff0_1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff0_1", "role": "address1" }} , 
 	{ "name": "ifm_buff0_1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff0_1", "role": "ce1" }} , 
 	{ "name": "ifm_buff0_1_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff0_1", "role": "q1" }} , 
 	{ "name": "ifm_buff0_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff0_2", "role": "address0" }} , 
 	{ "name": "ifm_buff0_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff0_2", "role": "ce0" }} , 
 	{ "name": "ifm_buff0_2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff0_2", "role": "q0" }} , 
 	{ "name": "ifm_buff0_2_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff0_2", "role": "address1" }} , 
 	{ "name": "ifm_buff0_2_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff0_2", "role": "ce1" }} , 
 	{ "name": "ifm_buff0_2_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff0_2", "role": "q1" }} , 
 	{ "name": "ifm_buff0_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff0_3", "role": "address0" }} , 
 	{ "name": "ifm_buff0_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff0_3", "role": "ce0" }} , 
 	{ "name": "ifm_buff0_3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff0_3", "role": "q0" }} , 
 	{ "name": "ifm_buff0_3_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff0_3", "role": "address1" }} , 
 	{ "name": "ifm_buff0_3_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff0_3", "role": "ce1" }} , 
 	{ "name": "ifm_buff0_3_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff0_3", "role": "q1" }} , 
 	{ "name": "ifm_buff0_4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff0_4", "role": "address0" }} , 
 	{ "name": "ifm_buff0_4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff0_4", "role": "ce0" }} , 
 	{ "name": "ifm_buff0_4_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff0_4", "role": "q0" }} , 
 	{ "name": "ifm_buff0_4_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff0_4", "role": "address1" }} , 
 	{ "name": "ifm_buff0_4_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff0_4", "role": "ce1" }} , 
 	{ "name": "ifm_buff0_4_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff0_4", "role": "q1" }} , 
 	{ "name": "ifm_buff0_5_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff0_5", "role": "address0" }} , 
 	{ "name": "ifm_buff0_5_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff0_5", "role": "ce0" }} , 
 	{ "name": "ifm_buff0_5_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff0_5", "role": "q0" }} , 
 	{ "name": "ifm_buff0_5_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff0_5", "role": "address1" }} , 
 	{ "name": "ifm_buff0_5_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff0_5", "role": "ce1" }} , 
 	{ "name": "ifm_buff0_5_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff0_5", "role": "q1" }} , 
 	{ "name": "ifm_buff0_6_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff0_6", "role": "address0" }} , 
 	{ "name": "ifm_buff0_6_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff0_6", "role": "ce0" }} , 
 	{ "name": "ifm_buff0_6_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff0_6", "role": "q0" }} , 
 	{ "name": "ifm_buff0_6_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff0_6", "role": "address1" }} , 
 	{ "name": "ifm_buff0_6_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff0_6", "role": "ce1" }} , 
 	{ "name": "ifm_buff0_6_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff0_6", "role": "q1" }} , 
 	{ "name": "ifm_buff0_7_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff0_7", "role": "address0" }} , 
 	{ "name": "ifm_buff0_7_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff0_7", "role": "ce0" }} , 
 	{ "name": "ifm_buff0_7_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff0_7", "role": "q0" }} , 
 	{ "name": "ifm_buff0_7_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff0_7", "role": "address1" }} , 
 	{ "name": "ifm_buff0_7_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff0_7", "role": "ce1" }} , 
 	{ "name": "ifm_buff0_7_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff0_7", "role": "q1" }} , 
 	{ "name": "ifm_buff0_8_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff0_8", "role": "address0" }} , 
 	{ "name": "ifm_buff0_8_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff0_8", "role": "ce0" }} , 
 	{ "name": "ifm_buff0_8_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff0_8", "role": "q0" }} , 
 	{ "name": "ifm_buff0_8_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff0_8", "role": "address1" }} , 
 	{ "name": "ifm_buff0_8_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff0_8", "role": "ce1" }} , 
 	{ "name": "ifm_buff0_8_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff0_8", "role": "q1" }} , 
 	{ "name": "ifm_buff0_9_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff0_9", "role": "address0" }} , 
 	{ "name": "ifm_buff0_9_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff0_9", "role": "ce0" }} , 
 	{ "name": "ifm_buff0_9_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff0_9", "role": "q0" }} , 
 	{ "name": "ifm_buff0_9_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff0_9", "role": "address1" }} , 
 	{ "name": "ifm_buff0_9_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff0_9", "role": "ce1" }} , 
 	{ "name": "ifm_buff0_9_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff0_9", "role": "q1" }} , 
 	{ "name": "ifm_buff0_10_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff0_10", "role": "address0" }} , 
 	{ "name": "ifm_buff0_10_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff0_10", "role": "ce0" }} , 
 	{ "name": "ifm_buff0_10_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff0_10", "role": "q0" }} , 
 	{ "name": "ifm_buff0_10_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff0_10", "role": "address1" }} , 
 	{ "name": "ifm_buff0_10_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff0_10", "role": "ce1" }} , 
 	{ "name": "ifm_buff0_10_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff0_10", "role": "q1" }} , 
 	{ "name": "ifm_buff0_11_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff0_11", "role": "address0" }} , 
 	{ "name": "ifm_buff0_11_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff0_11", "role": "ce0" }} , 
 	{ "name": "ifm_buff0_11_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff0_11", "role": "q0" }} , 
 	{ "name": "ifm_buff0_11_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff0_11", "role": "address1" }} , 
 	{ "name": "ifm_buff0_11_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff0_11", "role": "ce1" }} , 
 	{ "name": "ifm_buff0_11_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff0_11", "role": "q1" }} , 
 	{ "name": "ifm_buff0_12_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff0_12", "role": "address0" }} , 
 	{ "name": "ifm_buff0_12_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff0_12", "role": "ce0" }} , 
 	{ "name": "ifm_buff0_12_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff0_12", "role": "q0" }} , 
 	{ "name": "ifm_buff0_12_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff0_12", "role": "address1" }} , 
 	{ "name": "ifm_buff0_12_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff0_12", "role": "ce1" }} , 
 	{ "name": "ifm_buff0_12_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff0_12", "role": "q1" }} , 
 	{ "name": "ifm_buff0_13_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff0_13", "role": "address0" }} , 
 	{ "name": "ifm_buff0_13_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff0_13", "role": "ce0" }} , 
 	{ "name": "ifm_buff0_13_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff0_13", "role": "q0" }} , 
 	{ "name": "ifm_buff0_13_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff0_13", "role": "address1" }} , 
 	{ "name": "ifm_buff0_13_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff0_13", "role": "ce1" }} , 
 	{ "name": "ifm_buff0_13_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff0_13", "role": "q1" }} , 
 	{ "name": "ifm_buff0_14_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff0_14", "role": "address0" }} , 
 	{ "name": "ifm_buff0_14_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff0_14", "role": "ce0" }} , 
 	{ "name": "ifm_buff0_14_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff0_14", "role": "q0" }} , 
 	{ "name": "ifm_buff0_14_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff0_14", "role": "address1" }} , 
 	{ "name": "ifm_buff0_14_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff0_14", "role": "ce1" }} , 
 	{ "name": "ifm_buff0_14_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff0_14", "role": "q1" }} , 
 	{ "name": "ifm_buff0_15_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff0_15", "role": "address0" }} , 
 	{ "name": "ifm_buff0_15_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff0_15", "role": "ce0" }} , 
 	{ "name": "ifm_buff0_15_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff0_15", "role": "q0" }} , 
 	{ "name": "ifm_buff0_15_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff0_15", "role": "address1" }} , 
 	{ "name": "ifm_buff0_15_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff0_15", "role": "ce1" }} , 
 	{ "name": "ifm_buff0_15_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff0_15", "role": "q1" }} , 
 	{ "name": "ifm_buff1_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff1_0", "role": "address0" }} , 
 	{ "name": "ifm_buff1_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff1_0", "role": "ce0" }} , 
 	{ "name": "ifm_buff1_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff1_0", "role": "q0" }} , 
 	{ "name": "ifm_buff1_0_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff1_0", "role": "address1" }} , 
 	{ "name": "ifm_buff1_0_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff1_0", "role": "ce1" }} , 
 	{ "name": "ifm_buff1_0_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff1_0", "role": "q1" }} , 
 	{ "name": "ifm_buff1_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff1_1", "role": "address0" }} , 
 	{ "name": "ifm_buff1_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff1_1", "role": "ce0" }} , 
 	{ "name": "ifm_buff1_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff1_1", "role": "q0" }} , 
 	{ "name": "ifm_buff1_1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff1_1", "role": "address1" }} , 
 	{ "name": "ifm_buff1_1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff1_1", "role": "ce1" }} , 
 	{ "name": "ifm_buff1_1_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff1_1", "role": "q1" }} , 
 	{ "name": "ifm_buff1_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff1_2", "role": "address0" }} , 
 	{ "name": "ifm_buff1_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff1_2", "role": "ce0" }} , 
 	{ "name": "ifm_buff1_2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff1_2", "role": "q0" }} , 
 	{ "name": "ifm_buff1_2_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff1_2", "role": "address1" }} , 
 	{ "name": "ifm_buff1_2_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff1_2", "role": "ce1" }} , 
 	{ "name": "ifm_buff1_2_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff1_2", "role": "q1" }} , 
 	{ "name": "ifm_buff1_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff1_3", "role": "address0" }} , 
 	{ "name": "ifm_buff1_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff1_3", "role": "ce0" }} , 
 	{ "name": "ifm_buff1_3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff1_3", "role": "q0" }} , 
 	{ "name": "ifm_buff1_3_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff1_3", "role": "address1" }} , 
 	{ "name": "ifm_buff1_3_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff1_3", "role": "ce1" }} , 
 	{ "name": "ifm_buff1_3_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff1_3", "role": "q1" }} , 
 	{ "name": "ifm_buff1_4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff1_4", "role": "address0" }} , 
 	{ "name": "ifm_buff1_4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff1_4", "role": "ce0" }} , 
 	{ "name": "ifm_buff1_4_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff1_4", "role": "q0" }} , 
 	{ "name": "ifm_buff1_4_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff1_4", "role": "address1" }} , 
 	{ "name": "ifm_buff1_4_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff1_4", "role": "ce1" }} , 
 	{ "name": "ifm_buff1_4_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff1_4", "role": "q1" }} , 
 	{ "name": "ifm_buff1_5_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff1_5", "role": "address0" }} , 
 	{ "name": "ifm_buff1_5_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff1_5", "role": "ce0" }} , 
 	{ "name": "ifm_buff1_5_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff1_5", "role": "q0" }} , 
 	{ "name": "ifm_buff1_5_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff1_5", "role": "address1" }} , 
 	{ "name": "ifm_buff1_5_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff1_5", "role": "ce1" }} , 
 	{ "name": "ifm_buff1_5_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff1_5", "role": "q1" }} , 
 	{ "name": "ifm_buff1_6_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff1_6", "role": "address0" }} , 
 	{ "name": "ifm_buff1_6_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff1_6", "role": "ce0" }} , 
 	{ "name": "ifm_buff1_6_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff1_6", "role": "q0" }} , 
 	{ "name": "ifm_buff1_6_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff1_6", "role": "address1" }} , 
 	{ "name": "ifm_buff1_6_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff1_6", "role": "ce1" }} , 
 	{ "name": "ifm_buff1_6_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff1_6", "role": "q1" }} , 
 	{ "name": "ifm_buff1_7_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff1_7", "role": "address0" }} , 
 	{ "name": "ifm_buff1_7_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff1_7", "role": "ce0" }} , 
 	{ "name": "ifm_buff1_7_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff1_7", "role": "q0" }} , 
 	{ "name": "ifm_buff1_7_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff1_7", "role": "address1" }} , 
 	{ "name": "ifm_buff1_7_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff1_7", "role": "ce1" }} , 
 	{ "name": "ifm_buff1_7_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff1_7", "role": "q1" }} , 
 	{ "name": "ifm_buff1_8_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff1_8", "role": "address0" }} , 
 	{ "name": "ifm_buff1_8_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff1_8", "role": "ce0" }} , 
 	{ "name": "ifm_buff1_8_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff1_8", "role": "q0" }} , 
 	{ "name": "ifm_buff1_8_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff1_8", "role": "address1" }} , 
 	{ "name": "ifm_buff1_8_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff1_8", "role": "ce1" }} , 
 	{ "name": "ifm_buff1_8_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff1_8", "role": "q1" }} , 
 	{ "name": "ifm_buff1_9_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff1_9", "role": "address0" }} , 
 	{ "name": "ifm_buff1_9_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff1_9", "role": "ce0" }} , 
 	{ "name": "ifm_buff1_9_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff1_9", "role": "q0" }} , 
 	{ "name": "ifm_buff1_9_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff1_9", "role": "address1" }} , 
 	{ "name": "ifm_buff1_9_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff1_9", "role": "ce1" }} , 
 	{ "name": "ifm_buff1_9_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff1_9", "role": "q1" }} , 
 	{ "name": "ifm_buff1_10_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff1_10", "role": "address0" }} , 
 	{ "name": "ifm_buff1_10_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff1_10", "role": "ce0" }} , 
 	{ "name": "ifm_buff1_10_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff1_10", "role": "q0" }} , 
 	{ "name": "ifm_buff1_10_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff1_10", "role": "address1" }} , 
 	{ "name": "ifm_buff1_10_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff1_10", "role": "ce1" }} , 
 	{ "name": "ifm_buff1_10_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff1_10", "role": "q1" }} , 
 	{ "name": "ifm_buff1_11_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff1_11", "role": "address0" }} , 
 	{ "name": "ifm_buff1_11_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff1_11", "role": "ce0" }} , 
 	{ "name": "ifm_buff1_11_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff1_11", "role": "q0" }} , 
 	{ "name": "ifm_buff1_11_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff1_11", "role": "address1" }} , 
 	{ "name": "ifm_buff1_11_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff1_11", "role": "ce1" }} , 
 	{ "name": "ifm_buff1_11_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff1_11", "role": "q1" }} , 
 	{ "name": "ifm_buff1_12_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff1_12", "role": "address0" }} , 
 	{ "name": "ifm_buff1_12_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff1_12", "role": "ce0" }} , 
 	{ "name": "ifm_buff1_12_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff1_12", "role": "q0" }} , 
 	{ "name": "ifm_buff1_12_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff1_12", "role": "address1" }} , 
 	{ "name": "ifm_buff1_12_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff1_12", "role": "ce1" }} , 
 	{ "name": "ifm_buff1_12_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff1_12", "role": "q1" }} , 
 	{ "name": "ifm_buff1_13_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff1_13", "role": "address0" }} , 
 	{ "name": "ifm_buff1_13_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff1_13", "role": "ce0" }} , 
 	{ "name": "ifm_buff1_13_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff1_13", "role": "q0" }} , 
 	{ "name": "ifm_buff1_13_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff1_13", "role": "address1" }} , 
 	{ "name": "ifm_buff1_13_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff1_13", "role": "ce1" }} , 
 	{ "name": "ifm_buff1_13_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff1_13", "role": "q1" }} , 
 	{ "name": "ifm_buff1_14_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff1_14", "role": "address0" }} , 
 	{ "name": "ifm_buff1_14_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff1_14", "role": "ce0" }} , 
 	{ "name": "ifm_buff1_14_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff1_14", "role": "q0" }} , 
 	{ "name": "ifm_buff1_14_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff1_14", "role": "address1" }} , 
 	{ "name": "ifm_buff1_14_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff1_14", "role": "ce1" }} , 
 	{ "name": "ifm_buff1_14_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff1_14", "role": "q1" }} , 
 	{ "name": "ifm_buff1_15_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff1_15", "role": "address0" }} , 
 	{ "name": "ifm_buff1_15_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff1_15", "role": "ce0" }} , 
 	{ "name": "ifm_buff1_15_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff1_15", "role": "q0" }} , 
 	{ "name": "ifm_buff1_15_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff1_15", "role": "address1" }} , 
 	{ "name": "ifm_buff1_15_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff1_15", "role": "ce1" }} , 
 	{ "name": "ifm_buff1_15_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff1_15", "role": "q1" }} , 
 	{ "name": "ofm_buff0_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ofm_buff0_0", "role": "address0" }} , 
 	{ "name": "ofm_buff0_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ofm_buff0_0", "role": "ce0" }} , 
 	{ "name": "ofm_buff0_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ofm_buff0_0", "role": "we0" }} , 
 	{ "name": "ofm_buff0_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ofm_buff0_0", "role": "d0" }} , 
 	{ "name": "ofm_buff0_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ofm_buff0_1", "role": "address0" }} , 
 	{ "name": "ofm_buff0_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ofm_buff0_1", "role": "ce0" }} , 
 	{ "name": "ofm_buff0_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ofm_buff0_1", "role": "we0" }} , 
 	{ "name": "ofm_buff0_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ofm_buff0_1", "role": "d0" }} , 
 	{ "name": "ofm_buff0_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ofm_buff0_2", "role": "address0" }} , 
 	{ "name": "ofm_buff0_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ofm_buff0_2", "role": "ce0" }} , 
 	{ "name": "ofm_buff0_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ofm_buff0_2", "role": "we0" }} , 
 	{ "name": "ofm_buff0_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ofm_buff0_2", "role": "d0" }} , 
 	{ "name": "ofm_buff0_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ofm_buff0_3", "role": "address0" }} , 
 	{ "name": "ofm_buff0_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ofm_buff0_3", "role": "ce0" }} , 
 	{ "name": "ofm_buff0_3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ofm_buff0_3", "role": "we0" }} , 
 	{ "name": "ofm_buff0_3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ofm_buff0_3", "role": "d0" }} , 
 	{ "name": "ofm_buff0_4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ofm_buff0_4", "role": "address0" }} , 
 	{ "name": "ofm_buff0_4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ofm_buff0_4", "role": "ce0" }} , 
 	{ "name": "ofm_buff0_4_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ofm_buff0_4", "role": "we0" }} , 
 	{ "name": "ofm_buff0_4_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ofm_buff0_4", "role": "d0" }} , 
 	{ "name": "ofm_buff0_5_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ofm_buff0_5", "role": "address0" }} , 
 	{ "name": "ofm_buff0_5_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ofm_buff0_5", "role": "ce0" }} , 
 	{ "name": "ofm_buff0_5_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ofm_buff0_5", "role": "we0" }} , 
 	{ "name": "ofm_buff0_5_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ofm_buff0_5", "role": "d0" }} , 
 	{ "name": "ofm_buff0_6_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ofm_buff0_6", "role": "address0" }} , 
 	{ "name": "ofm_buff0_6_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ofm_buff0_6", "role": "ce0" }} , 
 	{ "name": "ofm_buff0_6_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ofm_buff0_6", "role": "we0" }} , 
 	{ "name": "ofm_buff0_6_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ofm_buff0_6", "role": "d0" }} , 
 	{ "name": "ofm_buff0_7_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ofm_buff0_7", "role": "address0" }} , 
 	{ "name": "ofm_buff0_7_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ofm_buff0_7", "role": "ce0" }} , 
 	{ "name": "ofm_buff0_7_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ofm_buff0_7", "role": "we0" }} , 
 	{ "name": "ofm_buff0_7_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ofm_buff0_7", "role": "d0" }} , 
 	{ "name": "ofm_buff0_8_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ofm_buff0_8", "role": "address0" }} , 
 	{ "name": "ofm_buff0_8_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ofm_buff0_8", "role": "ce0" }} , 
 	{ "name": "ofm_buff0_8_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ofm_buff0_8", "role": "we0" }} , 
 	{ "name": "ofm_buff0_8_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ofm_buff0_8", "role": "d0" }} , 
 	{ "name": "ofm_buff0_9_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ofm_buff0_9", "role": "address0" }} , 
 	{ "name": "ofm_buff0_9_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ofm_buff0_9", "role": "ce0" }} , 
 	{ "name": "ofm_buff0_9_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ofm_buff0_9", "role": "we0" }} , 
 	{ "name": "ofm_buff0_9_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ofm_buff0_9", "role": "d0" }} , 
 	{ "name": "ofm_buff0_10_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ofm_buff0_10", "role": "address0" }} , 
 	{ "name": "ofm_buff0_10_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ofm_buff0_10", "role": "ce0" }} , 
 	{ "name": "ofm_buff0_10_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ofm_buff0_10", "role": "we0" }} , 
 	{ "name": "ofm_buff0_10_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ofm_buff0_10", "role": "d0" }} , 
 	{ "name": "ofm_buff0_11_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ofm_buff0_11", "role": "address0" }} , 
 	{ "name": "ofm_buff0_11_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ofm_buff0_11", "role": "ce0" }} , 
 	{ "name": "ofm_buff0_11_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ofm_buff0_11", "role": "we0" }} , 
 	{ "name": "ofm_buff0_11_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ofm_buff0_11", "role": "d0" }} , 
 	{ "name": "ofm_buff0_12_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ofm_buff0_12", "role": "address0" }} , 
 	{ "name": "ofm_buff0_12_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ofm_buff0_12", "role": "ce0" }} , 
 	{ "name": "ofm_buff0_12_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ofm_buff0_12", "role": "we0" }} , 
 	{ "name": "ofm_buff0_12_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ofm_buff0_12", "role": "d0" }} , 
 	{ "name": "ofm_buff0_13_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ofm_buff0_13", "role": "address0" }} , 
 	{ "name": "ofm_buff0_13_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ofm_buff0_13", "role": "ce0" }} , 
 	{ "name": "ofm_buff0_13_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ofm_buff0_13", "role": "we0" }} , 
 	{ "name": "ofm_buff0_13_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ofm_buff0_13", "role": "d0" }} , 
 	{ "name": "ofm_buff0_14_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ofm_buff0_14", "role": "address0" }} , 
 	{ "name": "ofm_buff0_14_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ofm_buff0_14", "role": "ce0" }} , 
 	{ "name": "ofm_buff0_14_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ofm_buff0_14", "role": "we0" }} , 
 	{ "name": "ofm_buff0_14_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ofm_buff0_14", "role": "d0" }} , 
 	{ "name": "ofm_buff0_15_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ofm_buff0_15", "role": "address0" }} , 
 	{ "name": "ofm_buff0_15_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ofm_buff0_15", "role": "ce0" }} , 
 	{ "name": "ofm_buff0_15_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ofm_buff0_15", "role": "we0" }} , 
 	{ "name": "ofm_buff0_15_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ofm_buff0_15", "role": "d0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7"],
		"CDFG" : "pool_write",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "903", "EstimateLatencyMax" : "903",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "ifm_buff0_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ifm_buff0_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ifm_buff0_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ifm_buff0_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ifm_buff0_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ifm_buff0_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ifm_buff0_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ifm_buff0_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ifm_buff0_8", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ifm_buff0_9", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ifm_buff0_10", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ifm_buff0_11", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ifm_buff0_12", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ifm_buff0_13", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ifm_buff0_14", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ifm_buff0_15", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ifm_buff1_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ifm_buff1_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ifm_buff1_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ifm_buff1_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ifm_buff1_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ifm_buff1_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ifm_buff1_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ifm_buff1_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ifm_buff1_8", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ifm_buff1_9", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ifm_buff1_10", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ifm_buff1_11", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ifm_buff1_12", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ifm_buff1_13", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ifm_buff1_14", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ifm_buff1_15", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ofm_buff0_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ofm_buff0_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ofm_buff0_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ofm_buff0_3", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ofm_buff0_4", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ofm_buff0_5", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ofm_buff0_6", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ofm_buff0_7", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ofm_buff0_8", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ofm_buff0_9", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ofm_buff0_10", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ofm_buff0_11", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ofm_buff0_12", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ofm_buff0_13", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ofm_buff0_14", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ofm_buff0_15", "Type" : "Memory", "Direction" : "O"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.pool_hw_fcmp_32nsbkb_U40", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.pool_hw_fcmp_32nsbkb_U41", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.pool_hw_fcmp_32nsbkb_U42", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.pool_hw_mux_164_3cud_U43", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.pool_hw_mux_164_3cud_U44", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.pool_hw_mux_164_3cud_U45", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.pool_hw_mux_164_3cud_U46", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	pool_write {
		ifm_buff0_0 {Type I LastRead 2 FirstWrite -1}
		ifm_buff0_1 {Type I LastRead 2 FirstWrite -1}
		ifm_buff0_2 {Type I LastRead 2 FirstWrite -1}
		ifm_buff0_3 {Type I LastRead 2 FirstWrite -1}
		ifm_buff0_4 {Type I LastRead 2 FirstWrite -1}
		ifm_buff0_5 {Type I LastRead 2 FirstWrite -1}
		ifm_buff0_6 {Type I LastRead 2 FirstWrite -1}
		ifm_buff0_7 {Type I LastRead 2 FirstWrite -1}
		ifm_buff0_8 {Type I LastRead 2 FirstWrite -1}
		ifm_buff0_9 {Type I LastRead 2 FirstWrite -1}
		ifm_buff0_10 {Type I LastRead 2 FirstWrite -1}
		ifm_buff0_11 {Type I LastRead 2 FirstWrite -1}
		ifm_buff0_12 {Type I LastRead 2 FirstWrite -1}
		ifm_buff0_13 {Type I LastRead 2 FirstWrite -1}
		ifm_buff0_14 {Type I LastRead 2 FirstWrite -1}
		ifm_buff0_15 {Type I LastRead 2 FirstWrite -1}
		ifm_buff1_0 {Type I LastRead 2 FirstWrite -1}
		ifm_buff1_1 {Type I LastRead 2 FirstWrite -1}
		ifm_buff1_2 {Type I LastRead 2 FirstWrite -1}
		ifm_buff1_3 {Type I LastRead 2 FirstWrite -1}
		ifm_buff1_4 {Type I LastRead 2 FirstWrite -1}
		ifm_buff1_5 {Type I LastRead 2 FirstWrite -1}
		ifm_buff1_6 {Type I LastRead 2 FirstWrite -1}
		ifm_buff1_7 {Type I LastRead 2 FirstWrite -1}
		ifm_buff1_8 {Type I LastRead 2 FirstWrite -1}
		ifm_buff1_9 {Type I LastRead 2 FirstWrite -1}
		ifm_buff1_10 {Type I LastRead 2 FirstWrite -1}
		ifm_buff1_11 {Type I LastRead 2 FirstWrite -1}
		ifm_buff1_12 {Type I LastRead 2 FirstWrite -1}
		ifm_buff1_13 {Type I LastRead 2 FirstWrite -1}
		ifm_buff1_14 {Type I LastRead 2 FirstWrite -1}
		ifm_buff1_15 {Type I LastRead 2 FirstWrite -1}
		ofm_buff0_0 {Type O LastRead -1 FirstWrite 7}
		ofm_buff0_1 {Type O LastRead -1 FirstWrite 7}
		ofm_buff0_2 {Type O LastRead -1 FirstWrite 7}
		ofm_buff0_3 {Type O LastRead -1 FirstWrite 7}
		ofm_buff0_4 {Type O LastRead -1 FirstWrite 7}
		ofm_buff0_5 {Type O LastRead -1 FirstWrite 7}
		ofm_buff0_6 {Type O LastRead -1 FirstWrite 7}
		ofm_buff0_7 {Type O LastRead -1 FirstWrite 7}
		ofm_buff0_8 {Type O LastRead -1 FirstWrite 7}
		ofm_buff0_9 {Type O LastRead -1 FirstWrite 7}
		ofm_buff0_10 {Type O LastRead -1 FirstWrite 7}
		ofm_buff0_11 {Type O LastRead -1 FirstWrite 7}
		ofm_buff0_12 {Type O LastRead -1 FirstWrite 7}
		ofm_buff0_13 {Type O LastRead -1 FirstWrite 7}
		ofm_buff0_14 {Type O LastRead -1 FirstWrite 7}
		ofm_buff0_15 {Type O LastRead -1 FirstWrite 7}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "903", "Max" : "903"}
	, {"Name" : "Interval", "Min" : "903", "Max" : "903"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	ifm_buff0_0 { ap_memory {  { ifm_buff0_0_address0 mem_address 1 6 }  { ifm_buff0_0_ce0 mem_ce 1 1 }  { ifm_buff0_0_q0 mem_dout 0 32 }  { ifm_buff0_0_address1 MemPortADDR2 1 6 }  { ifm_buff0_0_ce1 MemPortCE2 1 1 }  { ifm_buff0_0_q1 MemPortDOUT2 0 32 } } }
	ifm_buff0_1 { ap_memory {  { ifm_buff0_1_address0 mem_address 1 6 }  { ifm_buff0_1_ce0 mem_ce 1 1 }  { ifm_buff0_1_q0 mem_dout 0 32 }  { ifm_buff0_1_address1 MemPortADDR2 1 6 }  { ifm_buff0_1_ce1 MemPortCE2 1 1 }  { ifm_buff0_1_q1 MemPortDOUT2 0 32 } } }
	ifm_buff0_2 { ap_memory {  { ifm_buff0_2_address0 mem_address 1 6 }  { ifm_buff0_2_ce0 mem_ce 1 1 }  { ifm_buff0_2_q0 mem_dout 0 32 }  { ifm_buff0_2_address1 MemPortADDR2 1 6 }  { ifm_buff0_2_ce1 MemPortCE2 1 1 }  { ifm_buff0_2_q1 MemPortDOUT2 0 32 } } }
	ifm_buff0_3 { ap_memory {  { ifm_buff0_3_address0 mem_address 1 6 }  { ifm_buff0_3_ce0 mem_ce 1 1 }  { ifm_buff0_3_q0 mem_dout 0 32 }  { ifm_buff0_3_address1 MemPortADDR2 1 6 }  { ifm_buff0_3_ce1 MemPortCE2 1 1 }  { ifm_buff0_3_q1 MemPortDOUT2 0 32 } } }
	ifm_buff0_4 { ap_memory {  { ifm_buff0_4_address0 mem_address 1 6 }  { ifm_buff0_4_ce0 mem_ce 1 1 }  { ifm_buff0_4_q0 mem_dout 0 32 }  { ifm_buff0_4_address1 MemPortADDR2 1 6 }  { ifm_buff0_4_ce1 MemPortCE2 1 1 }  { ifm_buff0_4_q1 MemPortDOUT2 0 32 } } }
	ifm_buff0_5 { ap_memory {  { ifm_buff0_5_address0 mem_address 1 6 }  { ifm_buff0_5_ce0 mem_ce 1 1 }  { ifm_buff0_5_q0 mem_dout 0 32 }  { ifm_buff0_5_address1 MemPortADDR2 1 6 }  { ifm_buff0_5_ce1 MemPortCE2 1 1 }  { ifm_buff0_5_q1 MemPortDOUT2 0 32 } } }
	ifm_buff0_6 { ap_memory {  { ifm_buff0_6_address0 mem_address 1 6 }  { ifm_buff0_6_ce0 mem_ce 1 1 }  { ifm_buff0_6_q0 mem_dout 0 32 }  { ifm_buff0_6_address1 MemPortADDR2 1 6 }  { ifm_buff0_6_ce1 MemPortCE2 1 1 }  { ifm_buff0_6_q1 MemPortDOUT2 0 32 } } }
	ifm_buff0_7 { ap_memory {  { ifm_buff0_7_address0 mem_address 1 6 }  { ifm_buff0_7_ce0 mem_ce 1 1 }  { ifm_buff0_7_q0 mem_dout 0 32 }  { ifm_buff0_7_address1 MemPortADDR2 1 6 }  { ifm_buff0_7_ce1 MemPortCE2 1 1 }  { ifm_buff0_7_q1 MemPortDOUT2 0 32 } } }
	ifm_buff0_8 { ap_memory {  { ifm_buff0_8_address0 mem_address 1 6 }  { ifm_buff0_8_ce0 mem_ce 1 1 }  { ifm_buff0_8_q0 mem_dout 0 32 }  { ifm_buff0_8_address1 MemPortADDR2 1 6 }  { ifm_buff0_8_ce1 MemPortCE2 1 1 }  { ifm_buff0_8_q1 MemPortDOUT2 0 32 } } }
	ifm_buff0_9 { ap_memory {  { ifm_buff0_9_address0 mem_address 1 6 }  { ifm_buff0_9_ce0 mem_ce 1 1 }  { ifm_buff0_9_q0 mem_dout 0 32 }  { ifm_buff0_9_address1 MemPortADDR2 1 6 }  { ifm_buff0_9_ce1 MemPortCE2 1 1 }  { ifm_buff0_9_q1 MemPortDOUT2 0 32 } } }
	ifm_buff0_10 { ap_memory {  { ifm_buff0_10_address0 mem_address 1 6 }  { ifm_buff0_10_ce0 mem_ce 1 1 }  { ifm_buff0_10_q0 mem_dout 0 32 }  { ifm_buff0_10_address1 MemPortADDR2 1 6 }  { ifm_buff0_10_ce1 MemPortCE2 1 1 }  { ifm_buff0_10_q1 MemPortDOUT2 0 32 } } }
	ifm_buff0_11 { ap_memory {  { ifm_buff0_11_address0 mem_address 1 6 }  { ifm_buff0_11_ce0 mem_ce 1 1 }  { ifm_buff0_11_q0 mem_dout 0 32 }  { ifm_buff0_11_address1 MemPortADDR2 1 6 }  { ifm_buff0_11_ce1 MemPortCE2 1 1 }  { ifm_buff0_11_q1 MemPortDOUT2 0 32 } } }
	ifm_buff0_12 { ap_memory {  { ifm_buff0_12_address0 mem_address 1 6 }  { ifm_buff0_12_ce0 mem_ce 1 1 }  { ifm_buff0_12_q0 mem_dout 0 32 }  { ifm_buff0_12_address1 MemPortADDR2 1 6 }  { ifm_buff0_12_ce1 MemPortCE2 1 1 }  { ifm_buff0_12_q1 MemPortDOUT2 0 32 } } }
	ifm_buff0_13 { ap_memory {  { ifm_buff0_13_address0 mem_address 1 6 }  { ifm_buff0_13_ce0 mem_ce 1 1 }  { ifm_buff0_13_q0 mem_dout 0 32 }  { ifm_buff0_13_address1 MemPortADDR2 1 6 }  { ifm_buff0_13_ce1 MemPortCE2 1 1 }  { ifm_buff0_13_q1 MemPortDOUT2 0 32 } } }
	ifm_buff0_14 { ap_memory {  { ifm_buff0_14_address0 mem_address 1 6 }  { ifm_buff0_14_ce0 mem_ce 1 1 }  { ifm_buff0_14_q0 mem_dout 0 32 }  { ifm_buff0_14_address1 MemPortADDR2 1 6 }  { ifm_buff0_14_ce1 MemPortCE2 1 1 }  { ifm_buff0_14_q1 MemPortDOUT2 0 32 } } }
	ifm_buff0_15 { ap_memory {  { ifm_buff0_15_address0 mem_address 1 6 }  { ifm_buff0_15_ce0 mem_ce 1 1 }  { ifm_buff0_15_q0 mem_dout 0 32 }  { ifm_buff0_15_address1 MemPortADDR2 1 6 }  { ifm_buff0_15_ce1 MemPortCE2 1 1 }  { ifm_buff0_15_q1 MemPortDOUT2 0 32 } } }
	ifm_buff1_0 { ap_memory {  { ifm_buff1_0_address0 mem_address 1 6 }  { ifm_buff1_0_ce0 mem_ce 1 1 }  { ifm_buff1_0_q0 mem_dout 0 32 }  { ifm_buff1_0_address1 MemPortADDR2 1 6 }  { ifm_buff1_0_ce1 MemPortCE2 1 1 }  { ifm_buff1_0_q1 MemPortDOUT2 0 32 } } }
	ifm_buff1_1 { ap_memory {  { ifm_buff1_1_address0 mem_address 1 6 }  { ifm_buff1_1_ce0 mem_ce 1 1 }  { ifm_buff1_1_q0 mem_dout 0 32 }  { ifm_buff1_1_address1 MemPortADDR2 1 6 }  { ifm_buff1_1_ce1 MemPortCE2 1 1 }  { ifm_buff1_1_q1 MemPortDOUT2 0 32 } } }
	ifm_buff1_2 { ap_memory {  { ifm_buff1_2_address0 mem_address 1 6 }  { ifm_buff1_2_ce0 mem_ce 1 1 }  { ifm_buff1_2_q0 mem_dout 0 32 }  { ifm_buff1_2_address1 MemPortADDR2 1 6 }  { ifm_buff1_2_ce1 MemPortCE2 1 1 }  { ifm_buff1_2_q1 MemPortDOUT2 0 32 } } }
	ifm_buff1_3 { ap_memory {  { ifm_buff1_3_address0 mem_address 1 6 }  { ifm_buff1_3_ce0 mem_ce 1 1 }  { ifm_buff1_3_q0 mem_dout 0 32 }  { ifm_buff1_3_address1 MemPortADDR2 1 6 }  { ifm_buff1_3_ce1 MemPortCE2 1 1 }  { ifm_buff1_3_q1 MemPortDOUT2 0 32 } } }
	ifm_buff1_4 { ap_memory {  { ifm_buff1_4_address0 mem_address 1 6 }  { ifm_buff1_4_ce0 mem_ce 1 1 }  { ifm_buff1_4_q0 mem_dout 0 32 }  { ifm_buff1_4_address1 MemPortADDR2 1 6 }  { ifm_buff1_4_ce1 MemPortCE2 1 1 }  { ifm_buff1_4_q1 MemPortDOUT2 0 32 } } }
	ifm_buff1_5 { ap_memory {  { ifm_buff1_5_address0 mem_address 1 6 }  { ifm_buff1_5_ce0 mem_ce 1 1 }  { ifm_buff1_5_q0 mem_dout 0 32 }  { ifm_buff1_5_address1 MemPortADDR2 1 6 }  { ifm_buff1_5_ce1 MemPortCE2 1 1 }  { ifm_buff1_5_q1 MemPortDOUT2 0 32 } } }
	ifm_buff1_6 { ap_memory {  { ifm_buff1_6_address0 mem_address 1 6 }  { ifm_buff1_6_ce0 mem_ce 1 1 }  { ifm_buff1_6_q0 mem_dout 0 32 }  { ifm_buff1_6_address1 MemPortADDR2 1 6 }  { ifm_buff1_6_ce1 MemPortCE2 1 1 }  { ifm_buff1_6_q1 MemPortDOUT2 0 32 } } }
	ifm_buff1_7 { ap_memory {  { ifm_buff1_7_address0 mem_address 1 6 }  { ifm_buff1_7_ce0 mem_ce 1 1 }  { ifm_buff1_7_q0 mem_dout 0 32 }  { ifm_buff1_7_address1 MemPortADDR2 1 6 }  { ifm_buff1_7_ce1 MemPortCE2 1 1 }  { ifm_buff1_7_q1 MemPortDOUT2 0 32 } } }
	ifm_buff1_8 { ap_memory {  { ifm_buff1_8_address0 mem_address 1 6 }  { ifm_buff1_8_ce0 mem_ce 1 1 }  { ifm_buff1_8_q0 mem_dout 0 32 }  { ifm_buff1_8_address1 MemPortADDR2 1 6 }  { ifm_buff1_8_ce1 MemPortCE2 1 1 }  { ifm_buff1_8_q1 MemPortDOUT2 0 32 } } }
	ifm_buff1_9 { ap_memory {  { ifm_buff1_9_address0 mem_address 1 6 }  { ifm_buff1_9_ce0 mem_ce 1 1 }  { ifm_buff1_9_q0 mem_dout 0 32 }  { ifm_buff1_9_address1 MemPortADDR2 1 6 }  { ifm_buff1_9_ce1 MemPortCE2 1 1 }  { ifm_buff1_9_q1 MemPortDOUT2 0 32 } } }
	ifm_buff1_10 { ap_memory {  { ifm_buff1_10_address0 mem_address 1 6 }  { ifm_buff1_10_ce0 mem_ce 1 1 }  { ifm_buff1_10_q0 mem_dout 0 32 }  { ifm_buff1_10_address1 MemPortADDR2 1 6 }  { ifm_buff1_10_ce1 MemPortCE2 1 1 }  { ifm_buff1_10_q1 MemPortDOUT2 0 32 } } }
	ifm_buff1_11 { ap_memory {  { ifm_buff1_11_address0 mem_address 1 6 }  { ifm_buff1_11_ce0 mem_ce 1 1 }  { ifm_buff1_11_q0 mem_dout 0 32 }  { ifm_buff1_11_address1 MemPortADDR2 1 6 }  { ifm_buff1_11_ce1 MemPortCE2 1 1 }  { ifm_buff1_11_q1 MemPortDOUT2 0 32 } } }
	ifm_buff1_12 { ap_memory {  { ifm_buff1_12_address0 mem_address 1 6 }  { ifm_buff1_12_ce0 mem_ce 1 1 }  { ifm_buff1_12_q0 mem_dout 0 32 }  { ifm_buff1_12_address1 MemPortADDR2 1 6 }  { ifm_buff1_12_ce1 MemPortCE2 1 1 }  { ifm_buff1_12_q1 MemPortDOUT2 0 32 } } }
	ifm_buff1_13 { ap_memory {  { ifm_buff1_13_address0 mem_address 1 6 }  { ifm_buff1_13_ce0 mem_ce 1 1 }  { ifm_buff1_13_q0 mem_dout 0 32 }  { ifm_buff1_13_address1 MemPortADDR2 1 6 }  { ifm_buff1_13_ce1 MemPortCE2 1 1 }  { ifm_buff1_13_q1 MemPortDOUT2 0 32 } } }
	ifm_buff1_14 { ap_memory {  { ifm_buff1_14_address0 mem_address 1 6 }  { ifm_buff1_14_ce0 mem_ce 1 1 }  { ifm_buff1_14_q0 mem_dout 0 32 }  { ifm_buff1_14_address1 MemPortADDR2 1 6 }  { ifm_buff1_14_ce1 MemPortCE2 1 1 }  { ifm_buff1_14_q1 MemPortDOUT2 0 32 } } }
	ifm_buff1_15 { ap_memory {  { ifm_buff1_15_address0 mem_address 1 6 }  { ifm_buff1_15_ce0 mem_ce 1 1 }  { ifm_buff1_15_q0 mem_dout 0 32 }  { ifm_buff1_15_address1 MemPortADDR2 1 6 }  { ifm_buff1_15_ce1 MemPortCE2 1 1 }  { ifm_buff1_15_q1 MemPortDOUT2 0 32 } } }
	ofm_buff0_0 { ap_memory {  { ofm_buff0_0_address0 mem_address 1 6 }  { ofm_buff0_0_ce0 mem_ce 1 1 }  { ofm_buff0_0_we0 mem_we 1 1 }  { ofm_buff0_0_d0 mem_din 1 32 } } }
	ofm_buff0_1 { ap_memory {  { ofm_buff0_1_address0 mem_address 1 6 }  { ofm_buff0_1_ce0 mem_ce 1 1 }  { ofm_buff0_1_we0 mem_we 1 1 }  { ofm_buff0_1_d0 mem_din 1 32 } } }
	ofm_buff0_2 { ap_memory {  { ofm_buff0_2_address0 mem_address 1 6 }  { ofm_buff0_2_ce0 mem_ce 1 1 }  { ofm_buff0_2_we0 mem_we 1 1 }  { ofm_buff0_2_d0 mem_din 1 32 } } }
	ofm_buff0_3 { ap_memory {  { ofm_buff0_3_address0 mem_address 1 6 }  { ofm_buff0_3_ce0 mem_ce 1 1 }  { ofm_buff0_3_we0 mem_we 1 1 }  { ofm_buff0_3_d0 mem_din 1 32 } } }
	ofm_buff0_4 { ap_memory {  { ofm_buff0_4_address0 mem_address 1 6 }  { ofm_buff0_4_ce0 mem_ce 1 1 }  { ofm_buff0_4_we0 mem_we 1 1 }  { ofm_buff0_4_d0 mem_din 1 32 } } }
	ofm_buff0_5 { ap_memory {  { ofm_buff0_5_address0 mem_address 1 6 }  { ofm_buff0_5_ce0 mem_ce 1 1 }  { ofm_buff0_5_we0 mem_we 1 1 }  { ofm_buff0_5_d0 mem_din 1 32 } } }
	ofm_buff0_6 { ap_memory {  { ofm_buff0_6_address0 mem_address 1 6 }  { ofm_buff0_6_ce0 mem_ce 1 1 }  { ofm_buff0_6_we0 mem_we 1 1 }  { ofm_buff0_6_d0 mem_din 1 32 } } }
	ofm_buff0_7 { ap_memory {  { ofm_buff0_7_address0 mem_address 1 6 }  { ofm_buff0_7_ce0 mem_ce 1 1 }  { ofm_buff0_7_we0 mem_we 1 1 }  { ofm_buff0_7_d0 mem_din 1 32 } } }
	ofm_buff0_8 { ap_memory {  { ofm_buff0_8_address0 mem_address 1 6 }  { ofm_buff0_8_ce0 mem_ce 1 1 }  { ofm_buff0_8_we0 mem_we 1 1 }  { ofm_buff0_8_d0 mem_din 1 32 } } }
	ofm_buff0_9 { ap_memory {  { ofm_buff0_9_address0 mem_address 1 6 }  { ofm_buff0_9_ce0 mem_ce 1 1 }  { ofm_buff0_9_we0 mem_we 1 1 }  { ofm_buff0_9_d0 mem_din 1 32 } } }
	ofm_buff0_10 { ap_memory {  { ofm_buff0_10_address0 mem_address 1 6 }  { ofm_buff0_10_ce0 mem_ce 1 1 }  { ofm_buff0_10_we0 mem_we 1 1 }  { ofm_buff0_10_d0 mem_din 1 32 } } }
	ofm_buff0_11 { ap_memory {  { ofm_buff0_11_address0 mem_address 1 6 }  { ofm_buff0_11_ce0 mem_ce 1 1 }  { ofm_buff0_11_we0 mem_we 1 1 }  { ofm_buff0_11_d0 mem_din 1 32 } } }
	ofm_buff0_12 { ap_memory {  { ofm_buff0_12_address0 mem_address 1 6 }  { ofm_buff0_12_ce0 mem_ce 1 1 }  { ofm_buff0_12_we0 mem_we 1 1 }  { ofm_buff0_12_d0 mem_din 1 32 } } }
	ofm_buff0_13 { ap_memory {  { ofm_buff0_13_address0 mem_address 1 6 }  { ofm_buff0_13_ce0 mem_ce 1 1 }  { ofm_buff0_13_we0 mem_we 1 1 }  { ofm_buff0_13_d0 mem_din 1 32 } } }
	ofm_buff0_14 { ap_memory {  { ofm_buff0_14_address0 mem_address 1 6 }  { ofm_buff0_14_ce0 mem_ce 1 1 }  { ofm_buff0_14_we0 mem_we 1 1 }  { ofm_buff0_14_d0 mem_din 1 32 } } }
	ofm_buff0_15 { ap_memory {  { ofm_buff0_15_address0 mem_address 1 6 }  { ofm_buff0_15_ce0 mem_ce 1 1 }  { ofm_buff0_15_we0 mem_we 1 1 }  { ofm_buff0_15_d0 mem_din 1 32 } } }
}
