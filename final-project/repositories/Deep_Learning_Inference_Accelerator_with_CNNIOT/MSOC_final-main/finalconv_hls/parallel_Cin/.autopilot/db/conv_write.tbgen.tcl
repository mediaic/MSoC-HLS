set moduleName conv_write
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
set C_modelName {conv_write}
set C_modelType { void 0 }
set C_modelArgList {
	{ filter_buff_0_0_0 float 32 regular {array 6 { 1 3 } 1 1 }  }
	{ filter_buff_0_0_1 float 32 regular {array 6 { 1 3 } 1 1 }  }
	{ filter_buff_0_0_2 float 32 regular {array 6 { 1 3 } 1 1 }  }
	{ filter_buff_0_1_0 float 32 regular {array 6 { 1 3 } 1 1 }  }
	{ filter_buff_0_1_1 float 32 regular {array 6 { 1 3 } 1 1 }  }
	{ filter_buff_0_1_2 float 32 regular {array 6 { 1 3 } 1 1 }  }
	{ filter_buff_0_2_0 float 32 regular {array 6 { 1 3 } 1 1 }  }
	{ filter_buff_0_2_1 float 32 regular {array 6 { 1 3 } 1 1 }  }
	{ filter_buff_0_2_2 float 32 regular {array 6 { 1 3 } 1 1 }  }
	{ filter_buff_1_0_0 float 32 regular {array 6 { 1 3 } 1 1 }  }
	{ filter_buff_1_0_1 float 32 regular {array 6 { 1 3 } 1 1 }  }
	{ filter_buff_1_0_2 float 32 regular {array 6 { 1 3 } 1 1 }  }
	{ filter_buff_1_1_0 float 32 regular {array 6 { 1 3 } 1 1 }  }
	{ filter_buff_1_1_1 float 32 regular {array 6 { 1 3 } 1 1 }  }
	{ filter_buff_1_1_2 float 32 regular {array 6 { 1 3 } 1 1 }  }
	{ filter_buff_1_2_0 float 32 regular {array 6 { 1 3 } 1 1 }  }
	{ filter_buff_1_2_1 float 32 regular {array 6 { 1 3 } 1 1 }  }
	{ filter_buff_1_2_2 float 32 regular {array 6 { 1 3 } 1 1 }  }
	{ filter_buff_2_0_0 float 32 regular {array 6 { 1 3 } 1 1 }  }
	{ filter_buff_2_0_1 float 32 regular {array 6 { 1 3 } 1 1 }  }
	{ filter_buff_2_0_2 float 32 regular {array 6 { 1 3 } 1 1 }  }
	{ filter_buff_2_1_0 float 32 regular {array 6 { 1 3 } 1 1 }  }
	{ filter_buff_2_1_1 float 32 regular {array 6 { 1 3 } 1 1 }  }
	{ filter_buff_2_1_2 float 32 regular {array 6 { 1 3 } 1 1 }  }
	{ filter_buff_2_2_0 float 32 regular {array 6 { 1 3 } 1 1 }  }
	{ filter_buff_2_2_1 float 32 regular {array 6 { 1 3 } 1 1 }  }
	{ filter_buff_2_2_2 float 32 regular {array 6 { 1 3 } 1 1 }  }
	{ ifm_buff0_0 float 32 regular {array 34 { 1 1 } 1 1 }  }
	{ ifm_buff0_1 float 32 regular {array 34 { 1 1 } 1 1 }  }
	{ ifm_buff0_2 float 32 regular {array 34 { 1 1 } 1 1 }  }
	{ ifm_buff1_0 float 32 regular {array 34 { 1 1 } 1 1 }  }
	{ ifm_buff1_1 float 32 regular {array 34 { 1 1 } 1 1 }  }
	{ ifm_buff1_2 float 32 regular {array 34 { 1 1 } 1 1 }  }
	{ ifm_buff2_0 float 32 regular {array 34 { 1 1 } 1 1 }  }
	{ ifm_buff2_1 float 32 regular {array 34 { 1 1 } 1 1 }  }
	{ ifm_buff2_2 float 32 regular {array 34 { 1 1 } 1 1 }  }
	{ ofm_buff0_0 float 32 regular {array 32 { 0 3 } 0 1 }  }
	{ ofm_buff0_1 float 32 regular {array 32 { 0 3 } 0 1 }  }
	{ ofm_buff0_2 float 32 regular {array 32 { 0 3 } 0 1 }  }
	{ ofm_buff0_3 float 32 regular {array 32 { 0 3 } 0 1 }  }
	{ ofm_buff0_4 float 32 regular {array 32 { 0 3 } 0 1 }  }
	{ ofm_buff0_5 float 32 regular {array 32 { 0 3 } 0 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "filter_buff_0_0_0", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "filter_buff_0_0_1", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "filter_buff_0_0_2", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "filter_buff_0_1_0", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "filter_buff_0_1_1", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "filter_buff_0_1_2", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "filter_buff_0_2_0", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "filter_buff_0_2_1", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "filter_buff_0_2_2", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "filter_buff_1_0_0", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "filter_buff_1_0_1", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "filter_buff_1_0_2", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "filter_buff_1_1_0", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "filter_buff_1_1_1", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "filter_buff_1_1_2", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "filter_buff_1_2_0", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "filter_buff_1_2_1", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "filter_buff_1_2_2", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "filter_buff_2_0_0", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "filter_buff_2_0_1", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "filter_buff_2_0_2", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "filter_buff_2_1_0", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "filter_buff_2_1_1", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "filter_buff_2_1_2", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "filter_buff_2_2_0", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "filter_buff_2_2_1", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "filter_buff_2_2_2", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "ifm_buff0_0", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "ifm_buff0_1", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "ifm_buff0_2", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "ifm_buff1_0", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "ifm_buff1_1", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "ifm_buff1_2", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "ifm_buff2_0", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "ifm_buff2_1", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "ifm_buff2_2", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "ofm_buff0_0", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "ofm_buff0_1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "ofm_buff0_2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "ofm_buff0_3", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "ofm_buff0_4", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "ofm_buff0_5", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 165
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ filter_buff_0_0_0_address0 sc_out sc_lv 3 signal 0 } 
	{ filter_buff_0_0_0_ce0 sc_out sc_logic 1 signal 0 } 
	{ filter_buff_0_0_0_q0 sc_in sc_lv 32 signal 0 } 
	{ filter_buff_0_0_1_address0 sc_out sc_lv 3 signal 1 } 
	{ filter_buff_0_0_1_ce0 sc_out sc_logic 1 signal 1 } 
	{ filter_buff_0_0_1_q0 sc_in sc_lv 32 signal 1 } 
	{ filter_buff_0_0_2_address0 sc_out sc_lv 3 signal 2 } 
	{ filter_buff_0_0_2_ce0 sc_out sc_logic 1 signal 2 } 
	{ filter_buff_0_0_2_q0 sc_in sc_lv 32 signal 2 } 
	{ filter_buff_0_1_0_address0 sc_out sc_lv 3 signal 3 } 
	{ filter_buff_0_1_0_ce0 sc_out sc_logic 1 signal 3 } 
	{ filter_buff_0_1_0_q0 sc_in sc_lv 32 signal 3 } 
	{ filter_buff_0_1_1_address0 sc_out sc_lv 3 signal 4 } 
	{ filter_buff_0_1_1_ce0 sc_out sc_logic 1 signal 4 } 
	{ filter_buff_0_1_1_q0 sc_in sc_lv 32 signal 4 } 
	{ filter_buff_0_1_2_address0 sc_out sc_lv 3 signal 5 } 
	{ filter_buff_0_1_2_ce0 sc_out sc_logic 1 signal 5 } 
	{ filter_buff_0_1_2_q0 sc_in sc_lv 32 signal 5 } 
	{ filter_buff_0_2_0_address0 sc_out sc_lv 3 signal 6 } 
	{ filter_buff_0_2_0_ce0 sc_out sc_logic 1 signal 6 } 
	{ filter_buff_0_2_0_q0 sc_in sc_lv 32 signal 6 } 
	{ filter_buff_0_2_1_address0 sc_out sc_lv 3 signal 7 } 
	{ filter_buff_0_2_1_ce0 sc_out sc_logic 1 signal 7 } 
	{ filter_buff_0_2_1_q0 sc_in sc_lv 32 signal 7 } 
	{ filter_buff_0_2_2_address0 sc_out sc_lv 3 signal 8 } 
	{ filter_buff_0_2_2_ce0 sc_out sc_logic 1 signal 8 } 
	{ filter_buff_0_2_2_q0 sc_in sc_lv 32 signal 8 } 
	{ filter_buff_1_0_0_address0 sc_out sc_lv 3 signal 9 } 
	{ filter_buff_1_0_0_ce0 sc_out sc_logic 1 signal 9 } 
	{ filter_buff_1_0_0_q0 sc_in sc_lv 32 signal 9 } 
	{ filter_buff_1_0_1_address0 sc_out sc_lv 3 signal 10 } 
	{ filter_buff_1_0_1_ce0 sc_out sc_logic 1 signal 10 } 
	{ filter_buff_1_0_1_q0 sc_in sc_lv 32 signal 10 } 
	{ filter_buff_1_0_2_address0 sc_out sc_lv 3 signal 11 } 
	{ filter_buff_1_0_2_ce0 sc_out sc_logic 1 signal 11 } 
	{ filter_buff_1_0_2_q0 sc_in sc_lv 32 signal 11 } 
	{ filter_buff_1_1_0_address0 sc_out sc_lv 3 signal 12 } 
	{ filter_buff_1_1_0_ce0 sc_out sc_logic 1 signal 12 } 
	{ filter_buff_1_1_0_q0 sc_in sc_lv 32 signal 12 } 
	{ filter_buff_1_1_1_address0 sc_out sc_lv 3 signal 13 } 
	{ filter_buff_1_1_1_ce0 sc_out sc_logic 1 signal 13 } 
	{ filter_buff_1_1_1_q0 sc_in sc_lv 32 signal 13 } 
	{ filter_buff_1_1_2_address0 sc_out sc_lv 3 signal 14 } 
	{ filter_buff_1_1_2_ce0 sc_out sc_logic 1 signal 14 } 
	{ filter_buff_1_1_2_q0 sc_in sc_lv 32 signal 14 } 
	{ filter_buff_1_2_0_address0 sc_out sc_lv 3 signal 15 } 
	{ filter_buff_1_2_0_ce0 sc_out sc_logic 1 signal 15 } 
	{ filter_buff_1_2_0_q0 sc_in sc_lv 32 signal 15 } 
	{ filter_buff_1_2_1_address0 sc_out sc_lv 3 signal 16 } 
	{ filter_buff_1_2_1_ce0 sc_out sc_logic 1 signal 16 } 
	{ filter_buff_1_2_1_q0 sc_in sc_lv 32 signal 16 } 
	{ filter_buff_1_2_2_address0 sc_out sc_lv 3 signal 17 } 
	{ filter_buff_1_2_2_ce0 sc_out sc_logic 1 signal 17 } 
	{ filter_buff_1_2_2_q0 sc_in sc_lv 32 signal 17 } 
	{ filter_buff_2_0_0_address0 sc_out sc_lv 3 signal 18 } 
	{ filter_buff_2_0_0_ce0 sc_out sc_logic 1 signal 18 } 
	{ filter_buff_2_0_0_q0 sc_in sc_lv 32 signal 18 } 
	{ filter_buff_2_0_1_address0 sc_out sc_lv 3 signal 19 } 
	{ filter_buff_2_0_1_ce0 sc_out sc_logic 1 signal 19 } 
	{ filter_buff_2_0_1_q0 sc_in sc_lv 32 signal 19 } 
	{ filter_buff_2_0_2_address0 sc_out sc_lv 3 signal 20 } 
	{ filter_buff_2_0_2_ce0 sc_out sc_logic 1 signal 20 } 
	{ filter_buff_2_0_2_q0 sc_in sc_lv 32 signal 20 } 
	{ filter_buff_2_1_0_address0 sc_out sc_lv 3 signal 21 } 
	{ filter_buff_2_1_0_ce0 sc_out sc_logic 1 signal 21 } 
	{ filter_buff_2_1_0_q0 sc_in sc_lv 32 signal 21 } 
	{ filter_buff_2_1_1_address0 sc_out sc_lv 3 signal 22 } 
	{ filter_buff_2_1_1_ce0 sc_out sc_logic 1 signal 22 } 
	{ filter_buff_2_1_1_q0 sc_in sc_lv 32 signal 22 } 
	{ filter_buff_2_1_2_address0 sc_out sc_lv 3 signal 23 } 
	{ filter_buff_2_1_2_ce0 sc_out sc_logic 1 signal 23 } 
	{ filter_buff_2_1_2_q0 sc_in sc_lv 32 signal 23 } 
	{ filter_buff_2_2_0_address0 sc_out sc_lv 3 signal 24 } 
	{ filter_buff_2_2_0_ce0 sc_out sc_logic 1 signal 24 } 
	{ filter_buff_2_2_0_q0 sc_in sc_lv 32 signal 24 } 
	{ filter_buff_2_2_1_address0 sc_out sc_lv 3 signal 25 } 
	{ filter_buff_2_2_1_ce0 sc_out sc_logic 1 signal 25 } 
	{ filter_buff_2_2_1_q0 sc_in sc_lv 32 signal 25 } 
	{ filter_buff_2_2_2_address0 sc_out sc_lv 3 signal 26 } 
	{ filter_buff_2_2_2_ce0 sc_out sc_logic 1 signal 26 } 
	{ filter_buff_2_2_2_q0 sc_in sc_lv 32 signal 26 } 
	{ ifm_buff0_0_address0 sc_out sc_lv 6 signal 27 } 
	{ ifm_buff0_0_ce0 sc_out sc_logic 1 signal 27 } 
	{ ifm_buff0_0_q0 sc_in sc_lv 32 signal 27 } 
	{ ifm_buff0_0_address1 sc_out sc_lv 6 signal 27 } 
	{ ifm_buff0_0_ce1 sc_out sc_logic 1 signal 27 } 
	{ ifm_buff0_0_q1 sc_in sc_lv 32 signal 27 } 
	{ ifm_buff0_1_address0 sc_out sc_lv 6 signal 28 } 
	{ ifm_buff0_1_ce0 sc_out sc_logic 1 signal 28 } 
	{ ifm_buff0_1_q0 sc_in sc_lv 32 signal 28 } 
	{ ifm_buff0_1_address1 sc_out sc_lv 6 signal 28 } 
	{ ifm_buff0_1_ce1 sc_out sc_logic 1 signal 28 } 
	{ ifm_buff0_1_q1 sc_in sc_lv 32 signal 28 } 
	{ ifm_buff0_2_address0 sc_out sc_lv 6 signal 29 } 
	{ ifm_buff0_2_ce0 sc_out sc_logic 1 signal 29 } 
	{ ifm_buff0_2_q0 sc_in sc_lv 32 signal 29 } 
	{ ifm_buff0_2_address1 sc_out sc_lv 6 signal 29 } 
	{ ifm_buff0_2_ce1 sc_out sc_logic 1 signal 29 } 
	{ ifm_buff0_2_q1 sc_in sc_lv 32 signal 29 } 
	{ ifm_buff1_0_address0 sc_out sc_lv 6 signal 30 } 
	{ ifm_buff1_0_ce0 sc_out sc_logic 1 signal 30 } 
	{ ifm_buff1_0_q0 sc_in sc_lv 32 signal 30 } 
	{ ifm_buff1_0_address1 sc_out sc_lv 6 signal 30 } 
	{ ifm_buff1_0_ce1 sc_out sc_logic 1 signal 30 } 
	{ ifm_buff1_0_q1 sc_in sc_lv 32 signal 30 } 
	{ ifm_buff1_1_address0 sc_out sc_lv 6 signal 31 } 
	{ ifm_buff1_1_ce0 sc_out sc_logic 1 signal 31 } 
	{ ifm_buff1_1_q0 sc_in sc_lv 32 signal 31 } 
	{ ifm_buff1_1_address1 sc_out sc_lv 6 signal 31 } 
	{ ifm_buff1_1_ce1 sc_out sc_logic 1 signal 31 } 
	{ ifm_buff1_1_q1 sc_in sc_lv 32 signal 31 } 
	{ ifm_buff1_2_address0 sc_out sc_lv 6 signal 32 } 
	{ ifm_buff1_2_ce0 sc_out sc_logic 1 signal 32 } 
	{ ifm_buff1_2_q0 sc_in sc_lv 32 signal 32 } 
	{ ifm_buff1_2_address1 sc_out sc_lv 6 signal 32 } 
	{ ifm_buff1_2_ce1 sc_out sc_logic 1 signal 32 } 
	{ ifm_buff1_2_q1 sc_in sc_lv 32 signal 32 } 
	{ ifm_buff2_0_address0 sc_out sc_lv 6 signal 33 } 
	{ ifm_buff2_0_ce0 sc_out sc_logic 1 signal 33 } 
	{ ifm_buff2_0_q0 sc_in sc_lv 32 signal 33 } 
	{ ifm_buff2_0_address1 sc_out sc_lv 6 signal 33 } 
	{ ifm_buff2_0_ce1 sc_out sc_logic 1 signal 33 } 
	{ ifm_buff2_0_q1 sc_in sc_lv 32 signal 33 } 
	{ ifm_buff2_1_address0 sc_out sc_lv 6 signal 34 } 
	{ ifm_buff2_1_ce0 sc_out sc_logic 1 signal 34 } 
	{ ifm_buff2_1_q0 sc_in sc_lv 32 signal 34 } 
	{ ifm_buff2_1_address1 sc_out sc_lv 6 signal 34 } 
	{ ifm_buff2_1_ce1 sc_out sc_logic 1 signal 34 } 
	{ ifm_buff2_1_q1 sc_in sc_lv 32 signal 34 } 
	{ ifm_buff2_2_address0 sc_out sc_lv 6 signal 35 } 
	{ ifm_buff2_2_ce0 sc_out sc_logic 1 signal 35 } 
	{ ifm_buff2_2_q0 sc_in sc_lv 32 signal 35 } 
	{ ifm_buff2_2_address1 sc_out sc_lv 6 signal 35 } 
	{ ifm_buff2_2_ce1 sc_out sc_logic 1 signal 35 } 
	{ ifm_buff2_2_q1 sc_in sc_lv 32 signal 35 } 
	{ ofm_buff0_0_address0 sc_out sc_lv 5 signal 36 } 
	{ ofm_buff0_0_ce0 sc_out sc_logic 1 signal 36 } 
	{ ofm_buff0_0_we0 sc_out sc_logic 1 signal 36 } 
	{ ofm_buff0_0_d0 sc_out sc_lv 32 signal 36 } 
	{ ofm_buff0_1_address0 sc_out sc_lv 5 signal 37 } 
	{ ofm_buff0_1_ce0 sc_out sc_logic 1 signal 37 } 
	{ ofm_buff0_1_we0 sc_out sc_logic 1 signal 37 } 
	{ ofm_buff0_1_d0 sc_out sc_lv 32 signal 37 } 
	{ ofm_buff0_2_address0 sc_out sc_lv 5 signal 38 } 
	{ ofm_buff0_2_ce0 sc_out sc_logic 1 signal 38 } 
	{ ofm_buff0_2_we0 sc_out sc_logic 1 signal 38 } 
	{ ofm_buff0_2_d0 sc_out sc_lv 32 signal 38 } 
	{ ofm_buff0_3_address0 sc_out sc_lv 5 signal 39 } 
	{ ofm_buff0_3_ce0 sc_out sc_logic 1 signal 39 } 
	{ ofm_buff0_3_we0 sc_out sc_logic 1 signal 39 } 
	{ ofm_buff0_3_d0 sc_out sc_lv 32 signal 39 } 
	{ ofm_buff0_4_address0 sc_out sc_lv 5 signal 40 } 
	{ ofm_buff0_4_ce0 sc_out sc_logic 1 signal 40 } 
	{ ofm_buff0_4_we0 sc_out sc_logic 1 signal 40 } 
	{ ofm_buff0_4_d0 sc_out sc_lv 32 signal 40 } 
	{ ofm_buff0_5_address0 sc_out sc_lv 5 signal 41 } 
	{ ofm_buff0_5_ce0 sc_out sc_logic 1 signal 41 } 
	{ ofm_buff0_5_we0 sc_out sc_logic 1 signal 41 } 
	{ ofm_buff0_5_d0 sc_out sc_lv 32 signal 41 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "filter_buff_0_0_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "filter_buff_0_0_0", "role": "address0" }} , 
 	{ "name": "filter_buff_0_0_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_0_0_0", "role": "ce0" }} , 
 	{ "name": "filter_buff_0_0_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_0_0_0", "role": "q0" }} , 
 	{ "name": "filter_buff_0_0_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "filter_buff_0_0_1", "role": "address0" }} , 
 	{ "name": "filter_buff_0_0_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_0_0_1", "role": "ce0" }} , 
 	{ "name": "filter_buff_0_0_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_0_0_1", "role": "q0" }} , 
 	{ "name": "filter_buff_0_0_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "filter_buff_0_0_2", "role": "address0" }} , 
 	{ "name": "filter_buff_0_0_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_0_0_2", "role": "ce0" }} , 
 	{ "name": "filter_buff_0_0_2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_0_0_2", "role": "q0" }} , 
 	{ "name": "filter_buff_0_1_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "filter_buff_0_1_0", "role": "address0" }} , 
 	{ "name": "filter_buff_0_1_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_0_1_0", "role": "ce0" }} , 
 	{ "name": "filter_buff_0_1_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_0_1_0", "role": "q0" }} , 
 	{ "name": "filter_buff_0_1_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "filter_buff_0_1_1", "role": "address0" }} , 
 	{ "name": "filter_buff_0_1_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_0_1_1", "role": "ce0" }} , 
 	{ "name": "filter_buff_0_1_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_0_1_1", "role": "q0" }} , 
 	{ "name": "filter_buff_0_1_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "filter_buff_0_1_2", "role": "address0" }} , 
 	{ "name": "filter_buff_0_1_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_0_1_2", "role": "ce0" }} , 
 	{ "name": "filter_buff_0_1_2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_0_1_2", "role": "q0" }} , 
 	{ "name": "filter_buff_0_2_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "filter_buff_0_2_0", "role": "address0" }} , 
 	{ "name": "filter_buff_0_2_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_0_2_0", "role": "ce0" }} , 
 	{ "name": "filter_buff_0_2_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_0_2_0", "role": "q0" }} , 
 	{ "name": "filter_buff_0_2_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "filter_buff_0_2_1", "role": "address0" }} , 
 	{ "name": "filter_buff_0_2_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_0_2_1", "role": "ce0" }} , 
 	{ "name": "filter_buff_0_2_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_0_2_1", "role": "q0" }} , 
 	{ "name": "filter_buff_0_2_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "filter_buff_0_2_2", "role": "address0" }} , 
 	{ "name": "filter_buff_0_2_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_0_2_2", "role": "ce0" }} , 
 	{ "name": "filter_buff_0_2_2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_0_2_2", "role": "q0" }} , 
 	{ "name": "filter_buff_1_0_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "filter_buff_1_0_0", "role": "address0" }} , 
 	{ "name": "filter_buff_1_0_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_1_0_0", "role": "ce0" }} , 
 	{ "name": "filter_buff_1_0_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_1_0_0", "role": "q0" }} , 
 	{ "name": "filter_buff_1_0_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "filter_buff_1_0_1", "role": "address0" }} , 
 	{ "name": "filter_buff_1_0_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_1_0_1", "role": "ce0" }} , 
 	{ "name": "filter_buff_1_0_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_1_0_1", "role": "q0" }} , 
 	{ "name": "filter_buff_1_0_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "filter_buff_1_0_2", "role": "address0" }} , 
 	{ "name": "filter_buff_1_0_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_1_0_2", "role": "ce0" }} , 
 	{ "name": "filter_buff_1_0_2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_1_0_2", "role": "q0" }} , 
 	{ "name": "filter_buff_1_1_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "filter_buff_1_1_0", "role": "address0" }} , 
 	{ "name": "filter_buff_1_1_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_1_1_0", "role": "ce0" }} , 
 	{ "name": "filter_buff_1_1_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_1_1_0", "role": "q0" }} , 
 	{ "name": "filter_buff_1_1_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "filter_buff_1_1_1", "role": "address0" }} , 
 	{ "name": "filter_buff_1_1_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_1_1_1", "role": "ce0" }} , 
 	{ "name": "filter_buff_1_1_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_1_1_1", "role": "q0" }} , 
 	{ "name": "filter_buff_1_1_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "filter_buff_1_1_2", "role": "address0" }} , 
 	{ "name": "filter_buff_1_1_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_1_1_2", "role": "ce0" }} , 
 	{ "name": "filter_buff_1_1_2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_1_1_2", "role": "q0" }} , 
 	{ "name": "filter_buff_1_2_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "filter_buff_1_2_0", "role": "address0" }} , 
 	{ "name": "filter_buff_1_2_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_1_2_0", "role": "ce0" }} , 
 	{ "name": "filter_buff_1_2_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_1_2_0", "role": "q0" }} , 
 	{ "name": "filter_buff_1_2_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "filter_buff_1_2_1", "role": "address0" }} , 
 	{ "name": "filter_buff_1_2_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_1_2_1", "role": "ce0" }} , 
 	{ "name": "filter_buff_1_2_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_1_2_1", "role": "q0" }} , 
 	{ "name": "filter_buff_1_2_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "filter_buff_1_2_2", "role": "address0" }} , 
 	{ "name": "filter_buff_1_2_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_1_2_2", "role": "ce0" }} , 
 	{ "name": "filter_buff_1_2_2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_1_2_2", "role": "q0" }} , 
 	{ "name": "filter_buff_2_0_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "filter_buff_2_0_0", "role": "address0" }} , 
 	{ "name": "filter_buff_2_0_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_2_0_0", "role": "ce0" }} , 
 	{ "name": "filter_buff_2_0_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_2_0_0", "role": "q0" }} , 
 	{ "name": "filter_buff_2_0_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "filter_buff_2_0_1", "role": "address0" }} , 
 	{ "name": "filter_buff_2_0_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_2_0_1", "role": "ce0" }} , 
 	{ "name": "filter_buff_2_0_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_2_0_1", "role": "q0" }} , 
 	{ "name": "filter_buff_2_0_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "filter_buff_2_0_2", "role": "address0" }} , 
 	{ "name": "filter_buff_2_0_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_2_0_2", "role": "ce0" }} , 
 	{ "name": "filter_buff_2_0_2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_2_0_2", "role": "q0" }} , 
 	{ "name": "filter_buff_2_1_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "filter_buff_2_1_0", "role": "address0" }} , 
 	{ "name": "filter_buff_2_1_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_2_1_0", "role": "ce0" }} , 
 	{ "name": "filter_buff_2_1_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_2_1_0", "role": "q0" }} , 
 	{ "name": "filter_buff_2_1_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "filter_buff_2_1_1", "role": "address0" }} , 
 	{ "name": "filter_buff_2_1_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_2_1_1", "role": "ce0" }} , 
 	{ "name": "filter_buff_2_1_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_2_1_1", "role": "q0" }} , 
 	{ "name": "filter_buff_2_1_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "filter_buff_2_1_2", "role": "address0" }} , 
 	{ "name": "filter_buff_2_1_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_2_1_2", "role": "ce0" }} , 
 	{ "name": "filter_buff_2_1_2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_2_1_2", "role": "q0" }} , 
 	{ "name": "filter_buff_2_2_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "filter_buff_2_2_0", "role": "address0" }} , 
 	{ "name": "filter_buff_2_2_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_2_2_0", "role": "ce0" }} , 
 	{ "name": "filter_buff_2_2_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_2_2_0", "role": "q0" }} , 
 	{ "name": "filter_buff_2_2_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "filter_buff_2_2_1", "role": "address0" }} , 
 	{ "name": "filter_buff_2_2_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_2_2_1", "role": "ce0" }} , 
 	{ "name": "filter_buff_2_2_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_2_2_1", "role": "q0" }} , 
 	{ "name": "filter_buff_2_2_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "filter_buff_2_2_2", "role": "address0" }} , 
 	{ "name": "filter_buff_2_2_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_2_2_2", "role": "ce0" }} , 
 	{ "name": "filter_buff_2_2_2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_2_2_2", "role": "q0" }} , 
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
 	{ "name": "ifm_buff2_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff2_0", "role": "address0" }} , 
 	{ "name": "ifm_buff2_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff2_0", "role": "ce0" }} , 
 	{ "name": "ifm_buff2_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff2_0", "role": "q0" }} , 
 	{ "name": "ifm_buff2_0_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff2_0", "role": "address1" }} , 
 	{ "name": "ifm_buff2_0_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff2_0", "role": "ce1" }} , 
 	{ "name": "ifm_buff2_0_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff2_0", "role": "q1" }} , 
 	{ "name": "ifm_buff2_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff2_1", "role": "address0" }} , 
 	{ "name": "ifm_buff2_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff2_1", "role": "ce0" }} , 
 	{ "name": "ifm_buff2_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff2_1", "role": "q0" }} , 
 	{ "name": "ifm_buff2_1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff2_1", "role": "address1" }} , 
 	{ "name": "ifm_buff2_1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff2_1", "role": "ce1" }} , 
 	{ "name": "ifm_buff2_1_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff2_1", "role": "q1" }} , 
 	{ "name": "ifm_buff2_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff2_2", "role": "address0" }} , 
 	{ "name": "ifm_buff2_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff2_2", "role": "ce0" }} , 
 	{ "name": "ifm_buff2_2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff2_2", "role": "q0" }} , 
 	{ "name": "ifm_buff2_2_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff2_2", "role": "address1" }} , 
 	{ "name": "ifm_buff2_2_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff2_2", "role": "ce1" }} , 
 	{ "name": "ifm_buff2_2_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff2_2", "role": "q1" }} , 
 	{ "name": "ofm_buff0_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "ofm_buff0_0", "role": "address0" }} , 
 	{ "name": "ofm_buff0_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ofm_buff0_0", "role": "ce0" }} , 
 	{ "name": "ofm_buff0_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ofm_buff0_0", "role": "we0" }} , 
 	{ "name": "ofm_buff0_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ofm_buff0_0", "role": "d0" }} , 
 	{ "name": "ofm_buff0_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "ofm_buff0_1", "role": "address0" }} , 
 	{ "name": "ofm_buff0_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ofm_buff0_1", "role": "ce0" }} , 
 	{ "name": "ofm_buff0_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ofm_buff0_1", "role": "we0" }} , 
 	{ "name": "ofm_buff0_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ofm_buff0_1", "role": "d0" }} , 
 	{ "name": "ofm_buff0_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "ofm_buff0_2", "role": "address0" }} , 
 	{ "name": "ofm_buff0_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ofm_buff0_2", "role": "ce0" }} , 
 	{ "name": "ofm_buff0_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ofm_buff0_2", "role": "we0" }} , 
 	{ "name": "ofm_buff0_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ofm_buff0_2", "role": "d0" }} , 
 	{ "name": "ofm_buff0_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "ofm_buff0_3", "role": "address0" }} , 
 	{ "name": "ofm_buff0_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ofm_buff0_3", "role": "ce0" }} , 
 	{ "name": "ofm_buff0_3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ofm_buff0_3", "role": "we0" }} , 
 	{ "name": "ofm_buff0_3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ofm_buff0_3", "role": "d0" }} , 
 	{ "name": "ofm_buff0_4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "ofm_buff0_4", "role": "address0" }} , 
 	{ "name": "ofm_buff0_4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ofm_buff0_4", "role": "ce0" }} , 
 	{ "name": "ofm_buff0_4_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ofm_buff0_4", "role": "we0" }} , 
 	{ "name": "ofm_buff0_4_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ofm_buff0_4", "role": "d0" }} , 
 	{ "name": "ofm_buff0_5_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "ofm_buff0_5", "role": "address0" }} , 
 	{ "name": "ofm_buff0_5_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ofm_buff0_5", "role": "ce0" }} , 
 	{ "name": "ofm_buff0_5_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ofm_buff0_5", "role": "we0" }} , 
 	{ "name": "ofm_buff0_5_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ofm_buff0_5", "role": "d0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28"],
		"CDFG" : "conv_write",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "428", "EstimateLatencyMax" : "428",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "filter_buff_0_0_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_0_0_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_0_0_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_0_1_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_0_1_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_0_1_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_0_2_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_0_2_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_0_2_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_1_0_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_1_0_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_1_0_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_1_1_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_1_1_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_1_1_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_1_2_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_1_2_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_1_2_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_2_0_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_2_0_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_2_0_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_2_1_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_2_1_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_2_1_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_2_2_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_2_2_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_2_2_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ifm_buff0_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ifm_buff0_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ifm_buff0_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ifm_buff1_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ifm_buff1_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ifm_buff1_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ifm_buff2_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ifm_buff2_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ifm_buff2_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ofm_buff0_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ofm_buff0_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ofm_buff0_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ofm_buff0_3", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ofm_buff0_4", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ofm_buff0_5", "Type" : "Memory", "Direction" : "O"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.convolution_hw_fabkb_U45", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.convolution_hw_fabkb_U46", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.convolution_hw_fabkb_U47", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.convolution_hw_fabkb_U48", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.convolution_hw_fabkb_U49", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.convolution_hw_fabkb_U50", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.convolution_hw_fabkb_U51", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.convolution_hw_fabkb_U52", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.convolution_hw_fabkb_U53", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.convolution_hw_fabkb_U54", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.convolution_hw_fabkb_U55", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.convolution_hw_fabkb_U56", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.convolution_hw_fabkb_U57", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.convolution_hw_fabkb_U58", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.convolution_hw_fmcud_U59", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.convolution_hw_fmcud_U60", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.convolution_hw_fmcud_U61", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.convolution_hw_fmcud_U62", "Parent" : "0"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.convolution_hw_fmcud_U63", "Parent" : "0"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.convolution_hw_fmcud_U64", "Parent" : "0"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.convolution_hw_fmcud_U65", "Parent" : "0"},
	{"ID" : "22", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.convolution_hw_fmcud_U66", "Parent" : "0"},
	{"ID" : "23", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.convolution_hw_fmcud_U67", "Parent" : "0"},
	{"ID" : "24", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.convolution_hw_fmcud_U68", "Parent" : "0"},
	{"ID" : "25", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.convolution_hw_fmcud_U69", "Parent" : "0"},
	{"ID" : "26", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.convolution_hw_fmcud_U70", "Parent" : "0"},
	{"ID" : "27", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.convolution_hw_fmcud_U71", "Parent" : "0"},
	{"ID" : "28", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.convolution_hw_fmcud_U72", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	conv_write {
		filter_buff_0_0_0 {Type I LastRead 1 FirstWrite -1}
		filter_buff_0_0_1 {Type I LastRead 1 FirstWrite -1}
		filter_buff_0_0_2 {Type I LastRead 3 FirstWrite -1}
		filter_buff_0_1_0 {Type I LastRead 1 FirstWrite -1}
		filter_buff_0_1_1 {Type I LastRead 1 FirstWrite -1}
		filter_buff_0_1_2 {Type I LastRead 3 FirstWrite -1}
		filter_buff_0_2_0 {Type I LastRead 1 FirstWrite -1}
		filter_buff_0_2_1 {Type I LastRead 1 FirstWrite -1}
		filter_buff_0_2_2 {Type I LastRead 3 FirstWrite -1}
		filter_buff_1_0_0 {Type I LastRead 1 FirstWrite -1}
		filter_buff_1_0_1 {Type I LastRead 1 FirstWrite -1}
		filter_buff_1_0_2 {Type I LastRead 3 FirstWrite -1}
		filter_buff_1_1_0 {Type I LastRead 1 FirstWrite -1}
		filter_buff_1_1_1 {Type I LastRead 1 FirstWrite -1}
		filter_buff_1_1_2 {Type I LastRead 3 FirstWrite -1}
		filter_buff_1_2_0 {Type I LastRead 1 FirstWrite -1}
		filter_buff_1_2_1 {Type I LastRead 1 FirstWrite -1}
		filter_buff_1_2_2 {Type I LastRead 3 FirstWrite -1}
		filter_buff_2_0_0 {Type I LastRead 1 FirstWrite -1}
		filter_buff_2_0_1 {Type I LastRead 3 FirstWrite -1}
		filter_buff_2_0_2 {Type I LastRead 3 FirstWrite -1}
		filter_buff_2_1_0 {Type I LastRead 1 FirstWrite -1}
		filter_buff_2_1_1 {Type I LastRead 3 FirstWrite -1}
		filter_buff_2_1_2 {Type I LastRead 3 FirstWrite -1}
		filter_buff_2_2_0 {Type I LastRead 3 FirstWrite -1}
		filter_buff_2_2_1 {Type I LastRead 3 FirstWrite -1}
		filter_buff_2_2_2 {Type I LastRead 3 FirstWrite -1}
		ifm_buff0_0 {Type I LastRead 3 FirstWrite -1}
		ifm_buff0_1 {Type I LastRead 3 FirstWrite -1}
		ifm_buff0_2 {Type I LastRead 3 FirstWrite -1}
		ifm_buff1_0 {Type I LastRead 3 FirstWrite -1}
		ifm_buff1_1 {Type I LastRead 3 FirstWrite -1}
		ifm_buff1_2 {Type I LastRead 3 FirstWrite -1}
		ifm_buff2_0 {Type I LastRead 3 FirstWrite -1}
		ifm_buff2_1 {Type I LastRead 3 FirstWrite -1}
		ifm_buff2_2 {Type I LastRead 3 FirstWrite -1}
		ofm_buff0_0 {Type O LastRead -1 FirstWrite 45}
		ofm_buff0_1 {Type O LastRead -1 FirstWrite 45}
		ofm_buff0_2 {Type O LastRead -1 FirstWrite 45}
		ofm_buff0_3 {Type O LastRead -1 FirstWrite 45}
		ofm_buff0_4 {Type O LastRead -1 FirstWrite 45}
		ofm_buff0_5 {Type O LastRead -1 FirstWrite 45}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "428", "Max" : "428"}
	, {"Name" : "Interval", "Min" : "428", "Max" : "428"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	filter_buff_0_0_0 { ap_memory {  { filter_buff_0_0_0_address0 mem_address 1 3 }  { filter_buff_0_0_0_ce0 mem_ce 1 1 }  { filter_buff_0_0_0_q0 mem_dout 0 32 } } }
	filter_buff_0_0_1 { ap_memory {  { filter_buff_0_0_1_address0 mem_address 1 3 }  { filter_buff_0_0_1_ce0 mem_ce 1 1 }  { filter_buff_0_0_1_q0 mem_dout 0 32 } } }
	filter_buff_0_0_2 { ap_memory {  { filter_buff_0_0_2_address0 mem_address 1 3 }  { filter_buff_0_0_2_ce0 mem_ce 1 1 }  { filter_buff_0_0_2_q0 mem_dout 0 32 } } }
	filter_buff_0_1_0 { ap_memory {  { filter_buff_0_1_0_address0 mem_address 1 3 }  { filter_buff_0_1_0_ce0 mem_ce 1 1 }  { filter_buff_0_1_0_q0 mem_dout 0 32 } } }
	filter_buff_0_1_1 { ap_memory {  { filter_buff_0_1_1_address0 mem_address 1 3 }  { filter_buff_0_1_1_ce0 mem_ce 1 1 }  { filter_buff_0_1_1_q0 mem_dout 0 32 } } }
	filter_buff_0_1_2 { ap_memory {  { filter_buff_0_1_2_address0 mem_address 1 3 }  { filter_buff_0_1_2_ce0 mem_ce 1 1 }  { filter_buff_0_1_2_q0 mem_dout 0 32 } } }
	filter_buff_0_2_0 { ap_memory {  { filter_buff_0_2_0_address0 mem_address 1 3 }  { filter_buff_0_2_0_ce0 mem_ce 1 1 }  { filter_buff_0_2_0_q0 mem_dout 0 32 } } }
	filter_buff_0_2_1 { ap_memory {  { filter_buff_0_2_1_address0 mem_address 1 3 }  { filter_buff_0_2_1_ce0 mem_ce 1 1 }  { filter_buff_0_2_1_q0 mem_dout 0 32 } } }
	filter_buff_0_2_2 { ap_memory {  { filter_buff_0_2_2_address0 mem_address 1 3 }  { filter_buff_0_2_2_ce0 mem_ce 1 1 }  { filter_buff_0_2_2_q0 mem_dout 0 32 } } }
	filter_buff_1_0_0 { ap_memory {  { filter_buff_1_0_0_address0 mem_address 1 3 }  { filter_buff_1_0_0_ce0 mem_ce 1 1 }  { filter_buff_1_0_0_q0 mem_dout 0 32 } } }
	filter_buff_1_0_1 { ap_memory {  { filter_buff_1_0_1_address0 mem_address 1 3 }  { filter_buff_1_0_1_ce0 mem_ce 1 1 }  { filter_buff_1_0_1_q0 mem_dout 0 32 } } }
	filter_buff_1_0_2 { ap_memory {  { filter_buff_1_0_2_address0 mem_address 1 3 }  { filter_buff_1_0_2_ce0 mem_ce 1 1 }  { filter_buff_1_0_2_q0 mem_dout 0 32 } } }
	filter_buff_1_1_0 { ap_memory {  { filter_buff_1_1_0_address0 mem_address 1 3 }  { filter_buff_1_1_0_ce0 mem_ce 1 1 }  { filter_buff_1_1_0_q0 mem_dout 0 32 } } }
	filter_buff_1_1_1 { ap_memory {  { filter_buff_1_1_1_address0 mem_address 1 3 }  { filter_buff_1_1_1_ce0 mem_ce 1 1 }  { filter_buff_1_1_1_q0 mem_dout 0 32 } } }
	filter_buff_1_1_2 { ap_memory {  { filter_buff_1_1_2_address0 mem_address 1 3 }  { filter_buff_1_1_2_ce0 mem_ce 1 1 }  { filter_buff_1_1_2_q0 mem_dout 0 32 } } }
	filter_buff_1_2_0 { ap_memory {  { filter_buff_1_2_0_address0 mem_address 1 3 }  { filter_buff_1_2_0_ce0 mem_ce 1 1 }  { filter_buff_1_2_0_q0 mem_dout 0 32 } } }
	filter_buff_1_2_1 { ap_memory {  { filter_buff_1_2_1_address0 mem_address 1 3 }  { filter_buff_1_2_1_ce0 mem_ce 1 1 }  { filter_buff_1_2_1_q0 mem_dout 0 32 } } }
	filter_buff_1_2_2 { ap_memory {  { filter_buff_1_2_2_address0 mem_address 1 3 }  { filter_buff_1_2_2_ce0 mem_ce 1 1 }  { filter_buff_1_2_2_q0 mem_dout 0 32 } } }
	filter_buff_2_0_0 { ap_memory {  { filter_buff_2_0_0_address0 mem_address 1 3 }  { filter_buff_2_0_0_ce0 mem_ce 1 1 }  { filter_buff_2_0_0_q0 mem_dout 0 32 } } }
	filter_buff_2_0_1 { ap_memory {  { filter_buff_2_0_1_address0 mem_address 1 3 }  { filter_buff_2_0_1_ce0 mem_ce 1 1 }  { filter_buff_2_0_1_q0 mem_dout 0 32 } } }
	filter_buff_2_0_2 { ap_memory {  { filter_buff_2_0_2_address0 mem_address 1 3 }  { filter_buff_2_0_2_ce0 mem_ce 1 1 }  { filter_buff_2_0_2_q0 mem_dout 0 32 } } }
	filter_buff_2_1_0 { ap_memory {  { filter_buff_2_1_0_address0 mem_address 1 3 }  { filter_buff_2_1_0_ce0 mem_ce 1 1 }  { filter_buff_2_1_0_q0 mem_dout 0 32 } } }
	filter_buff_2_1_1 { ap_memory {  { filter_buff_2_1_1_address0 mem_address 1 3 }  { filter_buff_2_1_1_ce0 mem_ce 1 1 }  { filter_buff_2_1_1_q0 mem_dout 0 32 } } }
	filter_buff_2_1_2 { ap_memory {  { filter_buff_2_1_2_address0 mem_address 1 3 }  { filter_buff_2_1_2_ce0 mem_ce 1 1 }  { filter_buff_2_1_2_q0 mem_dout 0 32 } } }
	filter_buff_2_2_0 { ap_memory {  { filter_buff_2_2_0_address0 mem_address 1 3 }  { filter_buff_2_2_0_ce0 mem_ce 1 1 }  { filter_buff_2_2_0_q0 mem_dout 0 32 } } }
	filter_buff_2_2_1 { ap_memory {  { filter_buff_2_2_1_address0 mem_address 1 3 }  { filter_buff_2_2_1_ce0 mem_ce 1 1 }  { filter_buff_2_2_1_q0 mem_dout 0 32 } } }
	filter_buff_2_2_2 { ap_memory {  { filter_buff_2_2_2_address0 mem_address 1 3 }  { filter_buff_2_2_2_ce0 mem_ce 1 1 }  { filter_buff_2_2_2_q0 mem_dout 0 32 } } }
	ifm_buff0_0 { ap_memory {  { ifm_buff0_0_address0 mem_address 1 6 }  { ifm_buff0_0_ce0 mem_ce 1 1 }  { ifm_buff0_0_q0 mem_dout 0 32 }  { ifm_buff0_0_address1 MemPortADDR2 1 6 }  { ifm_buff0_0_ce1 MemPortCE2 1 1 }  { ifm_buff0_0_q1 MemPortDOUT2 0 32 } } }
	ifm_buff0_1 { ap_memory {  { ifm_buff0_1_address0 mem_address 1 6 }  { ifm_buff0_1_ce0 mem_ce 1 1 }  { ifm_buff0_1_q0 mem_dout 0 32 }  { ifm_buff0_1_address1 MemPortADDR2 1 6 }  { ifm_buff0_1_ce1 MemPortCE2 1 1 }  { ifm_buff0_1_q1 MemPortDOUT2 0 32 } } }
	ifm_buff0_2 { ap_memory {  { ifm_buff0_2_address0 mem_address 1 6 }  { ifm_buff0_2_ce0 mem_ce 1 1 }  { ifm_buff0_2_q0 mem_dout 0 32 }  { ifm_buff0_2_address1 MemPortADDR2 1 6 }  { ifm_buff0_2_ce1 MemPortCE2 1 1 }  { ifm_buff0_2_q1 MemPortDOUT2 0 32 } } }
	ifm_buff1_0 { ap_memory {  { ifm_buff1_0_address0 mem_address 1 6 }  { ifm_buff1_0_ce0 mem_ce 1 1 }  { ifm_buff1_0_q0 mem_dout 0 32 }  { ifm_buff1_0_address1 MemPortADDR2 1 6 }  { ifm_buff1_0_ce1 MemPortCE2 1 1 }  { ifm_buff1_0_q1 MemPortDOUT2 0 32 } } }
	ifm_buff1_1 { ap_memory {  { ifm_buff1_1_address0 mem_address 1 6 }  { ifm_buff1_1_ce0 mem_ce 1 1 }  { ifm_buff1_1_q0 mem_dout 0 32 }  { ifm_buff1_1_address1 MemPortADDR2 1 6 }  { ifm_buff1_1_ce1 MemPortCE2 1 1 }  { ifm_buff1_1_q1 MemPortDOUT2 0 32 } } }
	ifm_buff1_2 { ap_memory {  { ifm_buff1_2_address0 mem_address 1 6 }  { ifm_buff1_2_ce0 mem_ce 1 1 }  { ifm_buff1_2_q0 mem_dout 0 32 }  { ifm_buff1_2_address1 MemPortADDR2 1 6 }  { ifm_buff1_2_ce1 MemPortCE2 1 1 }  { ifm_buff1_2_q1 MemPortDOUT2 0 32 } } }
	ifm_buff2_0 { ap_memory {  { ifm_buff2_0_address0 mem_address 1 6 }  { ifm_buff2_0_ce0 mem_ce 1 1 }  { ifm_buff2_0_q0 mem_dout 0 32 }  { ifm_buff2_0_address1 MemPortADDR2 1 6 }  { ifm_buff2_0_ce1 MemPortCE2 1 1 }  { ifm_buff2_0_q1 MemPortDOUT2 0 32 } } }
	ifm_buff2_1 { ap_memory {  { ifm_buff2_1_address0 mem_address 1 6 }  { ifm_buff2_1_ce0 mem_ce 1 1 }  { ifm_buff2_1_q0 mem_dout 0 32 }  { ifm_buff2_1_address1 MemPortADDR2 1 6 }  { ifm_buff2_1_ce1 MemPortCE2 1 1 }  { ifm_buff2_1_q1 MemPortDOUT2 0 32 } } }
	ifm_buff2_2 { ap_memory {  { ifm_buff2_2_address0 mem_address 1 6 }  { ifm_buff2_2_ce0 mem_ce 1 1 }  { ifm_buff2_2_q0 mem_dout 0 32 }  { ifm_buff2_2_address1 MemPortADDR2 1 6 }  { ifm_buff2_2_ce1 MemPortCE2 1 1 }  { ifm_buff2_2_q1 MemPortDOUT2 0 32 } } }
	ofm_buff0_0 { ap_memory {  { ofm_buff0_0_address0 mem_address 1 5 }  { ofm_buff0_0_ce0 mem_ce 1 1 }  { ofm_buff0_0_we0 mem_we 1 1 }  { ofm_buff0_0_d0 mem_din 1 32 } } }
	ofm_buff0_1 { ap_memory {  { ofm_buff0_1_address0 mem_address 1 5 }  { ofm_buff0_1_ce0 mem_ce 1 1 }  { ofm_buff0_1_we0 mem_we 1 1 }  { ofm_buff0_1_d0 mem_din 1 32 } } }
	ofm_buff0_2 { ap_memory {  { ofm_buff0_2_address0 mem_address 1 5 }  { ofm_buff0_2_ce0 mem_ce 1 1 }  { ofm_buff0_2_we0 mem_we 1 1 }  { ofm_buff0_2_d0 mem_din 1 32 } } }
	ofm_buff0_3 { ap_memory {  { ofm_buff0_3_address0 mem_address 1 5 }  { ofm_buff0_3_ce0 mem_ce 1 1 }  { ofm_buff0_3_we0 mem_we 1 1 }  { ofm_buff0_3_d0 mem_din 1 32 } } }
	ofm_buff0_4 { ap_memory {  { ofm_buff0_4_address0 mem_address 1 5 }  { ofm_buff0_4_ce0 mem_ce 1 1 }  { ofm_buff0_4_we0 mem_we 1 1 }  { ofm_buff0_4_d0 mem_din 1 32 } } }
	ofm_buff0_5 { ap_memory {  { ofm_buff0_5_address0 mem_address 1 5 }  { ofm_buff0_5_ce0 mem_ce 1 1 }  { ofm_buff0_5_we0 mem_we 1 1 }  { ofm_buff0_5_d0 mem_din 1 32 } } }
}
