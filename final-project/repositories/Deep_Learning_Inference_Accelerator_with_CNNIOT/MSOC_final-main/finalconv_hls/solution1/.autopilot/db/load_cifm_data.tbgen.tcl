set moduleName load_cifm_data
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
set C_modelName {load_cifm_data}
set C_modelType { void 0 }
set C_modelArgList {
	{ cifm int 512 regular {axi_s 0 volatile  { cifm Data } }  }
	{ ifm_buff0_0 float 32 regular {array 34 { 0 3 } 0 1 }  }
	{ ifm_buff0_1 float 32 regular {array 34 { 0 3 } 0 1 }  }
	{ ifm_buff0_2 float 32 regular {array 34 { 0 3 } 0 1 }  }
	{ ifm_buff1_0 float 32 regular {array 34 { 0 3 } 0 1 }  }
	{ ifm_buff1_1 float 32 regular {array 34 { 0 3 } 0 1 }  }
	{ ifm_buff1_2 float 32 regular {array 34 { 0 3 } 0 1 }  }
	{ ifm_buff2_0 float 32 regular {array 34 { 0 3 } 0 1 }  }
	{ ifm_buff2_1 float 32 regular {array 34 { 0 3 } 0 1 }  }
	{ ifm_buff2_2 float 32 regular {array 34 { 0 3 } 0 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "cifm", "interface" : "axis", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "ifm_buff0_0", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "ifm_buff0_1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "ifm_buff0_2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "ifm_buff1_0", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "ifm_buff1_1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "ifm_buff1_2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "ifm_buff2_0", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "ifm_buff2_1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "ifm_buff2_2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 45
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
	{ ifm_buff1_0_address0 sc_out sc_lv 6 signal 4 } 
	{ ifm_buff1_0_ce0 sc_out sc_logic 1 signal 4 } 
	{ ifm_buff1_0_we0 sc_out sc_logic 1 signal 4 } 
	{ ifm_buff1_0_d0 sc_out sc_lv 32 signal 4 } 
	{ ifm_buff1_1_address0 sc_out sc_lv 6 signal 5 } 
	{ ifm_buff1_1_ce0 sc_out sc_logic 1 signal 5 } 
	{ ifm_buff1_1_we0 sc_out sc_logic 1 signal 5 } 
	{ ifm_buff1_1_d0 sc_out sc_lv 32 signal 5 } 
	{ ifm_buff1_2_address0 sc_out sc_lv 6 signal 6 } 
	{ ifm_buff1_2_ce0 sc_out sc_logic 1 signal 6 } 
	{ ifm_buff1_2_we0 sc_out sc_logic 1 signal 6 } 
	{ ifm_buff1_2_d0 sc_out sc_lv 32 signal 6 } 
	{ ifm_buff2_0_address0 sc_out sc_lv 6 signal 7 } 
	{ ifm_buff2_0_ce0 sc_out sc_logic 1 signal 7 } 
	{ ifm_buff2_0_we0 sc_out sc_logic 1 signal 7 } 
	{ ifm_buff2_0_d0 sc_out sc_lv 32 signal 7 } 
	{ ifm_buff2_1_address0 sc_out sc_lv 6 signal 8 } 
	{ ifm_buff2_1_ce0 sc_out sc_logic 1 signal 8 } 
	{ ifm_buff2_1_we0 sc_out sc_logic 1 signal 8 } 
	{ ifm_buff2_1_d0 sc_out sc_lv 32 signal 8 } 
	{ ifm_buff2_2_address0 sc_out sc_lv 6 signal 9 } 
	{ ifm_buff2_2_ce0 sc_out sc_logic 1 signal 9 } 
	{ ifm_buff2_2_we0 sc_out sc_logic 1 signal 9 } 
	{ ifm_buff2_2_d0 sc_out sc_lv 32 signal 9 } 
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
 	{ "name": "ifm_buff1_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff1_0", "role": "address0" }} , 
 	{ "name": "ifm_buff1_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff1_0", "role": "ce0" }} , 
 	{ "name": "ifm_buff1_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff1_0", "role": "we0" }} , 
 	{ "name": "ifm_buff1_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff1_0", "role": "d0" }} , 
 	{ "name": "ifm_buff1_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff1_1", "role": "address0" }} , 
 	{ "name": "ifm_buff1_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff1_1", "role": "ce0" }} , 
 	{ "name": "ifm_buff1_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff1_1", "role": "we0" }} , 
 	{ "name": "ifm_buff1_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff1_1", "role": "d0" }} , 
 	{ "name": "ifm_buff1_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff1_2", "role": "address0" }} , 
 	{ "name": "ifm_buff1_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff1_2", "role": "ce0" }} , 
 	{ "name": "ifm_buff1_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff1_2", "role": "we0" }} , 
 	{ "name": "ifm_buff1_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff1_2", "role": "d0" }} , 
 	{ "name": "ifm_buff2_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff2_0", "role": "address0" }} , 
 	{ "name": "ifm_buff2_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff2_0", "role": "ce0" }} , 
 	{ "name": "ifm_buff2_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff2_0", "role": "we0" }} , 
 	{ "name": "ifm_buff2_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff2_0", "role": "d0" }} , 
 	{ "name": "ifm_buff2_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff2_1", "role": "address0" }} , 
 	{ "name": "ifm_buff2_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff2_1", "role": "ce0" }} , 
 	{ "name": "ifm_buff2_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff2_1", "role": "we0" }} , 
 	{ "name": "ifm_buff2_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff2_1", "role": "d0" }} , 
 	{ "name": "ifm_buff2_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ifm_buff2_2", "role": "address0" }} , 
 	{ "name": "ifm_buff2_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff2_2", "role": "ce0" }} , 
 	{ "name": "ifm_buff2_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ifm_buff2_2", "role": "we0" }} , 
 	{ "name": "ifm_buff2_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ifm_buff2_2", "role": "d0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "load_cifm_data",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "108", "EstimateLatencyMax" : "108",
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
			{"Name" : "ifm_buff1_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ifm_buff1_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ifm_buff1_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ifm_buff2_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ifm_buff2_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ifm_buff2_2", "Type" : "Memory", "Direction" : "O"}]}]}


