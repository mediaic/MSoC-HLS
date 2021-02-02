set moduleName load_filter_buffer
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
set C_modelName {load_filter_buffer}
set C_modelType { void 0 }
set C_modelArgList {
	{ wgt int 512 regular {axi_s 0 volatile  { wgt Data } }  }
	{ filter_buff_0_0_0 float 32 regular {array 6 { 0 3 } 0 1 }  }
	{ filter_buff_0_0_1 float 32 regular {array 6 { 0 3 } 0 1 }  }
	{ filter_buff_0_0_2 float 32 regular {array 6 { 0 3 } 0 1 }  }
	{ filter_buff_0_1_0 float 32 regular {array 6 { 0 3 } 0 1 }  }
	{ filter_buff_0_1_1 float 32 regular {array 6 { 0 3 } 0 1 }  }
	{ filter_buff_0_1_2 float 32 regular {array 6 { 0 3 } 0 1 }  }
	{ filter_buff_0_2_0 float 32 regular {array 6 { 0 3 } 0 1 }  }
	{ filter_buff_0_2_1 float 32 regular {array 6 { 0 3 } 0 1 }  }
	{ filter_buff_0_2_2 float 32 regular {array 6 { 0 3 } 0 1 }  }
	{ filter_buff_1_0_0 float 32 regular {array 6 { 0 3 } 0 1 }  }
	{ filter_buff_1_0_1 float 32 regular {array 6 { 0 3 } 0 1 }  }
	{ filter_buff_1_0_2 float 32 regular {array 6 { 0 3 } 0 1 }  }
	{ filter_buff_1_1_0 float 32 regular {array 6 { 0 3 } 0 1 }  }
	{ filter_buff_1_1_1 float 32 regular {array 6 { 0 3 } 0 1 }  }
	{ filter_buff_1_1_2 float 32 regular {array 6 { 0 3 } 0 1 }  }
	{ filter_buff_1_2_0 float 32 regular {array 6 { 0 3 } 0 1 }  }
	{ filter_buff_1_2_1 float 32 regular {array 6 { 0 3 } 0 1 }  }
	{ filter_buff_1_2_2 float 32 regular {array 6 { 0 3 } 0 1 }  }
	{ filter_buff_2_0_0 float 32 regular {array 6 { 0 3 } 0 1 }  }
	{ filter_buff_2_0_1 float 32 regular {array 6 { 0 3 } 0 1 }  }
	{ filter_buff_2_0_2 float 32 regular {array 6 { 0 3 } 0 1 }  }
	{ filter_buff_2_1_0 float 32 regular {array 6 { 0 3 } 0 1 }  }
	{ filter_buff_2_1_1 float 32 regular {array 6 { 0 3 } 0 1 }  }
	{ filter_buff_2_1_2 float 32 regular {array 6 { 0 3 } 0 1 }  }
	{ filter_buff_2_2_0 float 32 regular {array 6 { 0 3 } 0 1 }  }
	{ filter_buff_2_2_1 float 32 regular {array 6 { 0 3 } 0 1 }  }
	{ filter_buff_2_2_2 float 32 regular {array 6 { 0 3 } 0 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "wgt", "interface" : "axis", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "filter_buff_0_0_0", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_0_0_1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_0_0_2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_0_1_0", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_0_1_1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_0_1_2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_0_2_0", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_0_2_1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_0_2_2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_1_0_0", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_1_0_1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_1_0_2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_1_1_0", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_1_1_1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_1_1_2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_1_2_0", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_1_2_1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_1_2_2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_2_0_0", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_2_0_1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_2_0_2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_2_1_0", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_2_1_1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_2_1_2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_2_2_0", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_2_2_1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_2_2_2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 117
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ wgt_TDATA sc_in sc_lv 512 signal 0 } 
	{ wgt_TVALID sc_in sc_logic 1 invld 0 } 
	{ wgt_TREADY sc_out sc_logic 1 inacc 0 } 
	{ filter_buff_0_0_0_address0 sc_out sc_lv 3 signal 1 } 
	{ filter_buff_0_0_0_ce0 sc_out sc_logic 1 signal 1 } 
	{ filter_buff_0_0_0_we0 sc_out sc_logic 1 signal 1 } 
	{ filter_buff_0_0_0_d0 sc_out sc_lv 32 signal 1 } 
	{ filter_buff_0_0_1_address0 sc_out sc_lv 3 signal 2 } 
	{ filter_buff_0_0_1_ce0 sc_out sc_logic 1 signal 2 } 
	{ filter_buff_0_0_1_we0 sc_out sc_logic 1 signal 2 } 
	{ filter_buff_0_0_1_d0 sc_out sc_lv 32 signal 2 } 
	{ filter_buff_0_0_2_address0 sc_out sc_lv 3 signal 3 } 
	{ filter_buff_0_0_2_ce0 sc_out sc_logic 1 signal 3 } 
	{ filter_buff_0_0_2_we0 sc_out sc_logic 1 signal 3 } 
	{ filter_buff_0_0_2_d0 sc_out sc_lv 32 signal 3 } 
	{ filter_buff_0_1_0_address0 sc_out sc_lv 3 signal 4 } 
	{ filter_buff_0_1_0_ce0 sc_out sc_logic 1 signal 4 } 
	{ filter_buff_0_1_0_we0 sc_out sc_logic 1 signal 4 } 
	{ filter_buff_0_1_0_d0 sc_out sc_lv 32 signal 4 } 
	{ filter_buff_0_1_1_address0 sc_out sc_lv 3 signal 5 } 
	{ filter_buff_0_1_1_ce0 sc_out sc_logic 1 signal 5 } 
	{ filter_buff_0_1_1_we0 sc_out sc_logic 1 signal 5 } 
	{ filter_buff_0_1_1_d0 sc_out sc_lv 32 signal 5 } 
	{ filter_buff_0_1_2_address0 sc_out sc_lv 3 signal 6 } 
	{ filter_buff_0_1_2_ce0 sc_out sc_logic 1 signal 6 } 
	{ filter_buff_0_1_2_we0 sc_out sc_logic 1 signal 6 } 
	{ filter_buff_0_1_2_d0 sc_out sc_lv 32 signal 6 } 
	{ filter_buff_0_2_0_address0 sc_out sc_lv 3 signal 7 } 
	{ filter_buff_0_2_0_ce0 sc_out sc_logic 1 signal 7 } 
	{ filter_buff_0_2_0_we0 sc_out sc_logic 1 signal 7 } 
	{ filter_buff_0_2_0_d0 sc_out sc_lv 32 signal 7 } 
	{ filter_buff_0_2_1_address0 sc_out sc_lv 3 signal 8 } 
	{ filter_buff_0_2_1_ce0 sc_out sc_logic 1 signal 8 } 
	{ filter_buff_0_2_1_we0 sc_out sc_logic 1 signal 8 } 
	{ filter_buff_0_2_1_d0 sc_out sc_lv 32 signal 8 } 
	{ filter_buff_0_2_2_address0 sc_out sc_lv 3 signal 9 } 
	{ filter_buff_0_2_2_ce0 sc_out sc_logic 1 signal 9 } 
	{ filter_buff_0_2_2_we0 sc_out sc_logic 1 signal 9 } 
	{ filter_buff_0_2_2_d0 sc_out sc_lv 32 signal 9 } 
	{ filter_buff_1_0_0_address0 sc_out sc_lv 3 signal 10 } 
	{ filter_buff_1_0_0_ce0 sc_out sc_logic 1 signal 10 } 
	{ filter_buff_1_0_0_we0 sc_out sc_logic 1 signal 10 } 
	{ filter_buff_1_0_0_d0 sc_out sc_lv 32 signal 10 } 
	{ filter_buff_1_0_1_address0 sc_out sc_lv 3 signal 11 } 
	{ filter_buff_1_0_1_ce0 sc_out sc_logic 1 signal 11 } 
	{ filter_buff_1_0_1_we0 sc_out sc_logic 1 signal 11 } 
	{ filter_buff_1_0_1_d0 sc_out sc_lv 32 signal 11 } 
	{ filter_buff_1_0_2_address0 sc_out sc_lv 3 signal 12 } 
	{ filter_buff_1_0_2_ce0 sc_out sc_logic 1 signal 12 } 
	{ filter_buff_1_0_2_we0 sc_out sc_logic 1 signal 12 } 
	{ filter_buff_1_0_2_d0 sc_out sc_lv 32 signal 12 } 
	{ filter_buff_1_1_0_address0 sc_out sc_lv 3 signal 13 } 
	{ filter_buff_1_1_0_ce0 sc_out sc_logic 1 signal 13 } 
	{ filter_buff_1_1_0_we0 sc_out sc_logic 1 signal 13 } 
	{ filter_buff_1_1_0_d0 sc_out sc_lv 32 signal 13 } 
	{ filter_buff_1_1_1_address0 sc_out sc_lv 3 signal 14 } 
	{ filter_buff_1_1_1_ce0 sc_out sc_logic 1 signal 14 } 
	{ filter_buff_1_1_1_we0 sc_out sc_logic 1 signal 14 } 
	{ filter_buff_1_1_1_d0 sc_out sc_lv 32 signal 14 } 
	{ filter_buff_1_1_2_address0 sc_out sc_lv 3 signal 15 } 
	{ filter_buff_1_1_2_ce0 sc_out sc_logic 1 signal 15 } 
	{ filter_buff_1_1_2_we0 sc_out sc_logic 1 signal 15 } 
	{ filter_buff_1_1_2_d0 sc_out sc_lv 32 signal 15 } 
	{ filter_buff_1_2_0_address0 sc_out sc_lv 3 signal 16 } 
	{ filter_buff_1_2_0_ce0 sc_out sc_logic 1 signal 16 } 
	{ filter_buff_1_2_0_we0 sc_out sc_logic 1 signal 16 } 
	{ filter_buff_1_2_0_d0 sc_out sc_lv 32 signal 16 } 
	{ filter_buff_1_2_1_address0 sc_out sc_lv 3 signal 17 } 
	{ filter_buff_1_2_1_ce0 sc_out sc_logic 1 signal 17 } 
	{ filter_buff_1_2_1_we0 sc_out sc_logic 1 signal 17 } 
	{ filter_buff_1_2_1_d0 sc_out sc_lv 32 signal 17 } 
	{ filter_buff_1_2_2_address0 sc_out sc_lv 3 signal 18 } 
	{ filter_buff_1_2_2_ce0 sc_out sc_logic 1 signal 18 } 
	{ filter_buff_1_2_2_we0 sc_out sc_logic 1 signal 18 } 
	{ filter_buff_1_2_2_d0 sc_out sc_lv 32 signal 18 } 
	{ filter_buff_2_0_0_address0 sc_out sc_lv 3 signal 19 } 
	{ filter_buff_2_0_0_ce0 sc_out sc_logic 1 signal 19 } 
	{ filter_buff_2_0_0_we0 sc_out sc_logic 1 signal 19 } 
	{ filter_buff_2_0_0_d0 sc_out sc_lv 32 signal 19 } 
	{ filter_buff_2_0_1_address0 sc_out sc_lv 3 signal 20 } 
	{ filter_buff_2_0_1_ce0 sc_out sc_logic 1 signal 20 } 
	{ filter_buff_2_0_1_we0 sc_out sc_logic 1 signal 20 } 
	{ filter_buff_2_0_1_d0 sc_out sc_lv 32 signal 20 } 
	{ filter_buff_2_0_2_address0 sc_out sc_lv 3 signal 21 } 
	{ filter_buff_2_0_2_ce0 sc_out sc_logic 1 signal 21 } 
	{ filter_buff_2_0_2_we0 sc_out sc_logic 1 signal 21 } 
	{ filter_buff_2_0_2_d0 sc_out sc_lv 32 signal 21 } 
	{ filter_buff_2_1_0_address0 sc_out sc_lv 3 signal 22 } 
	{ filter_buff_2_1_0_ce0 sc_out sc_logic 1 signal 22 } 
	{ filter_buff_2_1_0_we0 sc_out sc_logic 1 signal 22 } 
	{ filter_buff_2_1_0_d0 sc_out sc_lv 32 signal 22 } 
	{ filter_buff_2_1_1_address0 sc_out sc_lv 3 signal 23 } 
	{ filter_buff_2_1_1_ce0 sc_out sc_logic 1 signal 23 } 
	{ filter_buff_2_1_1_we0 sc_out sc_logic 1 signal 23 } 
	{ filter_buff_2_1_1_d0 sc_out sc_lv 32 signal 23 } 
	{ filter_buff_2_1_2_address0 sc_out sc_lv 3 signal 24 } 
	{ filter_buff_2_1_2_ce0 sc_out sc_logic 1 signal 24 } 
	{ filter_buff_2_1_2_we0 sc_out sc_logic 1 signal 24 } 
	{ filter_buff_2_1_2_d0 sc_out sc_lv 32 signal 24 } 
	{ filter_buff_2_2_0_address0 sc_out sc_lv 3 signal 25 } 
	{ filter_buff_2_2_0_ce0 sc_out sc_logic 1 signal 25 } 
	{ filter_buff_2_2_0_we0 sc_out sc_logic 1 signal 25 } 
	{ filter_buff_2_2_0_d0 sc_out sc_lv 32 signal 25 } 
	{ filter_buff_2_2_1_address0 sc_out sc_lv 3 signal 26 } 
	{ filter_buff_2_2_1_ce0 sc_out sc_logic 1 signal 26 } 
	{ filter_buff_2_2_1_we0 sc_out sc_logic 1 signal 26 } 
	{ filter_buff_2_2_1_d0 sc_out sc_lv 32 signal 26 } 
	{ filter_buff_2_2_2_address0 sc_out sc_lv 3 signal 27 } 
	{ filter_buff_2_2_2_ce0 sc_out sc_logic 1 signal 27 } 
	{ filter_buff_2_2_2_we0 sc_out sc_logic 1 signal 27 } 
	{ filter_buff_2_2_2_d0 sc_out sc_lv 32 signal 27 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "wgt_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "wgt", "role": "TDATA" }} , 
 	{ "name": "wgt_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "wgt", "role": "TVALID" }} , 
 	{ "name": "wgt_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "wgt", "role": "TREADY" }} , 
 	{ "name": "filter_buff_0_0_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "filter_buff_0_0_0", "role": "address0" }} , 
 	{ "name": "filter_buff_0_0_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_0_0_0", "role": "ce0" }} , 
 	{ "name": "filter_buff_0_0_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_0_0_0", "role": "we0" }} , 
 	{ "name": "filter_buff_0_0_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_0_0_0", "role": "d0" }} , 
 	{ "name": "filter_buff_0_0_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "filter_buff_0_0_1", "role": "address0" }} , 
 	{ "name": "filter_buff_0_0_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_0_0_1", "role": "ce0" }} , 
 	{ "name": "filter_buff_0_0_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_0_0_1", "role": "we0" }} , 
 	{ "name": "filter_buff_0_0_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_0_0_1", "role": "d0" }} , 
 	{ "name": "filter_buff_0_0_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "filter_buff_0_0_2", "role": "address0" }} , 
 	{ "name": "filter_buff_0_0_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_0_0_2", "role": "ce0" }} , 
 	{ "name": "filter_buff_0_0_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_0_0_2", "role": "we0" }} , 
 	{ "name": "filter_buff_0_0_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_0_0_2", "role": "d0" }} , 
 	{ "name": "filter_buff_0_1_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "filter_buff_0_1_0", "role": "address0" }} , 
 	{ "name": "filter_buff_0_1_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_0_1_0", "role": "ce0" }} , 
 	{ "name": "filter_buff_0_1_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_0_1_0", "role": "we0" }} , 
 	{ "name": "filter_buff_0_1_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_0_1_0", "role": "d0" }} , 
 	{ "name": "filter_buff_0_1_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "filter_buff_0_1_1", "role": "address0" }} , 
 	{ "name": "filter_buff_0_1_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_0_1_1", "role": "ce0" }} , 
 	{ "name": "filter_buff_0_1_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_0_1_1", "role": "we0" }} , 
 	{ "name": "filter_buff_0_1_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_0_1_1", "role": "d0" }} , 
 	{ "name": "filter_buff_0_1_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "filter_buff_0_1_2", "role": "address0" }} , 
 	{ "name": "filter_buff_0_1_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_0_1_2", "role": "ce0" }} , 
 	{ "name": "filter_buff_0_1_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_0_1_2", "role": "we0" }} , 
 	{ "name": "filter_buff_0_1_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_0_1_2", "role": "d0" }} , 
 	{ "name": "filter_buff_0_2_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "filter_buff_0_2_0", "role": "address0" }} , 
 	{ "name": "filter_buff_0_2_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_0_2_0", "role": "ce0" }} , 
 	{ "name": "filter_buff_0_2_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_0_2_0", "role": "we0" }} , 
 	{ "name": "filter_buff_0_2_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_0_2_0", "role": "d0" }} , 
 	{ "name": "filter_buff_0_2_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "filter_buff_0_2_1", "role": "address0" }} , 
 	{ "name": "filter_buff_0_2_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_0_2_1", "role": "ce0" }} , 
 	{ "name": "filter_buff_0_2_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_0_2_1", "role": "we0" }} , 
 	{ "name": "filter_buff_0_2_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_0_2_1", "role": "d0" }} , 
 	{ "name": "filter_buff_0_2_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "filter_buff_0_2_2", "role": "address0" }} , 
 	{ "name": "filter_buff_0_2_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_0_2_2", "role": "ce0" }} , 
 	{ "name": "filter_buff_0_2_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_0_2_2", "role": "we0" }} , 
 	{ "name": "filter_buff_0_2_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_0_2_2", "role": "d0" }} , 
 	{ "name": "filter_buff_1_0_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "filter_buff_1_0_0", "role": "address0" }} , 
 	{ "name": "filter_buff_1_0_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_1_0_0", "role": "ce0" }} , 
 	{ "name": "filter_buff_1_0_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_1_0_0", "role": "we0" }} , 
 	{ "name": "filter_buff_1_0_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_1_0_0", "role": "d0" }} , 
 	{ "name": "filter_buff_1_0_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "filter_buff_1_0_1", "role": "address0" }} , 
 	{ "name": "filter_buff_1_0_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_1_0_1", "role": "ce0" }} , 
 	{ "name": "filter_buff_1_0_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_1_0_1", "role": "we0" }} , 
 	{ "name": "filter_buff_1_0_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_1_0_1", "role": "d0" }} , 
 	{ "name": "filter_buff_1_0_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "filter_buff_1_0_2", "role": "address0" }} , 
 	{ "name": "filter_buff_1_0_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_1_0_2", "role": "ce0" }} , 
 	{ "name": "filter_buff_1_0_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_1_0_2", "role": "we0" }} , 
 	{ "name": "filter_buff_1_0_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_1_0_2", "role": "d0" }} , 
 	{ "name": "filter_buff_1_1_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "filter_buff_1_1_0", "role": "address0" }} , 
 	{ "name": "filter_buff_1_1_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_1_1_0", "role": "ce0" }} , 
 	{ "name": "filter_buff_1_1_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_1_1_0", "role": "we0" }} , 
 	{ "name": "filter_buff_1_1_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_1_1_0", "role": "d0" }} , 
 	{ "name": "filter_buff_1_1_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "filter_buff_1_1_1", "role": "address0" }} , 
 	{ "name": "filter_buff_1_1_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_1_1_1", "role": "ce0" }} , 
 	{ "name": "filter_buff_1_1_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_1_1_1", "role": "we0" }} , 
 	{ "name": "filter_buff_1_1_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_1_1_1", "role": "d0" }} , 
 	{ "name": "filter_buff_1_1_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "filter_buff_1_1_2", "role": "address0" }} , 
 	{ "name": "filter_buff_1_1_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_1_1_2", "role": "ce0" }} , 
 	{ "name": "filter_buff_1_1_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_1_1_2", "role": "we0" }} , 
 	{ "name": "filter_buff_1_1_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_1_1_2", "role": "d0" }} , 
 	{ "name": "filter_buff_1_2_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "filter_buff_1_2_0", "role": "address0" }} , 
 	{ "name": "filter_buff_1_2_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_1_2_0", "role": "ce0" }} , 
 	{ "name": "filter_buff_1_2_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_1_2_0", "role": "we0" }} , 
 	{ "name": "filter_buff_1_2_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_1_2_0", "role": "d0" }} , 
 	{ "name": "filter_buff_1_2_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "filter_buff_1_2_1", "role": "address0" }} , 
 	{ "name": "filter_buff_1_2_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_1_2_1", "role": "ce0" }} , 
 	{ "name": "filter_buff_1_2_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_1_2_1", "role": "we0" }} , 
 	{ "name": "filter_buff_1_2_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_1_2_1", "role": "d0" }} , 
 	{ "name": "filter_buff_1_2_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "filter_buff_1_2_2", "role": "address0" }} , 
 	{ "name": "filter_buff_1_2_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_1_2_2", "role": "ce0" }} , 
 	{ "name": "filter_buff_1_2_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_1_2_2", "role": "we0" }} , 
 	{ "name": "filter_buff_1_2_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_1_2_2", "role": "d0" }} , 
 	{ "name": "filter_buff_2_0_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "filter_buff_2_0_0", "role": "address0" }} , 
 	{ "name": "filter_buff_2_0_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_2_0_0", "role": "ce0" }} , 
 	{ "name": "filter_buff_2_0_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_2_0_0", "role": "we0" }} , 
 	{ "name": "filter_buff_2_0_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_2_0_0", "role": "d0" }} , 
 	{ "name": "filter_buff_2_0_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "filter_buff_2_0_1", "role": "address0" }} , 
 	{ "name": "filter_buff_2_0_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_2_0_1", "role": "ce0" }} , 
 	{ "name": "filter_buff_2_0_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_2_0_1", "role": "we0" }} , 
 	{ "name": "filter_buff_2_0_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_2_0_1", "role": "d0" }} , 
 	{ "name": "filter_buff_2_0_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "filter_buff_2_0_2", "role": "address0" }} , 
 	{ "name": "filter_buff_2_0_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_2_0_2", "role": "ce0" }} , 
 	{ "name": "filter_buff_2_0_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_2_0_2", "role": "we0" }} , 
 	{ "name": "filter_buff_2_0_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_2_0_2", "role": "d0" }} , 
 	{ "name": "filter_buff_2_1_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "filter_buff_2_1_0", "role": "address0" }} , 
 	{ "name": "filter_buff_2_1_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_2_1_0", "role": "ce0" }} , 
 	{ "name": "filter_buff_2_1_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_2_1_0", "role": "we0" }} , 
 	{ "name": "filter_buff_2_1_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_2_1_0", "role": "d0" }} , 
 	{ "name": "filter_buff_2_1_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "filter_buff_2_1_1", "role": "address0" }} , 
 	{ "name": "filter_buff_2_1_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_2_1_1", "role": "ce0" }} , 
 	{ "name": "filter_buff_2_1_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_2_1_1", "role": "we0" }} , 
 	{ "name": "filter_buff_2_1_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_2_1_1", "role": "d0" }} , 
 	{ "name": "filter_buff_2_1_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "filter_buff_2_1_2", "role": "address0" }} , 
 	{ "name": "filter_buff_2_1_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_2_1_2", "role": "ce0" }} , 
 	{ "name": "filter_buff_2_1_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_2_1_2", "role": "we0" }} , 
 	{ "name": "filter_buff_2_1_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_2_1_2", "role": "d0" }} , 
 	{ "name": "filter_buff_2_2_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "filter_buff_2_2_0", "role": "address0" }} , 
 	{ "name": "filter_buff_2_2_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_2_2_0", "role": "ce0" }} , 
 	{ "name": "filter_buff_2_2_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_2_2_0", "role": "we0" }} , 
 	{ "name": "filter_buff_2_2_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_2_2_0", "role": "d0" }} , 
 	{ "name": "filter_buff_2_2_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "filter_buff_2_2_1", "role": "address0" }} , 
 	{ "name": "filter_buff_2_2_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_2_2_1", "role": "ce0" }} , 
 	{ "name": "filter_buff_2_2_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_2_2_1", "role": "we0" }} , 
 	{ "name": "filter_buff_2_2_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_2_2_1", "role": "d0" }} , 
 	{ "name": "filter_buff_2_2_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "filter_buff_2_2_2", "role": "address0" }} , 
 	{ "name": "filter_buff_2_2_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_2_2_2", "role": "ce0" }} , 
 	{ "name": "filter_buff_2_2_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_2_2_2", "role": "we0" }} , 
 	{ "name": "filter_buff_2_2_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_2_2_2", "role": "d0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "load_filter_buffer",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "20", "EstimateLatencyMax" : "20",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "wgt", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "wgt_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "filter_buff_0_0_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_0_0_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_0_0_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_0_1_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_0_1_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_0_1_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_0_2_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_0_2_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_0_2_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_1_0_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_1_0_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_1_0_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_1_1_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_1_1_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_1_1_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_1_2_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_1_2_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_1_2_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_2_0_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_2_0_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_2_0_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_2_1_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_2_1_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_2_1_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_2_2_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_2_2_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_2_2_2", "Type" : "Memory", "Direction" : "O"}]}]}


