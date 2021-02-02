set moduleName convolution_hw
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
set C_modelName {convolution_hw}
set C_modelType { void 0 }
set C_modelArgList {
	{ cifm int 512 regular {axi_s 0 volatile  { cifm Data } }  }
	{ cofm int 512 regular {axi_s 1 ""  { cofm Data } }  }
	{ tran_wgt int 512 regular {axi_s 0 volatile  { tran_wgt Data } }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "cifm", "interface" : "axis", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "cofm", "interface" : "axis", "bitwidth" : 512, "direction" : "WRITEONLY"} , 
 	{ "Name" : "tran_wgt", "interface" : "axis", "bitwidth" : 512, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 15
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
	{ tran_wgt_TDATA sc_in sc_lv 512 signal 2 } 
	{ tran_wgt_TVALID sc_in sc_logic 1 invld 2 } 
	{ tran_wgt_TREADY sc_out sc_logic 1 inacc 2 } 
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
 	{ "name": "cofm_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "cofm", "role": "TREADY" }} , 
 	{ "name": "tran_wgt_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "tran_wgt", "role": "TDATA" }} , 
 	{ "name": "tran_wgt_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "tran_wgt", "role": "TVALID" }} , 
 	{ "name": "tran_wgt_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "tran_wgt", "role": "TREADY" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "100", "101", "102", "103", "104", "105", "106", "107", "108", "109", "110", "111", "112", "113", "114", "115", "116", "117", "118", "119", "120", "121", "122", "123", "124", "125", "126", "127", "128", "129", "130", "131", "132", "133", "134", "135", "136", "137", "138", "139", "140", "141", "142", "143", "144", "145", "146", "147", "148", "149", "150", "151", "152", "153", "154", "155", "156", "157", "158", "159", "160", "161", "162", "163", "164", "165", "166", "167", "168", "169", "170", "171", "172", "173", "174", "175", "176", "177", "178", "179", "180", "181", "182", "183", "184", "185", "186", "187", "188", "189", "190", "191", "192", "193", "194", "195", "196", "197", "198", "199", "200", "201", "202", "203", "204", "205", "206", "207", "208", "209", "210", "211", "212", "213", "214", "215", "216", "217", "218", "219", "220", "221", "222", "223", "224", "225", "226", "227", "228", "229", "230", "231", "232", "233", "234", "235", "236", "237", "238", "239", "240", "241", "261", "262", "263", "264"],
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
					{"ID" : "263", "SubInstance" : "grp_write_row_ifm_fu_1578", "Port" : "cifm"},
					{"ID" : "264", "SubInstance" : "grp_load_cifm_data_fu_1603", "Port" : "cifm"}]},
			{"Name" : "cofm", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "261", "SubInstance" : "grp_conv_read_fu_1259", "Port" : "cofm"}]},
			{"Name" : "tran_wgt", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "262", "SubInstance" : "grp_load_filter_buffer_fu_1284", "Port" : "wgt"}]}]},
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
	{"ID" : "49", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff3_0_U", "Parent" : "0"},
	{"ID" : "50", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff3_1_U", "Parent" : "0"},
	{"ID" : "51", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff3_2_U", "Parent" : "0"},
	{"ID" : "52", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff3_3_U", "Parent" : "0"},
	{"ID" : "53", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff3_4_U", "Parent" : "0"},
	{"ID" : "54", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff3_5_U", "Parent" : "0"},
	{"ID" : "55", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff3_6_U", "Parent" : "0"},
	{"ID" : "56", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff3_7_U", "Parent" : "0"},
	{"ID" : "57", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff3_8_U", "Parent" : "0"},
	{"ID" : "58", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff3_9_U", "Parent" : "0"},
	{"ID" : "59", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff3_10_U", "Parent" : "0"},
	{"ID" : "60", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff3_11_U", "Parent" : "0"},
	{"ID" : "61", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff3_12_U", "Parent" : "0"},
	{"ID" : "62", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff3_13_U", "Parent" : "0"},
	{"ID" : "63", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff3_14_U", "Parent" : "0"},
	{"ID" : "64", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ifm_buff3_15_U", "Parent" : "0"},
	{"ID" : "65", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_0_0_0_U", "Parent" : "0"},
	{"ID" : "66", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_0_0_1_U", "Parent" : "0"},
	{"ID" : "67", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_0_0_2_U", "Parent" : "0"},
	{"ID" : "68", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_0_1_0_U", "Parent" : "0"},
	{"ID" : "69", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_0_1_1_U", "Parent" : "0"},
	{"ID" : "70", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_0_1_2_U", "Parent" : "0"},
	{"ID" : "71", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_0_2_0_U", "Parent" : "0"},
	{"ID" : "72", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_0_2_1_U", "Parent" : "0"},
	{"ID" : "73", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_0_2_2_U", "Parent" : "0"},
	{"ID" : "74", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_1_0_0_U", "Parent" : "0"},
	{"ID" : "75", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_1_0_1_U", "Parent" : "0"},
	{"ID" : "76", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_1_0_2_U", "Parent" : "0"},
	{"ID" : "77", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_1_1_0_U", "Parent" : "0"},
	{"ID" : "78", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_1_1_1_U", "Parent" : "0"},
	{"ID" : "79", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_1_1_2_U", "Parent" : "0"},
	{"ID" : "80", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_1_2_0_U", "Parent" : "0"},
	{"ID" : "81", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_1_2_1_U", "Parent" : "0"},
	{"ID" : "82", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_1_2_2_U", "Parent" : "0"},
	{"ID" : "83", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_2_0_0_U", "Parent" : "0"},
	{"ID" : "84", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_2_0_1_U", "Parent" : "0"},
	{"ID" : "85", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_2_0_2_U", "Parent" : "0"},
	{"ID" : "86", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_2_1_0_U", "Parent" : "0"},
	{"ID" : "87", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_2_1_1_U", "Parent" : "0"},
	{"ID" : "88", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_2_1_2_U", "Parent" : "0"},
	{"ID" : "89", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_2_2_0_U", "Parent" : "0"},
	{"ID" : "90", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_2_2_1_U", "Parent" : "0"},
	{"ID" : "91", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_2_2_2_U", "Parent" : "0"},
	{"ID" : "92", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_3_0_0_U", "Parent" : "0"},
	{"ID" : "93", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_3_0_1_U", "Parent" : "0"},
	{"ID" : "94", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_3_0_2_U", "Parent" : "0"},
	{"ID" : "95", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_3_1_0_U", "Parent" : "0"},
	{"ID" : "96", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_3_1_1_U", "Parent" : "0"},
	{"ID" : "97", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_3_1_2_U", "Parent" : "0"},
	{"ID" : "98", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_3_2_0_U", "Parent" : "0"},
	{"ID" : "99", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_3_2_1_U", "Parent" : "0"},
	{"ID" : "100", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_3_2_2_U", "Parent" : "0"},
	{"ID" : "101", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_4_0_0_U", "Parent" : "0"},
	{"ID" : "102", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_4_0_1_U", "Parent" : "0"},
	{"ID" : "103", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_4_0_2_U", "Parent" : "0"},
	{"ID" : "104", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_4_1_0_U", "Parent" : "0"},
	{"ID" : "105", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_4_1_1_U", "Parent" : "0"},
	{"ID" : "106", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_4_1_2_U", "Parent" : "0"},
	{"ID" : "107", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_4_2_0_U", "Parent" : "0"},
	{"ID" : "108", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_4_2_1_U", "Parent" : "0"},
	{"ID" : "109", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_4_2_2_U", "Parent" : "0"},
	{"ID" : "110", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_5_0_0_U", "Parent" : "0"},
	{"ID" : "111", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_5_0_1_U", "Parent" : "0"},
	{"ID" : "112", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_5_0_2_U", "Parent" : "0"},
	{"ID" : "113", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_5_1_0_U", "Parent" : "0"},
	{"ID" : "114", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_5_1_1_U", "Parent" : "0"},
	{"ID" : "115", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_5_1_2_U", "Parent" : "0"},
	{"ID" : "116", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_5_2_0_U", "Parent" : "0"},
	{"ID" : "117", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_5_2_1_U", "Parent" : "0"},
	{"ID" : "118", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_5_2_2_U", "Parent" : "0"},
	{"ID" : "119", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_6_0_0_U", "Parent" : "0"},
	{"ID" : "120", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_6_0_1_U", "Parent" : "0"},
	{"ID" : "121", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_6_0_2_U", "Parent" : "0"},
	{"ID" : "122", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_6_1_0_U", "Parent" : "0"},
	{"ID" : "123", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_6_1_1_U", "Parent" : "0"},
	{"ID" : "124", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_6_1_2_U", "Parent" : "0"},
	{"ID" : "125", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_6_2_0_U", "Parent" : "0"},
	{"ID" : "126", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_6_2_1_U", "Parent" : "0"},
	{"ID" : "127", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_6_2_2_U", "Parent" : "0"},
	{"ID" : "128", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_7_0_0_U", "Parent" : "0"},
	{"ID" : "129", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_7_0_1_U", "Parent" : "0"},
	{"ID" : "130", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_7_0_2_U", "Parent" : "0"},
	{"ID" : "131", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_7_1_0_U", "Parent" : "0"},
	{"ID" : "132", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_7_1_1_U", "Parent" : "0"},
	{"ID" : "133", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_7_1_2_U", "Parent" : "0"},
	{"ID" : "134", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_7_2_0_U", "Parent" : "0"},
	{"ID" : "135", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_7_2_1_U", "Parent" : "0"},
	{"ID" : "136", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_7_2_2_U", "Parent" : "0"},
	{"ID" : "137", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_8_0_0_U", "Parent" : "0"},
	{"ID" : "138", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_8_0_1_U", "Parent" : "0"},
	{"ID" : "139", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_8_0_2_U", "Parent" : "0"},
	{"ID" : "140", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_8_1_0_U", "Parent" : "0"},
	{"ID" : "141", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_8_1_1_U", "Parent" : "0"},
	{"ID" : "142", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_8_1_2_U", "Parent" : "0"},
	{"ID" : "143", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_8_2_0_U", "Parent" : "0"},
	{"ID" : "144", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_8_2_1_U", "Parent" : "0"},
	{"ID" : "145", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_8_2_2_U", "Parent" : "0"},
	{"ID" : "146", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_9_0_0_U", "Parent" : "0"},
	{"ID" : "147", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_9_0_1_U", "Parent" : "0"},
	{"ID" : "148", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_9_0_2_U", "Parent" : "0"},
	{"ID" : "149", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_9_1_0_U", "Parent" : "0"},
	{"ID" : "150", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_9_1_1_U", "Parent" : "0"},
	{"ID" : "151", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_9_1_2_U", "Parent" : "0"},
	{"ID" : "152", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_9_2_0_U", "Parent" : "0"},
	{"ID" : "153", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_9_2_1_U", "Parent" : "0"},
	{"ID" : "154", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_9_2_2_U", "Parent" : "0"},
	{"ID" : "155", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_10_0_0_U", "Parent" : "0"},
	{"ID" : "156", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_10_0_1_U", "Parent" : "0"},
	{"ID" : "157", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_10_0_2_U", "Parent" : "0"},
	{"ID" : "158", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_10_1_0_U", "Parent" : "0"},
	{"ID" : "159", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_10_1_1_U", "Parent" : "0"},
	{"ID" : "160", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_10_1_2_U", "Parent" : "0"},
	{"ID" : "161", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_10_2_0_U", "Parent" : "0"},
	{"ID" : "162", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_10_2_1_U", "Parent" : "0"},
	{"ID" : "163", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_10_2_2_U", "Parent" : "0"},
	{"ID" : "164", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_11_0_0_U", "Parent" : "0"},
	{"ID" : "165", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_11_0_1_U", "Parent" : "0"},
	{"ID" : "166", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_11_0_2_U", "Parent" : "0"},
	{"ID" : "167", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_11_1_0_U", "Parent" : "0"},
	{"ID" : "168", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_11_1_1_U", "Parent" : "0"},
	{"ID" : "169", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_11_1_2_U", "Parent" : "0"},
	{"ID" : "170", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_11_2_0_U", "Parent" : "0"},
	{"ID" : "171", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_11_2_1_U", "Parent" : "0"},
	{"ID" : "172", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_11_2_2_U", "Parent" : "0"},
	{"ID" : "173", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_12_0_0_U", "Parent" : "0"},
	{"ID" : "174", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_12_0_1_U", "Parent" : "0"},
	{"ID" : "175", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_12_0_2_U", "Parent" : "0"},
	{"ID" : "176", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_12_1_0_U", "Parent" : "0"},
	{"ID" : "177", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_12_1_1_U", "Parent" : "0"},
	{"ID" : "178", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_12_1_2_U", "Parent" : "0"},
	{"ID" : "179", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_12_2_0_U", "Parent" : "0"},
	{"ID" : "180", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_12_2_1_U", "Parent" : "0"},
	{"ID" : "181", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_12_2_2_U", "Parent" : "0"},
	{"ID" : "182", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_13_0_0_U", "Parent" : "0"},
	{"ID" : "183", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_13_0_1_U", "Parent" : "0"},
	{"ID" : "184", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_13_0_2_U", "Parent" : "0"},
	{"ID" : "185", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_13_1_0_U", "Parent" : "0"},
	{"ID" : "186", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_13_1_1_U", "Parent" : "0"},
	{"ID" : "187", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_13_1_2_U", "Parent" : "0"},
	{"ID" : "188", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_13_2_0_U", "Parent" : "0"},
	{"ID" : "189", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_13_2_1_U", "Parent" : "0"},
	{"ID" : "190", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_13_2_2_U", "Parent" : "0"},
	{"ID" : "191", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_14_0_0_U", "Parent" : "0"},
	{"ID" : "192", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_14_0_1_U", "Parent" : "0"},
	{"ID" : "193", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_14_0_2_U", "Parent" : "0"},
	{"ID" : "194", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_14_1_0_U", "Parent" : "0"},
	{"ID" : "195", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_14_1_1_U", "Parent" : "0"},
	{"ID" : "196", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_14_1_2_U", "Parent" : "0"},
	{"ID" : "197", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_14_2_0_U", "Parent" : "0"},
	{"ID" : "198", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_14_2_1_U", "Parent" : "0"},
	{"ID" : "199", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_14_2_2_U", "Parent" : "0"},
	{"ID" : "200", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_15_0_0_U", "Parent" : "0"},
	{"ID" : "201", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_15_0_1_U", "Parent" : "0"},
	{"ID" : "202", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_15_0_2_U", "Parent" : "0"},
	{"ID" : "203", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_15_1_0_U", "Parent" : "0"},
	{"ID" : "204", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_15_1_1_U", "Parent" : "0"},
	{"ID" : "205", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_15_1_2_U", "Parent" : "0"},
	{"ID" : "206", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_15_2_0_U", "Parent" : "0"},
	{"ID" : "207", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_15_2_1_U", "Parent" : "0"},
	{"ID" : "208", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.filter_buff_15_2_2_U", "Parent" : "0"},
	{"ID" : "209", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff0_0_U", "Parent" : "0"},
	{"ID" : "210", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff0_1_U", "Parent" : "0"},
	{"ID" : "211", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff0_2_U", "Parent" : "0"},
	{"ID" : "212", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff0_3_U", "Parent" : "0"},
	{"ID" : "213", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff0_4_U", "Parent" : "0"},
	{"ID" : "214", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff0_5_U", "Parent" : "0"},
	{"ID" : "215", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff0_6_U", "Parent" : "0"},
	{"ID" : "216", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff0_7_U", "Parent" : "0"},
	{"ID" : "217", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff0_8_U", "Parent" : "0"},
	{"ID" : "218", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff0_9_U", "Parent" : "0"},
	{"ID" : "219", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff0_10_U", "Parent" : "0"},
	{"ID" : "220", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff0_11_U", "Parent" : "0"},
	{"ID" : "221", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff0_12_U", "Parent" : "0"},
	{"ID" : "222", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff0_13_U", "Parent" : "0"},
	{"ID" : "223", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff0_14_U", "Parent" : "0"},
	{"ID" : "224", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff0_15_U", "Parent" : "0"},
	{"ID" : "225", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff1_0_U", "Parent" : "0"},
	{"ID" : "226", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff1_1_U", "Parent" : "0"},
	{"ID" : "227", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff1_2_U", "Parent" : "0"},
	{"ID" : "228", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff1_3_U", "Parent" : "0"},
	{"ID" : "229", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff1_4_U", "Parent" : "0"},
	{"ID" : "230", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff1_5_U", "Parent" : "0"},
	{"ID" : "231", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff1_6_U", "Parent" : "0"},
	{"ID" : "232", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff1_7_U", "Parent" : "0"},
	{"ID" : "233", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff1_8_U", "Parent" : "0"},
	{"ID" : "234", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff1_9_U", "Parent" : "0"},
	{"ID" : "235", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff1_10_U", "Parent" : "0"},
	{"ID" : "236", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff1_11_U", "Parent" : "0"},
	{"ID" : "237", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff1_12_U", "Parent" : "0"},
	{"ID" : "238", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff1_13_U", "Parent" : "0"},
	{"ID" : "239", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff1_14_U", "Parent" : "0"},
	{"ID" : "240", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ofm_buff1_15_U", "Parent" : "0"},
	{"ID" : "241", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_conv_write_fu_1047", "Parent" : "0", "Child" : ["242", "243", "244", "245", "246", "247", "248", "249", "250", "251", "252", "253", "254", "255", "256", "257", "258", "259", "260"],
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
	{"ID" : "242", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv_write_fu_1047.dnn_hw_fadd_32ns_Gfk_U343", "Parent" : "241"},
	{"ID" : "243", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv_write_fu_1047.dnn_hw_fadd_32ns_Gfk_U344", "Parent" : "241"},
	{"ID" : "244", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv_write_fu_1047.dnn_hw_fmul_32ns_Hfu_U345", "Parent" : "241"},
	{"ID" : "245", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv_write_fu_1047.dnn_hw_fmul_32ns_Hfu_U346", "Parent" : "241"},
	{"ID" : "246", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv_write_fu_1047.dnn_hw_mux_164_32IfE_U347", "Parent" : "241"},
	{"ID" : "247", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv_write_fu_1047.dnn_hw_mux_164_32IfE_U348", "Parent" : "241"},
	{"ID" : "248", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv_write_fu_1047.dnn_hw_mux_164_32IfE_U349", "Parent" : "241"},
	{"ID" : "249", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv_write_fu_1047.dnn_hw_mux_164_32IfE_U350", "Parent" : "241"},
	{"ID" : "250", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv_write_fu_1047.dnn_hw_mux_164_32IfE_U351", "Parent" : "241"},
	{"ID" : "251", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv_write_fu_1047.dnn_hw_mux_164_32IfE_U352", "Parent" : "241"},
	{"ID" : "252", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv_write_fu_1047.dnn_hw_mux_164_32IfE_U353", "Parent" : "241"},
	{"ID" : "253", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv_write_fu_1047.dnn_hw_mux_164_32IfE_U354", "Parent" : "241"},
	{"ID" : "254", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv_write_fu_1047.dnn_hw_mux_164_32IfE_U355", "Parent" : "241"},
	{"ID" : "255", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv_write_fu_1047.dnn_hw_mux_164_32IfE_U356", "Parent" : "241"},
	{"ID" : "256", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv_write_fu_1047.dnn_hw_mux_164_32IfE_U357", "Parent" : "241"},
	{"ID" : "257", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv_write_fu_1047.dnn_hw_mux_164_32IfE_U358", "Parent" : "241"},
	{"ID" : "258", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv_write_fu_1047.dnn_hw_mux_164_32IfE_U359", "Parent" : "241"},
	{"ID" : "259", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv_write_fu_1047.dnn_hw_mux_164_32IfE_U360", "Parent" : "241"},
	{"ID" : "260", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv_write_fu_1047.dnn_hw_mux_164_32IfE_U361", "Parent" : "241"},
	{"ID" : "261", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_conv_read_fu_1259", "Parent" : "0",
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
	{"ID" : "262", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_load_filter_buffer_fu_1284", "Parent" : "0",
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
	{"ID" : "263", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_write_row_ifm_fu_1578", "Parent" : "0",
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
	{"ID" : "264", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_load_cifm_data_fu_1603", "Parent" : "0",
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
			{"Name" : "ifm_buff2_15", "Type" : "Memory", "Direction" : "O"}]}]}


set ArgLastReadFirstWriteLatency {
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
	{"Name" : "Latency", "Min" : "374", "Max" : "5720551"}
	, {"Name" : "Interval", "Min" : "374", "Max" : "5720551"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	cifm { axis {  { cifm_TDATA in_data 0 512 }  { cifm_TVALID in_vld 0 1 }  { cifm_TREADY in_acc 1 1 } } }
	cofm { axis {  { cofm_TDATA out_data 1 512 }  { cofm_TVALID out_vld 1 1 }  { cofm_TREADY out_acc 0 1 } } }
	tran_wgt { axis {  { tran_wgt_TDATA in_data 0 512 }  { tran_wgt_TVALID in_vld 0 1 }  { tran_wgt_TREADY in_acc 1 1 } } }
}
