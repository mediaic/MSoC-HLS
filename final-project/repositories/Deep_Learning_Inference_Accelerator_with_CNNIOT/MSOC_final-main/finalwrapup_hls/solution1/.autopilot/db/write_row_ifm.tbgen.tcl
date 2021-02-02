set moduleName write_row_ifm
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
set C_modelName {write_row_ifm}
set C_modelType { int 32 }
set C_modelArgList {
	{ cifm int 512 regular {axi_s 0 volatile  { cifm Data } }  }
	{ ifm_buff0_0 float 32 regular {array 58 { 0 3 } 0 1 }  }
	{ ifm_buff0_1 float 32 regular {array 58 { 0 3 } 0 1 }  }
	{ ifm_buff0_2 float 32 regular {array 58 { 0 3 } 0 1 }  }
	{ ifm_buff0_3 float 32 regular {array 58 { 0 3 } 0 1 }  }
	{ ifm_buff0_4 float 32 regular {array 58 { 0 3 } 0 1 }  }
	{ ifm_buff0_5 float 32 regular {array 58 { 0 3 } 0 1 }  }
	{ ifm_buff0_6 float 32 regular {array 58 { 0 3 } 0 1 }  }
	{ ifm_buff0_7 float 32 regular {array 58 { 0 3 } 0 1 }  }
	{ ifm_buff0_8 float 32 regular {array 58 { 0 3 } 0 1 }  }
	{ ifm_buff0_9 float 32 regular {array 58 { 0 3 } 0 1 }  }
	{ ifm_buff0_10 float 32 regular {array 58 { 0 3 } 0 1 }  }
	{ ifm_buff0_11 float 32 regular {array 58 { 0 3 } 0 1 }  }
	{ ifm_buff0_12 float 32 regular {array 58 { 0 3 } 0 1 }  }
	{ ifm_buff0_13 float 32 regular {array 58 { 0 3 } 0 1 }  }
	{ ifm_buff0_14 float 32 regular {array 58 { 0 3 } 0 1 }  }
	{ ifm_buff0_15 float 32 regular {array 58 { 0 3 } 0 1 }  }
	{ cifm_counter_read int 32 regular  }
	{ enable uint 1 regular  }
}
set C_modelArgMapList {[ 
	{ "Name" : "cifm", "interface" : "axis", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "ifm_buff0_0", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "ifm_buff0_1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "ifm_buff0_2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "ifm_buff0_3", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "ifm_buff0_4", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "ifm_buff0_5", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "ifm_buff0_6", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "ifm_buff0_7", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "ifm_buff0_8", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "ifm_buff0_9", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "ifm_buff0_10", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "ifm_buff0_11", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "ifm_buff0_12", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "ifm_buff0_13", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "ifm_buff0_14", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "ifm_buff0_15", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "cifm_counter_read", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "enable", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 32} ]}
