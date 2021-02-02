set moduleName dnn_hw
set isTopModule 1
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
set C_modelName {dnn_hw}
set C_modelType { void 0 }
set C_modelArgList {
	{ cifm int 512 regular {axi_s 0 volatile  { cifm Data } }  }
	{ cofm int 512 regular {axi_s 1 ""  { cofm Data } }  }
	{ tran_wgt int 512 regular {axi_s 0 volatile  { tran_wgt Data } }  }
	{ config_r int 32 regular {axi_s 0 volatile  { config_r Data } }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "cifm", "interface" : "axis", "bitwidth" : 512, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "cifm.a0","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":32,"up":63,"cElement": [{"cName": "cifm.a1","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":64,"up":95,"cElement": [{"cName": "cifm.a2","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":96,"up":127,"cElement": [{"cName": "cifm.a3","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":128,"up":159,"cElement": [{"cName": "cifm.a4","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":160,"up":191,"cElement": [{"cName": "cifm.a5","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":192,"up":223,"cElement": [{"cName": "cifm.a6","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":224,"up":255,"cElement": [{"cName": "cifm.a7","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":256,"up":287,"cElement": [{"cName": "cifm.a8","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":288,"up":319,"cElement": [{"cName": "cifm.a9","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":320,"up":351,"cElement": [{"cName": "cifm.a10","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":352,"up":383,"cElement": [{"cName": "cifm.a11","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":384,"up":415,"cElement": [{"cName": "cifm.a12","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":416,"up":447,"cElement": [{"cName": "cifm.a13","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":448,"up":479,"cElement": [{"cName": "cifm.a14","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":480,"up":511,"cElement": [{"cName": "cifm.a15","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "cofm", "interface" : "axis", "bitwidth" : 512, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "cofm.b0","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":32,"up":63,"cElement": [{"cName": "cofm.b1","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":64,"up":95,"cElement": [{"cName": "cofm.b2","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":96,"up":127,"cElement": [{"cName": "cofm.b3","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":128,"up":159,"cElement": [{"cName": "cofm.b4","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":160,"up":191,"cElement": [{"cName": "cofm.b5","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":192,"up":223,"cElement": [{"cName": "cofm.b6","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":224,"up":255,"cElement": [{"cName": "cofm.b7","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":256,"up":287,"cElement": [{"cName": "cofm.b8","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":288,"up":319,"cElement": [{"cName": "cofm.b9","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":320,"up":351,"cElement": [{"cName": "cofm.b10","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":352,"up":383,"cElement": [{"cName": "cofm.b11","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":384,"up":415,"cElement": [{"cName": "cofm.b12","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":416,"up":447,"cElement": [{"cName": "cofm.b13","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":448,"up":479,"cElement": [{"cName": "cofm.b14","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":480,"up":511,"cElement": [{"cName": "cofm.b15","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "tran_wgt", "interface" : "axis", "bitwidth" : 512, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "tran_wgt.f0","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":32,"up":63,"cElement": [{"cName": "tran_wgt.f1","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":64,"up":95,"cElement": [{"cName": "tran_wgt.f2","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":96,"up":127,"cElement": [{"cName": "tran_wgt.f3","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":128,"up":159,"cElement": [{"cName": "tran_wgt.f4","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":160,"up":191,"cElement": [{"cName": "tran_wgt.f5","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":192,"up":223,"cElement": [{"cName": "tran_wgt.f6","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":224,"up":255,"cElement": [{"cName": "tran_wgt.f7","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":256,"up":287,"cElement": [{"cName": "tran_wgt.f8","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":288,"up":319,"cElement": [{"cName": "tran_wgt.f9","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":320,"up":351,"cElement": [{"cName": "tran_wgt.f10","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":352,"up":383,"cElement": [{"cName": "tran_wgt.f11","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":384,"up":415,"cElement": [{"cName": "tran_wgt.f12","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":416,"up":447,"cElement": [{"cName": "tran_wgt.f13","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":448,"up":479,"cElement": [{"cName": "tran_wgt.f14","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":480,"up":511,"cElement": [{"cName": "tran_wgt.f15","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "config_r", "interface" : "axis", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "config","cData": "int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} ]}
# RTL Port declarations: 
set portNum 18
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ cifm_TDATA sc_in sc_lv 512 signal 0 } 
	{ cifm_TVALID sc_in sc_logic 1 invld 0 } 
	{ cifm_TREADY sc_out sc_logic 1 inacc 0 } 
	{ cofm_TDATA sc_out sc_lv 512 signal 1 } 
	{ cofm_TVALID sc_out sc_logic 1 outvld 1 } 
	{ cofm_TREADY sc_in sc_logic 1 outacc 1 } 
	{ tran_wgt_TDATA sc_in sc_lv 512 signal 2 } 
	{ tran_wgt_TVALID sc_in sc_logic 1 invld 2 } 
	{ tran_wgt_TREADY sc_out sc_logic 1 inacc 2 } 
	{ config_r_TDATA sc_in sc_lv 32 signal 3 } 
	{ config_r_TVALID sc_in sc_logic 1 invld 3 } 
	{ config_r_TREADY sc_out sc_logic 1 inacc 3 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "cifm_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "cifm", "role": "TDATA" }} , 
 	{ "name": "cifm_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "cifm", "role": "TVALID" }} , 
 	{ "name": "cifm_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "cifm", "role": "TREADY" }} , 
 	{ "name": "cofm_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "cofm", "role": "TDATA" }} , 
 	{ "name": "cofm_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "cofm", "role": "TVALID" }} , 
 	{ "name": "cofm_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "cofm", "role": "TREADY" }} , 
 	{ "name": "tran_wgt_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "tran_wgt", "role": "TDATA" }} , 
 	{ "name": "tran_wgt_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "tran_wgt", "role": "TVALID" }} , 
 	{ "name": "tran_wgt_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "tran_wgt", "role": "TREADY" }} , 
 	{ "name": "config_r_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "config_r", "role": "TDATA" }} , 
 	{ "name": "config_r_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "config_r", "role": "TVALID" }} , 
 	{ "name": "config_r_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "config_r", "role": "TREADY" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "110", "375", "376", "377", "378"],
		"CDFG" : "dnn_hw",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2", "EstimateLatencyMax" : "5720553",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"WaitState" : [
			{"State" : "ap_ST_fsm_state2", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_pool_hw_fu_38"},
			{"State" : "ap_ST_fsm_state3", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_convolution_hw_fu_46"}],
		"Port" : [
			{"Name" : "cifm", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "110", "SubInstance" : "grp_convolution_hw_fu_46", "Port" : "cifm"},
					{"ID" : "1", "SubInstance" : "grp_pool_hw_fu_38", "Port" : "cifm"}]},
			{"Name" : "cofm", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "110", "SubInstance" : "grp_convolution_hw_fu_46", "Port" : "cofm"},
					{"ID" : "1", "SubInstance" : "grp_pool_hw_fu_38", "Port" : "cofm"}]},
			{"Name" : "tran_wgt", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "110", "SubInstance" : "grp_convolution_hw_fu_46", "Port" : "tran_wgt"}]},
			{"Name" : "config_r", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "config_r_TDATA_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38", "Parent" : "0", "Child" : ["2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "107", "108", "109"],
		"CDFG" : "pool_hw",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "236", "EstimateLatencyMax" : "7013",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"WaitState" : [
			{"State" : "ap_ST_fsm_state4", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_pool_write_fu_405"},
			{"State" : "ap_ST_fsm_state4", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_pool_write_fu_405"},
			{"State" : "ap_ST_fsm_state4", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_pool_write_fu_405"},
			{"State" : "ap_ST_fsm_state4", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_pool_write_fu_405"},
			{"State" : "ap_ST_fsm_state4", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_pool_write_fu_405"},
			{"State" : "ap_ST_fsm_state4", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_conv_read_fu_457"},
			{"State" : "ap_ST_fsm_state4", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_conv_read_fu_457"},
			{"State" : "ap_ST_fsm_state4", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_conv_read_fu_457"},
			{"State" : "ap_ST_fsm_state4", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_conv_read_fu_457"},
			{"State" : "ap_ST_fsm_state4", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_conv_read_fu_457"},
			{"State" : "ap_ST_fsm_state5", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_conv_read_fu_457"},
			{"State" : "ap_ST_fsm_state4", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_write_row_ifm_fu_482"},
			{"State" : "ap_ST_fsm_state4", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_write_row_ifm_fu_482"},
			{"State" : "ap_ST_fsm_state4", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_write_row_ifm_fu_482"},
			{"State" : "ap_ST_fsm_state4", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_write_row_ifm_fu_482"},
			{"State" : "ap_ST_fsm_state4", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_write_row_ifm_fu_482"},
			{"State" : "ap_ST_fsm_state2", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_load_cifm_data_pool_fu_506"}],
		"Port" : [
			{"Name" : "cifm", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "109", "SubInstance" : "grp_load_cifm_data_pool_fu_506", "Port" : "cifm"},
					{"ID" : "108", "SubInstance" : "grp_write_row_ifm_fu_482", "Port" : "cifm"}]},
			{"Name" : "cofm", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "107", "SubInstance" : "grp_conv_read_fu_457", "Port" : "cofm"}]}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ifm_buff0_0_U", "Parent" : "1"},
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ifm_buff0_1_U", "Parent" : "1"},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ifm_buff0_2_U", "Parent" : "1"},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ifm_buff0_3_U", "Parent" : "1"},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ifm_buff0_4_U", "Parent" : "1"},
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ifm_buff0_5_U", "Parent" : "1"},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ifm_buff0_6_U", "Parent" : "1"},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ifm_buff0_7_U", "Parent" : "1"},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ifm_buff0_8_U", "Parent" : "1"},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ifm_buff0_9_U", "Parent" : "1"},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ifm_buff0_10_U", "Parent" : "1"},
	{"ID" : "13", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ifm_buff0_11_U", "Parent" : "1"},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ifm_buff0_12_U", "Parent" : "1"},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ifm_buff0_13_U", "Parent" : "1"},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ifm_buff0_14_U", "Parent" : "1"},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ifm_buff0_15_U", "Parent" : "1"},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ifm_buff1_0_U", "Parent" : "1"},
	{"ID" : "19", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ifm_buff1_1_U", "Parent" : "1"},
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ifm_buff1_2_U", "Parent" : "1"},
	{"ID" : "21", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ifm_buff1_3_U", "Parent" : "1"},
	{"ID" : "22", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ifm_buff1_4_U", "Parent" : "1"},
	{"ID" : "23", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ifm_buff1_5_U", "Parent" : "1"},
	{"ID" : "24", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ifm_buff1_6_U", "Parent" : "1"},
	{"ID" : "25", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ifm_buff1_7_U", "Parent" : "1"},
	{"ID" : "26", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ifm_buff1_8_U", "Parent" : "1"},
	{"ID" : "27", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ifm_buff1_9_U", "Parent" : "1"},
	{"ID" : "28", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ifm_buff1_10_U", "Parent" : "1"},
	{"ID" : "29", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ifm_buff1_11_U", "Parent" : "1"},
	{"ID" : "30", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ifm_buff1_12_U", "Parent" : "1"},
	{"ID" : "31", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ifm_buff1_13_U", "Parent" : "1"},
	{"ID" : "32", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ifm_buff1_14_U", "Parent" : "1"},
	{"ID" : "33", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ifm_buff1_15_U", "Parent" : "1"},
	{"ID" : "34", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ifm_buff2_0_U", "Parent" : "1"},
	{"ID" : "35", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ifm_buff2_1_U", "Parent" : "1"},
	{"ID" : "36", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ifm_buff2_2_U", "Parent" : "1"},
	{"ID" : "37", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ifm_buff2_3_U", "Parent" : "1"},
	{"ID" : "38", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ifm_buff2_4_U", "Parent" : "1"},
	{"ID" : "39", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ifm_buff2_5_U", "Parent" : "1"},
	{"ID" : "40", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ifm_buff2_6_U", "Parent" : "1"},
	{"ID" : "41", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ifm_buff2_7_U", "Parent" : "1"},
	{"ID" : "42", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ifm_buff2_8_U", "Parent" : "1"},
	{"ID" : "43", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ifm_buff2_9_U", "Parent" : "1"},
	{"ID" : "44", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ifm_buff2_10_U", "Parent" : "1"},
	{"ID" : "45", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ifm_buff2_11_U", "Parent" : "1"},
	{"ID" : "46", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ifm_buff2_12_U", "Parent" : "1"},
	{"ID" : "47", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ifm_buff2_13_U", "Parent" : "1"},
	{"ID" : "48", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ifm_buff2_14_U", "Parent" : "1"},
	{"ID" : "49", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ifm_buff2_15_U", "Parent" : "1"},
	{"ID" : "50", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ofm_buff0_0_U", "Parent" : "1"},
	{"ID" : "51", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ofm_buff0_1_U", "Parent" : "1"},
	{"ID" : "52", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ofm_buff0_2_U", "Parent" : "1"},
	{"ID" : "53", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ofm_buff0_3_U", "Parent" : "1"},
	{"ID" : "54", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ofm_buff0_4_U", "Parent" : "1"},
	{"ID" : "55", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ofm_buff0_5_U", "Parent" : "1"},
	{"ID" : "56", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ofm_buff0_6_U", "Parent" : "1"},
	{"ID" : "57", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ofm_buff0_7_U", "Parent" : "1"},
	{"ID" : "58", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ofm_buff0_8_U", "Parent" : "1"},
	{"ID" : "59", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ofm_buff0_9_U", "Parent" : "1"},
	{"ID" : "60", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ofm_buff0_10_U", "Parent" : "1"},
	{"ID" : "61", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ofm_buff0_11_U", "Parent" : "1"},
	{"ID" : "62", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ofm_buff0_12_U", "Parent" : "1"},
	{"ID" : "63", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ofm_buff0_13_U", "Parent" : "1"},
	{"ID" : "64", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ofm_buff0_14_U", "Parent" : "1"},
	{"ID" : "65", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ofm_buff0_15_U", "Parent" : "1"},
	{"ID" : "66", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ofm_buff1_0_U", "Parent" : "1"},
	{"ID" : "67", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ofm_buff1_1_U", "Parent" : "1"},
	{"ID" : "68", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ofm_buff1_2_U", "Parent" : "1"},
	{"ID" : "69", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ofm_buff1_3_U", "Parent" : "1"},
	{"ID" : "70", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ofm_buff1_4_U", "Parent" : "1"},
	{"ID" : "71", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ofm_buff1_5_U", "Parent" : "1"},
	{"ID" : "72", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ofm_buff1_6_U", "Parent" : "1"},
	{"ID" : "73", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ofm_buff1_7_U", "Parent" : "1"},
	{"ID" : "74", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ofm_buff1_8_U", "Parent" : "1"},
	{"ID" : "75", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ofm_buff1_9_U", "Parent" : "1"},
	{"ID" : "76", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ofm_buff1_10_U", "Parent" : "1"},
	{"ID" : "77", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ofm_buff1_11_U", "Parent" : "1"},
	{"ID" : "78", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ofm_buff1_12_U", "Parent" : "1"},
	{"ID" : "79", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ofm_buff1_13_U", "Parent" : "1"},
	{"ID" : "80", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ofm_buff1_14_U", "Parent" : "1"},
	{"ID" : "81", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.ofm_buff1_15_U", "Parent" : "1"},
	{"ID" : "82", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.grp_pool_write_fu_405", "Parent" : "1", "Child" : ["83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "100", "101", "102", "103", "104", "105", "106"],
		"CDFG" : "pool_write",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "120", "EstimateLatencyMax" : "120",
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
	{"ID" : "83", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.grp_pool_write_fu_405.dnn_hw_fcmp_32ns_bkb_U53", "Parent" : "82"},
	{"ID" : "84", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.grp_pool_write_fu_405.dnn_hw_fcmp_32ns_bkb_U54", "Parent" : "82"},
	{"ID" : "85", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.grp_pool_write_fu_405.dnn_hw_fcmp_32ns_bkb_U55", "Parent" : "82"},
	{"ID" : "86", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.grp_pool_write_fu_405.dnn_hw_fcmp_32ns_bkb_U56", "Parent" : "82"},
	{"ID" : "87", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.grp_pool_write_fu_405.dnn_hw_fcmp_32ns_bkb_U57", "Parent" : "82"},
	{"ID" : "88", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.grp_pool_write_fu_405.dnn_hw_fcmp_32ns_bkb_U58", "Parent" : "82"},
	{"ID" : "89", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.grp_pool_write_fu_405.dnn_hw_fcmp_32ns_bkb_U59", "Parent" : "82"},
	{"ID" : "90", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.grp_pool_write_fu_405.dnn_hw_fcmp_32ns_bkb_U60", "Parent" : "82"},
	{"ID" : "91", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.grp_pool_write_fu_405.dnn_hw_fcmp_32ns_bkb_U61", "Parent" : "82"},
	{"ID" : "92", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.grp_pool_write_fu_405.dnn_hw_fcmp_32ns_bkb_U62", "Parent" : "82"},
	{"ID" : "93", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.grp_pool_write_fu_405.dnn_hw_fcmp_32ns_bkb_U63", "Parent" : "82"},
	{"ID" : "94", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.grp_pool_write_fu_405.dnn_hw_fcmp_32ns_bkb_U64", "Parent" : "82"},
	{"ID" : "95", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.grp_pool_write_fu_405.dnn_hw_fcmp_32ns_bkb_U65", "Parent" : "82"},
	{"ID" : "96", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.grp_pool_write_fu_405.dnn_hw_fcmp_32ns_bkb_U66", "Parent" : "82"},
	{"ID" : "97", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.grp_pool_write_fu_405.dnn_hw_fcmp_32ns_bkb_U67", "Parent" : "82"},
	{"ID" : "98", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.grp_pool_write_fu_405.dnn_hw_fcmp_32ns_bkb_U68", "Parent" : "82"},
	{"ID" : "99", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.grp_pool_write_fu_405.dnn_hw_fcmp_32ns_bkb_U69", "Parent" : "82"},
	{"ID" : "100", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.grp_pool_write_fu_405.dnn_hw_fcmp_32ns_bkb_U70", "Parent" : "82"},
	{"ID" : "101", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.grp_pool_write_fu_405.dnn_hw_fcmp_32ns_bkb_U71", "Parent" : "82"},
	{"ID" : "102", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.grp_pool_write_fu_405.dnn_hw_fcmp_32ns_bkb_U72", "Parent" : "82"},
	{"ID" : "103", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.grp_pool_write_fu_405.dnn_hw_fcmp_32ns_bkb_U73", "Parent" : "82"},
	{"ID" : "104", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.grp_pool_write_fu_405.dnn_hw_fcmp_32ns_bkb_U74", "Parent" : "82"},
	{"ID" : "105", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.grp_pool_write_fu_405.dnn_hw_fcmp_32ns_bkb_U75", "Parent" : "82"},
	{"ID" : "106", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.grp_pool_write_fu_405.dnn_hw_fcmp_32ns_bkb_U76", "Parent" : "82"},
	{"ID" : "107", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.grp_conv_read_fu_457", "Parent" : "1",
		"CDFG" : "conv_read",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1", "EstimateLatencyMax" : "58",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "cofm", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "cofm_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "ofm_buff0_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ofm_buff0_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ofm_buff0_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ofm_buff0_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ofm_buff0_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ofm_buff0_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ofm_buff0_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ofm_buff0_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ofm_buff0_8", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ofm_buff0_9", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ofm_buff0_10", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ofm_buff0_11", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ofm_buff0_12", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ofm_buff0_13", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ofm_buff0_14", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ofm_buff0_15", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "cofm_counter_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "enable", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "108", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.grp_write_row_ifm_fu_482", "Parent" : "1",
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
			{"Name" : "enable", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "109", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_hw_fu_38.grp_load_cifm_data_pool_fu_506", "Parent" : "1",
		"CDFG" : "load_cifm_data_pool",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "120", "EstimateLatencyMax" : "120",
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
			{"Name" : "ifm_buff1_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ifm_buff1_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ifm_buff1_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ifm_buff1_3", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ifm_buff1_4", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ifm_buff1_5", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ifm_buff1_6", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ifm_buff1_7", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ifm_buff1_8", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ifm_buff1_9", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ifm_buff1_10", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ifm_buff1_11", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ifm_buff1_12", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ifm_buff1_13", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ifm_buff1_14", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ifm_buff1_15", "Type" : "Memory", "Direction" : "O"}]},
	{"ID" : "110", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46", "Parent" : "0", "Child" : ["111", "112", "113", "114", "115", "116", "117", "118", "119", "120", "121", "122", "123", "124", "125", "126", "127", "128", "129", "130", "131", "132", "133", "134", "135", "136", "137", "138", "139", "140", "141", "142", "143", "144", "145", "146", "147", "148", "149", "150", "151", "152", "153", "154", "155", "156", "157", "158", "159", "160", "161", "162", "163", "164", "165", "166", "167", "168", "169", "170", "171", "172", "173", "174", "175", "176", "177", "178", "179", "180", "181", "182", "183", "184", "185", "186", "187", "188", "189", "190", "191", "192", "193", "194", "195", "196", "197", "198", "199", "200", "201", "202", "203", "204", "205", "206", "207", "208", "209", "210", "211", "212", "213", "214", "215", "216", "217", "218", "219", "220", "221", "222", "223", "224", "225", "226", "227", "228", "229", "230", "231", "232", "233", "234", "235", "236", "237", "238", "239", "240", "241", "242", "243", "244", "245", "246", "247", "248", "249", "250", "251", "252", "253", "254", "255", "256", "257", "258", "259", "260", "261", "262", "263", "264", "265", "266", "267", "268", "269", "270", "271", "272", "273", "274", "275", "276", "277", "278", "279", "280", "281", "282", "283", "284", "285", "286", "287", "288", "289", "290", "291", "292", "293", "294", "295", "296", "297", "298", "299", "300", "301", "302", "303", "304", "305", "306", "307", "308", "309", "310", "311", "312", "313", "314", "315", "316", "317", "318", "319", "320", "321", "322", "323", "324", "325", "326", "327", "328", "329", "330", "331", "332", "333", "334", "335", "336", "337", "338", "339", "340", "341", "342", "343", "344", "345", "346", "347", "348", "349", "350", "351", "371", "372", "373", "374"],
		"CDFG" : "convolution_hw",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "374", "EstimateLatencyMax" : "5720551",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"WaitState" : [
			{"State" : "ap_ST_fsm_state4", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_conv_write_fu_1047"},
			{"State" : "ap_ST_fsm_state4", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_conv_write_fu_1047"},
			{"State" : "ap_ST_fsm_state4", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_conv_write_fu_1047"},
			{"State" : "ap_ST_fsm_state4", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_conv_write_fu_1047"},
			{"State" : "ap_ST_fsm_state4", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_conv_read_fu_1259"},
			{"State" : "ap_ST_fsm_state4", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_conv_read_fu_1259"},
			{"State" : "ap_ST_fsm_state4", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_conv_read_fu_1259"},
			{"State" : "ap_ST_fsm_state4", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_conv_read_fu_1259"},
			{"State" : "ap_ST_fsm_state5", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_conv_read_fu_1259"},
			{"State" : "ap_ST_fsm_state2", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_load_filter_buffer_fu_1284"},
			{"State" : "ap_ST_fsm_state4", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_write_row_ifm_fu_1578"},
			{"State" : "ap_ST_fsm_state4", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_write_row_ifm_fu_1578"},
			{"State" : "ap_ST_fsm_state4", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_write_row_ifm_fu_1578"},
			{"State" : "ap_ST_fsm_state4", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_write_row_ifm_fu_1578"},
			{"State" : "ap_ST_fsm_state2", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_load_cifm_data_fu_1603"}],
		"Port" : [
			{"Name" : "cifm", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "373", "SubInstance" : "grp_write_row_ifm_fu_1578", "Port" : "cifm"},
					{"ID" : "374", "SubInstance" : "grp_load_cifm_data_fu_1603", "Port" : "cifm"}]},
			{"Name" : "cofm", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "371", "SubInstance" : "grp_conv_read_fu_1259", "Port" : "cofm"}]},
			{"Name" : "tran_wgt", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "372", "SubInstance" : "grp_load_filter_buffer_fu_1284", "Port" : "wgt"}]}]},
	{"ID" : "111", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ifm_buff0_0_U", "Parent" : "110"},
	{"ID" : "112", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ifm_buff0_1_U", "Parent" : "110"},
	{"ID" : "113", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ifm_buff0_2_U", "Parent" : "110"},
	{"ID" : "114", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ifm_buff0_3_U", "Parent" : "110"},
	{"ID" : "115", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ifm_buff0_4_U", "Parent" : "110"},
	{"ID" : "116", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ifm_buff0_5_U", "Parent" : "110"},
	{"ID" : "117", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ifm_buff0_6_U", "Parent" : "110"},
	{"ID" : "118", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ifm_buff0_7_U", "Parent" : "110"},
	{"ID" : "119", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ifm_buff0_8_U", "Parent" : "110"},
	{"ID" : "120", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ifm_buff0_9_U", "Parent" : "110"},
	{"ID" : "121", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ifm_buff0_10_U", "Parent" : "110"},
	{"ID" : "122", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ifm_buff0_11_U", "Parent" : "110"},
	{"ID" : "123", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ifm_buff0_12_U", "Parent" : "110"},
	{"ID" : "124", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ifm_buff0_13_U", "Parent" : "110"},
	{"ID" : "125", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ifm_buff0_14_U", "Parent" : "110"},
	{"ID" : "126", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ifm_buff0_15_U", "Parent" : "110"},
	{"ID" : "127", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ifm_buff1_0_U", "Parent" : "110"},
	{"ID" : "128", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ifm_buff1_1_U", "Parent" : "110"},
	{"ID" : "129", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ifm_buff1_2_U", "Parent" : "110"},
	{"ID" : "130", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ifm_buff1_3_U", "Parent" : "110"},
	{"ID" : "131", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ifm_buff1_4_U", "Parent" : "110"},
	{"ID" : "132", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ifm_buff1_5_U", "Parent" : "110"},
	{"ID" : "133", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ifm_buff1_6_U", "Parent" : "110"},
	{"ID" : "134", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ifm_buff1_7_U", "Parent" : "110"},
	{"ID" : "135", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ifm_buff1_8_U", "Parent" : "110"},
	{"ID" : "136", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ifm_buff1_9_U", "Parent" : "110"},
	{"ID" : "137", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ifm_buff1_10_U", "Parent" : "110"},
	{"ID" : "138", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ifm_buff1_11_U", "Parent" : "110"},
	{"ID" : "139", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ifm_buff1_12_U", "Parent" : "110"},
	{"ID" : "140", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ifm_buff1_13_U", "Parent" : "110"},
	{"ID" : "141", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ifm_buff1_14_U", "Parent" : "110"},
	{"ID" : "142", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ifm_buff1_15_U", "Parent" : "110"},
	{"ID" : "143", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ifm_buff2_0_U", "Parent" : "110"},
	{"ID" : "144", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ifm_buff2_1_U", "Parent" : "110"},
	{"ID" : "145", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ifm_buff2_2_U", "Parent" : "110"},
	{"ID" : "146", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ifm_buff2_3_U", "Parent" : "110"},
	{"ID" : "147", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ifm_buff2_4_U", "Parent" : "110"},
	{"ID" : "148", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ifm_buff2_5_U", "Parent" : "110"},
	{"ID" : "149", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ifm_buff2_6_U", "Parent" : "110"},
	{"ID" : "150", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ifm_buff2_7_U", "Parent" : "110"},
	{"ID" : "151", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ifm_buff2_8_U", "Parent" : "110"},
	{"ID" : "152", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ifm_buff2_9_U", "Parent" : "110"},
	{"ID" : "153", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ifm_buff2_10_U", "Parent" : "110"},
	{"ID" : "154", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ifm_buff2_11_U", "Parent" : "110"},
	{"ID" : "155", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ifm_buff2_12_U", "Parent" : "110"},
	{"ID" : "156", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ifm_buff2_13_U", "Parent" : "110"},
	{"ID" : "157", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ifm_buff2_14_U", "Parent" : "110"},
	{"ID" : "158", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ifm_buff2_15_U", "Parent" : "110"},
	{"ID" : "159", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ifm_buff3_0_U", "Parent" : "110"},
	{"ID" : "160", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ifm_buff3_1_U", "Parent" : "110"},
	{"ID" : "161", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ifm_buff3_2_U", "Parent" : "110"},
	{"ID" : "162", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ifm_buff3_3_U", "Parent" : "110"},
	{"ID" : "163", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ifm_buff3_4_U", "Parent" : "110"},
	{"ID" : "164", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ifm_buff3_5_U", "Parent" : "110"},
	{"ID" : "165", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ifm_buff3_6_U", "Parent" : "110"},
	{"ID" : "166", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ifm_buff3_7_U", "Parent" : "110"},
	{"ID" : "167", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ifm_buff3_8_U", "Parent" : "110"},
	{"ID" : "168", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ifm_buff3_9_U", "Parent" : "110"},
	{"ID" : "169", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ifm_buff3_10_U", "Parent" : "110"},
	{"ID" : "170", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ifm_buff3_11_U", "Parent" : "110"},
	{"ID" : "171", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ifm_buff3_12_U", "Parent" : "110"},
	{"ID" : "172", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ifm_buff3_13_U", "Parent" : "110"},
	{"ID" : "173", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ifm_buff3_14_U", "Parent" : "110"},
	{"ID" : "174", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ifm_buff3_15_U", "Parent" : "110"},
	{"ID" : "175", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_0_0_0_U", "Parent" : "110"},
	{"ID" : "176", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_0_0_1_U", "Parent" : "110"},
	{"ID" : "177", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_0_0_2_U", "Parent" : "110"},
	{"ID" : "178", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_0_1_0_U", "Parent" : "110"},
	{"ID" : "179", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_0_1_1_U", "Parent" : "110"},
	{"ID" : "180", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_0_1_2_U", "Parent" : "110"},
	{"ID" : "181", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_0_2_0_U", "Parent" : "110"},
	{"ID" : "182", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_0_2_1_U", "Parent" : "110"},
	{"ID" : "183", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_0_2_2_U", "Parent" : "110"},
	{"ID" : "184", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_1_0_0_U", "Parent" : "110"},
	{"ID" : "185", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_1_0_1_U", "Parent" : "110"},
	{"ID" : "186", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_1_0_2_U", "Parent" : "110"},
	{"ID" : "187", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_1_1_0_U", "Parent" : "110"},
	{"ID" : "188", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_1_1_1_U", "Parent" : "110"},
	{"ID" : "189", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_1_1_2_U", "Parent" : "110"},
	{"ID" : "190", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_1_2_0_U", "Parent" : "110"},
	{"ID" : "191", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_1_2_1_U", "Parent" : "110"},
	{"ID" : "192", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_1_2_2_U", "Parent" : "110"},
	{"ID" : "193", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_2_0_0_U", "Parent" : "110"},
	{"ID" : "194", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_2_0_1_U", "Parent" : "110"},
	{"ID" : "195", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_2_0_2_U", "Parent" : "110"},
	{"ID" : "196", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_2_1_0_U", "Parent" : "110"},
	{"ID" : "197", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_2_1_1_U", "Parent" : "110"},
	{"ID" : "198", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_2_1_2_U", "Parent" : "110"},
	{"ID" : "199", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_2_2_0_U", "Parent" : "110"},
	{"ID" : "200", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_2_2_1_U", "Parent" : "110"},
	{"ID" : "201", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_2_2_2_U", "Parent" : "110"},
	{"ID" : "202", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_3_0_0_U", "Parent" : "110"},
	{"ID" : "203", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_3_0_1_U", "Parent" : "110"},
	{"ID" : "204", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_3_0_2_U", "Parent" : "110"},
	{"ID" : "205", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_3_1_0_U", "Parent" : "110"},
	{"ID" : "206", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_3_1_1_U", "Parent" : "110"},
	{"ID" : "207", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_3_1_2_U", "Parent" : "110"},
	{"ID" : "208", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_3_2_0_U", "Parent" : "110"},
	{"ID" : "209", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_3_2_1_U", "Parent" : "110"},
	{"ID" : "210", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_3_2_2_U", "Parent" : "110"},
	{"ID" : "211", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_4_0_0_U", "Parent" : "110"},
	{"ID" : "212", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_4_0_1_U", "Parent" : "110"},
	{"ID" : "213", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_4_0_2_U", "Parent" : "110"},
	{"ID" : "214", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_4_1_0_U", "Parent" : "110"},
	{"ID" : "215", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_4_1_1_U", "Parent" : "110"},
	{"ID" : "216", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_4_1_2_U", "Parent" : "110"},
	{"ID" : "217", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_4_2_0_U", "Parent" : "110"},
	{"ID" : "218", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_4_2_1_U", "Parent" : "110"},
	{"ID" : "219", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_4_2_2_U", "Parent" : "110"},
	{"ID" : "220", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_5_0_0_U", "Parent" : "110"},
	{"ID" : "221", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_5_0_1_U", "Parent" : "110"},
	{"ID" : "222", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_5_0_2_U", "Parent" : "110"},
	{"ID" : "223", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_5_1_0_U", "Parent" : "110"},
	{"ID" : "224", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_5_1_1_U", "Parent" : "110"},
	{"ID" : "225", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_5_1_2_U", "Parent" : "110"},
	{"ID" : "226", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_5_2_0_U", "Parent" : "110"},
	{"ID" : "227", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_5_2_1_U", "Parent" : "110"},
	{"ID" : "228", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_5_2_2_U", "Parent" : "110"},
	{"ID" : "229", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_6_0_0_U", "Parent" : "110"},
	{"ID" : "230", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_6_0_1_U", "Parent" : "110"},
	{"ID" : "231", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_6_0_2_U", "Parent" : "110"},
	{"ID" : "232", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_6_1_0_U", "Parent" : "110"},
	{"ID" : "233", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_6_1_1_U", "Parent" : "110"},
	{"ID" : "234", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_6_1_2_U", "Parent" : "110"},
	{"ID" : "235", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_6_2_0_U", "Parent" : "110"},
	{"ID" : "236", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_6_2_1_U", "Parent" : "110"},
	{"ID" : "237", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_6_2_2_U", "Parent" : "110"},
	{"ID" : "238", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_7_0_0_U", "Parent" : "110"},
	{"ID" : "239", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_7_0_1_U", "Parent" : "110"},
	{"ID" : "240", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_7_0_2_U", "Parent" : "110"},
	{"ID" : "241", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_7_1_0_U", "Parent" : "110"},
	{"ID" : "242", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_7_1_1_U", "Parent" : "110"},
	{"ID" : "243", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_7_1_2_U", "Parent" : "110"},
	{"ID" : "244", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_7_2_0_U", "Parent" : "110"},
	{"ID" : "245", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_7_2_1_U", "Parent" : "110"},
	{"ID" : "246", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_7_2_2_U", "Parent" : "110"},
	{"ID" : "247", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_8_0_0_U", "Parent" : "110"},
	{"ID" : "248", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_8_0_1_U", "Parent" : "110"},
	{"ID" : "249", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_8_0_2_U", "Parent" : "110"},
	{"ID" : "250", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_8_1_0_U", "Parent" : "110"},
	{"ID" : "251", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_8_1_1_U", "Parent" : "110"},
	{"ID" : "252", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_8_1_2_U", "Parent" : "110"},
	{"ID" : "253", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_8_2_0_U", "Parent" : "110"},
	{"ID" : "254", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_8_2_1_U", "Parent" : "110"},
	{"ID" : "255", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_8_2_2_U", "Parent" : "110"},
	{"ID" : "256", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_9_0_0_U", "Parent" : "110"},
	{"ID" : "257", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_9_0_1_U", "Parent" : "110"},
	{"ID" : "258", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_9_0_2_U", "Parent" : "110"},
	{"ID" : "259", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_9_1_0_U", "Parent" : "110"},
	{"ID" : "260", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_9_1_1_U", "Parent" : "110"},
	{"ID" : "261", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_9_1_2_U", "Parent" : "110"},
	{"ID" : "262", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_9_2_0_U", "Parent" : "110"},
	{"ID" : "263", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_9_2_1_U", "Parent" : "110"},
	{"ID" : "264", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_9_2_2_U", "Parent" : "110"},
	{"ID" : "265", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_10_0_0_U", "Parent" : "110"},
	{"ID" : "266", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_10_0_1_U", "Parent" : "110"},
	{"ID" : "267", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_10_0_2_U", "Parent" : "110"},
	{"ID" : "268", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_10_1_0_U", "Parent" : "110"},
	{"ID" : "269", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_10_1_1_U", "Parent" : "110"},
	{"ID" : "270", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_10_1_2_U", "Parent" : "110"},
	{"ID" : "271", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_10_2_0_U", "Parent" : "110"},
	{"ID" : "272", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_10_2_1_U", "Parent" : "110"},
	{"ID" : "273", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_10_2_2_U", "Parent" : "110"},
	{"ID" : "274", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_11_0_0_U", "Parent" : "110"},
	{"ID" : "275", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_11_0_1_U", "Parent" : "110"},
	{"ID" : "276", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_11_0_2_U", "Parent" : "110"},
	{"ID" : "277", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_11_1_0_U", "Parent" : "110"},
	{"ID" : "278", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_11_1_1_U", "Parent" : "110"},
	{"ID" : "279", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_11_1_2_U", "Parent" : "110"},
	{"ID" : "280", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_11_2_0_U", "Parent" : "110"},
	{"ID" : "281", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_11_2_1_U", "Parent" : "110"},
	{"ID" : "282", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_11_2_2_U", "Parent" : "110"},
	{"ID" : "283", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_12_0_0_U", "Parent" : "110"},
	{"ID" : "284", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_12_0_1_U", "Parent" : "110"},
	{"ID" : "285", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_12_0_2_U", "Parent" : "110"},
	{"ID" : "286", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_12_1_0_U", "Parent" : "110"},
	{"ID" : "287", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_12_1_1_U", "Parent" : "110"},
	{"ID" : "288", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_12_1_2_U", "Parent" : "110"},
	{"ID" : "289", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_12_2_0_U", "Parent" : "110"},
	{"ID" : "290", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_12_2_1_U", "Parent" : "110"},
	{"ID" : "291", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_12_2_2_U", "Parent" : "110"},
	{"ID" : "292", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_13_0_0_U", "Parent" : "110"},
	{"ID" : "293", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_13_0_1_U", "Parent" : "110"},
	{"ID" : "294", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_13_0_2_U", "Parent" : "110"},
	{"ID" : "295", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_13_1_0_U", "Parent" : "110"},
	{"ID" : "296", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_13_1_1_U", "Parent" : "110"},
	{"ID" : "297", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_13_1_2_U", "Parent" : "110"},
	{"ID" : "298", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_13_2_0_U", "Parent" : "110"},
	{"ID" : "299", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_13_2_1_U", "Parent" : "110"},
	{"ID" : "300", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_13_2_2_U", "Parent" : "110"},
	{"ID" : "301", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_14_0_0_U", "Parent" : "110"},
	{"ID" : "302", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_14_0_1_U", "Parent" : "110"},
	{"ID" : "303", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_14_0_2_U", "Parent" : "110"},
	{"ID" : "304", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_14_1_0_U", "Parent" : "110"},
	{"ID" : "305", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_14_1_1_U", "Parent" : "110"},
	{"ID" : "306", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_14_1_2_U", "Parent" : "110"},
	{"ID" : "307", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_14_2_0_U", "Parent" : "110"},
	{"ID" : "308", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_14_2_1_U", "Parent" : "110"},
	{"ID" : "309", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_14_2_2_U", "Parent" : "110"},
	{"ID" : "310", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_15_0_0_U", "Parent" : "110"},
	{"ID" : "311", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_15_0_1_U", "Parent" : "110"},
	{"ID" : "312", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_15_0_2_U", "Parent" : "110"},
	{"ID" : "313", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_15_1_0_U", "Parent" : "110"},
	{"ID" : "314", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_15_1_1_U", "Parent" : "110"},
	{"ID" : "315", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_15_1_2_U", "Parent" : "110"},
	{"ID" : "316", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_15_2_0_U", "Parent" : "110"},
	{"ID" : "317", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_15_2_1_U", "Parent" : "110"},
	{"ID" : "318", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.filter_buff_15_2_2_U", "Parent" : "110"},
	{"ID" : "319", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ofm_buff0_0_U", "Parent" : "110"},
	{"ID" : "320", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ofm_buff0_1_U", "Parent" : "110"},
	{"ID" : "321", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ofm_buff0_2_U", "Parent" : "110"},
	{"ID" : "322", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ofm_buff0_3_U", "Parent" : "110"},
	{"ID" : "323", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ofm_buff0_4_U", "Parent" : "110"},
	{"ID" : "324", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ofm_buff0_5_U", "Parent" : "110"},
	{"ID" : "325", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ofm_buff0_6_U", "Parent" : "110"},
	{"ID" : "326", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ofm_buff0_7_U", "Parent" : "110"},
	{"ID" : "327", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ofm_buff0_8_U", "Parent" : "110"},
	{"ID" : "328", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ofm_buff0_9_U", "Parent" : "110"},
	{"ID" : "329", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ofm_buff0_10_U", "Parent" : "110"},
	{"ID" : "330", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ofm_buff0_11_U", "Parent" : "110"},
	{"ID" : "331", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ofm_buff0_12_U", "Parent" : "110"},
	{"ID" : "332", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ofm_buff0_13_U", "Parent" : "110"},
	{"ID" : "333", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ofm_buff0_14_U", "Parent" : "110"},
	{"ID" : "334", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ofm_buff0_15_U", "Parent" : "110"},
	{"ID" : "335", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ofm_buff1_0_U", "Parent" : "110"},
	{"ID" : "336", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ofm_buff1_1_U", "Parent" : "110"},
	{"ID" : "337", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ofm_buff1_2_U", "Parent" : "110"},
	{"ID" : "338", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ofm_buff1_3_U", "Parent" : "110"},
	{"ID" : "339", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ofm_buff1_4_U", "Parent" : "110"},
	{"ID" : "340", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ofm_buff1_5_U", "Parent" : "110"},
	{"ID" : "341", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ofm_buff1_6_U", "Parent" : "110"},
	{"ID" : "342", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ofm_buff1_7_U", "Parent" : "110"},
	{"ID" : "343", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ofm_buff1_8_U", "Parent" : "110"},
	{"ID" : "344", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ofm_buff1_9_U", "Parent" : "110"},
	{"ID" : "345", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ofm_buff1_10_U", "Parent" : "110"},
	{"ID" : "346", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ofm_buff1_11_U", "Parent" : "110"},
	{"ID" : "347", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ofm_buff1_12_U", "Parent" : "110"},
	{"ID" : "348", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ofm_buff1_13_U", "Parent" : "110"},
	{"ID" : "349", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ofm_buff1_14_U", "Parent" : "110"},
	{"ID" : "350", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.ofm_buff1_15_U", "Parent" : "110"},
	{"ID" : "351", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.grp_conv_write_fu_1047", "Parent" : "110", "Child" : ["352", "353", "354", "355", "356", "357", "358", "359", "360", "361", "362", "363", "364", "365", "366", "367", "368", "369", "370"],
		"CDFG" : "conv_write",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "102145", "EstimateLatencyMax" : "102145",
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
			{"Name" : "filter_buff_3_0_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_3_0_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_3_0_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_3_1_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_3_1_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_3_1_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_3_2_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_3_2_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_3_2_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_4_0_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_4_0_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_4_0_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_4_1_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_4_1_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_4_1_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_4_2_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_4_2_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_4_2_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_5_0_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_5_0_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_5_0_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_5_1_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_5_1_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_5_1_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_5_2_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_5_2_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_5_2_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_6_0_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_6_0_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_6_0_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_6_1_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_6_1_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_6_1_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_6_2_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_6_2_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_6_2_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_7_0_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_7_0_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_7_0_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_7_1_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_7_1_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_7_1_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_7_2_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_7_2_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_7_2_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_8_0_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_8_0_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_8_0_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_8_1_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_8_1_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_8_1_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_8_2_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_8_2_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_8_2_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_9_0_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_9_0_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_9_0_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_9_1_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_9_1_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_9_1_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_9_2_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_9_2_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_9_2_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_10_0_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_10_0_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_10_0_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_10_1_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_10_1_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_10_1_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_10_2_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_10_2_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_10_2_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_11_0_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_11_0_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_11_0_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_11_1_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_11_1_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_11_1_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_11_2_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_11_2_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_11_2_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_12_0_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_12_0_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_12_0_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_12_1_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_12_1_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_12_1_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_12_2_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_12_2_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_12_2_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_13_0_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_13_0_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_13_0_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_13_1_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_13_1_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_13_1_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_13_2_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_13_2_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_13_2_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_14_0_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_14_0_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_14_0_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_14_1_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_14_1_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_14_1_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_14_2_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_14_2_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_14_2_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_15_0_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_15_0_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_15_0_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_15_1_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_15_1_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_15_1_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_15_2_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_15_2_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "filter_buff_15_2_2", "Type" : "Memory", "Direction" : "I"},
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
			{"Name" : "ifm_buff2_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ifm_buff2_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ifm_buff2_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ifm_buff2_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ifm_buff2_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ifm_buff2_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ifm_buff2_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ifm_buff2_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ifm_buff2_8", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ifm_buff2_9", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ifm_buff2_10", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ifm_buff2_11", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ifm_buff2_12", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ifm_buff2_13", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ifm_buff2_14", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ifm_buff2_15", "Type" : "Memory", "Direction" : "I"},
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
	{"ID" : "352", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.grp_conv_write_fu_1047.dnn_hw_fadd_32ns_Gfk_U343", "Parent" : "351"},
	{"ID" : "353", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.grp_conv_write_fu_1047.dnn_hw_fadd_32ns_Gfk_U344", "Parent" : "351"},
	{"ID" : "354", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.grp_conv_write_fu_1047.dnn_hw_fmul_32ns_Hfu_U345", "Parent" : "351"},
	{"ID" : "355", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.grp_conv_write_fu_1047.dnn_hw_fmul_32ns_Hfu_U346", "Parent" : "351"},
	{"ID" : "356", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.grp_conv_write_fu_1047.dnn_hw_mux_164_32IfE_U347", "Parent" : "351"},
	{"ID" : "357", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.grp_conv_write_fu_1047.dnn_hw_mux_164_32IfE_U348", "Parent" : "351"},
	{"ID" : "358", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.grp_conv_write_fu_1047.dnn_hw_mux_164_32IfE_U349", "Parent" : "351"},
	{"ID" : "359", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.grp_conv_write_fu_1047.dnn_hw_mux_164_32IfE_U350", "Parent" : "351"},
	{"ID" : "360", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.grp_conv_write_fu_1047.dnn_hw_mux_164_32IfE_U351", "Parent" : "351"},
	{"ID" : "361", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.grp_conv_write_fu_1047.dnn_hw_mux_164_32IfE_U352", "Parent" : "351"},
	{"ID" : "362", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.grp_conv_write_fu_1047.dnn_hw_mux_164_32IfE_U353", "Parent" : "351"},
	{"ID" : "363", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.grp_conv_write_fu_1047.dnn_hw_mux_164_32IfE_U354", "Parent" : "351"},
	{"ID" : "364", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.grp_conv_write_fu_1047.dnn_hw_mux_164_32IfE_U355", "Parent" : "351"},
	{"ID" : "365", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.grp_conv_write_fu_1047.dnn_hw_mux_164_32IfE_U356", "Parent" : "351"},
	{"ID" : "366", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.grp_conv_write_fu_1047.dnn_hw_mux_164_32IfE_U357", "Parent" : "351"},
	{"ID" : "367", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.grp_conv_write_fu_1047.dnn_hw_mux_164_32IfE_U358", "Parent" : "351"},
	{"ID" : "368", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.grp_conv_write_fu_1047.dnn_hw_mux_164_32IfE_U359", "Parent" : "351"},
	{"ID" : "369", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.grp_conv_write_fu_1047.dnn_hw_mux_164_32IfE_U360", "Parent" : "351"},
	{"ID" : "370", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.grp_conv_write_fu_1047.dnn_hw_mux_164_32IfE_U361", "Parent" : "351"},
	{"ID" : "371", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.grp_conv_read_fu_1259", "Parent" : "110",
		"CDFG" : "conv_read",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1", "EstimateLatencyMax" : "58",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "cofm", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "cofm_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "ofm_buff0_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ofm_buff0_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ofm_buff0_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ofm_buff0_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ofm_buff0_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ofm_buff0_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ofm_buff0_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ofm_buff0_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ofm_buff0_8", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ofm_buff0_9", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ofm_buff0_10", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ofm_buff0_11", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ofm_buff0_12", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ofm_buff0_13", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ofm_buff0_14", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ofm_buff0_15", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "cofm_counter_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "enable", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "372", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.grp_load_filter_buffer_fu_1284", "Parent" : "110",
		"CDFG" : "load_filter_buffer",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "258", "EstimateLatencyMax" : "258",
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
			{"Name" : "filter_buff_2_2_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_3_0_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_3_0_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_3_0_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_3_1_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_3_1_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_3_1_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_3_2_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_3_2_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_3_2_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_4_0_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_4_0_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_4_0_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_4_1_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_4_1_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_4_1_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_4_2_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_4_2_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_4_2_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_5_0_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_5_0_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_5_0_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_5_1_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_5_1_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_5_1_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_5_2_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_5_2_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_5_2_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_6_0_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_6_0_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_6_0_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_6_1_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_6_1_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_6_1_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_6_2_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_6_2_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_6_2_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_7_0_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_7_0_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_7_0_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_7_1_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_7_1_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_7_1_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_7_2_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_7_2_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_7_2_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_8_0_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_8_0_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_8_0_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_8_1_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_8_1_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_8_1_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_8_2_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_8_2_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_8_2_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_9_0_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_9_0_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_9_0_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_9_1_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_9_1_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_9_1_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_9_2_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_9_2_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_9_2_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_10_0_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_10_0_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_10_0_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_10_1_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_10_1_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_10_1_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_10_2_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_10_2_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_10_2_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_11_0_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_11_0_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_11_0_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_11_1_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_11_1_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_11_1_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_11_2_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_11_2_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_11_2_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_12_0_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_12_0_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_12_0_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_12_1_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_12_1_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_12_1_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_12_2_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_12_2_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_12_2_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_13_0_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_13_0_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_13_0_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_13_1_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_13_1_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_13_1_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_13_2_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_13_2_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_13_2_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_14_0_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_14_0_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_14_0_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_14_1_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_14_1_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_14_1_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_14_2_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_14_2_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_14_2_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_15_0_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_15_0_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_15_0_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_15_1_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_15_1_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_15_1_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_15_2_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_15_2_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_buff_15_2_2", "Type" : "Memory", "Direction" : "O"}]},
	{"ID" : "373", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.grp_write_row_ifm_fu_1578", "Parent" : "110",
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
			{"Name" : "enable", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "374", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convolution_hw_fu_46.grp_load_cifm_data_fu_1603", "Parent" : "110",
		"CDFG" : "load_cifm_data",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "180", "EstimateLatencyMax" : "180",
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
			{"Name" : "ifm_buff1_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ifm_buff1_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ifm_buff1_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ifm_buff1_3", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ifm_buff1_4", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ifm_buff1_5", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ifm_buff1_6", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ifm_buff1_7", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ifm_buff1_8", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ifm_buff1_9", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ifm_buff1_10", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ifm_buff1_11", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ifm_buff1_12", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ifm_buff1_13", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ifm_buff1_14", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ifm_buff1_15", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ifm_buff2_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ifm_buff2_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ifm_buff2_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ifm_buff2_3", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ifm_buff2_4", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ifm_buff2_5", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ifm_buff2_6", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ifm_buff2_7", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ifm_buff2_8", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ifm_buff2_9", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ifm_buff2_10", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ifm_buff2_11", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ifm_buff2_12", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ifm_buff2_13", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ifm_buff2_14", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ifm_buff2_15", "Type" : "Memory", "Direction" : "O"}]},
	{"ID" : "375", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_cifm_U", "Parent" : "0"},
	{"ID" : "376", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_cofm_U", "Parent" : "0"},
	{"ID" : "377", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_tran_wgt_U", "Parent" : "0"},
	{"ID" : "378", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_config_r_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	dnn_hw {
		cifm {Type I LastRead 5 FirstWrite -1}
		cofm {Type O LastRead -1 FirstWrite 2}
		tran_wgt {Type I LastRead 1 FirstWrite -1}
		config_r {Type I LastRead 0 FirstWrite -1}}
	pool_hw {
		cifm {Type I LastRead 3 FirstWrite -1}
		cofm {Type O LastRead -1 FirstWrite 2}}
	pool_write {
		ifm_buff0_0 {Type I LastRead 4 FirstWrite -1}
		ifm_buff0_1 {Type I LastRead 4 FirstWrite -1}
		ifm_buff0_2 {Type I LastRead 4 FirstWrite -1}
		ifm_buff0_3 {Type I LastRead 4 FirstWrite -1}
		ifm_buff0_4 {Type I LastRead 4 FirstWrite -1}
		ifm_buff0_5 {Type I LastRead 4 FirstWrite -1}
		ifm_buff0_6 {Type I LastRead 4 FirstWrite -1}
		ifm_buff0_7 {Type I LastRead 4 FirstWrite -1}
		ifm_buff0_8 {Type I LastRead 4 FirstWrite -1}
		ifm_buff0_9 {Type I LastRead 4 FirstWrite -1}
		ifm_buff0_10 {Type I LastRead 4 FirstWrite -1}
		ifm_buff0_11 {Type I LastRead 4 FirstWrite -1}
		ifm_buff0_12 {Type I LastRead 6 FirstWrite -1}
		ifm_buff0_13 {Type I LastRead 6 FirstWrite -1}
		ifm_buff0_14 {Type I LastRead 6 FirstWrite -1}
		ifm_buff0_15 {Type I LastRead 6 FirstWrite -1}
		ifm_buff1_0 {Type I LastRead 4 FirstWrite -1}
		ifm_buff1_1 {Type I LastRead 4 FirstWrite -1}
		ifm_buff1_2 {Type I LastRead 4 FirstWrite -1}
		ifm_buff1_3 {Type I LastRead 4 FirstWrite -1}
		ifm_buff1_4 {Type I LastRead 4 FirstWrite -1}
		ifm_buff1_5 {Type I LastRead 4 FirstWrite -1}
		ifm_buff1_6 {Type I LastRead 4 FirstWrite -1}
		ifm_buff1_7 {Type I LastRead 4 FirstWrite -1}
		ifm_buff1_8 {Type I LastRead 4 FirstWrite -1}
		ifm_buff1_9 {Type I LastRead 4 FirstWrite -1}
		ifm_buff1_10 {Type I LastRead 4 FirstWrite -1}
		ifm_buff1_11 {Type I LastRead 4 FirstWrite -1}
		ifm_buff1_12 {Type I LastRead 6 FirstWrite -1}
		ifm_buff1_13 {Type I LastRead 6 FirstWrite -1}
		ifm_buff1_14 {Type I LastRead 6 FirstWrite -1}
		ifm_buff1_15 {Type I LastRead 6 FirstWrite -1}
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
		ofm_buff0_12 {Type O LastRead -1 FirstWrite 9}
		ofm_buff0_13 {Type O LastRead -1 FirstWrite 9}
		ofm_buff0_14 {Type O LastRead -1 FirstWrite 9}
		ofm_buff0_15 {Type O LastRead -1 FirstWrite 9}}
	conv_read {
		cofm {Type O LastRead -1 FirstWrite 2}
		ofm_buff0_0 {Type I LastRead 1 FirstWrite -1}
		ofm_buff0_1 {Type I LastRead 1 FirstWrite -1}
		ofm_buff0_2 {Type I LastRead 1 FirstWrite -1}
		ofm_buff0_3 {Type I LastRead 1 FirstWrite -1}
		ofm_buff0_4 {Type I LastRead 1 FirstWrite -1}
		ofm_buff0_5 {Type I LastRead 1 FirstWrite -1}
		ofm_buff0_6 {Type I LastRead 1 FirstWrite -1}
		ofm_buff0_7 {Type I LastRead 1 FirstWrite -1}
		ofm_buff0_8 {Type I LastRead 1 FirstWrite -1}
		ofm_buff0_9 {Type I LastRead 1 FirstWrite -1}
		ofm_buff0_10 {Type I LastRead 1 FirstWrite -1}
		ofm_buff0_11 {Type I LastRead 1 FirstWrite -1}
		ofm_buff0_12 {Type I LastRead 1 FirstWrite -1}
		ofm_buff0_13 {Type I LastRead 1 FirstWrite -1}
		ofm_buff0_14 {Type I LastRead 1 FirstWrite -1}
		ofm_buff0_15 {Type I LastRead 1 FirstWrite -1}
		cofm_counter_read {Type I LastRead 0 FirstWrite -1}
		enable {Type I LastRead 0 FirstWrite -1}}
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
		enable {Type I LastRead 0 FirstWrite -1}}
	load_cifm_data_pool {
		cifm {Type I LastRead 3 FirstWrite -1}
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
		ifm_buff1_0 {Type O LastRead -1 FirstWrite 3}
		ifm_buff1_1 {Type O LastRead -1 FirstWrite 3}
		ifm_buff1_2 {Type O LastRead -1 FirstWrite 3}
		ifm_buff1_3 {Type O LastRead -1 FirstWrite 3}
		ifm_buff1_4 {Type O LastRead -1 FirstWrite 3}
		ifm_buff1_5 {Type O LastRead -1 FirstWrite 3}
		ifm_buff1_6 {Type O LastRead -1 FirstWrite 3}
		ifm_buff1_7 {Type O LastRead -1 FirstWrite 3}
		ifm_buff1_8 {Type O LastRead -1 FirstWrite 3}
		ifm_buff1_9 {Type O LastRead -1 FirstWrite 3}
		ifm_buff1_10 {Type O LastRead -1 FirstWrite 3}
		ifm_buff1_11 {Type O LastRead -1 FirstWrite 3}
		ifm_buff1_12 {Type O LastRead -1 FirstWrite 3}
		ifm_buff1_13 {Type O LastRead -1 FirstWrite 3}
		ifm_buff1_14 {Type O LastRead -1 FirstWrite 3}
		ifm_buff1_15 {Type O LastRead -1 FirstWrite 3}}
	convolution_hw {
		cifm {Type I LastRead 5 FirstWrite -1}
		cofm {Type O LastRead -1 FirstWrite 2}
		tran_wgt {Type I LastRead 1 FirstWrite -1}}
	conv_write {
		filter_buff_0_0_0 {Type I LastRead 2 FirstWrite -1}
		filter_buff_0_0_1 {Type I LastRead 2 FirstWrite -1}
		filter_buff_0_0_2 {Type I LastRead 2 FirstWrite -1}
		filter_buff_0_1_0 {Type I LastRead 2 FirstWrite -1}
		filter_buff_0_1_1 {Type I LastRead 2 FirstWrite -1}
		filter_buff_0_1_2 {Type I LastRead 2 FirstWrite -1}
		filter_buff_0_2_0 {Type I LastRead 2 FirstWrite -1}
		filter_buff_0_2_1 {Type I LastRead 2 FirstWrite -1}
		filter_buff_0_2_2 {Type I LastRead 2 FirstWrite -1}
		filter_buff_1_0_0 {Type I LastRead 2 FirstWrite -1}
		filter_buff_1_0_1 {Type I LastRead 2 FirstWrite -1}
		filter_buff_1_0_2 {Type I LastRead 2 FirstWrite -1}
		filter_buff_1_1_0 {Type I LastRead 2 FirstWrite -1}
		filter_buff_1_1_1 {Type I LastRead 2 FirstWrite -1}
		filter_buff_1_1_2 {Type I LastRead 2 FirstWrite -1}
		filter_buff_1_2_0 {Type I LastRead 2 FirstWrite -1}
		filter_buff_1_2_1 {Type I LastRead 2 FirstWrite -1}
		filter_buff_1_2_2 {Type I LastRead 2 FirstWrite -1}
		filter_buff_2_0_0 {Type I LastRead 2 FirstWrite -1}
		filter_buff_2_0_1 {Type I LastRead 2 FirstWrite -1}
		filter_buff_2_0_2 {Type I LastRead 2 FirstWrite -1}
		filter_buff_2_1_0 {Type I LastRead 2 FirstWrite -1}
		filter_buff_2_1_1 {Type I LastRead 2 FirstWrite -1}
		filter_buff_2_1_2 {Type I LastRead 2 FirstWrite -1}
		filter_buff_2_2_0 {Type I LastRead 2 FirstWrite -1}
		filter_buff_2_2_1 {Type I LastRead 2 FirstWrite -1}
		filter_buff_2_2_2 {Type I LastRead 2 FirstWrite -1}
		filter_buff_3_0_0 {Type I LastRead 2 FirstWrite -1}
		filter_buff_3_0_1 {Type I LastRead 2 FirstWrite -1}
		filter_buff_3_0_2 {Type I LastRead 2 FirstWrite -1}
		filter_buff_3_1_0 {Type I LastRead 2 FirstWrite -1}
		filter_buff_3_1_1 {Type I LastRead 2 FirstWrite -1}
		filter_buff_3_1_2 {Type I LastRead 2 FirstWrite -1}
		filter_buff_3_2_0 {Type I LastRead 2 FirstWrite -1}
		filter_buff_3_2_1 {Type I LastRead 2 FirstWrite -1}
		filter_buff_3_2_2 {Type I LastRead 2 FirstWrite -1}
		filter_buff_4_0_0 {Type I LastRead 2 FirstWrite -1}
		filter_buff_4_0_1 {Type I LastRead 2 FirstWrite -1}
		filter_buff_4_0_2 {Type I LastRead 2 FirstWrite -1}
		filter_buff_4_1_0 {Type I LastRead 2 FirstWrite -1}
		filter_buff_4_1_1 {Type I LastRead 2 FirstWrite -1}
		filter_buff_4_1_2 {Type I LastRead 2 FirstWrite -1}
		filter_buff_4_2_0 {Type I LastRead 2 FirstWrite -1}
		filter_buff_4_2_1 {Type I LastRead 2 FirstWrite -1}
		filter_buff_4_2_2 {Type I LastRead 2 FirstWrite -1}
		filter_buff_5_0_0 {Type I LastRead 2 FirstWrite -1}
		filter_buff_5_0_1 {Type I LastRead 2 FirstWrite -1}
		filter_buff_5_0_2 {Type I LastRead 2 FirstWrite -1}
		filter_buff_5_1_0 {Type I LastRead 2 FirstWrite -1}
		filter_buff_5_1_1 {Type I LastRead 2 FirstWrite -1}
		filter_buff_5_1_2 {Type I LastRead 2 FirstWrite -1}
		filter_buff_5_2_0 {Type I LastRead 2 FirstWrite -1}
		filter_buff_5_2_1 {Type I LastRead 2 FirstWrite -1}
		filter_buff_5_2_2 {Type I LastRead 2 FirstWrite -1}
		filter_buff_6_0_0 {Type I LastRead 2 FirstWrite -1}
		filter_buff_6_0_1 {Type I LastRead 2 FirstWrite -1}
		filter_buff_6_0_2 {Type I LastRead 2 FirstWrite -1}
		filter_buff_6_1_0 {Type I LastRead 2 FirstWrite -1}
		filter_buff_6_1_1 {Type I LastRead 2 FirstWrite -1}
		filter_buff_6_1_2 {Type I LastRead 2 FirstWrite -1}
		filter_buff_6_2_0 {Type I LastRead 2 FirstWrite -1}
		filter_buff_6_2_1 {Type I LastRead 2 FirstWrite -1}
		filter_buff_6_2_2 {Type I LastRead 2 FirstWrite -1}
		filter_buff_7_0_0 {Type I LastRead 2 FirstWrite -1}
		filter_buff_7_0_1 {Type I LastRead 2 FirstWrite -1}
		filter_buff_7_0_2 {Type I LastRead 2 FirstWrite -1}
		filter_buff_7_1_0 {Type I LastRead 2 FirstWrite -1}
		filter_buff_7_1_1 {Type I LastRead 2 FirstWrite -1}
		filter_buff_7_1_2 {Type I LastRead 2 FirstWrite -1}
		filter_buff_7_2_0 {Type I LastRead 2 FirstWrite -1}
		filter_buff_7_2_1 {Type I LastRead 2 FirstWrite -1}
		filter_buff_7_2_2 {Type I LastRead 2 FirstWrite -1}
		filter_buff_8_0_0 {Type I LastRead 2 FirstWrite -1}
		filter_buff_8_0_1 {Type I LastRead 2 FirstWrite -1}
		filter_buff_8_0_2 {Type I LastRead 2 FirstWrite -1}
		filter_buff_8_1_0 {Type I LastRead 2 FirstWrite -1}
		filter_buff_8_1_1 {Type I LastRead 2 FirstWrite -1}
		filter_buff_8_1_2 {Type I LastRead 2 FirstWrite -1}
		filter_buff_8_2_0 {Type I LastRead 2 FirstWrite -1}
		filter_buff_8_2_1 {Type I LastRead 2 FirstWrite -1}
		filter_buff_8_2_2 {Type I LastRead 2 FirstWrite -1}
		filter_buff_9_0_0 {Type I LastRead 2 FirstWrite -1}
		filter_buff_9_0_1 {Type I LastRead 2 FirstWrite -1}
		filter_buff_9_0_2 {Type I LastRead 2 FirstWrite -1}
		filter_buff_9_1_0 {Type I LastRead 2 FirstWrite -1}
		filter_buff_9_1_1 {Type I LastRead 2 FirstWrite -1}
		filter_buff_9_1_2 {Type I LastRead 2 FirstWrite -1}
		filter_buff_9_2_0 {Type I LastRead 2 FirstWrite -1}
		filter_buff_9_2_1 {Type I LastRead 2 FirstWrite -1}
		filter_buff_9_2_2 {Type I LastRead 2 FirstWrite -1}
		filter_buff_10_0_0 {Type I LastRead 2 FirstWrite -1}
		filter_buff_10_0_1 {Type I LastRead 2 FirstWrite -1}
		filter_buff_10_0_2 {Type I LastRead 2 FirstWrite -1}
		filter_buff_10_1_0 {Type I LastRead 2 FirstWrite -1}
		filter_buff_10_1_1 {Type I LastRead 2 FirstWrite -1}
		filter_buff_10_1_2 {Type I LastRead 2 FirstWrite -1}
		filter_buff_10_2_0 {Type I LastRead 2 FirstWrite -1}
		filter_buff_10_2_1 {Type I LastRead 2 FirstWrite -1}
		filter_buff_10_2_2 {Type I LastRead 2 FirstWrite -1}
		filter_buff_11_0_0 {Type I LastRead 2 FirstWrite -1}
		filter_buff_11_0_1 {Type I LastRead 2 FirstWrite -1}
		filter_buff_11_0_2 {Type I LastRead 2 FirstWrite -1}
		filter_buff_11_1_0 {Type I LastRead 2 FirstWrite -1}
		filter_buff_11_1_1 {Type I LastRead 2 FirstWrite -1}
		filter_buff_11_1_2 {Type I LastRead 2 FirstWrite -1}
		filter_buff_11_2_0 {Type I LastRead 2 FirstWrite -1}
		filter_buff_11_2_1 {Type I LastRead 2 FirstWrite -1}
		filter_buff_11_2_2 {Type I LastRead 2 FirstWrite -1}
		filter_buff_12_0_0 {Type I LastRead 2 FirstWrite -1}
		filter_buff_12_0_1 {Type I LastRead 2 FirstWrite -1}
		filter_buff_12_0_2 {Type I LastRead 2 FirstWrite -1}
		filter_buff_12_1_0 {Type I LastRead 2 FirstWrite -1}
		filter_buff_12_1_1 {Type I LastRead 2 FirstWrite -1}
		filter_buff_12_1_2 {Type I LastRead 2 FirstWrite -1}
		filter_buff_12_2_0 {Type I LastRead 2 FirstWrite -1}
		filter_buff_12_2_1 {Type I LastRead 2 FirstWrite -1}
		filter_buff_12_2_2 {Type I LastRead 2 FirstWrite -1}
		filter_buff_13_0_0 {Type I LastRead 2 FirstWrite -1}
		filter_buff_13_0_1 {Type I LastRead 2 FirstWrite -1}
		filter_buff_13_0_2 {Type I LastRead 2 FirstWrite -1}
		filter_buff_13_1_0 {Type I LastRead 2 FirstWrite -1}
		filter_buff_13_1_1 {Type I LastRead 2 FirstWrite -1}
		filter_buff_13_1_2 {Type I LastRead 2 FirstWrite -1}
		filter_buff_13_2_0 {Type I LastRead 2 FirstWrite -1}
		filter_buff_13_2_1 {Type I LastRead 2 FirstWrite -1}
		filter_buff_13_2_2 {Type I LastRead 2 FirstWrite -1}
		filter_buff_14_0_0 {Type I LastRead 2 FirstWrite -1}
		filter_buff_14_0_1 {Type I LastRead 2 FirstWrite -1}
		filter_buff_14_0_2 {Type I LastRead 2 FirstWrite -1}
		filter_buff_14_1_0 {Type I LastRead 2 FirstWrite -1}
		filter_buff_14_1_1 {Type I LastRead 2 FirstWrite -1}
		filter_buff_14_1_2 {Type I LastRead 2 FirstWrite -1}
		filter_buff_14_2_0 {Type I LastRead 2 FirstWrite -1}
		filter_buff_14_2_1 {Type I LastRead 2 FirstWrite -1}
		filter_buff_14_2_2 {Type I LastRead 2 FirstWrite -1}
		filter_buff_15_0_0 {Type I LastRead 2 FirstWrite -1}
		filter_buff_15_0_1 {Type I LastRead 2 FirstWrite -1}
		filter_buff_15_0_2 {Type I LastRead 2 FirstWrite -1}
		filter_buff_15_1_0 {Type I LastRead 2 FirstWrite -1}
		filter_buff_15_1_1 {Type I LastRead 2 FirstWrite -1}
		filter_buff_15_1_2 {Type I LastRead 2 FirstWrite -1}
		filter_buff_15_2_0 {Type I LastRead 2 FirstWrite -1}
		filter_buff_15_2_1 {Type I LastRead 2 FirstWrite -1}
		filter_buff_15_2_2 {Type I LastRead 2 FirstWrite -1}
		ifm_buff0_0 {Type I LastRead 4 FirstWrite -1}
		ifm_buff0_1 {Type I LastRead 4 FirstWrite -1}
		ifm_buff0_2 {Type I LastRead 4 FirstWrite -1}
		ifm_buff0_3 {Type I LastRead 4 FirstWrite -1}
		ifm_buff0_4 {Type I LastRead 4 FirstWrite -1}
		ifm_buff0_5 {Type I LastRead 4 FirstWrite -1}
		ifm_buff0_6 {Type I LastRead 4 FirstWrite -1}
		ifm_buff0_7 {Type I LastRead 4 FirstWrite -1}
		ifm_buff0_8 {Type I LastRead 4 FirstWrite -1}
		ifm_buff0_9 {Type I LastRead 4 FirstWrite -1}
		ifm_buff0_10 {Type I LastRead 4 FirstWrite -1}
		ifm_buff0_11 {Type I LastRead 4 FirstWrite -1}
		ifm_buff0_12 {Type I LastRead 4 FirstWrite -1}
		ifm_buff0_13 {Type I LastRead 4 FirstWrite -1}
		ifm_buff0_14 {Type I LastRead 4 FirstWrite -1}
		ifm_buff0_15 {Type I LastRead 4 FirstWrite -1}
		ifm_buff1_0 {Type I LastRead 4 FirstWrite -1}
		ifm_buff1_1 {Type I LastRead 4 FirstWrite -1}
		ifm_buff1_2 {Type I LastRead 4 FirstWrite -1}
		ifm_buff1_3 {Type I LastRead 4 FirstWrite -1}
		ifm_buff1_4 {Type I LastRead 4 FirstWrite -1}
		ifm_buff1_5 {Type I LastRead 4 FirstWrite -1}
		ifm_buff1_6 {Type I LastRead 4 FirstWrite -1}
		ifm_buff1_7 {Type I LastRead 4 FirstWrite -1}
		ifm_buff1_8 {Type I LastRead 4 FirstWrite -1}
		ifm_buff1_9 {Type I LastRead 4 FirstWrite -1}
		ifm_buff1_10 {Type I LastRead 4 FirstWrite -1}
		ifm_buff1_11 {Type I LastRead 4 FirstWrite -1}
		ifm_buff1_12 {Type I LastRead 4 FirstWrite -1}
		ifm_buff1_13 {Type I LastRead 4 FirstWrite -1}
		ifm_buff1_14 {Type I LastRead 4 FirstWrite -1}
		ifm_buff1_15 {Type I LastRead 4 FirstWrite -1}
		ifm_buff2_0 {Type I LastRead 4 FirstWrite -1}
		ifm_buff2_1 {Type I LastRead 4 FirstWrite -1}
		ifm_buff2_2 {Type I LastRead 4 FirstWrite -1}
		ifm_buff2_3 {Type I LastRead 4 FirstWrite -1}
		ifm_buff2_4 {Type I LastRead 4 FirstWrite -1}
		ifm_buff2_5 {Type I LastRead 4 FirstWrite -1}
		ifm_buff2_6 {Type I LastRead 4 FirstWrite -1}
		ifm_buff2_7 {Type I LastRead 4 FirstWrite -1}
		ifm_buff2_8 {Type I LastRead 4 FirstWrite -1}
		ifm_buff2_9 {Type I LastRead 4 FirstWrite -1}
		ifm_buff2_10 {Type I LastRead 4 FirstWrite -1}
		ifm_buff2_11 {Type I LastRead 4 FirstWrite -1}
		ifm_buff2_12 {Type I LastRead 4 FirstWrite -1}
		ifm_buff2_13 {Type I LastRead 4 FirstWrite -1}
		ifm_buff2_14 {Type I LastRead 4 FirstWrite -1}
		ifm_buff2_15 {Type I LastRead 4 FirstWrite -1}
		ofm_buff0_0 {Type O LastRead -1 FirstWrite 3}
		ofm_buff0_1 {Type O LastRead -1 FirstWrite 3}
		ofm_buff0_2 {Type O LastRead -1 FirstWrite 3}
		ofm_buff0_3 {Type O LastRead -1 FirstWrite 3}
		ofm_buff0_4 {Type O LastRead -1 FirstWrite 3}
		ofm_buff0_5 {Type O LastRead -1 FirstWrite 3}
		ofm_buff0_6 {Type O LastRead -1 FirstWrite 3}
		ofm_buff0_7 {Type O LastRead -1 FirstWrite 3}
		ofm_buff0_8 {Type O LastRead -1 FirstWrite 3}
		ofm_buff0_9 {Type O LastRead -1 FirstWrite 3}
		ofm_buff0_10 {Type O LastRead -1 FirstWrite 3}
		ofm_buff0_11 {Type O LastRead -1 FirstWrite 3}
		ofm_buff0_12 {Type O LastRead -1 FirstWrite 3}
		ofm_buff0_13 {Type O LastRead -1 FirstWrite 3}
		ofm_buff0_14 {Type O LastRead -1 FirstWrite 3}
		ofm_buff0_15 {Type O LastRead -1 FirstWrite 3}}
	conv_read {
		cofm {Type O LastRead -1 FirstWrite 2}
		ofm_buff0_0 {Type I LastRead 1 FirstWrite -1}
		ofm_buff0_1 {Type I LastRead 1 FirstWrite -1}
		ofm_buff0_2 {Type I LastRead 1 FirstWrite -1}
		ofm_buff0_3 {Type I LastRead 1 FirstWrite -1}
		ofm_buff0_4 {Type I LastRead 1 FirstWrite -1}
		ofm_buff0_5 {Type I LastRead 1 FirstWrite -1}
		ofm_buff0_6 {Type I LastRead 1 FirstWrite -1}
		ofm_buff0_7 {Type I LastRead 1 FirstWrite -1}
		ofm_buff0_8 {Type I LastRead 1 FirstWrite -1}
		ofm_buff0_9 {Type I LastRead 1 FirstWrite -1}
		ofm_buff0_10 {Type I LastRead 1 FirstWrite -1}
		ofm_buff0_11 {Type I LastRead 1 FirstWrite -1}
		ofm_buff0_12 {Type I LastRead 1 FirstWrite -1}
		ofm_buff0_13 {Type I LastRead 1 FirstWrite -1}
		ofm_buff0_14 {Type I LastRead 1 FirstWrite -1}
		ofm_buff0_15 {Type I LastRead 1 FirstWrite -1}
		cofm_counter_read {Type I LastRead 0 FirstWrite -1}
		enable {Type I LastRead 0 FirstWrite -1}}
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
		filter_buff_2_2_2 {Type O LastRead -1 FirstWrite 1}
		filter_buff_3_0_0 {Type O LastRead -1 FirstWrite 1}
		filter_buff_3_0_1 {Type O LastRead -1 FirstWrite 1}
		filter_buff_3_0_2 {Type O LastRead -1 FirstWrite 1}
		filter_buff_3_1_0 {Type O LastRead -1 FirstWrite 1}
		filter_buff_3_1_1 {Type O LastRead -1 FirstWrite 1}
		filter_buff_3_1_2 {Type O LastRead -1 FirstWrite 1}
		filter_buff_3_2_0 {Type O LastRead -1 FirstWrite 1}
		filter_buff_3_2_1 {Type O LastRead -1 FirstWrite 1}
		filter_buff_3_2_2 {Type O LastRead -1 FirstWrite 1}
		filter_buff_4_0_0 {Type O LastRead -1 FirstWrite 1}
		filter_buff_4_0_1 {Type O LastRead -1 FirstWrite 1}
		filter_buff_4_0_2 {Type O LastRead -1 FirstWrite 1}
		filter_buff_4_1_0 {Type O LastRead -1 FirstWrite 1}
		filter_buff_4_1_1 {Type O LastRead -1 FirstWrite 1}
		filter_buff_4_1_2 {Type O LastRead -1 FirstWrite 1}
		filter_buff_4_2_0 {Type O LastRead -1 FirstWrite 1}
		filter_buff_4_2_1 {Type O LastRead -1 FirstWrite 1}
		filter_buff_4_2_2 {Type O LastRead -1 FirstWrite 1}
		filter_buff_5_0_0 {Type O LastRead -1 FirstWrite 1}
		filter_buff_5_0_1 {Type O LastRead -1 FirstWrite 1}
		filter_buff_5_0_2 {Type O LastRead -1 FirstWrite 1}
		filter_buff_5_1_0 {Type O LastRead -1 FirstWrite 1}
		filter_buff_5_1_1 {Type O LastRead -1 FirstWrite 1}
		filter_buff_5_1_2 {Type O LastRead -1 FirstWrite 1}
		filter_buff_5_2_0 {Type O LastRead -1 FirstWrite 1}
		filter_buff_5_2_1 {Type O LastRead -1 FirstWrite 1}
		filter_buff_5_2_2 {Type O LastRead -1 FirstWrite 1}
		filter_buff_6_0_0 {Type O LastRead -1 FirstWrite 1}
		filter_buff_6_0_1 {Type O LastRead -1 FirstWrite 1}
		filter_buff_6_0_2 {Type O LastRead -1 FirstWrite 1}
		filter_buff_6_1_0 {Type O LastRead -1 FirstWrite 1}
		filter_buff_6_1_1 {Type O LastRead -1 FirstWrite 1}
		filter_buff_6_1_2 {Type O LastRead -1 FirstWrite 1}
		filter_buff_6_2_0 {Type O LastRead -1 FirstWrite 1}
		filter_buff_6_2_1 {Type O LastRead -1 FirstWrite 1}
		filter_buff_6_2_2 {Type O LastRead -1 FirstWrite 1}
		filter_buff_7_0_0 {Type O LastRead -1 FirstWrite 1}
		filter_buff_7_0_1 {Type O LastRead -1 FirstWrite 1}
		filter_buff_7_0_2 {Type O LastRead -1 FirstWrite 1}
		filter_buff_7_1_0 {Type O LastRead -1 FirstWrite 1}
		filter_buff_7_1_1 {Type O LastRead -1 FirstWrite 1}
		filter_buff_7_1_2 {Type O LastRead -1 FirstWrite 1}
		filter_buff_7_2_0 {Type O LastRead -1 FirstWrite 1}
		filter_buff_7_2_1 {Type O LastRead -1 FirstWrite 1}
		filter_buff_7_2_2 {Type O LastRead -1 FirstWrite 1}
		filter_buff_8_0_0 {Type O LastRead -1 FirstWrite 1}
		filter_buff_8_0_1 {Type O LastRead -1 FirstWrite 1}
		filter_buff_8_0_2 {Type O LastRead -1 FirstWrite 1}
		filter_buff_8_1_0 {Type O LastRead -1 FirstWrite 1}
		filter_buff_8_1_1 {Type O LastRead -1 FirstWrite 1}
		filter_buff_8_1_2 {Type O LastRead -1 FirstWrite 1}
		filter_buff_8_2_0 {Type O LastRead -1 FirstWrite 1}
		filter_buff_8_2_1 {Type O LastRead -1 FirstWrite 1}
		filter_buff_8_2_2 {Type O LastRead -1 FirstWrite 1}
		filter_buff_9_0_0 {Type O LastRead -1 FirstWrite 1}
		filter_buff_9_0_1 {Type O LastRead -1 FirstWrite 1}
		filter_buff_9_0_2 {Type O LastRead -1 FirstWrite 1}
		filter_buff_9_1_0 {Type O LastRead -1 FirstWrite 1}
		filter_buff_9_1_1 {Type O LastRead -1 FirstWrite 1}
		filter_buff_9_1_2 {Type O LastRead -1 FirstWrite 1}
		filter_buff_9_2_0 {Type O LastRead -1 FirstWrite 1}
		filter_buff_9_2_1 {Type O LastRead -1 FirstWrite 1}
		filter_buff_9_2_2 {Type O LastRead -1 FirstWrite 1}
		filter_buff_10_0_0 {Type O LastRead -1 FirstWrite 1}
		filter_buff_10_0_1 {Type O LastRead -1 FirstWrite 1}
		filter_buff_10_0_2 {Type O LastRead -1 FirstWrite 1}
		filter_buff_10_1_0 {Type O LastRead -1 FirstWrite 1}
		filter_buff_10_1_1 {Type O LastRead -1 FirstWrite 1}
		filter_buff_10_1_2 {Type O LastRead -1 FirstWrite 1}
		filter_buff_10_2_0 {Type O LastRead -1 FirstWrite 1}
		filter_buff_10_2_1 {Type O LastRead -1 FirstWrite 1}
		filter_buff_10_2_2 {Type O LastRead -1 FirstWrite 1}
		filter_buff_11_0_0 {Type O LastRead -1 FirstWrite 1}
		filter_buff_11_0_1 {Type O LastRead -1 FirstWrite 1}
		filter_buff_11_0_2 {Type O LastRead -1 FirstWrite 1}
		filter_buff_11_1_0 {Type O LastRead -1 FirstWrite 1}
		filter_buff_11_1_1 {Type O LastRead -1 FirstWrite 1}
		filter_buff_11_1_2 {Type O LastRead -1 FirstWrite 1}
		filter_buff_11_2_0 {Type O LastRead -1 FirstWrite 1}
		filter_buff_11_2_1 {Type O LastRead -1 FirstWrite 1}
		filter_buff_11_2_2 {Type O LastRead -1 FirstWrite 1}
		filter_buff_12_0_0 {Type O LastRead -1 FirstWrite 1}
		filter_buff_12_0_1 {Type O LastRead -1 FirstWrite 1}
		filter_buff_12_0_2 {Type O LastRead -1 FirstWrite 1}
		filter_buff_12_1_0 {Type O LastRead -1 FirstWrite 1}
		filter_buff_12_1_1 {Type O LastRead -1 FirstWrite 1}
		filter_buff_12_1_2 {Type O LastRead -1 FirstWrite 1}
		filter_buff_12_2_0 {Type O LastRead -1 FirstWrite 1}
		filter_buff_12_2_1 {Type O LastRead -1 FirstWrite 1}
		filter_buff_12_2_2 {Type O LastRead -1 FirstWrite 1}
		filter_buff_13_0_0 {Type O LastRead -1 FirstWrite 1}
		filter_buff_13_0_1 {Type O LastRead -1 FirstWrite 1}
		filter_buff_13_0_2 {Type O LastRead -1 FirstWrite 1}
		filter_buff_13_1_0 {Type O LastRead -1 FirstWrite 1}
		filter_buff_13_1_1 {Type O LastRead -1 FirstWrite 1}
		filter_buff_13_1_2 {Type O LastRead -1 FirstWrite 1}
		filter_buff_13_2_0 {Type O LastRead -1 FirstWrite 1}
		filter_buff_13_2_1 {Type O LastRead -1 FirstWrite 1}
		filter_buff_13_2_2 {Type O LastRead -1 FirstWrite 1}
		filter_buff_14_0_0 {Type O LastRead -1 FirstWrite 1}
		filter_buff_14_0_1 {Type O LastRead -1 FirstWrite 1}
		filter_buff_14_0_2 {Type O LastRead -1 FirstWrite 1}
		filter_buff_14_1_0 {Type O LastRead -1 FirstWrite 1}
		filter_buff_14_1_1 {Type O LastRead -1 FirstWrite 1}
		filter_buff_14_1_2 {Type O LastRead -1 FirstWrite 1}
		filter_buff_14_2_0 {Type O LastRead -1 FirstWrite 1}
		filter_buff_14_2_1 {Type O LastRead -1 FirstWrite 1}
		filter_buff_14_2_2 {Type O LastRead -1 FirstWrite 1}
		filter_buff_15_0_0 {Type O LastRead -1 FirstWrite 1}
		filter_buff_15_0_1 {Type O LastRead -1 FirstWrite 1}
		filter_buff_15_0_2 {Type O LastRead -1 FirstWrite 1}
		filter_buff_15_1_0 {Type O LastRead -1 FirstWrite 1}
		filter_buff_15_1_1 {Type O LastRead -1 FirstWrite 1}
		filter_buff_15_1_2 {Type O LastRead -1 FirstWrite 1}
		filter_buff_15_2_0 {Type O LastRead -1 FirstWrite 1}
		filter_buff_15_2_1 {Type O LastRead -1 FirstWrite 1}
		filter_buff_15_2_2 {Type O LastRead -1 FirstWrite 1}}
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
		enable {Type I LastRead 0 FirstWrite -1}}
	load_cifm_data {
		cifm {Type I LastRead 5 FirstWrite -1}
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
		ifm_buff1_0 {Type O LastRead -1 FirstWrite 3}
		ifm_buff1_1 {Type O LastRead -1 FirstWrite 3}
		ifm_buff1_2 {Type O LastRead -1 FirstWrite 3}
		ifm_buff1_3 {Type O LastRead -1 FirstWrite 3}
		ifm_buff1_4 {Type O LastRead -1 FirstWrite 3}
		ifm_buff1_5 {Type O LastRead -1 FirstWrite 3}
		ifm_buff1_6 {Type O LastRead -1 FirstWrite 3}
		ifm_buff1_7 {Type O LastRead -1 FirstWrite 3}
		ifm_buff1_8 {Type O LastRead -1 FirstWrite 3}
		ifm_buff1_9 {Type O LastRead -1 FirstWrite 3}
		ifm_buff1_10 {Type O LastRead -1 FirstWrite 3}
		ifm_buff1_11 {Type O LastRead -1 FirstWrite 3}
		ifm_buff1_12 {Type O LastRead -1 FirstWrite 3}
		ifm_buff1_13 {Type O LastRead -1 FirstWrite 3}
		ifm_buff1_14 {Type O LastRead -1 FirstWrite 3}
		ifm_buff1_15 {Type O LastRead -1 FirstWrite 3}
		ifm_buff2_0 {Type O LastRead -1 FirstWrite 5}
		ifm_buff2_1 {Type O LastRead -1 FirstWrite 5}
		ifm_buff2_2 {Type O LastRead -1 FirstWrite 5}
		ifm_buff2_3 {Type O LastRead -1 FirstWrite 5}
		ifm_buff2_4 {Type O LastRead -1 FirstWrite 5}
		ifm_buff2_5 {Type O LastRead -1 FirstWrite 5}
		ifm_buff2_6 {Type O LastRead -1 FirstWrite 5}
		ifm_buff2_7 {Type O LastRead -1 FirstWrite 5}
		ifm_buff2_8 {Type O LastRead -1 FirstWrite 5}
		ifm_buff2_9 {Type O LastRead -1 FirstWrite 5}
		ifm_buff2_10 {Type O LastRead -1 FirstWrite 5}
		ifm_buff2_11 {Type O LastRead -1 FirstWrite 5}
		ifm_buff2_12 {Type O LastRead -1 FirstWrite 5}
		ifm_buff2_13 {Type O LastRead -1 FirstWrite 5}
		ifm_buff2_14 {Type O LastRead -1 FirstWrite 5}
		ifm_buff2_15 {Type O LastRead -1 FirstWrite 5}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2", "Max" : "5720553"}
	, {"Name" : "Interval", "Min" : "3", "Max" : "5720554"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	cifm { axis {  { cifm_TDATA in_data 0 512 }  { cifm_TVALID in_vld 0 1 }  { cifm_TREADY in_acc 1 1 } } }
	cofm { axis {  { cofm_TDATA out_data 1 512 }  { cofm_TVALID out_vld 1 1 }  { cofm_TREADY out_acc 0 1 } } }
	tran_wgt { axis {  { tran_wgt_TDATA in_data 0 512 }  { tran_wgt_TVALID in_vld 0 1 }  { tran_wgt_TREADY in_acc 1 1 } } }
	config_r { axis {  { config_r_TDATA in_data 0 32 }  { config_r_TVALID in_vld 0 1 }  { config_r_TREADY in_acc 1 1 } } }
}

set busDeadlockParameterList { 
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