set ArgLastReadFirstWriteLatency {
	load_filter_buffer {
		wgt {Type I LastRead 1 FirstWrite -1}
		filter_buff_0_0_0 {Type O LastRead -1 FirstWrite 1}
		filter_buff_0_0_1 {Type O LastRead -1 FirstWrite 1}
		filter_buff_0_0_2 {Type O LastRead -1 FirstWrite 1}
		filter_buff_0_1_0 {Type O LastRead -1 FirstWrite 1}
		filter_buff_0_1_1 {Type O LastRead -1 FirstWrite 1}
		filter_buff_0_1_2 {Type O LastRead -1 FirstWrite 1}
		filter_buff_0_2_0 {Type O LastRead -1 FirstWrite 1}
		filter_buff_0_2_1 {Type O LastRead -1 FirstWrite 1}
		filter_buff_0_2_2 {Type O LastRead -1 FirstWrite 1}
		filter_buff_1_0_0 {Type O LastRead -1 FirstWrite 1}
		filter_buff_1_0_1 {Type O LastRead -1 FirstWrite 1}
		filter_buff_1_0_2 {Type O LastRead -1 FirstWrite 1}
		filter_buff_1_1_0 {Type O LastRead -1 FirstWrite 1}
		filter_buff_1_1_1 {Type O LastRead -1 FirstWrite 1}
		filter_buff_1_1_2 {Type O LastRead -1 FirstWrite 1}
		filter_buff_1_2_0 {Type O LastRead -1 FirstWrite 1}
		filter_buff_1_2_1 {Type O LastRead -1 FirstWrite 1}
		filter_buff_1_2_2 {Type O LastRead -1 FirstWrite 1}
		filter_buff_2_0_0 {Type O LastRead -1 FirstWrite 1}
		filter_buff_2_0_1 {Type O LastRead -1 FirstWrite 1}
		filter_buff_2_0_2 {Type O LastRead -1 FirstWrite 1}
		filter_buff_2_1_0 {Type O LastRead -1 FirstWrite 1}
		filter_buff_2_1_1 {Type O LastRead -1 FirstWrite 1}
		filter_buff_2_1_2 {Type O LastRead -1 FirstWrite 1}
		filter_buff_2_2_0 {Type O LastRead -1 FirstWrite 1}
		filter_buff_2_2_1 {Type O LastRead -1 FirstWrite 1}
		filter_buff_2_2_2 {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "20", "Max" : "20"}
	, {"Name" : "Interval", "Min" : "20", "Max" : "20"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	wgt { axis {  { wgt_TDATA in_data 0 512 }  { wgt_TVALID in_vld 0 1 }  { wgt_TREADY in_acc 1 1 } } }
	filter_buff_0_0_0 { ap_memory {  { filter_buff_0_0_0_address0 mem_address 1 3 }  { filter_buff_0_0_0_ce0 mem_ce 1 1 }  { filter_buff_0_0_0_we0 mem_we 1 1 }  { filter_buff_0_0_0_d0 mem_din 1 32 } } }
	filter_buff_0_0_1 { ap_memory {  { filter_buff_0_0_1_address0 mem_address 1 3 }  { filter_buff_0_0_1_ce0 mem_ce 1 1 }  { filter_buff_0_0_1_we0 mem_we 1 1 }  { filter_buff_0_0_1_d0 mem_din 1 32 } } }
	filter_buff_0_0_2 { ap_memory {  { filter_buff_0_0_2_address0 mem_address 1 3 }  { filter_buff_0_0_2_ce0 mem_ce 1 1 }  { filter_buff_0_0_2_we0 mem_we 1 1 }  { filter_buff_0_0_2_d0 mem_din 1 32 } } }
	filter_buff_0_1_0 { ap_memory {  { filter_buff_0_1_0_address0 mem_address 1 3 }  { filter_buff_0_1_0_ce0 mem_ce 1 1 }  { filter_buff_0_1_0_we0 mem_we 1 1 }  { filter_buff_0_1_0_d0 mem_din 1 32 } } }
	filter_buff_0_1_1 { ap_memory {  { filter_buff_0_1_1_address0 mem_address 1 3 }  { filter_buff_0_1_1_ce0 mem_ce 1 1 }  { filter_buff_0_1_1_we0 mem_we 1 1 }  { filter_buff_0_1_1_d0 mem_din 1 32 } } }
	filter_buff_0_1_2 { ap_memory {  { filter_buff_0_1_2_address0 mem_address 1 3 }  { filter_buff_0_1_2_ce0 mem_ce 1 1 }  { filter_buff_0_1_2_we0 mem_we 1 1 }  { filter_buff_0_1_2_d0 mem_din 1 32 } } }
	filter_buff_0_2_0 { ap_memory {  { filter_buff_0_2_0_address0 mem_address 1 3 }  { filter_buff_0_2_0_ce0 mem_ce 1 1 }  { filter_buff_0_2_0_we0 mem_we 1 1 }  { filter_buff_0_2_0_d0 mem_din 1 32 } } }
	filter_buff_0_2_1 { ap_memory {  { filter_buff_0_2_1_address0 mem_address 1 3 }  { filter_buff_0_2_1_ce0 mem_ce 1 1 }  { filter_buff_0_2_1_we0 mem_we 1 1 }  { filter_buff_0_2_1_d0 mem_din 1 32 } } }
	filter_buff_0_2_2 { ap_memory {  { filter_buff_0_2_2_address0 mem_address 1 3 }  { filter_buff_0_2_2_ce0 mem_ce 1 1 }  { filter_buff_0_2_2_we0 mem_we 1 1 }  { filter_buff_0_2_2_d0 mem_din 1 32 } } }
	filter_buff_1_0_0 { ap_memory {  { filter_buff_1_0_0_address0 mem_address 1 3 }  { filter_buff_1_0_0_ce0 mem_ce 1 1 }  { filter_buff_1_0_0_we0 mem_we 1 1 }  { filter_buff_1_0_0_d0 mem_din 1 32 } } }
	filter_buff_1_0_1 { ap_memory {  { filter_buff_1_0_1_address0 mem_address 1 3 }  { filter_buff_1_0_1_ce0 mem_ce 1 1 }  { filter_buff_1_0_1_we0 mem_we 1 1 }  { filter_buff_1_0_1_d0 mem_din 1 32 } } }
	filter_buff_1_0_2 { ap_memory {  { filter_buff_1_0_2_address0 mem_address 1 3 }  { filter_buff_1_0_2_ce0 mem_ce 1 1 }  { filter_buff_1_0_2_we0 mem_we 1 1 }  { filter_buff_1_0_2_d0 mem_din 1 32 } } }
	filter_buff_1_1_0 { ap_memory {  { filter_buff_1_1_0_address0 mem_address 1 3 }  { filter_buff_1_1_0_ce0 mem_ce 1 1 }  { filter_buff_1_1_0_we0 mem_we 1 1 }  { filter_buff_1_1_0_d0 mem_din 1 32 } } }
	filter_buff_1_1_1 { ap_memory {  { filter_buff_1_1_1_address0 mem_address 1 3 }  { filter_buff_1_1_1_ce0 mem_ce 1 1 }  { filter_buff_1_1_1_we0 mem_we 1 1 }  { filter_buff_1_1_1_d0 mem_din 1 32 } } }
	filter_buff_1_1_2 { ap_memory {  { filter_buff_1_1_2_address0 mem_address 1 3 }  { filter_buff_1_1_2_ce0 mem_ce 1 1 }  { filter_buff_1_1_2_we0 mem_we 1 1 }  { filter_buff_1_1_2_d0 mem_din 1 32 } } }
	filter_buff_1_2_0 { ap_memory {  { filter_buff_1_2_0_address0 mem_address 1 3 }  { filter_buff_1_2_0_ce0 mem_ce 1 1 }  { filter_buff_1_2_0_we0 mem_we 1 1 }  { filter_buff_1_2_0_d0 mem_din 1 32 } } }
	filter_buff_1_2_1 { ap_memory {  { filter_buff_1_2_1_address0 mem_address 1 3 }  { filter_buff_1_2_1_ce0 mem_ce 1 1 }  { filter_buff_1_2_1_we0 mem_we 1 1 }  { filter_buff_1_2_1_d0 mem_din 1 32 } } }
	filter_buff_1_2_2 { ap_memory {  { filter_buff_1_2_2_address0 mem_address 1 3 }  { filter_buff_1_2_2_ce0 mem_ce 1 1 }  { filter_buff_1_2_2_we0 mem_we 1 1 }  { filter_buff_1_2_2_d0 mem_din 1 32 } } }
	filter_buff_2_0_0 { ap_memory {  { filter_buff_2_0_0_address0 mem_address 1 3 }  { filter_buff_2_0_0_ce0 mem_ce 1 1 }  { filter_buff_2_0_0_we0 mem_we 1 1 }  { filter_buff_2_0_0_d0 mem_din 1 32 } } }
	filter_buff_2_0_1 { ap_memory {  { filter_buff_2_0_1_address0 mem_address 1 3 }  { filter_buff_2_0_1_ce0 mem_ce 1 1 }  { filter_buff_2_0_1_we0 mem_we 1 1 }  { filter_buff_2_0_1_d0 mem_din 1 32 } } }
	filter_buff_2_0_2 { ap_memory {  { filter_buff_2_0_2_address0 mem_address 1 3 }  { filter_buff_2_0_2_ce0 mem_ce 1 1 }  { filter_buff_2_0_2_we0 mem_we 1 1 }  { filter_buff_2_0_2_d0 mem_din 1 32 } } }
	filter_buff_2_1_0 { ap_memory {  { filter_buff_2_1_0_address0 mem_address 1 3 }  { filter_buff_2_1_0_ce0 mem_ce 1 1 }  { filter_buff_2_1_0_we0 mem_we 1 1 }  { filter_buff_2_1_0_d0 mem_din 1 32 } } }
	filter_buff_2_1_1 { ap_memory {  { filter_buff_2_1_1_address0 mem_address 1 3 }  { filter_buff_2_1_1_ce0 mem_ce 1 1 }  { filter_buff_2_1_1_we0 mem_we 1 1 }  { filter_buff_2_1_1_d0 mem_din 1 32 } } }
	filter_buff_2_1_2 { ap_memory {  { filter_buff_2_1_2_address0 mem_address 1 3 }  { filter_buff_2_1_2_ce0 mem_ce 1 1 }  { filter_buff_2_1_2_we0 mem_we 1 1 }  { filter_buff_2_1_2_d0 mem_din 1 32 } } }
	filter_buff_2_2_0 { ap_memory {  { filter_buff_2_2_0_address0 mem_address 1 3 }  { filter_buff_2_2_0_ce0 mem_ce 1 1 }  { filter_buff_2_2_0_we0 mem_we 1 1 }  { filter_buff_2_2_0_d0 mem_din 1 32 } } }
	filter_buff_2_2_1 { ap_memory {  { filter_buff_2_2_1_address0 mem_address 1 3 }  { filter_buff_2_2_1_ce0 mem_ce 1 1 }  { filter_buff_2_2_1_we0 mem_we 1 1 }  { filter_buff_2_2_1_d0 mem_din 1 32 } } }
	filter_buff_2_2_2 { ap_memory {  { filter_buff_2_2_2_address0 mem_address 1 3 }  { filter_buff_2_2_2_ce0 mem_ce 1 1 }  { filter_buff_2_2_2_we0 mem_we 1 1 }  { filter_buff_2_2_2_d0 mem_din 1 32 } } }
}