set ArgLastReadFirstWriteLatency {
	load_cifm_data {
		cifm {Type I LastRead 5 FirstWrite -1}
		ifm_buff0_0 {Type O LastRead -1 FirstWrite 1}
		ifm_buff0_1 {Type O LastRead -1 FirstWrite 1}
		ifm_buff0_2 {Type O LastRead -1 FirstWrite 1}
		ifm_buff1_0 {Type O LastRead -1 FirstWrite 3}
		ifm_buff1_1 {Type O LastRead -1 FirstWrite 3}
		ifm_buff1_2 {Type O LastRead -1 FirstWrite 3}
		ifm_buff2_0 {Type O LastRead -1 FirstWrite 5}
		ifm_buff2_1 {Type O LastRead -1 FirstWrite 5}
		ifm_buff2_2 {Type O LastRead -1 FirstWrite 5}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "108", "Max" : "108"}
	, {"Name" : "Interval", "Min" : "108", "Max" : "108"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	cifm { axis {  { cifm_TDATA in_data 0 512 }  { cifm_TVALID in_vld 0 1 }  { cifm_TREADY in_acc 1 1 } } }
	ifm_buff0_0 { ap_memory {  { ifm_buff0_0_address0 mem_address 1 6 }  { ifm_buff0_0_ce0 mem_ce 1 1 }  { ifm_buff0_0_we0 mem_we 1 1 }  { ifm_buff0_0_d0 mem_din 1 32 } } }
	ifm_buff0_1 { ap_memory {  { ifm_buff0_1_address0 mem_address 1 6 }  { ifm_buff0_1_ce0 mem_ce 1 1 }  { ifm_buff0_1_we0 mem_we 1 1 }  { ifm_buff0_1_d0 mem_din 1 32 } } }
	ifm_buff0_2 { ap_memory {  { ifm_buff0_2_address0 mem_address 1 6 }  { ifm_buff0_2_ce0 mem_ce 1 1 }  { ifm_buff0_2_we0 mem_we 1 1 }  { ifm_buff0_2_d0 mem_din 1 32 } } }
	ifm_buff1_0 { ap_memory {  { ifm_buff1_0_address0 mem_address 1 6 }  { ifm_buff1_0_ce0 mem_ce 1 1 }  { ifm_buff1_0_we0 mem_we 1 1 }  { ifm_buff1_0_d0 mem_din 1 32 } } }
	ifm_buff1_1 { ap_memory {  { ifm_buff1_1_address0 mem_address 1 6 }  { ifm_buff1_1_ce0 mem_ce 1 1 }  { ifm_buff1_1_we0 mem_we 1 1 }  { ifm_buff1_1_d0 mem_din 1 32 } } }
	ifm_buff1_2 { ap_memory {  { ifm_buff1_2_address0 mem_address 1 6 }  { ifm_buff1_2_ce0 mem_ce 1 1 }  { ifm_buff1_2_we0 mem_we 1 1 }  { ifm_buff1_2_d0 mem_din 1 32 } } }
	ifm_buff2_0 { ap_memory {  { ifm_buff2_0_address0 mem_address 1 6 }  { ifm_buff2_0_ce0 mem_ce 1 1 }  { ifm_buff2_0_we0 mem_we 1 1 }  { ifm_buff2_0_d0 mem_din 1 32 } } }
	ifm_buff2_1 { ap_memory {  { ifm_buff2_1_address0 mem_address 1 6 }  { ifm_buff2_1_ce0 mem_ce 1 1 }  { ifm_buff2_1_we0 mem_we 1 1 }  { ifm_buff2_1_d0 mem_din 1 32 } } }
	ifm_buff2_2 { ap_memory {  { ifm_buff2_2_address0 mem_address 1 6 }  { ifm_buff2_2_ce0 mem_ce 1 1 }  { ifm_buff2_2_we0 mem_we 1 1 }  { ifm_buff2_2_d0 mem_din 1 32 } } }
}