# RTL Port declarations: 
set portNum 76
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ cifm_TDATA sc_in sc_lv 512 signal 0 } 
	{ cifm_TVALID sc_in sc_logic 1 invld 0 } 
	{ cifm_TREADY sc_out sc_logic 1 inacc 0 } 
	{ ifm_buff0_0_address0 sc_out sc_lv 6 signal 1 } 
	{ ifm_buff0_0_ce0 sc_out sc_logic 1 signal 1 } 
	{ ifm_buff0_0_we0 sc_out sc_logic 1 signal 1 } 
	{ ifm_buff0_0_d0 sc_out sc_lv 32 signal 1 } 
	{ ifm_buff0_1_address0 sc_out sc_lv 6 signal 2 } 
	{ ifm_buff0_1_ce0 sc_out sc_logic 1 signal 2 } 
	{ ifm_buff0_1_we0 sc_out sc_logic 1 signal 2 } 
	{ ifm_buff0_1_d0 sc_out sc_lv 32 signal 2 } 
	{ ifm_buff0_2_address0 sc_out sc_lv 6 signal 3 } 
	{ ifm_buff0_2_ce0 sc_out sc_logic 1 signal 3 } 
	{ ifm_buff0_2_we0 sc_out sc_logic 1 signal 3 } 
	{ ifm_buff0_2_d0 sc_out sc_lv 32 signal 3 } 
	{ ifm_buff0_3_address0 sc_out sc_lv 6 signal 4 } 
	{ ifm_buff0_3_ce0 sc_out sc_logic 1 signal 4 } 
	{ ifm_buff0_3_we0 sc_out sc_logic 1 signal 4 } 
	{ ifm_buff0_3_d0 sc_out sc_lv 32 signal 4 } 
	{ ifm_buff0_4_address0 sc_out sc_lv 6 signal 5 } 
	{ ifm_buff0_4_ce0 sc_out sc_logic 1 signal 5 } 
	{ ifm_buff0_4_we0 sc_out sc_logic 1 signal 5 } 
	{ ifm_buff0_4_d0 sc_out sc_lv 32 signal 5 } 
	{ ifm_buff0_5_address0 sc_out sc_lv 6 signal 6 } 
	{ ifm_buff0_5_ce0 sc_out sc_logic 1 signal 6 } 
	{ ifm_buff0_5_we0 sc_out sc_logic 1 signal 6 } 
	{ ifm_buff0_5_d0 sc_out sc_lv 32 signal 6 } 
	{ ifm_buff0_6_address0 sc_out sc_lv 6 signal 7 } 
	{ ifm_buff0_6_ce0 sc_out sc_logic 1 signal 7 } 
	{ ifm_buff0_6_we0 sc_out sc_logic 1 signal 7 } 
	{ ifm_buff0_6_d0 sc_out sc_lv 32 signal 7 } 
	{ ifm_buff0_7_address0 sc_out sc_lv 6 signal 8 } 
	{ ifm_buff0_7_ce0 sc_out sc_logic 1 signal 8 } 
	{ ifm_buff0_7_we0 sc_out sc_logic 1 signal 8 } 
	{ ifm_buff0_7_d0 sc_out sc_lv 32 signal 8 } 
	{ ifm_buff0_8_address0 sc_out sc_lv 6 signal 9 } 
	{ ifm_buff0_8_ce0 sc_out sc_logic 1 signal 9 } 
	{ ifm_buff0_8_we0 sc_out sc_logic 1 signal 9 } 
	{ ifm_buff0_8_d0 sc_out sc_lv 32 signal 9 } 
	{ ifm_buff0_9_address0 sc_out sc_lv 6 signal 10 } 
	{ ifm_buff0_9_ce0 sc_out sc_logic 1 signal 10 } 
	{ ifm_buff0_9_we0 sc_out sc_logic 1 signal 10 } 
	{ ifm_buff0_9_d0 sc_out sc_lv 32 signal 10 } 
	{ ifm_buff0_10_address0 sc_out sc_lv 6 signal 11 } 
	{ ifm_buff0_10_ce0 sc_out sc_logic 1 signal 11 } 
	{ ifm_buff0_10_we0 sc_out sc_logic 1 signal 11 } 
	{ ifm_buff0_10_d0 sc_out sc_lv 32 signal 11 } 
	{ ifm_buff0_11_address0 sc_out sc_lv 6 signal 12 } 
	{ ifm_buff0_11_ce0 sc_out sc_logic 1 signal 12 } 
	{ ifm_buff0_11_we0 sc_out sc_logic 1 signal 12 } 
	{ ifm_buff0_11_d0 sc_out sc_lv 32 signal 12 } 
	{ ifm_buff0_12_address0 sc_out sc_lv 6 signal 13 } 
	{ ifm_buff0_12_ce0 sc_out sc_logic 1 signal 13 } 
	{ ifm_buff0_12_we0 sc_out sc_logic 1 signal 13 } 
	{ ifm_buff0_12_d0 sc_out sc_lv 32 signal 13 } 
	{ ifm_buff0_13_address0 sc_out sc_lv 6 signal 14 } 
	{ ifm_buff0_13_ce0 sc_out sc_logic 1 signal 14 } 
	{ ifm_buff0_13_we0 sc_out sc_logic 1 signal 14 } 
	{ ifm_buff0_13_d0 sc_out sc_lv 32 signal 14 } 
	{ ifm_buff0_14_address0 sc_out sc_lv 6 signal 15 } 
	{ ifm_buff0_14_ce0 sc_out sc_logic 1 signal 15 } 
	{ ifm_buff0_14_we0 sc_out sc_logic 1 signal 15 } 
	{ ifm_buff0_14_d0 sc_out sc_lv 32 signal 15 } 
	{ ifm_buff0_15_address0 sc_out sc_lv 6 signal 16 } 
	{ ifm_buff0_15_ce0 sc_out sc_logic 1 signal 16 } 
	{ ifm_buff0_15_we0 sc_out sc_logic 1 signal 16 } 
	{ ifm_buff0_15_d0 sc_out sc_lv 32 signal 16 } 
	{ cifm_counter_read sc_in sc_lv 32 signal 17 } 
	{ enable sc_in sc_logic 1 signal 18 } 
	{ ap_return sc_out sc_lv 32 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "cifm_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "cifm", "role": "TDATA" }} , 
 	{ "name": "cifm_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "cifm", "role": "TVALID" }} , 
 	{ "name": "cifm_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "cifm", "role": "TREADY" }} , 
 	{ "name": "ifm_buff0_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff0_0", "role": "address0" }} , 
 	{ "name": "ifm_buff0_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff0_0", "role": "ce0" }} , 
 	{ "name": "ifm_buff0_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff0_0", "role": "we0" }} , 
 	{ "name": "ifm_buff0_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff0_0", "role": "d0" }} , 
 	{ "name": "ifm_buff0_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff0_1", "role": "address0" }} , 
 	{ "name": "ifm_buff0_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff0_1", "role": "ce0" }} , 
 	{ "name": "ifm_buff0_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff0_1", "role": "we0" }} , 
 	{ "name": "ifm_buff0_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff0_1", "role": "d0" }} , 
 	{ "name": "ifm_buff0_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff0_2", "role": "address0" }} , 
 	{ "name": "ifm_buff0_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff0_2", "role": "ce0" }} , 
 	{ "name": "ifm_buff0_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff0_2", "role": "we0" }} , 
 	{ "name": "ifm_buff0_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff0_2", "role": "d0" }} , 
 	{ "name": "ifm_buff0_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff0_3", "role": "address0" }} , 
 	{ "name": "ifm_buff0_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff0_3", "role": "ce0" }} , 
 	{ "name": "ifm_buff0_3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff0_3", "role": "we0" }} , 
 	{ "name": "ifm_buff0_3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff0_3", "role": "d0" }} , 
 	{ "name": "ifm_buff0_4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff0_4", "role": "address0" }} , 
 	{ "name": "ifm_buff0_4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff0_4", "role": "ce0" }} , 
 	{ "name": "ifm_buff0_4_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff0_4", "role": "we0" }} , 
 	{ "name": "ifm_buff0_4_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff0_4", "role": "d0" }} , 
 	{ "name": "ifm_buff0_5_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff0_5", "role": "address0" }} , 
 	{ "name": "ifm_buff0_5_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff0_5", "role": "ce0" }} , 
 	{ "name": "ifm_buff0_5_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff0_5", "role": "we0" }} , 
 	{ "name": "ifm_buff0_5_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff0_5", "role": "d0" }} , 
 	{ "name": "ifm_buff0_6_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff0_6", "role": "address0" }} , 
 	{ "name": "ifm_buff0_6_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff0_6", "role": "ce0" }} , 
 	{ "name": "ifm_buff0_6_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff0_6", "role": "we0" }} , 
 	{ "name": "ifm_buff0_6_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff0_6", "role": "d0" }} , 
 	{ "name": "ifm_buff0_7_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff0_7", "role": "address0" }} , 
 	{ "name": "ifm_buff0_7_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff0_7", "role": "ce0" }} , 
 	{ "name": "ifm_buff0_7_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff0_7", "role": "we0" }} , 
 	{ "name": "ifm_buff0_7_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff0_7", "role": "d0" }} , 
 	{ "name": "ifm_buff0_8_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff0_8", "role": "address0" }} , 
 	{ "name": "ifm_buff0_8_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff0_8", "role": "ce0" }} , 
 	{ "name": "ifm_buff0_8_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff0_8", "role": "we0" }} , 
 	{ "name": "ifm_buff0_8_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff0_8", "role": "d0" }} , 
 	{ "name": "ifm_buff0_9_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff0_9", "role": "address0" }} , 
 	{ "name": "ifm_buff0_9_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff0_9", "role": "ce0" }} , 
 	{ "name": "ifm_buff0_9_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff0_9", "role": "we0" }} , 
 	{ "name": "ifm_buff0_9_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff0_9", "role": "d0" }} , 
 	{ "name": "ifm_buff0_10_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff0_10", "role": "address0" }} , 
 	{ "name": "ifm_buff0_10_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff0_10", "role": "ce0" }} , 
 	{ "name": "ifm_buff0_10_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff0_10", "role": "we0" }} , 
 	{ "name": "ifm_buff0_10_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff0_10", "role": "d0" }} , 
 	{ "name": "ifm_buff0_11_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff0_11", "role": "address0" }} , 
 	{ "name": "ifm_buff0_11_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff0_11", "role": "ce0" }} , 
 	{ "name": "ifm_buff0_11_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff0_11", "role": "we0" }} , 
 	{ "name": "ifm_buff0_11_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff0_11", "role": "d0" }} , 
 	{ "name": "ifm_buff0_12_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff0_12", "role": "address0" }} , 
 	{ "name": "ifm_buff0_12_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff0_12", "role": "ce0" }} , 
 	{ "name": "ifm_buff0_12_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff0_12", "role": "we0" }} , 
 	{ "name": "ifm_buff0_12_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff0_12", "role": "d0" }} , 
 	{ "name": "ifm_buff0_13_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff0_13", "role": "address0" }} , 
 	{ "name": "ifm_buff0_13_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff0_13", "role": "ce0" }} , 
 	{ "name": "ifm_buff0_13_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff0_13", "role": "we0" }} , 
 	{ "name": "ifm_buff0_13_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff0_13", "role": "d0" }} , 
 	{ "name": "ifm_buff0_14_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff0_14", "role": "address0" }} , 
 	{ "name": "ifm_buff0_14_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff0_14", "role": "ce0" }} , 
 	{ "name": "ifm_buff0_14_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff0_14", "role": "we0" }} , 
 	{ "name": "ifm_buff0_14_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff0_14", "role": "d0" }} , 
 	{ "name": "ifm_buff0_15_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff0_15", "role": "address0" }} , 
 	{ "name": "ifm_buff0_15_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff0_15", "role": "ce0" }} , 
 	{ "name": "ifm_buff0_15_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff0_15", "role": "we0" }} , 
 	{ "name": "ifm_buff0_15_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff0_15", "role": "d0" }} , 
 	{ "name": "cifm_counter_read", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "cifm_counter_read", "role": "default" }} , 
 	{ "name": "enable", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "enable", "role": "default" }} , 
 	{ "name": "ap_return", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ap_return", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "write_row_ifm",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1", "EstimateLatencyMax" : "60",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "cifm", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "cifm_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "ifm_buff0_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ifm_buff0_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ifm_buff0_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ifm_buff0_3", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ifm_buff0_4", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ifm_buff0_5", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ifm_buff0_6", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ifm_buff0_7", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ifm_buff0_8", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ifm_buff0_9", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ifm_buff0_10", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ifm_buff0_11", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ifm_buff0_12", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ifm_buff0_13", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ifm_buff0_14", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ifm_buff0_15", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "cifm_counter_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "enable", "Type" : "None", "Direction" : "I"}]}]}


