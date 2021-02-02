set moduleName convolution_hw
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
set C_modelName {convolution_hw}
set C_modelType { void 0 }
set C_modelArgList {
	{ cifm int 512 regular {axi_s 0 volatile  { cifm Data } }  }
	{ cofm int 512 regular {axi_s 2 ""  { cofm Data } }  }
	{ tran_wgt int 512 regular {axi_s 0 volatile  { tran_wgt Data } }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "cifm", "interface" : "axis", "bitwidth" : 512, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "cifm.a0","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":32,"up":63,"cElement": [{"cName": "cifm.a1","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":64,"up":95,"cElement": [{"cName": "cifm.a2","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":96,"up":127,"cElement": [{"cName": "cifm.a3","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":128,"up":159,"cElement": [{"cName": "cifm.a4","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":160,"up":191,"cElement": [{"cName": "cifm.a5","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":192,"up":223,"cElement": [{"cName": "cifm.a6","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":224,"up":255,"cElement": [{"cName": "cifm.a7","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":256,"up":287,"cElement": [{"cName": "cifm.a8","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":288,"up":319,"cElement": [{"cName": "cifm.a9","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":320,"up":351,"cElement": [{"cName": "cifm.a10","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":352,"up":383,"cElement": [{"cName": "cifm.a11","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":384,"up":415,"cElement": [{"cName": "cifm.a12","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":416,"up":447,"cElement": [{"cName": "cifm.a13","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":448,"up":479,"cElement": [{"cName": "cifm.a14","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":480,"up":511,"cElement": [{"cName": "cifm.a15","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "cofm", "interface" : "axis", "bitwidth" : 512, "direction" : "READWRITE", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "cofm.b0","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":32,"up":63,"cElement": [{"cName": "cofm.b1","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":64,"up":95,"cElement": [{"cName": "cofm.b2","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":96,"up":127,"cElement": [{"cName": "cofm.b3","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":128,"up":159,"cElement": [{"cName": "cofm.b4","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":160,"up":191,"cElement": [{"cName": "cofm.b5","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":192,"up":223,"cElement": [{"cName": "cofm.b6","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":224,"up":255,"cElement": [{"cName": "cofm.b7","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":256,"up":287,"cElement": [{"cName": "cofm.b8","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":288,"up":319,"cElement": [{"cName": "cofm.b9","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":320,"up":351,"cElement": [{"cName": "cofm.b10","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":352,"up":383,"cElement": [{"cName": "cofm.b11","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":384,"up":415,"cElement": [{"cName": "cofm.b12","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":416,"up":447,"cElement": [{"cName": "cofm.b13","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":448,"up":479,"cElement": [{"cName": "cofm.b14","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":480,"up":511,"cElement": [{"cName": "cofm.b15","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "tran_wgt", "interface" : "axis", "bitwidth" : 512, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "tran_wgt.f0","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":32,"up":63,"cElement": [{"cName": "tran_wgt.f1","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":64,"up":95,"cElement": [{"cName": "tran_wgt.f2","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":96,"up":127,"cElement": [{"cName": "tran_wgt.f3","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":128,"up":159,"cElement": [{"cName": "tran_wgt.f4","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":160,"up":191,"cElement": [{"cName": "tran_wgt.f5","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":192,"up":223,"cElement": [{"cName": "tran_wgt.f6","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":224,"up":255,"cElement": [{"cName": "tran_wgt.f7","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":256,"up":287,"cElement": [{"cName": "tran_wgt.f8","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":288,"up":319,"cElement": [{"cName": "tran_wgt.f9","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":320,"up":351,"cElement": [{"cName": "tran_wgt.f10","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":352,"up":383,"cElement": [{"cName": "tran_wgt.f11","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":384,"up":415,"cElement": [{"cName": "tran_wgt.f12","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":416,"up":447,"cElement": [{"cName": "tran_wgt.f13","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":448,"up":479,"cElement": [{"cName": "tran_wgt.f14","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":480,"up":511,"cElement": [{"cName": "tran_wgt.f15","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} ]}
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
	{ cofm_i_TDATA sc_in sc_lv 512 signal 1 } 
	{ cofm_i_TVALID sc_in sc_logic 1 invld 1 } 
	{ cofm_i_TREADY sc_out sc_logic 1 inacc 1 } 
	{ cofm_o_TDATA sc_out sc_lv 512 signal 1 } 
	{ cofm_o_TVALID sc_out sc_logic 1 outvld 1 } 
	{ cofm_o_TREADY sc_in sc_logic 1 outacc 1 } 
	{ tran_wgt_TDATA sc_in sc_lv 512 signal 2 } 
	{ tran_wgt_TVALID sc_in sc_logic 1 invld 2 } 
	{ tran_wgt_TREADY sc_out sc_logic 1 inacc 2 } 
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
 	{ "name": "cofm_i_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "cofm", "role": "i_TDATA" }} , 
 	{ "name": "cofm_i_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "cofm", "role": "i_TVALID" }} , 
 	{ "name": "cofm_i_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "cofm", "role": "i_TREADY" }} , 
 	{ "name": "cofm_o_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "cofm", "role": "o_TDATA" }} , 
 	{ "name": "cofm_o_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "cofm", "role": "o_TVALID" }} , 
 	{ "name": "cofm_o_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "cofm", "role": "o_TREADY" }} , 
 	{ "name": "tran_wgt_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "tran_wgt", "role": "TDATA" }} , 
 	{ "name": "tran_wgt_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "tran_wgt", "role": "TVALID" }} , 
 	{ "name": "tran_wgt_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "tran_wgt", "role": "TREADY" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "81", "82", "83", "84", "85", "86", "87", "88"],
		"CDFG" : "convolution_hw",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "178", "EstimateLatencyMax" : "13940",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"WaitState" : [
			{"State" : "ap_ST_fsm_state5", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_conv_write_fu_297"},
			{"State" : "ap_ST_fsm_state5", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_conv_write_fu_297"},
			{"State" : "ap_ST_fsm_state5", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_conv_write_fu_297"},
			{"State" : "ap_ST_fsm_state5", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_conv_write_fu_297"},
			{"State" : "ap_ST_fsm_state5", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_conv_read_fu_343"},
			{"State" : "ap_ST_fsm_state5", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_conv_read_fu_343"},
			{"State" : "ap_ST_fsm_state5", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_conv_read_fu_343"},
			{"State" : "ap_ST_fsm_state5", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_conv_read_fu_343"},
			{"State" : "ap_ST_fsm_state6", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_conv_read_fu_343"},
			{"State" : "ap_ST_fsm_state5", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_write_row_ifm_fu_358"},
			{"State" : "ap_ST_fsm_state5", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_write_row_ifm_fu_358"},
			{"State" : "ap_ST_fsm_state5", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_write_row_ifm_fu_358"},
			{"State" : "ap_ST_fsm_state5", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_write_row_ifm_fu_358"},
			{"State" : "ap_ST_fsm_state3", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_load_cifm_data_fu_370"},
			{"State" : "ap_ST_fsm_state3", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_load_filter_buffer_fu_385"}],
		"Port" : [
			{"Name" : "cifm", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "83", "SubInstance" : "grp_load_cifm_data_fu_370", "Port" : "cifm"},
					{"ID" : "82", "SubInstance" : "grp_write_row_ifm_fu_358", "Port" : "cifm"}]},
			{"Name" : "cofm", "Type" : "Axis", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "81", "SubInstance" : "grp_conv_read_fu_343", "Port" : "cofm"}]},
			{"Name" : "tran_wgt", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "84", "SubInstance" : "grp_load_filter_buffer_fu_385", "Port" : "wgt"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff0_0_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff0_1_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff0_2_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff1_0_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff1_1_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff1_2_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff2_0_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff2_1_U", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff2_2_U", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff3_0_U", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff3_1_U", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff3_2_U", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_0_0_0_U", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_0_0_1_U", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_0_0_2_U", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_0_1_0_U", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_0_1_1_U", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_0_1_2_U", "Parent" : "0"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_0_2_0_U", "Parent" : "0"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_0_2_1_U", "Parent" : "0"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_0_2_2_U", "Parent" : "0"},
	{"ID" : "22", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_1_0_0_U", "Parent" : "0"},
	{"ID" : "23", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_1_0_1_U", "Parent" : "0"},
	{"ID" : "24", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_1_0_2_U", "Parent" : "0"},
	{"ID" : "25", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_1_1_0_U", "Parent" : "0"},
	{"ID" : "26", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_1_1_1_U", "Parent" : "0"},
	{"ID" : "27", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_1_1_2_U", "Parent" : "0"},
	{"ID" : "28", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_1_2_0_U", "Parent" : "0"},
	{"ID" : "29", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_1_2_1_U", "Parent" : "0"},
	{"ID" : "30", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_1_2_2_U", "Parent" : "0"},
	{"ID" : "31", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_2_0_0_U", "Parent" : "0"},
	{"ID" : "32", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_2_0_1_U", "Parent" : "0"},
	{"ID" : "33", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_2_0_2_U", "Parent" : "0"},
	{"ID" : "34", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_2_1_0_U", "Parent" : "0"},
	{"ID" : "35", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_2_1_1_U", "Parent" : "0"},
	{"ID" : "36", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_2_1_2_U", "Parent" : "0"},
	{"ID" : "37", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_2_2_0_U", "Parent" : "0"},
	{"ID" : "38", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_2_2_1_U", "Parent" : "0"},
	{"ID" : "39", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_2_2_2_U", "Parent" : "0"},
	{"ID" : "40", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff0_0_U", "Parent" : "0"},
	{"ID" : "41", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff0_1_U", "Parent" : "0"},
	{"ID" : "42", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff0_2_U", "Parent" : "0"},
	{"ID" : "43", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff0_3_U", "Parent" : "0"},
	{"ID" : "44", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff0_4_U", "Parent" : "0"},
	{"ID" : "45", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff0_5_U", "Parent" : "0"},
	{"ID" : "46", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff1_0_U", "Parent" : "0"},
	{"ID" : "47", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff1_1_U", "Parent" : "0"},
	{"ID" : "48", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff1_2_U", "Parent" : "0"},
	{"ID" : "49", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff1_3_U", "Parent" : "0"},
	{"ID" : "50", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff1_4_U", "Parent" : "0"},
	{"ID" : "51", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff1_5_U", "Parent" : "0"},
	{"ID" : "52", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_conv_write_fu_297", "Parent" : "0", "Child" : ["53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80"],
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
	{"ID" : "53", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv_write_fu_297.convolution_hw_fabkb_U45", "Parent" : "52"},
	{"ID" : "54", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv_write_fu_297.convolution_hw_fabkb_U46", "Parent" : "52"},
	{"ID" : "55", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv_write_fu_297.convolution_hw_fabkb_U47", "Parent" : "52"},
	{"ID" : "56", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv_write_fu_297.convolution_hw_fabkb_U48", "Parent" : "52"},
	{"ID" : "57", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv_write_fu_297.convolution_hw_fabkb_U49", "Parent" : "52"},
	{"ID" : "58", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv_write_fu_297.convolution_hw_fabkb_U50", "Parent" : "52"},
	{"ID" : "59", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv_write_fu_297.convolution_hw_fabkb_U51", "Parent" : "52"},
	{"ID" : "60", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv_write_fu_297.convolution_hw_fabkb_U52", "Parent" : "52"},
	{"ID" : "61", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv_write_fu_297.convolution_hw_fabkb_U53", "Parent" : "52"},
	{"ID" : "62", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv_write_fu_297.convolution_hw_fabkb_U54", "Parent" : "52"},
	{"ID" : "63", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv_write_fu_297.convolution_hw_fabkb_U55", "Parent" : "52"},
	{"ID" : "64", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv_write_fu_297.convolution_hw_fabkb_U56", "Parent" : "52"},
	{"ID" : "65", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv_write_fu_297.convolution_hw_fabkb_U57", "Parent" : "52"},
	{"ID" : "66", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv_write_fu_297.convolution_hw_fabkb_U58", "Parent" : "52"},
	{"ID" : "67", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv_write_fu_297.convolution_hw_fmcud_U59", "Parent" : "52"},
	{"ID" : "68", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv_write_fu_297.convolution_hw_fmcud_U60", "Parent" : "52"},
	{"ID" : "69", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv_write_fu_297.convolution_hw_fmcud_U61", "Parent" : "52"},
	{"ID" : "70", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv_write_fu_297.convolution_hw_fmcud_U62", "Parent" : "52"},
	{"ID" : "71", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv_write_fu_297.convolution_hw_fmcud_U63", "Parent" : "52"},
	{"ID" : "72", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv_write_fu_297.convolution_hw_fmcud_U64", "Parent" : "52"},
	{"ID" : "73", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv_write_fu_297.convolution_hw_fmcud_U65", "Parent" : "52"},
	{"ID" : "74", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv_write_fu_297.convolution_hw_fmcud_U66", "Parent" : "52"},
	{"ID" : "75", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv_write_fu_297.convolution_hw_fmcud_U67", "Parent" : "52"},
	{"ID" : "76", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv_write_fu_297.convolution_hw_fmcud_U68", "Parent" : "52"},
	{"ID" : "77", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv_write_fu_297.convolution_hw_fmcud_U69", "Parent" : "52"},
	{"ID" : "78", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv_write_fu_297.convolution_hw_fmcud_U70", "Parent" : "52"},
	{"ID" : "79", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv_write_fu_297.convolution_hw_fmcud_U71", "Parent" : "52"},
	{"ID" : "80", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv_write_fu_297.convolution_hw_fmcud_U72", "Parent" : "52"},
	{"ID" : "81", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_conv_read_fu_343", "Parent" : "0",
		"CDFG" : "conv_read",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1", "EstimateLatencyMax" : "67",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "cofm", "Type" : "Axis", "Direction" : "IO",
				"BlockSignal" : [
					{"Name" : "cofm_TDATA_i_blk_n", "Type" : "RtlSignal"},
					{"Name" : "cofm_TDATA_o_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "ofm_buff0_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ofm_buff0_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ofm_buff0_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ofm_buff0_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ofm_buff0_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ofm_buff0_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "cofm_counter_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "enable", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "82", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_write_row_ifm_fu_358", "Parent" : "0",
		"CDFG" : "write_row_ifm",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1", "EstimateLatencyMax" : "36",
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
			{"Name" : "cifm_counter_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "enable", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "83", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_load_cifm_data_fu_370", "Parent" : "0",
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
			{"Name" : "ifm_buff2_2", "Type" : "Memory", "Direction" : "O"}]},
	{"ID" : "84", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_load_filter_buffer_fu_385", "Parent" : "0",
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
			{"Name" : "filter_buff_2_2_2", "Type" : "Memory", "Direction" : "O"}]},
	{"ID" : "85", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_cifm_U", "Parent" : "0"},
	{"ID" : "86", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_cofm_i_U", "Parent" : "0"},
	{"ID" : "87", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_cofm_o_U", "Parent" : "0"},
	{"ID" : "88", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_tran_wgt_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	convolution_hw {
		cifm {Type I LastRead 5 FirstWrite -1}
		cofm {Type IO LastRead 2 FirstWrite 3}
		tran_wgt {Type I LastRead 1 FirstWrite -1}}
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
		ofm_buff0_5 {Type O LastRead -1 FirstWrite 45}}
	conv_read {
		cofm {Type IO LastRead 2 FirstWrite 3}
		ofm_buff0_0 {Type I LastRead 1 FirstWrite -1}
		ofm_buff0_1 {Type I LastRead 1 FirstWrite -1}
		ofm_buff0_2 {Type I LastRead 1 FirstWrite -1}
		ofm_buff0_3 {Type I LastRead 1 FirstWrite -1}
		ofm_buff0_4 {Type I LastRead 1 FirstWrite -1}
		ofm_buff0_5 {Type I LastRead 1 FirstWrite -1}
		cofm_counter_read {Type I LastRead 0 FirstWrite -1}
		enable {Type I LastRead 0 FirstWrite -1}}
	write_row_ifm {
		cifm {Type I LastRead 1 FirstWrite -1}
		ifm_buff0_0 {Type O LastRead -1 FirstWrite 1}
		ifm_buff0_1 {Type O LastRead -1 FirstWrite 1}
		ifm_buff0_2 {Type O LastRead -1 FirstWrite 1}
		cifm_counter_read {Type I LastRead 0 FirstWrite -1}
		enable {Type I LastRead 0 FirstWrite -1}}
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
		ifm_buff2_2 {Type O LastRead -1 FirstWrite 5}}
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
	{"Name" : "Latency", "Min" : "178", "Max" : "13940"}
	, {"Name" : "Interval", "Min" : "179", "Max" : "13941"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	cifm { axis {  { cifm_TDATA in_data 0 512 }  { cifm_TVALID in_vld 0 1 }  { cifm_TREADY in_acc 1 1 } } }
	cofm { axis {  { cofm_i_TDATA in_data 0 512 }  { cofm_i_TVALID in_vld 0 1 }  { cofm_i_TREADY in_acc 1 1 }  { cofm_o_TDATA out_data 1 512 }  { cofm_o_TVALID out_vld 1 1 }  { cofm_o_TREADY out_acc 0 1 } } }
	tran_wgt { axis {  { tran_wgt_TDATA in_data 0 512 }  { tran_wgt_TVALID in_vld 0 1 }  { tran_wgt_TREADY in_acc 1 1 } } }
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
