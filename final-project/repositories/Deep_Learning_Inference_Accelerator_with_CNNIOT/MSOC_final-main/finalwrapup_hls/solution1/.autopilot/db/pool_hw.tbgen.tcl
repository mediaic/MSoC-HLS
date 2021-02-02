set moduleName pool_hw
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
set C_modelName {pool_hw}
set C_modelType { void 0 }
set C_modelArgList {
	{ cifm int 512 regular {axi_s 0 volatile  { cifm Data } }  }
	{ cofm int 512 regular {axi_s 1 ""  { cofm Data } }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "cifm", "interface" : "axis", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "cofm", "interface" : "axis", "bitwidth" : 512, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 12
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
	{ cofm_TDATA sc_out sc_lv 512 signal 1 } 
	{ cofm_TVALID sc_out sc_logic 1 outvld 1 } 
	{ cofm_TREADY sc_in sc_logic 1 outacc 1 } 
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
 	{ "name": "cofm_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "cofm", "role": "TDATA" }} , 
 	{ "name": "cofm_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "cofm", "role": "TVALID" }} , 
 	{ "name": "cofm_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "cofm", "role": "TREADY" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "106", "107", "108"],
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
					{"ID" : "108", "SubInstance" : "grp_load_cifm_data_pool_fu_506", "Port" : "cifm"},
					{"ID" : "107", "SubInstance" : "grp_write_row_ifm_fu_482", "Port" : "cifm"}]},
			{"Name" : "cofm", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "106", "SubInstance" : "grp_conv_read_fu_457", "Port" : "cofm"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff0_0_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff0_1_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff0_2_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff0_3_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff0_4_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff0_5_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff0_6_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff0_7_U", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff0_8_U", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff0_9_U", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff0_10_U", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff0_11_U", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff0_12_U", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff0_13_U", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff0_14_U", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff0_15_U", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff1_0_U", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff1_1_U", "Parent" : "0"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff1_2_U", "Parent" : "0"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff1_3_U", "Parent" : "0"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff1_4_U", "Parent" : "0"},
	{"ID" : "22", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff1_5_U", "Parent" : "0"},
	{"ID" : "23", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff1_6_U", "Parent" : "0"},
	{"ID" : "24", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff1_7_U", "Parent" : "0"},
	{"ID" : "25", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff1_8_U", "Parent" : "0"},
	{"ID" : "26", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff1_9_U", "Parent" : "0"},
	{"ID" : "27", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff1_10_U", "Parent" : "0"},
	{"ID" : "28", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff1_11_U", "Parent" : "0"},
	{"ID" : "29", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff1_12_U", "Parent" : "0"},
	{"ID" : "30", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff1_13_U", "Parent" : "0"},
	{"ID" : "31", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff1_14_U", "Parent" : "0"},
	{"ID" : "32", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff1_15_U", "Parent" : "0"},
	{"ID" : "33", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff2_0_U", "Parent" : "0"},
	{"ID" : "34", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff2_1_U", "Parent" : "0"},
	{"ID" : "35", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff2_2_U", "Parent" : "0"},
	{"ID" : "36", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff2_3_U", "Parent" : "0"},
	{"ID" : "37", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff2_4_U", "Parent" : "0"},
	{"ID" : "38", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff2_5_U", "Parent" : "0"},
	{"ID" : "39", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff2_6_U", "Parent" : "0"},
	{"ID" : "40", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff2_7_U", "Parent" : "0"},
	{"ID" : "41", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff2_8_U", "Parent" : "0"},
	{"ID" : "42", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff2_9_U", "Parent" : "0"},
	{"ID" : "43", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff2_10_U", "Parent" : "0"},
	{"ID" : "44", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff2_11_U", "Parent" : "0"},
	{"ID" : "45", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff2_12_U", "Parent" : "0"},
	{"ID" : "46", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff2_13_U", "Parent" : "0"},
	{"ID" : "47", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff2_14_U", "Parent" : "0"},
	{"ID" : "48", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff2_15_U", "Parent" : "0"},
	{"ID" : "49", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff0_0_U", "Parent" : "0"},
	{"ID" : "50", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff0_1_U", "Parent" : "0"},
	{"ID" : "51", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff0_2_U", "Parent" : "0"},
	{"ID" : "52", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff0_3_U", "Parent" : "0"},
	{"ID" : "53", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff0_4_U", "Parent" : "0"},
	{"ID" : "54", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff0_5_U", "Parent" : "0"},
	{"ID" : "55", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff0_6_U", "Parent" : "0"},
	{"ID" : "56", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff0_7_U", "Parent" : "0"},
	{"ID" : "57", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff0_8_U", "Parent" : "0"},
	{"ID" : "58", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff0_9_U", "Parent" : "0"},
	{"ID" : "59", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff0_10_U", "Parent" : "0"},
	{"ID" : "60", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff0_11_U", "Parent" : "0"},
	{"ID" : "61", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff0_12_U", "Parent" : "0"},
	{"ID" : "62", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff0_13_U", "Parent" : "0"},
	{"ID" : "63", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff0_14_U", "Parent" : "0"},
	{"ID" : "64", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff0_15_U", "Parent" : "0"},
	{"ID" : "65", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff1_0_U", "Parent" : "0"},
	{"ID" : "66", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff1_1_U", "Parent" : "0"},
	{"ID" : "67", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff1_2_U", "Parent" : "0"},
	{"ID" : "68", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff1_3_U", "Parent" : "0"},
	{"ID" : "69", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff1_4_U", "Parent" : "0"},
	{"ID" : "70", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff1_5_U", "Parent" : "0"},
	{"ID" : "71", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff1_6_U", "Parent" : "0"},
	{"ID" : "72", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff1_7_U", "Parent" : "0"},
	{"ID" : "73", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff1_8_U", "Parent" : "0"},
	{"ID" : "74", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff1_9_U", "Parent" : "0"},
	{"ID" : "75", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff1_10_U", "Parent" : "0"},
	{"ID" : "76", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff1_11_U", "Parent" : "0"},
	{"ID" : "77", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff1_12_U", "Parent" : "0"},
	{"ID" : "78", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff1_13_U", "Parent" : "0"},
	{"ID" : "79", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff1_14_U", "Parent" : "0"},
	{"ID" : "80", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff1_15_U", "Parent" : "0"},
	{"ID" : "81", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_pool_write_fu_405", "Parent" : "0", "Child" : ["82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "100", "101", "102", "103", "104", "105"],
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
	{"ID" : "82", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_write_fu_405.dnn_hw_fcmp_32ns_bkb_U53", "Parent" : "81"},
	{"ID" : "83", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_write_fu_405.dnn_hw_fcmp_32ns_bkb_U54", "Parent" : "81"},
	{"ID" : "84", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_write_fu_405.dnn_hw_fcmp_32ns_bkb_U55", "Parent" : "81"},
	{"ID" : "85", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_write_fu_405.dnn_hw_fcmp_32ns_bkb_U56", "Parent" : "81"},
	{"ID" : "86", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_write_fu_405.dnn_hw_fcmp_32ns_bkb_U57", "Parent" : "81"},
	{"ID" : "87", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_write_fu_405.dnn_hw_fcmp_32ns_bkb_U58", "Parent" : "81"},
	{"ID" : "88", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_write_fu_405.dnn_hw_fcmp_32ns_bkb_U59", "Parent" : "81"},
	{"ID" : "89", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_write_fu_405.dnn_hw_fcmp_32ns_bkb_U60", "Parent" : "81"},
	{"ID" : "90", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_write_fu_405.dnn_hw_fcmp_32ns_bkb_U61", "Parent" : "81"},
	{"ID" : "91", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_write_fu_405.dnn_hw_fcmp_32ns_bkb_U62", "Parent" : "81"},
	{"ID" : "92", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_write_fu_405.dnn_hw_fcmp_32ns_bkb_U63", "Parent" : "81"},
	{"ID" : "93", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_write_fu_405.dnn_hw_fcmp_32ns_bkb_U64", "Parent" : "81"},
	{"ID" : "94", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_write_fu_405.dnn_hw_fcmp_32ns_bkb_U65", "Parent" : "81"},
	{"ID" : "95", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_write_fu_405.dnn_hw_fcmp_32ns_bkb_U66", "Parent" : "81"},
	{"ID" : "96", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_write_fu_405.dnn_hw_fcmp_32ns_bkb_U67", "Parent" : "81"},
	{"ID" : "97", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_write_fu_405.dnn_hw_fcmp_32ns_bkb_U68", "Parent" : "81"},
	{"ID" : "98", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_write_fu_405.dnn_hw_fcmp_32ns_bkb_U69", "Parent" : "81"},
	{"ID" : "99", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_write_fu_405.dnn_hw_fcmp_32ns_bkb_U70", "Parent" : "81"},
	{"ID" : "100", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_write_fu_405.dnn_hw_fcmp_32ns_bkb_U71", "Parent" : "81"},
	{"ID" : "101", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_write_fu_405.dnn_hw_fcmp_32ns_bkb_U72", "Parent" : "81"},
	{"ID" : "102", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_write_fu_405.dnn_hw_fcmp_32ns_bkb_U73", "Parent" : "81"},
	{"ID" : "103", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_write_fu_405.dnn_hw_fcmp_32ns_bkb_U74", "Parent" : "81"},
	{"ID" : "104", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_write_fu_405.dnn_hw_fcmp_32ns_bkb_U75", "Parent" : "81"},
	{"ID" : "105", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pool_write_fu_405.dnn_hw_fcmp_32ns_bkb_U76", "Parent" : "81"},
	{"ID" : "106", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_conv_read_fu_457", "Parent" : "0",
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
	{"ID" : "107", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_write_row_ifm_fu_482", "Parent" : "0",
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
	{"ID" : "108", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_load_cifm_data_pool_fu_506", "Parent" : "0",
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
			{"Name" : "ifm_buff1_15", "Type" : "Memory", "Direction" : "O"}]}]}


set ArgLastReadFirstWriteLatency {
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
		ifm_buff1_15 {Type O LastRead -1 FirstWrite 3}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "236", "Max" : "7013"}
	, {"Name" : "Interval", "Min" : "236", "Max" : "7013"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	cifm { axis {  { cifm_TDATA in_data 0 512 }  { cifm_TVALID in_vld 0 1 }  { cifm_TREADY in_acc 1 1 } } }
	cofm { axis {  { cofm_TDATA out_data 1 512 }  { cofm_TVALID out_vld 1 1 }  { cofm_TREADY out_acc 0 1 } } }
}