set ArgLastReadFirstWriteLatency {
	write_row_ifm {
		cifm {Type I LastRead 1 FirstWrite -1}
		ifm_buff0_0 {Type O LastRead -1 FirstWrite 1}
		ifm_buff0_1 {Type O LastRead -1 FirstWrite 1}
		ifm_buff0_2 {Type O LastRead -1 FirstWrite 1}
		ifm_buff0_3 {Type O LastRead -1 FirstWrite 1}
		ifm_buff0_4 {Type O LastRead -1 FirstWrite 1}
		ifm_buff0_5 {Type O LastRead -1 FirstWrite 1}
		ifm_buff0_6 {Type O LastRead -1 FirstWrite 1}
		ifm_buff0_7 {Type O LastRead -1 FirstWrite 1}
		ifm_buff0_8 {Type O LastRead -1 FirstWrite 1}
		ifm_buff0_9 {Type O LastRead -1 FirstWrite 1}
		ifm_buff0_10 {Type O LastRead -1 FirstWrite 1}
		ifm_buff0_11 {Type O LastRead -1 FirstWrite 1}
		ifm_buff0_12 {Type O LastRead -1 FirstWrite 1}
		ifm_buff0_13 {Type O LastRead -1 FirstWrite 1}
		ifm_buff0_14 {Type O LastRead -1 FirstWrite 1}
		ifm_buff0_15 {Type O LastRead -1 FirstWrite 1}
		cifm_counter_read {Type I LastRead 0 FirstWrite -1}
		enable {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "60"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "60"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	cifm { axis {  { cifm_TDATA in_data 0 512 }  { cifm_TVALID in_vld 0 1 }  { cifm_TREADY in_acc 1 1 } } }
	ifm_buff0_0 { ap_memory {  { ifm_buff0_0_address0 mem_address 1 6 }  { ifm_buff0_0_ce0 mem_ce 1 1 }  { ifm_buff0_0_we0 mem_we 1 1 }  { ifm_buff0_0_d0 mem_din 1 32 } } }
	ifm_buff0_1 { ap_memory {  { ifm_buff0_1_address0 mem_address 1 6 }  { ifm_buff0_1_ce0 mem_ce 1 1 }  { ifm_buff0_1_we0 mem_we 1 1 }  { ifm_buff0_1_d0 mem_din 1 32 } } }
	ifm_buff0_2 { ap_memory {  { ifm_buff0_2_address0 mem_address 1 6 }  { ifm_buff0_2_ce0 mem_ce 1 1 }  { ifm_buff0_2_we0 mem_we 1 1 }  { ifm_buff0_2_d0 mem_din 1 32 } } }
	ifm_buff0_3 { ap_memory {  { ifm_buff0_3_address0 mem_address 1 6 }  { ifm_buff0_3_ce0 mem_ce 1 1 }  { ifm_buff0_3_we0 mem_we 1 1 }  { ifm_buff0_3_d0 mem_din 1 32 } } }
	ifm_buff0_4 { ap_memory {  { ifm_buff0_4_address0 mem_address 1 6 }  { ifm_buff0_4_ce0 mem_ce 1 1 }  { ifm_buff0_4_we0 mem_we 1 1 }  { ifm_buff0_4_d0 mem_din 1 32 } } }
	ifm_buff0_5 { ap_memory {  { ifm_buff0_5_address0 mem_address 1 6 }  { ifm_buff0_5_ce0 mem_ce 1 1 }  { ifm_buff0_5_we0 mem_we 1 1 }  { ifm_buff0_5_d0 mem_din 1 32 } } }
	ifm_buff0_6 { ap_memory {  { ifm_buff0_6_address0 mem_address 1 6 }  { ifm_buff0_6_ce0 mem_ce 1 1 }  { ifm_buff0_6_we0 mem_we 1 1 }  { ifm_buff0_6_d0 mem_din 1 32 } } }
	ifm_buff0_7 { ap_memory {  { ifm_buff0_7_address0 mem_address 1 6 }  { ifm_buff0_7_ce0 mem_ce 1 1 }  { ifm_buff0_7_we0 mem_we 1 1 }  { ifm_buff0_7_d0 mem_din 1 32 } } }
	ifm_buff0_8 { ap_memory {  { ifm_buff0_8_address0 mem_address 1 6 }  { ifm_buff0_8_ce0 mem_ce 1 1 }  { ifm_buff0_8_we0 mem_we 1 1 }  { ifm_buff0_8_d0 mem_din 1 32 } } }
	ifm_buff0_9 { ap_memory {  { ifm_buff0_9_address0 mem_address 1 6 }  { ifm_buff0_9_ce0 mem_ce 1 1 }  { ifm_buff0_9_we0 mem_we 1 1 }  { ifm_buff0_9_d0 mem_din 1 32 } } }
	ifm_buff0_10 { ap_memory {  { ifm_buff0_10_address0 mem_address 1 6 }  { ifm_buff0_10_ce0 mem_ce 1 1 }  { ifm_buff0_10_we0 mem_we 1 1 }  { ifm_buff0_10_d0 mem_din 1 32 } } }
	ifm_buff0_11 { ap_memory {  { ifm_buff0_11_address0 mem_address 1 6 }  { ifm_buff0_11_ce0 mem_ce 1 1 }  { ifm_buff0_11_we0 mem_we 1 1 }  { ifm_buff0_11_d0 mem_din 1 32 } } }
	ifm_buff0_12 { ap_memory {  { ifm_buff0_12_address0 mem_address 1 6 }  { ifm_buff0_12_ce0 mem_ce 1 1 }  { ifm_buff0_12_we0 mem_we 1 1 }  { ifm_buff0_12_d0 mem_din 1 32 } } }
	ifm_buff0_13 { ap_memory {  { ifm_buff0_13_address0 mem_address 1 6 }  { ifm_buff0_13_ce0 mem_ce 1 1 }  { ifm_buff0_13_we0 mem_we 1 1 }  { ifm_buff0_13_d0 mem_din 1 32 } } }
	ifm_buff0_14 { ap_memory {  { ifm_buff0_14_address0 mem_address 1 6 }  { ifm_buff0_14_ce0 mem_ce 1 1 }  { ifm_buff0_14_we0 mem_we 1 1 }  { ifm_buff0_14_d0 mem_din 1 32 } } }
	ifm_buff0_15 { ap_memory {  { ifm_buff0_15_address0 mem_address 1 6 }  { ifm_buff0_15_ce0 mem_ce 1 1 }  { ifm_buff0_15_we0 mem_we 1 1 }  { ifm_buff0_15_d0 mem_din 1 32 } } }
	cifm_counter_read { ap_none {  { cifm_counter_read in_data 0 32 } } }
	enable { ap_none {  { enable in_data 0 1 } } }
}
