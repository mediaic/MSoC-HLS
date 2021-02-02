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
	{ filter_buff_0_0_0 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_0_0_1 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_0_0_2 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_0_1_0 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_0_1_1 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_0_1_2 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_0_2_0 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_0_2_1 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_0_2_2 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_1_0_0 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_1_0_1 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_1_0_2 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_1_1_0 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_1_1_1 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_1_1_2 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_1_2_0 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_1_2_1 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_1_2_2 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_2_0_0 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_2_0_1 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_2_0_2 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_2_1_0 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_2_1_1 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_2_1_2 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_2_2_0 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_2_2_1 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_2_2_2 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_3_0_0 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_3_0_1 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_3_0_2 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_3_1_0 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_3_1_1 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_3_1_2 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_3_2_0 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_3_2_1 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_3_2_2 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_4_0_0 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_4_0_1 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_4_0_2 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_4_1_0 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_4_1_1 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_4_1_2 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_4_2_0 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_4_2_1 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_4_2_2 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_5_0_0 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_5_0_1 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_5_0_2 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_5_1_0 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_5_1_1 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_5_1_2 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_5_2_0 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_5_2_1 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_5_2_2 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_6_0_0 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_6_0_1 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_6_0_2 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_6_1_0 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_6_1_1 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_6_1_2 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_6_2_0 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_6_2_1 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_6_2_2 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_7_0_0 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_7_0_1 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_7_0_2 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_7_1_0 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_7_1_1 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_7_1_2 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_7_2_0 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_7_2_1 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_7_2_2 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_8_0_0 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_8_0_1 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_8_0_2 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_8_1_0 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_8_1_1 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_8_1_2 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_8_2_0 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_8_2_1 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_8_2_2 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_9_0_0 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_9_0_1 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_9_0_2 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_9_1_0 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_9_1_1 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_9_1_2 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_9_2_0 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_9_2_1 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_9_2_2 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_10_0_0 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_10_0_1 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_10_0_2 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_10_1_0 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_10_1_1 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_10_1_2 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_10_2_0 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_10_2_1 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_10_2_2 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_11_0_0 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_11_0_1 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_11_0_2 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_11_1_0 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_11_1_1 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_11_1_2 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_11_2_0 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_11_2_1 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_11_2_2 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_12_0_0 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_12_0_1 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_12_0_2 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_12_1_0 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_12_1_1 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_12_1_2 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_12_2_0 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_12_2_1 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_12_2_2 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_13_0_0 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_13_0_1 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_13_0_2 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_13_1_0 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_13_1_1 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_13_1_2 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_13_2_0 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_13_2_1 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_13_2_2 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_14_0_0 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_14_0_1 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_14_0_2 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_14_1_0 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_14_1_1 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_14_1_2 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_14_2_0 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_14_2_1 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_14_2_2 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_15_0_0 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_15_0_1 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_15_0_2 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_15_1_0 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_15_1_1 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_15_1_2 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_15_2_0 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_15_2_1 float 32 regular {array 16 { 0 3 } 0 1 }  }
	{ filter_buff_15_2_2 float 32 regular {array 16 { 0 3 } 0 1 }  }
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
 	{ "Name" : "filter_buff_2_2_2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_3_0_0", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_3_0_1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_3_0_2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_3_1_0", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_3_1_1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_3_1_2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_3_2_0", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_3_2_1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_3_2_2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_4_0_0", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_4_0_1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_4_0_2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_4_1_0", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_4_1_1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_4_1_2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_4_2_0", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_4_2_1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_4_2_2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_5_0_0", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_5_0_1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_5_0_2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_5_1_0", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_5_1_1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_5_1_2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_5_2_0", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_5_2_1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_5_2_2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_6_0_0", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_6_0_1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_6_0_2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_6_1_0", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_6_1_1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_6_1_2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_6_2_0", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_6_2_1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_6_2_2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_7_0_0", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_7_0_1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_7_0_2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_7_1_0", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_7_1_1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_7_1_2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_7_2_0", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_7_2_1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_7_2_2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_8_0_0", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_8_0_1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_8_0_2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_8_1_0", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_8_1_1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_8_1_2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_8_2_0", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_8_2_1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_8_2_2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_9_0_0", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_9_0_1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_9_0_2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_9_1_0", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_9_1_1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_9_1_2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_9_2_0", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_9_2_1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_9_2_2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_10_0_0", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_10_0_1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_10_0_2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_10_1_0", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_10_1_1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_10_1_2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_10_2_0", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_10_2_1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_10_2_2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_11_0_0", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_11_0_1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_11_0_2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_11_1_0", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_11_1_1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_11_1_2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_11_2_0", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_11_2_1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_11_2_2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_12_0_0", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_12_0_1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_12_0_2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_12_1_0", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_12_1_1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_12_1_2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_12_2_0", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_12_2_1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_12_2_2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_13_0_0", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_13_0_1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_13_0_2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_13_1_0", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_13_1_1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_13_1_2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_13_2_0", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_13_2_1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_13_2_2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_14_0_0", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_14_0_1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_14_0_2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_14_1_0", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_14_1_1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_14_1_2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_14_2_0", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_14_2_1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_14_2_2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_15_0_0", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_15_0_1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_15_0_2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_15_1_0", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_15_1_1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_15_1_2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_15_2_0", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_15_2_1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_buff_15_2_2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 585
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
	{ filter_buff_0_0_0_address0 sc_out sc_lv 4 signal 1 } 
	{ filter_buff_0_0_0_ce0 sc_out sc_logic 1 signal 1 } 
	{ filter_buff_0_0_0_we0 sc_out sc_logic 1 signal 1 } 
	{ filter_buff_0_0_0_d0 sc_out sc_lv 32 signal 1 } 
	{ filter_buff_0_0_1_address0 sc_out sc_lv 4 signal 2 } 
	{ filter_buff_0_0_1_ce0 sc_out sc_logic 1 signal 2 } 
	{ filter_buff_0_0_1_we0 sc_out sc_logic 1 signal 2 } 
	{ filter_buff_0_0_1_d0 sc_out sc_lv 32 signal 2 } 
	{ filter_buff_0_0_2_address0 sc_out sc_lv 4 signal 3 } 
	{ filter_buff_0_0_2_ce0 sc_out sc_logic 1 signal 3 } 
	{ filter_buff_0_0_2_we0 sc_out sc_logic 1 signal 3 } 
	{ filter_buff_0_0_2_d0 sc_out sc_lv 32 signal 3 } 
	{ filter_buff_0_1_0_address0 sc_out sc_lv 4 signal 4 } 
	{ filter_buff_0_1_0_ce0 sc_out sc_logic 1 signal 4 } 
	{ filter_buff_0_1_0_we0 sc_out sc_logic 1 signal 4 } 
	{ filter_buff_0_1_0_d0 sc_out sc_lv 32 signal 4 } 
	{ filter_buff_0_1_1_address0 sc_out sc_lv 4 signal 5 } 
	{ filter_buff_0_1_1_ce0 sc_out sc_logic 1 signal 5 } 
	{ filter_buff_0_1_1_we0 sc_out sc_logic 1 signal 5 } 
	{ filter_buff_0_1_1_d0 sc_out sc_lv 32 signal 5 } 
	{ filter_buff_0_1_2_address0 sc_out sc_lv 4 signal 6 } 
	{ filter_buff_0_1_2_ce0 sc_out sc_logic 1 signal 6 } 
	{ filter_buff_0_1_2_we0 sc_out sc_logic 1 signal 6 } 
	{ filter_buff_0_1_2_d0 sc_out sc_lv 32 signal 6 } 
	{ filter_buff_0_2_0_address0 sc_out sc_lv 4 signal 7 } 
	{ filter_buff_0_2_0_ce0 sc_out sc_logic 1 signal 7 } 
	{ filter_buff_0_2_0_we0 sc_out sc_logic 1 signal 7 } 
	{ filter_buff_0_2_0_d0 sc_out sc_lv 32 signal 7 } 
	{ filter_buff_0_2_1_address0 sc_out sc_lv 4 signal 8 } 
	{ filter_buff_0_2_1_ce0 sc_out sc_logic 1 signal 8 } 
	{ filter_buff_0_2_1_we0 sc_out sc_logic 1 signal 8 } 
	{ filter_buff_0_2_1_d0 sc_out sc_lv 32 signal 8 } 
	{ filter_buff_0_2_2_address0 sc_out sc_lv 4 signal 9 } 
	{ filter_buff_0_2_2_ce0 sc_out sc_logic 1 signal 9 } 
	{ filter_buff_0_2_2_we0 sc_out sc_logic 1 signal 9 } 
	{ filter_buff_0_2_2_d0 sc_out sc_lv 32 signal 9 } 
	{ filter_buff_1_0_0_address0 sc_out sc_lv 4 signal 10 } 
	{ filter_buff_1_0_0_ce0 sc_out sc_logic 1 signal 10 } 
	{ filter_buff_1_0_0_we0 sc_out sc_logic 1 signal 10 } 
	{ filter_buff_1_0_0_d0 sc_out sc_lv 32 signal 10 } 
	{ filter_buff_1_0_1_address0 sc_out sc_lv 4 signal 11 } 
	{ filter_buff_1_0_1_ce0 sc_out sc_logic 1 signal 11 } 
	{ filter_buff_1_0_1_we0 sc_out sc_logic 1 signal 11 } 
	{ filter_buff_1_0_1_d0 sc_out sc_lv 32 signal 11 } 
	{ filter_buff_1_0_2_address0 sc_out sc_lv 4 signal 12 } 
	{ filter_buff_1_0_2_ce0 sc_out sc_logic 1 signal 12 } 
	{ filter_buff_1_0_2_we0 sc_out sc_logic 1 signal 12 } 
	{ filter_buff_1_0_2_d0 sc_out sc_lv 32 signal 12 } 
	{ filter_buff_1_1_0_address0 sc_out sc_lv 4 signal 13 } 
	{ filter_buff_1_1_0_ce0 sc_out sc_logic 1 signal 13 } 
	{ filter_buff_1_1_0_we0 sc_out sc_logic 1 signal 13 } 
	{ filter_buff_1_1_0_d0 sc_out sc_lv 32 signal 13 } 
	{ filter_buff_1_1_1_address0 sc_out sc_lv 4 signal 14 } 
	{ filter_buff_1_1_1_ce0 sc_out sc_logic 1 signal 14 } 
	{ filter_buff_1_1_1_we0 sc_out sc_logic 1 signal 14 } 
	{ filter_buff_1_1_1_d0 sc_out sc_lv 32 signal 14 } 
	{ filter_buff_1_1_2_address0 sc_out sc_lv 4 signal 15 } 
	{ filter_buff_1_1_2_ce0 sc_out sc_logic 1 signal 15 } 
	{ filter_buff_1_1_2_we0 sc_out sc_logic 1 signal 15 } 
	{ filter_buff_1_1_2_d0 sc_out sc_lv 32 signal 15 } 
	{ filter_buff_1_2_0_address0 sc_out sc_lv 4 signal 16 } 
	{ filter_buff_1_2_0_ce0 sc_out sc_logic 1 signal 16 } 
	{ filter_buff_1_2_0_we0 sc_out sc_logic 1 signal 16 } 
	{ filter_buff_1_2_0_d0 sc_out sc_lv 32 signal 16 } 
	{ filter_buff_1_2_1_address0 sc_out sc_lv 4 signal 17 } 
	{ filter_buff_1_2_1_ce0 sc_out sc_logic 1 signal 17 } 
	{ filter_buff_1_2_1_we0 sc_out sc_logic 1 signal 17 } 
	{ filter_buff_1_2_1_d0 sc_out sc_lv 32 signal 17 } 
	{ filter_buff_1_2_2_address0 sc_out sc_lv 4 signal 18 } 
	{ filter_buff_1_2_2_ce0 sc_out sc_logic 1 signal 18 } 
	{ filter_buff_1_2_2_we0 sc_out sc_logic 1 signal 18 } 
	{ filter_buff_1_2_2_d0 sc_out sc_lv 32 signal 18 } 
	{ filter_buff_2_0_0_address0 sc_out sc_lv 4 signal 19 } 
	{ filter_buff_2_0_0_ce0 sc_out sc_logic 1 signal 19 } 
	{ filter_buff_2_0_0_we0 sc_out sc_logic 1 signal 19 } 
	{ filter_buff_2_0_0_d0 sc_out sc_lv 32 signal 19 } 
	{ filter_buff_2_0_1_address0 sc_out sc_lv 4 signal 20 } 
	{ filter_buff_2_0_1_ce0 sc_out sc_logic 1 signal 20 } 
	{ filter_buff_2_0_1_we0 sc_out sc_logic 1 signal 20 } 
	{ filter_buff_2_0_1_d0 sc_out sc_lv 32 signal 20 } 
	{ filter_buff_2_0_2_address0 sc_out sc_lv 4 signal 21 } 
	{ filter_buff_2_0_2_ce0 sc_out sc_logic 1 signal 21 } 
	{ filter_buff_2_0_2_we0 sc_out sc_logic 1 signal 21 } 
	{ filter_buff_2_0_2_d0 sc_out sc_lv 32 signal 21 } 
	{ filter_buff_2_1_0_address0 sc_out sc_lv 4 signal 22 } 
	{ filter_buff_2_1_0_ce0 sc_out sc_logic 1 signal 22 } 
	{ filter_buff_2_1_0_we0 sc_out sc_logic 1 signal 22 } 
	{ filter_buff_2_1_0_d0 sc_out sc_lv 32 signal 22 } 
	{ filter_buff_2_1_1_address0 sc_out sc_lv 4 signal 23 } 
	{ filter_buff_2_1_1_ce0 sc_out sc_logic 1 signal 23 } 
	{ filter_buff_2_1_1_we0 sc_out sc_logic 1 signal 23 } 
	{ filter_buff_2_1_1_d0 sc_out sc_lv 32 signal 23 } 
	{ filter_buff_2_1_2_address0 sc_out sc_lv 4 signal 24 } 
	{ filter_buff_2_1_2_ce0 sc_out sc_logic 1 signal 24 } 
	{ filter_buff_2_1_2_we0 sc_out sc_logic 1 signal 24 } 
	{ filter_buff_2_1_2_d0 sc_out sc_lv 32 signal 24 } 
	{ filter_buff_2_2_0_address0 sc_out sc_lv 4 signal 25 } 
	{ filter_buff_2_2_0_ce0 sc_out sc_logic 1 signal 25 } 
	{ filter_buff_2_2_0_we0 sc_out sc_logic 1 signal 25 } 
	{ filter_buff_2_2_0_d0 sc_out sc_lv 32 signal 25 } 
	{ filter_buff_2_2_1_address0 sc_out sc_lv 4 signal 26 } 
	{ filter_buff_2_2_1_ce0 sc_out sc_logic 1 signal 26 } 
	{ filter_buff_2_2_1_we0 sc_out sc_logic 1 signal 26 } 
	{ filter_buff_2_2_1_d0 sc_out sc_lv 32 signal 26 } 
	{ filter_buff_2_2_2_address0 sc_out sc_lv 4 signal 27 } 
	{ filter_buff_2_2_2_ce0 sc_out sc_logic 1 signal 27 } 
	{ filter_buff_2_2_2_we0 sc_out sc_logic 1 signal 27 } 
	{ filter_buff_2_2_2_d0 sc_out sc_lv 32 signal 27 } 
	{ filter_buff_3_0_0_address0 sc_out sc_lv 4 signal 28 } 
	{ filter_buff_3_0_0_ce0 sc_out sc_logic 1 signal 28 } 
	{ filter_buff_3_0_0_we0 sc_out sc_logic 1 signal 28 } 
	{ filter_buff_3_0_0_d0 sc_out sc_lv 32 signal 28 } 
	{ filter_buff_3_0_1_address0 sc_out sc_lv 4 signal 29 } 
	{ filter_buff_3_0_1_ce0 sc_out sc_logic 1 signal 29 } 
	{ filter_buff_3_0_1_we0 sc_out sc_logic 1 signal 29 } 
	{ filter_buff_3_0_1_d0 sc_out sc_lv 32 signal 29 } 
	{ filter_buff_3_0_2_address0 sc_out sc_lv 4 signal 30 } 
	{ filter_buff_3_0_2_ce0 sc_out sc_logic 1 signal 30 } 
	{ filter_buff_3_0_2_we0 sc_out sc_logic 1 signal 30 } 
	{ filter_buff_3_0_2_d0 sc_out sc_lv 32 signal 30 } 
	{ filter_buff_3_1_0_address0 sc_out sc_lv 4 signal 31 } 
	{ filter_buff_3_1_0_ce0 sc_out sc_logic 1 signal 31 } 
	{ filter_buff_3_1_0_we0 sc_out sc_logic 1 signal 31 } 
	{ filter_buff_3_1_0_d0 sc_out sc_lv 32 signal 31 } 
	{ filter_buff_3_1_1_address0 sc_out sc_lv 4 signal 32 } 
	{ filter_buff_3_1_1_ce0 sc_out sc_logic 1 signal 32 } 
	{ filter_buff_3_1_1_we0 sc_out sc_logic 1 signal 32 } 
	{ filter_buff_3_1_1_d0 sc_out sc_lv 32 signal 32 } 
	{ filter_buff_3_1_2_address0 sc_out sc_lv 4 signal 33 } 
	{ filter_buff_3_1_2_ce0 sc_out sc_logic 1 signal 33 } 
	{ filter_buff_3_1_2_we0 sc_out sc_logic 1 signal 33 } 
	{ filter_buff_3_1_2_d0 sc_out sc_lv 32 signal 33 } 
	{ filter_buff_3_2_0_address0 sc_out sc_lv 4 signal 34 } 
	{ filter_buff_3_2_0_ce0 sc_out sc_logic 1 signal 34 } 
	{ filter_buff_3_2_0_we0 sc_out sc_logic 1 signal 34 } 
	{ filter_buff_3_2_0_d0 sc_out sc_lv 32 signal 34 } 
	{ filter_buff_3_2_1_address0 sc_out sc_lv 4 signal 35 } 
	{ filter_buff_3_2_1_ce0 sc_out sc_logic 1 signal 35 } 
	{ filter_buff_3_2_1_we0 sc_out sc_logic 1 signal 35 } 
	{ filter_buff_3_2_1_d0 sc_out sc_lv 32 signal 35 } 
	{ filter_buff_3_2_2_address0 sc_out sc_lv 4 signal 36 } 
	{ filter_buff_3_2_2_ce0 sc_out sc_logic 1 signal 36 } 
	{ filter_buff_3_2_2_we0 sc_out sc_logic 1 signal 36 } 
	{ filter_buff_3_2_2_d0 sc_out sc_lv 32 signal 36 } 
	{ filter_buff_4_0_0_address0 sc_out sc_lv 4 signal 37 } 
	{ filter_buff_4_0_0_ce0 sc_out sc_logic 1 signal 37 } 
	{ filter_buff_4_0_0_we0 sc_out sc_logic 1 signal 37 } 
	{ filter_buff_4_0_0_d0 sc_out sc_lv 32 signal 37 } 
	{ filter_buff_4_0_1_address0 sc_out sc_lv 4 signal 38 } 
	{ filter_buff_4_0_1_ce0 sc_out sc_logic 1 signal 38 } 
	{ filter_buff_4_0_1_we0 sc_out sc_logic 1 signal 38 } 
	{ filter_buff_4_0_1_d0 sc_out sc_lv 32 signal 38 } 
	{ filter_buff_4_0_2_address0 sc_out sc_lv 4 signal 39 } 
	{ filter_buff_4_0_2_ce0 sc_out sc_logic 1 signal 39 } 
	{ filter_buff_4_0_2_we0 sc_out sc_logic 1 signal 39 } 
	{ filter_buff_4_0_2_d0 sc_out sc_lv 32 signal 39 } 
	{ filter_buff_4_1_0_address0 sc_out sc_lv 4 signal 40 } 
	{ filter_buff_4_1_0_ce0 sc_out sc_logic 1 signal 40 } 
	{ filter_buff_4_1_0_we0 sc_out sc_logic 1 signal 40 } 
	{ filter_buff_4_1_0_d0 sc_out sc_lv 32 signal 40 } 
	{ filter_buff_4_1_1_address0 sc_out sc_lv 4 signal 41 } 
	{ filter_buff_4_1_1_ce0 sc_out sc_logic 1 signal 41 } 
	{ filter_buff_4_1_1_we0 sc_out sc_logic 1 signal 41 } 
	{ filter_buff_4_1_1_d0 sc_out sc_lv 32 signal 41 } 
	{ filter_buff_4_1_2_address0 sc_out sc_lv 4 signal 42 } 
	{ filter_buff_4_1_2_ce0 sc_out sc_logic 1 signal 42 } 
	{ filter_buff_4_1_2_we0 sc_out sc_logic 1 signal 42 } 
	{ filter_buff_4_1_2_d0 sc_out sc_lv 32 signal 42 } 
	{ filter_buff_4_2_0_address0 sc_out sc_lv 4 signal 43 } 
	{ filter_buff_4_2_0_ce0 sc_out sc_logic 1 signal 43 } 
	{ filter_buff_4_2_0_we0 sc_out sc_logic 1 signal 43 } 
	{ filter_buff_4_2_0_d0 sc_out sc_lv 32 signal 43 } 
	{ filter_buff_4_2_1_address0 sc_out sc_lv 4 signal 44 } 
	{ filter_buff_4_2_1_ce0 sc_out sc_logic 1 signal 44 } 
	{ filter_buff_4_2_1_we0 sc_out sc_logic 1 signal 44 } 
	{ filter_buff_4_2_1_d0 sc_out sc_lv 32 signal 44 } 
	{ filter_buff_4_2_2_address0 sc_out sc_lv 4 signal 45 } 
	{ filter_buff_4_2_2_ce0 sc_out sc_logic 1 signal 45 } 
	{ filter_buff_4_2_2_we0 sc_out sc_logic 1 signal 45 } 
	{ filter_buff_4_2_2_d0 sc_out sc_lv 32 signal 45 } 
	{ filter_buff_5_0_0_address0 sc_out sc_lv 4 signal 46 } 
	{ filter_buff_5_0_0_ce0 sc_out sc_logic 1 signal 46 } 
	{ filter_buff_5_0_0_we0 sc_out sc_logic 1 signal 46 } 
	{ filter_buff_5_0_0_d0 sc_out sc_lv 32 signal 46 } 
	{ filter_buff_5_0_1_address0 sc_out sc_lv 4 signal 47 } 
	{ filter_buff_5_0_1_ce0 sc_out sc_logic 1 signal 47 } 
	{ filter_buff_5_0_1_we0 sc_out sc_logic 1 signal 47 } 
	{ filter_buff_5_0_1_d0 sc_out sc_lv 32 signal 47 } 
	{ filter_buff_5_0_2_address0 sc_out sc_lv 4 signal 48 } 
	{ filter_buff_5_0_2_ce0 sc_out sc_logic 1 signal 48 } 
	{ filter_buff_5_0_2_we0 sc_out sc_logic 1 signal 48 } 
	{ filter_buff_5_0_2_d0 sc_out sc_lv 32 signal 48 } 
	{ filter_buff_5_1_0_address0 sc_out sc_lv 4 signal 49 } 
	{ filter_buff_5_1_0_ce0 sc_out sc_logic 1 signal 49 } 
	{ filter_buff_5_1_0_we0 sc_out sc_logic 1 signal 49 } 
	{ filter_buff_5_1_0_d0 sc_out sc_lv 32 signal 49 } 
	{ filter_buff_5_1_1_address0 sc_out sc_lv 4 signal 50 } 
	{ filter_buff_5_1_1_ce0 sc_out sc_logic 1 signal 50 } 
	{ filter_buff_5_1_1_we0 sc_out sc_logic 1 signal 50 } 
	{ filter_buff_5_1_1_d0 sc_out sc_lv 32 signal 50 } 
	{ filter_buff_5_1_2_address0 sc_out sc_lv 4 signal 51 } 
	{ filter_buff_5_1_2_ce0 sc_out sc_logic 1 signal 51 } 
	{ filter_buff_5_1_2_we0 sc_out sc_logic 1 signal 51 } 
	{ filter_buff_5_1_2_d0 sc_out sc_lv 32 signal 51 } 
	{ filter_buff_5_2_0_address0 sc_out sc_lv 4 signal 52 } 
	{ filter_buff_5_2_0_ce0 sc_out sc_logic 1 signal 52 } 
	{ filter_buff_5_2_0_we0 sc_out sc_logic 1 signal 52 } 
	{ filter_buff_5_2_0_d0 sc_out sc_lv 32 signal 52 } 
	{ filter_buff_5_2_1_address0 sc_out sc_lv 4 signal 53 } 
	{ filter_buff_5_2_1_ce0 sc_out sc_logic 1 signal 53 } 
	{ filter_buff_5_2_1_we0 sc_out sc_logic 1 signal 53 } 
	{ filter_buff_5_2_1_d0 sc_out sc_lv 32 signal 53 } 
	{ filter_buff_5_2_2_address0 sc_out sc_lv 4 signal 54 } 
	{ filter_buff_5_2_2_ce0 sc_out sc_logic 1 signal 54 } 
	{ filter_buff_5_2_2_we0 sc_out sc_logic 1 signal 54 } 
	{ filter_buff_5_2_2_d0 sc_out sc_lv 32 signal 54 } 
	{ filter_buff_6_0_0_address0 sc_out sc_lv 4 signal 55 } 
	{ filter_buff_6_0_0_ce0 sc_out sc_logic 1 signal 55 } 
	{ filter_buff_6_0_0_we0 sc_out sc_logic 1 signal 55 } 
	{ filter_buff_6_0_0_d0 sc_out sc_lv 32 signal 55 } 
	{ filter_buff_6_0_1_address0 sc_out sc_lv 4 signal 56 } 
	{ filter_buff_6_0_1_ce0 sc_out sc_logic 1 signal 56 } 
	{ filter_buff_6_0_1_we0 sc_out sc_logic 1 signal 56 } 
	{ filter_buff_6_0_1_d0 sc_out sc_lv 32 signal 56 } 
	{ filter_buff_6_0_2_address0 sc_out sc_lv 4 signal 57 } 
	{ filter_buff_6_0_2_ce0 sc_out sc_logic 1 signal 57 } 
	{ filter_buff_6_0_2_we0 sc_out sc_logic 1 signal 57 } 
	{ filter_buff_6_0_2_d0 sc_out sc_lv 32 signal 57 } 
	{ filter_buff_6_1_0_address0 sc_out sc_lv 4 signal 58 } 
	{ filter_buff_6_1_0_ce0 sc_out sc_logic 1 signal 58 } 
	{ filter_buff_6_1_0_we0 sc_out sc_logic 1 signal 58 } 
	{ filter_buff_6_1_0_d0 sc_out sc_lv 32 signal 58 } 
	{ filter_buff_6_1_1_address0 sc_out sc_lv 4 signal 59 } 
	{ filter_buff_6_1_1_ce0 sc_out sc_logic 1 signal 59 } 
	{ filter_buff_6_1_1_we0 sc_out sc_logic 1 signal 59 } 
	{ filter_buff_6_1_1_d0 sc_out sc_lv 32 signal 59 } 
	{ filter_buff_6_1_2_address0 sc_out sc_lv 4 signal 60 } 
	{ filter_buff_6_1_2_ce0 sc_out sc_logic 1 signal 60 } 
	{ filter_buff_6_1_2_we0 sc_out sc_logic 1 signal 60 } 
	{ filter_buff_6_1_2_d0 sc_out sc_lv 32 signal 60 } 
	{ filter_buff_6_2_0_address0 sc_out sc_lv 4 signal 61 } 
	{ filter_buff_6_2_0_ce0 sc_out sc_logic 1 signal 61 } 
	{ filter_buff_6_2_0_we0 sc_out sc_logic 1 signal 61 } 
	{ filter_buff_6_2_0_d0 sc_out sc_lv 32 signal 61 } 
	{ filter_buff_6_2_1_address0 sc_out sc_lv 4 signal 62 } 
	{ filter_buff_6_2_1_ce0 sc_out sc_logic 1 signal 62 } 
	{ filter_buff_6_2_1_we0 sc_out sc_logic 1 signal 62 } 
	{ filter_buff_6_2_1_d0 sc_out sc_lv 32 signal 62 } 
	{ filter_buff_6_2_2_address0 sc_out sc_lv 4 signal 63 } 
	{ filter_buff_6_2_2_ce0 sc_out sc_logic 1 signal 63 } 
	{ filter_buff_6_2_2_we0 sc_out sc_logic 1 signal 63 } 
	{ filter_buff_6_2_2_d0 sc_out sc_lv 32 signal 63 } 
	{ filter_buff_7_0_0_address0 sc_out sc_lv 4 signal 64 } 
	{ filter_buff_7_0_0_ce0 sc_out sc_logic 1 signal 64 } 
	{ filter_buff_7_0_0_we0 sc_out sc_logic 1 signal 64 } 
	{ filter_buff_7_0_0_d0 sc_out sc_lv 32 signal 64 } 
	{ filter_buff_7_0_1_address0 sc_out sc_lv 4 signal 65 } 
	{ filter_buff_7_0_1_ce0 sc_out sc_logic 1 signal 65 } 
	{ filter_buff_7_0_1_we0 sc_out sc_logic 1 signal 65 } 
	{ filter_buff_7_0_1_d0 sc_out sc_lv 32 signal 65 } 
	{ filter_buff_7_0_2_address0 sc_out sc_lv 4 signal 66 } 
	{ filter_buff_7_0_2_ce0 sc_out sc_logic 1 signal 66 } 
	{ filter_buff_7_0_2_we0 sc_out sc_logic 1 signal 66 } 
	{ filter_buff_7_0_2_d0 sc_out sc_lv 32 signal 66 } 
	{ filter_buff_7_1_0_address0 sc_out sc_lv 4 signal 67 } 
	{ filter_buff_7_1_0_ce0 sc_out sc_logic 1 signal 67 } 
	{ filter_buff_7_1_0_we0 sc_out sc_logic 1 signal 67 } 
	{ filter_buff_7_1_0_d0 sc_out sc_lv 32 signal 67 } 
	{ filter_buff_7_1_1_address0 sc_out sc_lv 4 signal 68 } 
	{ filter_buff_7_1_1_ce0 sc_out sc_logic 1 signal 68 } 
	{ filter_buff_7_1_1_we0 sc_out sc_logic 1 signal 68 } 
	{ filter_buff_7_1_1_d0 sc_out sc_lv 32 signal 68 } 
	{ filter_buff_7_1_2_address0 sc_out sc_lv 4 signal 69 } 
	{ filter_buff_7_1_2_ce0 sc_out sc_logic 1 signal 69 } 
	{ filter_buff_7_1_2_we0 sc_out sc_logic 1 signal 69 } 
	{ filter_buff_7_1_2_d0 sc_out sc_lv 32 signal 69 } 
	{ filter_buff_7_2_0_address0 sc_out sc_lv 4 signal 70 } 
	{ filter_buff_7_2_0_ce0 sc_out sc_logic 1 signal 70 } 
	{ filter_buff_7_2_0_we0 sc_out sc_logic 1 signal 70 } 
	{ filter_buff_7_2_0_d0 sc_out sc_lv 32 signal 70 } 
	{ filter_buff_7_2_1_address0 sc_out sc_lv 4 signal 71 } 
	{ filter_buff_7_2_1_ce0 sc_out sc_logic 1 signal 71 } 
	{ filter_buff_7_2_1_we0 sc_out sc_logic 1 signal 71 } 
	{ filter_buff_7_2_1_d0 sc_out sc_lv 32 signal 71 } 
	{ filter_buff_7_2_2_address0 sc_out sc_lv 4 signal 72 } 
	{ filter_buff_7_2_2_ce0 sc_out sc_logic 1 signal 72 } 
	{ filter_buff_7_2_2_we0 sc_out sc_logic 1 signal 72 } 
	{ filter_buff_7_2_2_d0 sc_out sc_lv 32 signal 72 } 
	{ filter_buff_8_0_0_address0 sc_out sc_lv 4 signal 73 } 
	{ filter_buff_8_0_0_ce0 sc_out sc_logic 1 signal 73 } 
	{ filter_buff_8_0_0_we0 sc_out sc_logic 1 signal 73 } 
	{ filter_buff_8_0_0_d0 sc_out sc_lv 32 signal 73 } 
	{ filter_buff_8_0_1_address0 sc_out sc_lv 4 signal 74 } 
	{ filter_buff_8_0_1_ce0 sc_out sc_logic 1 signal 74 } 
	{ filter_buff_8_0_1_we0 sc_out sc_logic 1 signal 74 } 
	{ filter_buff_8_0_1_d0 sc_out sc_lv 32 signal 74 } 
	{ filter_buff_8_0_2_address0 sc_out sc_lv 4 signal 75 } 
	{ filter_buff_8_0_2_ce0 sc_out sc_logic 1 signal 75 } 
	{ filter_buff_8_0_2_we0 sc_out sc_logic 1 signal 75 } 
	{ filter_buff_8_0_2_d0 sc_out sc_lv 32 signal 75 } 
	{ filter_buff_8_1_0_address0 sc_out sc_lv 4 signal 76 } 
	{ filter_buff_8_1_0_ce0 sc_out sc_logic 1 signal 76 } 
	{ filter_buff_8_1_0_we0 sc_out sc_logic 1 signal 76 } 
	{ filter_buff_8_1_0_d0 sc_out sc_lv 32 signal 76 } 
	{ filter_buff_8_1_1_address0 sc_out sc_lv 4 signal 77 } 
	{ filter_buff_8_1_1_ce0 sc_out sc_logic 1 signal 77 } 
	{ filter_buff_8_1_1_we0 sc_out sc_logic 1 signal 77 } 
	{ filter_buff_8_1_1_d0 sc_out sc_lv 32 signal 77 } 
	{ filter_buff_8_1_2_address0 sc_out sc_lv 4 signal 78 } 
	{ filter_buff_8_1_2_ce0 sc_out sc_logic 1 signal 78 } 
	{ filter_buff_8_1_2_we0 sc_out sc_logic 1 signal 78 } 
	{ filter_buff_8_1_2_d0 sc_out sc_lv 32 signal 78 } 
	{ filter_buff_8_2_0_address0 sc_out sc_lv 4 signal 79 } 
	{ filter_buff_8_2_0_ce0 sc_out sc_logic 1 signal 79 } 
	{ filter_buff_8_2_0_we0 sc_out sc_logic 1 signal 79 } 
	{ filter_buff_8_2_0_d0 sc_out sc_lv 32 signal 79 } 
	{ filter_buff_8_2_1_address0 sc_out sc_lv 4 signal 80 } 
	{ filter_buff_8_2_1_ce0 sc_out sc_logic 1 signal 80 } 
	{ filter_buff_8_2_1_we0 sc_out sc_logic 1 signal 80 } 
	{ filter_buff_8_2_1_d0 sc_out sc_lv 32 signal 80 } 
	{ filter_buff_8_2_2_address0 sc_out sc_lv 4 signal 81 } 
	{ filter_buff_8_2_2_ce0 sc_out sc_logic 1 signal 81 } 
	{ filter_buff_8_2_2_we0 sc_out sc_logic 1 signal 81 } 
	{ filter_buff_8_2_2_d0 sc_out sc_lv 32 signal 81 } 
	{ filter_buff_9_0_0_address0 sc_out sc_lv 4 signal 82 } 
	{ filter_buff_9_0_0_ce0 sc_out sc_logic 1 signal 82 } 
	{ filter_buff_9_0_0_we0 sc_out sc_logic 1 signal 82 } 
	{ filter_buff_9_0_0_d0 sc_out sc_lv 32 signal 82 } 
	{ filter_buff_9_0_1_address0 sc_out sc_lv 4 signal 83 } 
	{ filter_buff_9_0_1_ce0 sc_out sc_logic 1 signal 83 } 
	{ filter_buff_9_0_1_we0 sc_out sc_logic 1 signal 83 } 
	{ filter_buff_9_0_1_d0 sc_out sc_lv 32 signal 83 } 
	{ filter_buff_9_0_2_address0 sc_out sc_lv 4 signal 84 } 
	{ filter_buff_9_0_2_ce0 sc_out sc_logic 1 signal 84 } 
	{ filter_buff_9_0_2_we0 sc_out sc_logic 1 signal 84 } 
	{ filter_buff_9_0_2_d0 sc_out sc_lv 32 signal 84 } 
	{ filter_buff_9_1_0_address0 sc_out sc_lv 4 signal 85 } 
	{ filter_buff_9_1_0_ce0 sc_out sc_logic 1 signal 85 } 
	{ filter_buff_9_1_0_we0 sc_out sc_logic 1 signal 85 } 
	{ filter_buff_9_1_0_d0 sc_out sc_lv 32 signal 85 } 
	{ filter_buff_9_1_1_address0 sc_out sc_lv 4 signal 86 } 
	{ filter_buff_9_1_1_ce0 sc_out sc_logic 1 signal 86 } 
	{ filter_buff_9_1_1_we0 sc_out sc_logic 1 signal 86 } 
	{ filter_buff_9_1_1_d0 sc_out sc_lv 32 signal 86 } 
	{ filter_buff_9_1_2_address0 sc_out sc_lv 4 signal 87 } 
	{ filter_buff_9_1_2_ce0 sc_out sc_logic 1 signal 87 } 
	{ filter_buff_9_1_2_we0 sc_out sc_logic 1 signal 87 } 
	{ filter_buff_9_1_2_d0 sc_out sc_lv 32 signal 87 } 
	{ filter_buff_9_2_0_address0 sc_out sc_lv 4 signal 88 } 
	{ filter_buff_9_2_0_ce0 sc_out sc_logic 1 signal 88 } 
	{ filter_buff_9_2_0_we0 sc_out sc_logic 1 signal 88 } 
	{ filter_buff_9_2_0_d0 sc_out sc_lv 32 signal 88 } 
	{ filter_buff_9_2_1_address0 sc_out sc_lv 4 signal 89 } 
	{ filter_buff_9_2_1_ce0 sc_out sc_logic 1 signal 89 } 
	{ filter_buff_9_2_1_we0 sc_out sc_logic 1 signal 89 } 
	{ filter_buff_9_2_1_d0 sc_out sc_lv 32 signal 89 } 
	{ filter_buff_9_2_2_address0 sc_out sc_lv 4 signal 90 } 
	{ filter_buff_9_2_2_ce0 sc_out sc_logic 1 signal 90 } 
	{ filter_buff_9_2_2_we0 sc_out sc_logic 1 signal 90 } 
	{ filter_buff_9_2_2_d0 sc_out sc_lv 32 signal 90 } 
	{ filter_buff_10_0_0_address0 sc_out sc_lv 4 signal 91 } 
	{ filter_buff_10_0_0_ce0 sc_out sc_logic 1 signal 91 } 
	{ filter_buff_10_0_0_we0 sc_out sc_logic 1 signal 91 } 
	{ filter_buff_10_0_0_d0 sc_out sc_lv 32 signal 91 } 
	{ filter_buff_10_0_1_address0 sc_out sc_lv 4 signal 92 } 
	{ filter_buff_10_0_1_ce0 sc_out sc_logic 1 signal 92 } 
	{ filter_buff_10_0_1_we0 sc_out sc_logic 1 signal 92 } 
	{ filter_buff_10_0_1_d0 sc_out sc_lv 32 signal 92 } 
	{ filter_buff_10_0_2_address0 sc_out sc_lv 4 signal 93 } 
	{ filter_buff_10_0_2_ce0 sc_out sc_logic 1 signal 93 } 
	{ filter_buff_10_0_2_we0 sc_out sc_logic 1 signal 93 } 
	{ filter_buff_10_0_2_d0 sc_out sc_lv 32 signal 93 } 
	{ filter_buff_10_1_0_address0 sc_out sc_lv 4 signal 94 } 
	{ filter_buff_10_1_0_ce0 sc_out sc_logic 1 signal 94 } 
	{ filter_buff_10_1_0_we0 sc_out sc_logic 1 signal 94 } 
	{ filter_buff_10_1_0_d0 sc_out sc_lv 32 signal 94 } 
	{ filter_buff_10_1_1_address0 sc_out sc_lv 4 signal 95 } 
	{ filter_buff_10_1_1_ce0 sc_out sc_logic 1 signal 95 } 
	{ filter_buff_10_1_1_we0 sc_out sc_logic 1 signal 95 } 
	{ filter_buff_10_1_1_d0 sc_out sc_lv 32 signal 95 } 
	{ filter_buff_10_1_2_address0 sc_out sc_lv 4 signal 96 } 
	{ filter_buff_10_1_2_ce0 sc_out sc_logic 1 signal 96 } 
	{ filter_buff_10_1_2_we0 sc_out sc_logic 1 signal 96 } 
	{ filter_buff_10_1_2_d0 sc_out sc_lv 32 signal 96 } 
	{ filter_buff_10_2_0_address0 sc_out sc_lv 4 signal 97 } 
	{ filter_buff_10_2_0_ce0 sc_out sc_logic 1 signal 97 } 
	{ filter_buff_10_2_0_we0 sc_out sc_logic 1 signal 97 } 
	{ filter_buff_10_2_0_d0 sc_out sc_lv 32 signal 97 } 
	{ filter_buff_10_2_1_address0 sc_out sc_lv 4 signal 98 } 
	{ filter_buff_10_2_1_ce0 sc_out sc_logic 1 signal 98 } 
	{ filter_buff_10_2_1_we0 sc_out sc_logic 1 signal 98 } 
	{ filter_buff_10_2_1_d0 sc_out sc_lv 32 signal 98 } 
	{ filter_buff_10_2_2_address0 sc_out sc_lv 4 signal 99 } 
	{ filter_buff_10_2_2_ce0 sc_out sc_logic 1 signal 99 } 
	{ filter_buff_10_2_2_we0 sc_out sc_logic 1 signal 99 } 
	{ filter_buff_10_2_2_d0 sc_out sc_lv 32 signal 99 } 
	{ filter_buff_11_0_0_address0 sc_out sc_lv 4 signal 100 } 
	{ filter_buff_11_0_0_ce0 sc_out sc_logic 1 signal 100 } 
	{ filter_buff_11_0_0_we0 sc_out sc_logic 1 signal 100 } 
	{ filter_buff_11_0_0_d0 sc_out sc_lv 32 signal 100 } 
	{ filter_buff_11_0_1_address0 sc_out sc_lv 4 signal 101 } 
	{ filter_buff_11_0_1_ce0 sc_out sc_logic 1 signal 101 } 
	{ filter_buff_11_0_1_we0 sc_out sc_logic 1 signal 101 } 
	{ filter_buff_11_0_1_d0 sc_out sc_lv 32 signal 101 } 
	{ filter_buff_11_0_2_address0 sc_out sc_lv 4 signal 102 } 
	{ filter_buff_11_0_2_ce0 sc_out sc_logic 1 signal 102 } 
	{ filter_buff_11_0_2_we0 sc_out sc_logic 1 signal 102 } 
	{ filter_buff_11_0_2_d0 sc_out sc_lv 32 signal 102 } 
	{ filter_buff_11_1_0_address0 sc_out sc_lv 4 signal 103 } 
	{ filter_buff_11_1_0_ce0 sc_out sc_logic 1 signal 103 } 
	{ filter_buff_11_1_0_we0 sc_out sc_logic 1 signal 103 } 
	{ filter_buff_11_1_0_d0 sc_out sc_lv 32 signal 103 } 
	{ filter_buff_11_1_1_address0 sc_out sc_lv 4 signal 104 } 
	{ filter_buff_11_1_1_ce0 sc_out sc_logic 1 signal 104 } 
	{ filter_buff_11_1_1_we0 sc_out sc_logic 1 signal 104 } 
	{ filter_buff_11_1_1_d0 sc_out sc_lv 32 signal 104 } 
	{ filter_buff_11_1_2_address0 sc_out sc_lv 4 signal 105 } 
	{ filter_buff_11_1_2_ce0 sc_out sc_logic 1 signal 105 } 
	{ filter_buff_11_1_2_we0 sc_out sc_logic 1 signal 105 } 
	{ filter_buff_11_1_2_d0 sc_out sc_lv 32 signal 105 } 
	{ filter_buff_11_2_0_address0 sc_out sc_lv 4 signal 106 } 
	{ filter_buff_11_2_0_ce0 sc_out sc_logic 1 signal 106 } 
	{ filter_buff_11_2_0_we0 sc_out sc_logic 1 signal 106 } 
	{ filter_buff_11_2_0_d0 sc_out sc_lv 32 signal 106 } 
	{ filter_buff_11_2_1_address0 sc_out sc_lv 4 signal 107 } 
	{ filter_buff_11_2_1_ce0 sc_out sc_logic 1 signal 107 } 
	{ filter_buff_11_2_1_we0 sc_out sc_logic 1 signal 107 } 
	{ filter_buff_11_2_1_d0 sc_out sc_lv 32 signal 107 } 
	{ filter_buff_11_2_2_address0 sc_out sc_lv 4 signal 108 } 
	{ filter_buff_11_2_2_ce0 sc_out sc_logic 1 signal 108 } 
	{ filter_buff_11_2_2_we0 sc_out sc_logic 1 signal 108 } 
	{ filter_buff_11_2_2_d0 sc_out sc_lv 32 signal 108 } 
	{ filter_buff_12_0_0_address0 sc_out sc_lv 4 signal 109 } 
	{ filter_buff_12_0_0_ce0 sc_out sc_logic 1 signal 109 } 
	{ filter_buff_12_0_0_we0 sc_out sc_logic 1 signal 109 } 
	{ filter_buff_12_0_0_d0 sc_out sc_lv 32 signal 109 } 
	{ filter_buff_12_0_1_address0 sc_out sc_lv 4 signal 110 } 
	{ filter_buff_12_0_1_ce0 sc_out sc_logic 1 signal 110 } 
	{ filter_buff_12_0_1_we0 sc_out sc_logic 1 signal 110 } 
	{ filter_buff_12_0_1_d0 sc_out sc_lv 32 signal 110 } 
	{ filter_buff_12_0_2_address0 sc_out sc_lv 4 signal 111 } 
	{ filter_buff_12_0_2_ce0 sc_out sc_logic 1 signal 111 } 
	{ filter_buff_12_0_2_we0 sc_out sc_logic 1 signal 111 } 
	{ filter_buff_12_0_2_d0 sc_out sc_lv 32 signal 111 } 
	{ filter_buff_12_1_0_address0 sc_out sc_lv 4 signal 112 } 
	{ filter_buff_12_1_0_ce0 sc_out sc_logic 1 signal 112 } 
	{ filter_buff_12_1_0_we0 sc_out sc_logic 1 signal 112 } 
	{ filter_buff_12_1_0_d0 sc_out sc_lv 32 signal 112 } 
	{ filter_buff_12_1_1_address0 sc_out sc_lv 4 signal 113 } 
	{ filter_buff_12_1_1_ce0 sc_out sc_logic 1 signal 113 } 
	{ filter_buff_12_1_1_we0 sc_out sc_logic 1 signal 113 } 
	{ filter_buff_12_1_1_d0 sc_out sc_lv 32 signal 113 } 
	{ filter_buff_12_1_2_address0 sc_out sc_lv 4 signal 114 } 
	{ filter_buff_12_1_2_ce0 sc_out sc_logic 1 signal 114 } 
	{ filter_buff_12_1_2_we0 sc_out sc_logic 1 signal 114 } 
	{ filter_buff_12_1_2_d0 sc_out sc_lv 32 signal 114 } 
	{ filter_buff_12_2_0_address0 sc_out sc_lv 4 signal 115 } 
	{ filter_buff_12_2_0_ce0 sc_out sc_logic 1 signal 115 } 
	{ filter_buff_12_2_0_we0 sc_out sc_logic 1 signal 115 } 
	{ filter_buff_12_2_0_d0 sc_out sc_lv 32 signal 115 } 
	{ filter_buff_12_2_1_address0 sc_out sc_lv 4 signal 116 } 
	{ filter_buff_12_2_1_ce0 sc_out sc_logic 1 signal 116 } 
	{ filter_buff_12_2_1_we0 sc_out sc_logic 1 signal 116 } 
	{ filter_buff_12_2_1_d0 sc_out sc_lv 32 signal 116 } 
	{ filter_buff_12_2_2_address0 sc_out sc_lv 4 signal 117 } 
	{ filter_buff_12_2_2_ce0 sc_out sc_logic 1 signal 117 } 
	{ filter_buff_12_2_2_we0 sc_out sc_logic 1 signal 117 } 
	{ filter_buff_12_2_2_d0 sc_out sc_lv 32 signal 117 } 
	{ filter_buff_13_0_0_address0 sc_out sc_lv 4 signal 118 } 
	{ filter_buff_13_0_0_ce0 sc_out sc_logic 1 signal 118 } 
	{ filter_buff_13_0_0_we0 sc_out sc_logic 1 signal 118 } 
	{ filter_buff_13_0_0_d0 sc_out sc_lv 32 signal 118 } 
	{ filter_buff_13_0_1_address0 sc_out sc_lv 4 signal 119 } 
	{ filter_buff_13_0_1_ce0 sc_out sc_logic 1 signal 119 } 
	{ filter_buff_13_0_1_we0 sc_out sc_logic 1 signal 119 } 
	{ filter_buff_13_0_1_d0 sc_out sc_lv 32 signal 119 } 
	{ filter_buff_13_0_2_address0 sc_out sc_lv 4 signal 120 } 
	{ filter_buff_13_0_2_ce0 sc_out sc_logic 1 signal 120 } 
	{ filter_buff_13_0_2_we0 sc_out sc_logic 1 signal 120 } 
	{ filter_buff_13_0_2_d0 sc_out sc_lv 32 signal 120 } 
	{ filter_buff_13_1_0_address0 sc_out sc_lv 4 signal 121 } 
	{ filter_buff_13_1_0_ce0 sc_out sc_logic 1 signal 121 } 
	{ filter_buff_13_1_0_we0 sc_out sc_logic 1 signal 121 } 
	{ filter_buff_13_1_0_d0 sc_out sc_lv 32 signal 121 } 
	{ filter_buff_13_1_1_address0 sc_out sc_lv 4 signal 122 } 
	{ filter_buff_13_1_1_ce0 sc_out sc_logic 1 signal 122 } 
	{ filter_buff_13_1_1_we0 sc_out sc_logic 1 signal 122 } 
	{ filter_buff_13_1_1_d0 sc_out sc_lv 32 signal 122 } 
	{ filter_buff_13_1_2_address0 sc_out sc_lv 4 signal 123 } 
	{ filter_buff_13_1_2_ce0 sc_out sc_logic 1 signal 123 } 
	{ filter_buff_13_1_2_we0 sc_out sc_logic 1 signal 123 } 
	{ filter_buff_13_1_2_d0 sc_out sc_lv 32 signal 123 } 
	{ filter_buff_13_2_0_address0 sc_out sc_lv 4 signal 124 } 
	{ filter_buff_13_2_0_ce0 sc_out sc_logic 1 signal 124 } 
	{ filter_buff_13_2_0_we0 sc_out sc_logic 1 signal 124 } 
	{ filter_buff_13_2_0_d0 sc_out sc_lv 32 signal 124 } 
	{ filter_buff_13_2_1_address0 sc_out sc_lv 4 signal 125 } 
	{ filter_buff_13_2_1_ce0 sc_out sc_logic 1 signal 125 } 
	{ filter_buff_13_2_1_we0 sc_out sc_logic 1 signal 125 } 
	{ filter_buff_13_2_1_d0 sc_out sc_lv 32 signal 125 } 
	{ filter_buff_13_2_2_address0 sc_out sc_lv 4 signal 126 } 
	{ filter_buff_13_2_2_ce0 sc_out sc_logic 1 signal 126 } 
	{ filter_buff_13_2_2_we0 sc_out sc_logic 1 signal 126 } 
	{ filter_buff_13_2_2_d0 sc_out sc_lv 32 signal 126 } 
	{ filter_buff_14_0_0_address0 sc_out sc_lv 4 signal 127 } 
	{ filter_buff_14_0_0_ce0 sc_out sc_logic 1 signal 127 } 
	{ filter_buff_14_0_0_we0 sc_out sc_logic 1 signal 127 } 
	{ filter_buff_14_0_0_d0 sc_out sc_lv 32 signal 127 } 
	{ filter_buff_14_0_1_address0 sc_out sc_lv 4 signal 128 } 
	{ filter_buff_14_0_1_ce0 sc_out sc_logic 1 signal 128 } 
	{ filter_buff_14_0_1_we0 sc_out sc_logic 1 signal 128 } 
	{ filter_buff_14_0_1_d0 sc_out sc_lv 32 signal 128 } 
	{ filter_buff_14_0_2_address0 sc_out sc_lv 4 signal 129 } 
	{ filter_buff_14_0_2_ce0 sc_out sc_logic 1 signal 129 } 
	{ filter_buff_14_0_2_we0 sc_out sc_logic 1 signal 129 } 
	{ filter_buff_14_0_2_d0 sc_out sc_lv 32 signal 129 } 
	{ filter_buff_14_1_0_address0 sc_out sc_lv 4 signal 130 } 
	{ filter_buff_14_1_0_ce0 sc_out sc_logic 1 signal 130 } 
	{ filter_buff_14_1_0_we0 sc_out sc_logic 1 signal 130 } 
	{ filter_buff_14_1_0_d0 sc_out sc_lv 32 signal 130 } 
	{ filter_buff_14_1_1_address0 sc_out sc_lv 4 signal 131 } 
	{ filter_buff_14_1_1_ce0 sc_out sc_logic 1 signal 131 } 
	{ filter_buff_14_1_1_we0 sc_out sc_logic 1 signal 131 } 
	{ filter_buff_14_1_1_d0 sc_out sc_lv 32 signal 131 } 
	{ filter_buff_14_1_2_address0 sc_out sc_lv 4 signal 132 } 
	{ filter_buff_14_1_2_ce0 sc_out sc_logic 1 signal 132 } 
	{ filter_buff_14_1_2_we0 sc_out sc_logic 1 signal 132 } 
	{ filter_buff_14_1_2_d0 sc_out sc_lv 32 signal 132 } 
	{ filter_buff_14_2_0_address0 sc_out sc_lv 4 signal 133 } 
	{ filter_buff_14_2_0_ce0 sc_out sc_logic 1 signal 133 } 
	{ filter_buff_14_2_0_we0 sc_out sc_logic 1 signal 133 } 
	{ filter_buff_14_2_0_d0 sc_out sc_lv 32 signal 133 } 
	{ filter_buff_14_2_1_address0 sc_out sc_lv 4 signal 134 } 
	{ filter_buff_14_2_1_ce0 sc_out sc_logic 1 signal 134 } 
	{ filter_buff_14_2_1_we0 sc_out sc_logic 1 signal 134 } 
	{ filter_buff_14_2_1_d0 sc_out sc_lv 32 signal 134 } 
	{ filter_buff_14_2_2_address0 sc_out sc_lv 4 signal 135 } 
	{ filter_buff_14_2_2_ce0 sc_out sc_logic 1 signal 135 } 
	{ filter_buff_14_2_2_we0 sc_out sc_logic 1 signal 135 } 
	{ filter_buff_14_2_2_d0 sc_out sc_lv 32 signal 135 } 
	{ filter_buff_15_0_0_address0 sc_out sc_lv 4 signal 136 } 
	{ filter_buff_15_0_0_ce0 sc_out sc_logic 1 signal 136 } 
	{ filter_buff_15_0_0_we0 sc_out sc_logic 1 signal 136 } 
	{ filter_buff_15_0_0_d0 sc_out sc_lv 32 signal 136 } 
	{ filter_buff_15_0_1_address0 sc_out sc_lv 4 signal 137 } 
	{ filter_buff_15_0_1_ce0 sc_out sc_logic 1 signal 137 } 
	{ filter_buff_15_0_1_we0 sc_out sc_logic 1 signal 137 } 
	{ filter_buff_15_0_1_d0 sc_out sc_lv 32 signal 137 } 
	{ filter_buff_15_0_2_address0 sc_out sc_lv 4 signal 138 } 
	{ filter_buff_15_0_2_ce0 sc_out sc_logic 1 signal 138 } 
	{ filter_buff_15_0_2_we0 sc_out sc_logic 1 signal 138 } 
	{ filter_buff_15_0_2_d0 sc_out sc_lv 32 signal 138 } 
	{ filter_buff_15_1_0_address0 sc_out sc_lv 4 signal 139 } 
	{ filter_buff_15_1_0_ce0 sc_out sc_logic 1 signal 139 } 
	{ filter_buff_15_1_0_we0 sc_out sc_logic 1 signal 139 } 
	{ filter_buff_15_1_0_d0 sc_out sc_lv 32 signal 139 } 
	{ filter_buff_15_1_1_address0 sc_out sc_lv 4 signal 140 } 
	{ filter_buff_15_1_1_ce0 sc_out sc_logic 1 signal 140 } 
	{ filter_buff_15_1_1_we0 sc_out sc_logic 1 signal 140 } 
	{ filter_buff_15_1_1_d0 sc_out sc_lv 32 signal 140 } 
	{ filter_buff_15_1_2_address0 sc_out sc_lv 4 signal 141 } 
	{ filter_buff_15_1_2_ce0 sc_out sc_logic 1 signal 141 } 
	{ filter_buff_15_1_2_we0 sc_out sc_logic 1 signal 141 } 
	{ filter_buff_15_1_2_d0 sc_out sc_lv 32 signal 141 } 
	{ filter_buff_15_2_0_address0 sc_out sc_lv 4 signal 142 } 
	{ filter_buff_15_2_0_ce0 sc_out sc_logic 1 signal 142 } 
	{ filter_buff_15_2_0_we0 sc_out sc_logic 1 signal 142 } 
	{ filter_buff_15_2_0_d0 sc_out sc_lv 32 signal 142 } 
	{ filter_buff_15_2_1_address0 sc_out sc_lv 4 signal 143 } 
	{ filter_buff_15_2_1_ce0 sc_out sc_logic 1 signal 143 } 
	{ filter_buff_15_2_1_we0 sc_out sc_logic 1 signal 143 } 
	{ filter_buff_15_2_1_d0 sc_out sc_lv 32 signal 143 } 
	{ filter_buff_15_2_2_address0 sc_out sc_lv 4 signal 144 } 
	{ filter_buff_15_2_2_ce0 sc_out sc_logic 1 signal 144 } 
	{ filter_buff_15_2_2_we0 sc_out sc_logic 1 signal 144 } 
	{ filter_buff_15_2_2_d0 sc_out sc_lv 32 signal 144 } 
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
 	{ "name": "filter_buff_0_0_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_0_0_0", "role": "address0" }} , 
 	{ "name": "filter_buff_0_0_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_0_0_0", "role": "ce0" }} , 
 	{ "name": "filter_buff_0_0_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_0_0_0", "role": "we0" }} , 
 	{ "name": "filter_buff_0_0_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_0_0_0", "role": "d0" }} , 
 	{ "name": "filter_buff_0_0_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_0_0_1", "role": "address0" }} , 
 	{ "name": "filter_buff_0_0_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_0_0_1", "role": "ce0" }} , 
 	{ "name": "filter_buff_0_0_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_0_0_1", "role": "we0" }} , 
 	{ "name": "filter_buff_0_0_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_0_0_1", "role": "d0" }} , 
 	{ "name": "filter_buff_0_0_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_0_0_2", "role": "address0" }} , 
 	{ "name": "filter_buff_0_0_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_0_0_2", "role": "ce0" }} , 
 	{ "name": "filter_buff_0_0_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_0_0_2", "role": "we0" }} , 
 	{ "name": "filter_buff_0_0_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_0_0_2", "role": "d0" }} , 
 	{ "name": "filter_buff_0_1_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_0_1_0", "role": "address0" }} , 
 	{ "name": "filter_buff_0_1_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_0_1_0", "role": "ce0" }} , 
 	{ "name": "filter_buff_0_1_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_0_1_0", "role": "we0" }} , 
 	{ "name": "filter_buff_0_1_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_0_1_0", "role": "d0" }} , 
 	{ "name": "filter_buff_0_1_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_0_1_1", "role": "address0" }} , 
 	{ "name": "filter_buff_0_1_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_0_1_1", "role": "ce0" }} , 
 	{ "name": "filter_buff_0_1_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_0_1_1", "role": "we0" }} , 
 	{ "name": "filter_buff_0_1_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_0_1_1", "role": "d0" }} , 
 	{ "name": "filter_buff_0_1_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_0_1_2", "role": "address0" }} , 
 	{ "name": "filter_buff_0_1_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_0_1_2", "role": "ce0" }} , 
 	{ "name": "filter_buff_0_1_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_0_1_2", "role": "we0" }} , 
 	{ "name": "filter_buff_0_1_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_0_1_2", "role": "d0" }} , 
 	{ "name": "filter_buff_0_2_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_0_2_0", "role": "address0" }} , 
 	{ "name": "filter_buff_0_2_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_0_2_0", "role": "ce0" }} , 
 	{ "name": "filter_buff_0_2_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_0_2_0", "role": "we0" }} , 
 	{ "name": "filter_buff_0_2_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_0_2_0", "role": "d0" }} , 
 	{ "name": "filter_buff_0_2_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_0_2_1", "role": "address0" }} , 
 	{ "name": "filter_buff_0_2_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_0_2_1", "role": "ce0" }} , 
 	{ "name": "filter_buff_0_2_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_0_2_1", "role": "we0" }} , 
 	{ "name": "filter_buff_0_2_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_0_2_1", "role": "d0" }} , 
 	{ "name": "filter_buff_0_2_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_0_2_2", "role": "address0" }} , 
 	{ "name": "filter_buff_0_2_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_0_2_2", "role": "ce0" }} , 
 	{ "name": "filter_buff_0_2_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_0_2_2", "role": "we0" }} , 
 	{ "name": "filter_buff_0_2_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_0_2_2", "role": "d0" }} , 
 	{ "name": "filter_buff_1_0_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_1_0_0", "role": "address0" }} , 
 	{ "name": "filter_buff_1_0_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_1_0_0", "role": "ce0" }} , 
 	{ "name": "filter_buff_1_0_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_1_0_0", "role": "we0" }} , 
 	{ "name": "filter_buff_1_0_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_1_0_0", "role": "d0" }} , 
 	{ "name": "filter_buff_1_0_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_1_0_1", "role": "address0" }} , 
 	{ "name": "filter_buff_1_0_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_1_0_1", "role": "ce0" }} , 
 	{ "name": "filter_buff_1_0_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_1_0_1", "role": "we0" }} , 
 	{ "name": "filter_buff_1_0_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_1_0_1", "role": "d0" }} , 
 	{ "name": "filter_buff_1_0_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_1_0_2", "role": "address0" }} , 
 	{ "name": "filter_buff_1_0_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_1_0_2", "role": "ce0" }} , 
 	{ "name": "filter_buff_1_0_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_1_0_2", "role": "we0" }} , 
 	{ "name": "filter_buff_1_0_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_1_0_2", "role": "d0" }} , 
 	{ "name": "filter_buff_1_1_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_1_1_0", "role": "address0" }} , 
 	{ "name": "filter_buff_1_1_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_1_1_0", "role": "ce0" }} , 
 	{ "name": "filter_buff_1_1_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_1_1_0", "role": "we0" }} , 
 	{ "name": "filter_buff_1_1_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_1_1_0", "role": "d0" }} , 
 	{ "name": "filter_buff_1_1_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_1_1_1", "role": "address0" }} , 
 	{ "name": "filter_buff_1_1_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_1_1_1", "role": "ce0" }} , 
 	{ "name": "filter_buff_1_1_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_1_1_1", "role": "we0" }} , 
 	{ "name": "filter_buff_1_1_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_1_1_1", "role": "d0" }} , 
 	{ "name": "filter_buff_1_1_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_1_1_2", "role": "address0" }} , 
 	{ "name": "filter_buff_1_1_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_1_1_2", "role": "ce0" }} , 
 	{ "name": "filter_buff_1_1_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_1_1_2", "role": "we0" }} , 
 	{ "name": "filter_buff_1_1_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_1_1_2", "role": "d0" }} , 
 	{ "name": "filter_buff_1_2_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_1_2_0", "role": "address0" }} , 
 	{ "name": "filter_buff_1_2_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_1_2_0", "role": "ce0" }} , 
 	{ "name": "filter_buff_1_2_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_1_2_0", "role": "we0" }} , 
 	{ "name": "filter_buff_1_2_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_1_2_0", "role": "d0" }} , 
 	{ "name": "filter_buff_1_2_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_1_2_1", "role": "address0" }} , 
 	{ "name": "filter_buff_1_2_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_1_2_1", "role": "ce0" }} , 
 	{ "name": "filter_buff_1_2_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_1_2_1", "role": "we0" }} , 
 	{ "name": "filter_buff_1_2_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_1_2_1", "role": "d0" }} , 
 	{ "name": "filter_buff_1_2_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_1_2_2", "role": "address0" }} , 
 	{ "name": "filter_buff_1_2_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_1_2_2", "role": "ce0" }} , 
 	{ "name": "filter_buff_1_2_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_1_2_2", "role": "we0" }} , 
 	{ "name": "filter_buff_1_2_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_1_2_2", "role": "d0" }} , 
 	{ "name": "filter_buff_2_0_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_2_0_0", "role": "address0" }} , 
 	{ "name": "filter_buff_2_0_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_2_0_0", "role": "ce0" }} , 
 	{ "name": "filter_buff_2_0_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_2_0_0", "role": "we0" }} , 
 	{ "name": "filter_buff_2_0_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_2_0_0", "role": "d0" }} , 
 	{ "name": "filter_buff_2_0_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_2_0_1", "role": "address0" }} , 
 	{ "name": "filter_buff_2_0_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_2_0_1", "role": "ce0" }} , 
 	{ "name": "filter_buff_2_0_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_2_0_1", "role": "we0" }} , 
 	{ "name": "filter_buff_2_0_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_2_0_1", "role": "d0" }} , 
 	{ "name": "filter_buff_2_0_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_2_0_2", "role": "address0" }} , 
 	{ "name": "filter_buff_2_0_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_2_0_2", "role": "ce0" }} , 
 	{ "name": "filter_buff_2_0_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_2_0_2", "role": "we0" }} , 
 	{ "name": "filter_buff_2_0_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_2_0_2", "role": "d0" }} , 
 	{ "name": "filter_buff_2_1_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_2_1_0", "role": "address0" }} , 
 	{ "name": "filter_buff_2_1_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_2_1_0", "role": "ce0" }} , 
 	{ "name": "filter_buff_2_1_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_2_1_0", "role": "we0" }} , 
 	{ "name": "filter_buff_2_1_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_2_1_0", "role": "d0" }} , 
 	{ "name": "filter_buff_2_1_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_2_1_1", "role": "address0" }} , 
 	{ "name": "filter_buff_2_1_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_2_1_1", "role": "ce0" }} , 
 	{ "name": "filter_buff_2_1_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_2_1_1", "role": "we0" }} , 
 	{ "name": "filter_buff_2_1_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_2_1_1", "role": "d0" }} , 
 	{ "name": "filter_buff_2_1_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_2_1_2", "role": "address0" }} , 
 	{ "name": "filter_buff_2_1_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_2_1_2", "role": "ce0" }} , 
 	{ "name": "filter_buff_2_1_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_2_1_2", "role": "we0" }} , 
 	{ "name": "filter_buff_2_1_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_2_1_2", "role": "d0" }} , 
 	{ "name": "filter_buff_2_2_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_2_2_0", "role": "address0" }} , 
 	{ "name": "filter_buff_2_2_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_2_2_0", "role": "ce0" }} , 
 	{ "name": "filter_buff_2_2_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_2_2_0", "role": "we0" }} , 
 	{ "name": "filter_buff_2_2_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_2_2_0", "role": "d0" }} , 
 	{ "name": "filter_buff_2_2_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_2_2_1", "role": "address0" }} , 
 	{ "name": "filter_buff_2_2_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_2_2_1", "role": "ce0" }} , 
 	{ "name": "filter_buff_2_2_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_2_2_1", "role": "we0" }} , 
 	{ "name": "filter_buff_2_2_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_2_2_1", "role": "d0" }} , 
 	{ "name": "filter_buff_2_2_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_2_2_2", "role": "address0" }} , 
 	{ "name": "filter_buff_2_2_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_2_2_2", "role": "ce0" }} , 
 	{ "name": "filter_buff_2_2_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_2_2_2", "role": "we0" }} , 
 	{ "name": "filter_buff_2_2_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_2_2_2", "role": "d0" }} , 
 	{ "name": "filter_buff_3_0_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_3_0_0", "role": "address0" }} , 
 	{ "name": "filter_buff_3_0_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_3_0_0", "role": "ce0" }} , 
 	{ "name": "filter_buff_3_0_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_3_0_0", "role": "we0" }} , 
 	{ "name": "filter_buff_3_0_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_3_0_0", "role": "d0" }} , 
 	{ "name": "filter_buff_3_0_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_3_0_1", "role": "address0" }} , 
 	{ "name": "filter_buff_3_0_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_3_0_1", "role": "ce0" }} , 
 	{ "name": "filter_buff_3_0_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_3_0_1", "role": "we0" }} , 
 	{ "name": "filter_buff_3_0_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_3_0_1", "role": "d0" }} , 
 	{ "name": "filter_buff_3_0_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_3_0_2", "role": "address0" }} , 
 	{ "name": "filter_buff_3_0_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_3_0_2", "role": "ce0" }} , 
 	{ "name": "filter_buff_3_0_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_3_0_2", "role": "we0" }} , 
 	{ "name": "filter_buff_3_0_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_3_0_2", "role": "d0" }} , 
 	{ "name": "filter_buff_3_1_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_3_1_0", "role": "address0" }} , 
 	{ "name": "filter_buff_3_1_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_3_1_0", "role": "ce0" }} , 
 	{ "name": "filter_buff_3_1_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_3_1_0", "role": "we0" }} , 
 	{ "name": "filter_buff_3_1_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_3_1_0", "role": "d0" }} , 
 	{ "name": "filter_buff_3_1_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_3_1_1", "role": "address0" }} , 
 	{ "name": "filter_buff_3_1_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_3_1_1", "role": "ce0" }} , 
 	{ "name": "filter_buff_3_1_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_3_1_1", "role": "we0" }} , 
 	{ "name": "filter_buff_3_1_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_3_1_1", "role": "d0" }} , 
 	{ "name": "filter_buff_3_1_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_3_1_2", "role": "address0" }} , 
 	{ "name": "filter_buff_3_1_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_3_1_2", "role": "ce0" }} , 
 	{ "name": "filter_buff_3_1_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_3_1_2", "role": "we0" }} , 
 	{ "name": "filter_buff_3_1_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_3_1_2", "role": "d0" }} , 
 	{ "name": "filter_buff_3_2_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_3_2_0", "role": "address0" }} , 
 	{ "name": "filter_buff_3_2_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_3_2_0", "role": "ce0" }} , 
 	{ "name": "filter_buff_3_2_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_3_2_0", "role": "we0" }} , 
 	{ "name": "filter_buff_3_2_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_3_2_0", "role": "d0" }} , 
 	{ "name": "filter_buff_3_2_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_3_2_1", "role": "address0" }} , 
 	{ "name": "filter_buff_3_2_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_3_2_1", "role": "ce0" }} , 
 	{ "name": "filter_buff_3_2_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_3_2_1", "role": "we0" }} , 
 	{ "name": "filter_buff_3_2_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_3_2_1", "role": "d0" }} , 
 	{ "name": "filter_buff_3_2_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_3_2_2", "role": "address0" }} , 
 	{ "name": "filter_buff_3_2_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_3_2_2", "role": "ce0" }} , 
 	{ "name": "filter_buff_3_2_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_3_2_2", "role": "we0" }} , 
 	{ "name": "filter_buff_3_2_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_3_2_2", "role": "d0" }} , 
 	{ "name": "filter_buff_4_0_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_4_0_0", "role": "address0" }} , 
 	{ "name": "filter_buff_4_0_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_4_0_0", "role": "ce0" }} , 
 	{ "name": "filter_buff_4_0_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_4_0_0", "role": "we0" }} , 
 	{ "name": "filter_buff_4_0_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_4_0_0", "role": "d0" }} , 
 	{ "name": "filter_buff_4_0_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_4_0_1", "role": "address0" }} , 
 	{ "name": "filter_buff_4_0_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_4_0_1", "role": "ce0" }} , 
 	{ "name": "filter_buff_4_0_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_4_0_1", "role": "we0" }} , 
 	{ "name": "filter_buff_4_0_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_4_0_1", "role": "d0" }} , 
 	{ "name": "filter_buff_4_0_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_4_0_2", "role": "address0" }} , 
 	{ "name": "filter_buff_4_0_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_4_0_2", "role": "ce0" }} , 
 	{ "name": "filter_buff_4_0_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_4_0_2", "role": "we0" }} , 
 	{ "name": "filter_buff_4_0_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_4_0_2", "role": "d0" }} , 
 	{ "name": "filter_buff_4_1_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_4_1_0", "role": "address0" }} , 
 	{ "name": "filter_buff_4_1_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_4_1_0", "role": "ce0" }} , 
 	{ "name": "filter_buff_4_1_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_4_1_0", "role": "we0" }} , 
 	{ "name": "filter_buff_4_1_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_4_1_0", "role": "d0" }} , 
 	{ "name": "filter_buff_4_1_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_4_1_1", "role": "address0" }} , 
 	{ "name": "filter_buff_4_1_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_4_1_1", "role": "ce0" }} , 
 	{ "name": "filter_buff_4_1_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_4_1_1", "role": "we0" }} , 
 	{ "name": "filter_buff_4_1_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_4_1_1", "role": "d0" }} , 
 	{ "name": "filter_buff_4_1_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_4_1_2", "role": "address0" }} , 
 	{ "name": "filter_buff_4_1_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_4_1_2", "role": "ce0" }} , 
 	{ "name": "filter_buff_4_1_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_4_1_2", "role": "we0" }} , 
 	{ "name": "filter_buff_4_1_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_4_1_2", "role": "d0" }} , 
 	{ "name": "filter_buff_4_2_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_4_2_0", "role": "address0" }} , 
 	{ "name": "filter_buff_4_2_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_4_2_0", "role": "ce0" }} , 
 	{ "name": "filter_buff_4_2_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_4_2_0", "role": "we0" }} , 
 	{ "name": "filter_buff_4_2_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_4_2_0", "role": "d0" }} , 
 	{ "name": "filter_buff_4_2_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_4_2_1", "role": "address0" }} , 
 	{ "name": "filter_buff_4_2_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_4_2_1", "role": "ce0" }} , 
 	{ "name": "filter_buff_4_2_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_4_2_1", "role": "we0" }} , 
 	{ "name": "filter_buff_4_2_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_4_2_1", "role": "d0" }} , 
 	{ "name": "filter_buff_4_2_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_4_2_2", "role": "address0" }} , 
 	{ "name": "filter_buff_4_2_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_4_2_2", "role": "ce0" }} , 
 	{ "name": "filter_buff_4_2_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_4_2_2", "role": "we0" }} , 
 	{ "name": "filter_buff_4_2_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_4_2_2", "role": "d0" }} , 
 	{ "name": "filter_buff_5_0_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_5_0_0", "role": "address0" }} , 
 	{ "name": "filter_buff_5_0_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_5_0_0", "role": "ce0" }} , 
 	{ "name": "filter_buff_5_0_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_5_0_0", "role": "we0" }} , 
 	{ "name": "filter_buff_5_0_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_5_0_0", "role": "d0" }} , 
 	{ "name": "filter_buff_5_0_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_5_0_1", "role": "address0" }} , 
 	{ "name": "filter_buff_5_0_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_5_0_1", "role": "ce0" }} , 
 	{ "name": "filter_buff_5_0_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_5_0_1", "role": "we0" }} , 
 	{ "name": "filter_buff_5_0_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_5_0_1", "role": "d0" }} , 
 	{ "name": "filter_buff_5_0_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_5_0_2", "role": "address0" }} , 
 	{ "name": "filter_buff_5_0_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_5_0_2", "role": "ce0" }} , 
 	{ "name": "filter_buff_5_0_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_5_0_2", "role": "we0" }} , 
 	{ "name": "filter_buff_5_0_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_5_0_2", "role": "d0" }} , 
 	{ "name": "filter_buff_5_1_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_5_1_0", "role": "address0" }} , 
 	{ "name": "filter_buff_5_1_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_5_1_0", "role": "ce0" }} , 
 	{ "name": "filter_buff_5_1_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_5_1_0", "role": "we0" }} , 
 	{ "name": "filter_buff_5_1_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_5_1_0", "role": "d0" }} , 
 	{ "name": "filter_buff_5_1_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_5_1_1", "role": "address0" }} , 
 	{ "name": "filter_buff_5_1_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_5_1_1", "role": "ce0" }} , 
 	{ "name": "filter_buff_5_1_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_5_1_1", "role": "we0" }} , 
 	{ "name": "filter_buff_5_1_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_5_1_1", "role": "d0" }} , 
 	{ "name": "filter_buff_5_1_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_5_1_2", "role": "address0" }} , 
 	{ "name": "filter_buff_5_1_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_5_1_2", "role": "ce0" }} , 
 	{ "name": "filter_buff_5_1_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_5_1_2", "role": "we0" }} , 
 	{ "name": "filter_buff_5_1_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_5_1_2", "role": "d0" }} , 
 	{ "name": "filter_buff_5_2_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_5_2_0", "role": "address0" }} , 
 	{ "name": "filter_buff_5_2_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_5_2_0", "role": "ce0" }} , 
 	{ "name": "filter_buff_5_2_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_5_2_0", "role": "we0" }} , 
 	{ "name": "filter_buff_5_2_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_5_2_0", "role": "d0" }} , 
 	{ "name": "filter_buff_5_2_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_5_2_1", "role": "address0" }} , 
 	{ "name": "filter_buff_5_2_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_5_2_1", "role": "ce0" }} , 
 	{ "name": "filter_buff_5_2_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_5_2_1", "role": "we0" }} , 
 	{ "name": "filter_buff_5_2_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_5_2_1", "role": "d0" }} , 
 	{ "name": "filter_buff_5_2_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_5_2_2", "role": "address0" }} , 
 	{ "name": "filter_buff_5_2_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_5_2_2", "role": "ce0" }} , 
 	{ "name": "filter_buff_5_2_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_5_2_2", "role": "we0" }} , 
 	{ "name": "filter_buff_5_2_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_5_2_2", "role": "d0" }} , 
 	{ "name": "filter_buff_6_0_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_6_0_0", "role": "address0" }} , 
 	{ "name": "filter_buff_6_0_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_6_0_0", "role": "ce0" }} , 
 	{ "name": "filter_buff_6_0_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_6_0_0", "role": "we0" }} , 
 	{ "name": "filter_buff_6_0_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_6_0_0", "role": "d0" }} , 
 	{ "name": "filter_buff_6_0_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_6_0_1", "role": "address0" }} , 
 	{ "name": "filter_buff_6_0_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_6_0_1", "role": "ce0" }} , 
 	{ "name": "filter_buff_6_0_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_6_0_1", "role": "we0" }} , 
 	{ "name": "filter_buff_6_0_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_6_0_1", "role": "d0" }} , 
 	{ "name": "filter_buff_6_0_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_6_0_2", "role": "address0" }} , 
 	{ "name": "filter_buff_6_0_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_6_0_2", "role": "ce0" }} , 
 	{ "name": "filter_buff_6_0_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_6_0_2", "role": "we0" }} , 
 	{ "name": "filter_buff_6_0_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_6_0_2", "role": "d0" }} , 
 	{ "name": "filter_buff_6_1_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_6_1_0", "role": "address0" }} , 
 	{ "name": "filter_buff_6_1_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_6_1_0", "role": "ce0" }} , 
 	{ "name": "filter_buff_6_1_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_6_1_0", "role": "we0" }} , 
 	{ "name": "filter_buff_6_1_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_6_1_0", "role": "d0" }} , 
 	{ "name": "filter_buff_6_1_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_6_1_1", "role": "address0" }} , 
 	{ "name": "filter_buff_6_1_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_6_1_1", "role": "ce0" }} , 
 	{ "name": "filter_buff_6_1_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_6_1_1", "role": "we0" }} , 
 	{ "name": "filter_buff_6_1_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_6_1_1", "role": "d0" }} , 
 	{ "name": "filter_buff_6_1_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_6_1_2", "role": "address0" }} , 
 	{ "name": "filter_buff_6_1_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_6_1_2", "role": "ce0" }} , 
 	{ "name": "filter_buff_6_1_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_6_1_2", "role": "we0" }} , 
 	{ "name": "filter_buff_6_1_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_6_1_2", "role": "d0" }} , 
 	{ "name": "filter_buff_6_2_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_6_2_0", "role": "address0" }} , 
 	{ "name": "filter_buff_6_2_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_6_2_0", "role": "ce0" }} , 
 	{ "name": "filter_buff_6_2_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_6_2_0", "role": "we0" }} , 
 	{ "name": "filter_buff_6_2_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_6_2_0", "role": "d0" }} , 
 	{ "name": "filter_buff_6_2_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_6_2_1", "role": "address0" }} , 
 	{ "name": "filter_buff_6_2_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_6_2_1", "role": "ce0" }} , 
 	{ "name": "filter_buff_6_2_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_6_2_1", "role": "we0" }} , 
 	{ "name": "filter_buff_6_2_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_6_2_1", "role": "d0" }} , 
 	{ "name": "filter_buff_6_2_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_6_2_2", "role": "address0" }} , 
 	{ "name": "filter_buff_6_2_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_6_2_2", "role": "ce0" }} , 
 	{ "name": "filter_buff_6_2_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_6_2_2", "role": "we0" }} , 
 	{ "name": "filter_buff_6_2_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_6_2_2", "role": "d0" }} , 
 	{ "name": "filter_buff_7_0_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_7_0_0", "role": "address0" }} , 
 	{ "name": "filter_buff_7_0_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_7_0_0", "role": "ce0" }} , 
 	{ "name": "filter_buff_7_0_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_7_0_0", "role": "we0" }} , 
 	{ "name": "filter_buff_7_0_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_7_0_0", "role": "d0" }} , 
 	{ "name": "filter_buff_7_0_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_7_0_1", "role": "address0" }} , 
 	{ "name": "filter_buff_7_0_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_7_0_1", "role": "ce0" }} , 
 	{ "name": "filter_buff_7_0_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_7_0_1", "role": "we0" }} , 
 	{ "name": "filter_buff_7_0_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_7_0_1", "role": "d0" }} , 
 	{ "name": "filter_buff_7_0_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_7_0_2", "role": "address0" }} , 
 	{ "name": "filter_buff_7_0_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_7_0_2", "role": "ce0" }} , 
 	{ "name": "filter_buff_7_0_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_7_0_2", "role": "we0" }} , 
 	{ "name": "filter_buff_7_0_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_7_0_2", "role": "d0" }} , 
 	{ "name": "filter_buff_7_1_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_7_1_0", "role": "address0" }} , 
 	{ "name": "filter_buff_7_1_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_7_1_0", "role": "ce0" }} , 
 	{ "name": "filter_buff_7_1_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_7_1_0", "role": "we0" }} , 
 	{ "name": "filter_buff_7_1_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_7_1_0", "role": "d0" }} , 
 	{ "name": "filter_buff_7_1_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_7_1_1", "role": "address0" }} , 
 	{ "name": "filter_buff_7_1_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_7_1_1", "role": "ce0" }} , 
 	{ "name": "filter_buff_7_1_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_7_1_1", "role": "we0" }} , 
 	{ "name": "filter_buff_7_1_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_7_1_1", "role": "d0" }} , 
 	{ "name": "filter_buff_7_1_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_7_1_2", "role": "address0" }} , 
 	{ "name": "filter_buff_7_1_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_7_1_2", "role": "ce0" }} , 
 	{ "name": "filter_buff_7_1_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_7_1_2", "role": "we0" }} , 
 	{ "name": "filter_buff_7_1_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_7_1_2", "role": "d0" }} , 
 	{ "name": "filter_buff_7_2_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_7_2_0", "role": "address0" }} , 
 	{ "name": "filter_buff_7_2_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_7_2_0", "role": "ce0" }} , 
 	{ "name": "filter_buff_7_2_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_7_2_0", "role": "we0" }} , 
 	{ "name": "filter_buff_7_2_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_7_2_0", "role": "d0" }} , 
 	{ "name": "filter_buff_7_2_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_7_2_1", "role": "address0" }} , 
 	{ "name": "filter_buff_7_2_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_7_2_1", "role": "ce0" }} , 
 	{ "name": "filter_buff_7_2_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_7_2_1", "role": "we0" }} , 
 	{ "name": "filter_buff_7_2_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_7_2_1", "role": "d0" }} , 
 	{ "name": "filter_buff_7_2_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_7_2_2", "role": "address0" }} , 
 	{ "name": "filter_buff_7_2_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_7_2_2", "role": "ce0" }} , 
 	{ "name": "filter_buff_7_2_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_7_2_2", "role": "we0" }} , 
 	{ "name": "filter_buff_7_2_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_7_2_2", "role": "d0" }} , 
 	{ "name": "filter_buff_8_0_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_8_0_0", "role": "address0" }} , 
 	{ "name": "filter_buff_8_0_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_8_0_0", "role": "ce0" }} , 
 	{ "name": "filter_buff_8_0_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_8_0_0", "role": "we0" }} , 
 	{ "name": "filter_buff_8_0_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_8_0_0", "role": "d0" }} , 
 	{ "name": "filter_buff_8_0_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_8_0_1", "role": "address0" }} , 
 	{ "name": "filter_buff_8_0_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_8_0_1", "role": "ce0" }} , 
 	{ "name": "filter_buff_8_0_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_8_0_1", "role": "we0" }} , 
 	{ "name": "filter_buff_8_0_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_8_0_1", "role": "d0" }} , 
 	{ "name": "filter_buff_8_0_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_8_0_2", "role": "address0" }} , 
 	{ "name": "filter_buff_8_0_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_8_0_2", "role": "ce0" }} , 
 	{ "name": "filter_buff_8_0_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_8_0_2", "role": "we0" }} , 
 	{ "name": "filter_buff_8_0_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_8_0_2", "role": "d0" }} , 
 	{ "name": "filter_buff_8_1_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_8_1_0", "role": "address0" }} , 
 	{ "name": "filter_buff_8_1_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_8_1_0", "role": "ce0" }} , 
 	{ "name": "filter_buff_8_1_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_8_1_0", "role": "we0" }} , 
 	{ "name": "filter_buff_8_1_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_8_1_0", "role": "d0" }} , 
 	{ "name": "filter_buff_8_1_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_8_1_1", "role": "address0" }} , 
 	{ "name": "filter_buff_8_1_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_8_1_1", "role": "ce0" }} , 
 	{ "name": "filter_buff_8_1_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_8_1_1", "role": "we0" }} , 
 	{ "name": "filter_buff_8_1_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_8_1_1", "role": "d0" }} , 
 	{ "name": "filter_buff_8_1_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_8_1_2", "role": "address0" }} , 
 	{ "name": "filter_buff_8_1_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_8_1_2", "role": "ce0" }} , 
 	{ "name": "filter_buff_8_1_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_8_1_2", "role": "we0" }} , 
 	{ "name": "filter_buff_8_1_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_8_1_2", "role": "d0" }} , 
 	{ "name": "filter_buff_8_2_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_8_2_0", "role": "address0" }} , 
 	{ "name": "filter_buff_8_2_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_8_2_0", "role": "ce0" }} , 
 	{ "name": "filter_buff_8_2_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_8_2_0", "role": "we0" }} , 
 	{ "name": "filter_buff_8_2_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_8_2_0", "role": "d0" }} , 
 	{ "name": "filter_buff_8_2_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_8_2_1", "role": "address0" }} , 
 	{ "name": "filter_buff_8_2_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_8_2_1", "role": "ce0" }} , 
 	{ "name": "filter_buff_8_2_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_8_2_1", "role": "we0" }} , 
 	{ "name": "filter_buff_8_2_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_8_2_1", "role": "d0" }} , 
 	{ "name": "filter_buff_8_2_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_8_2_2", "role": "address0" }} , 
 	{ "name": "filter_buff_8_2_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_8_2_2", "role": "ce0" }} , 
 	{ "name": "filter_buff_8_2_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_8_2_2", "role": "we0" }} , 
 	{ "name": "filter_buff_8_2_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_8_2_2", "role": "d0" }} , 
 	{ "name": "filter_buff_9_0_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_9_0_0", "role": "address0" }} , 
 	{ "name": "filter_buff_9_0_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_9_0_0", "role": "ce0" }} , 
 	{ "name": "filter_buff_9_0_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_9_0_0", "role": "we0" }} , 
 	{ "name": "filter_buff_9_0_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_9_0_0", "role": "d0" }} , 
 	{ "name": "filter_buff_9_0_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_9_0_1", "role": "address0" }} , 
 	{ "name": "filter_buff_9_0_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_9_0_1", "role": "ce0" }} , 
 	{ "name": "filter_buff_9_0_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_9_0_1", "role": "we0" }} , 
 	{ "name": "filter_buff_9_0_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_9_0_1", "role": "d0" }} , 
 	{ "name": "filter_buff_9_0_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_9_0_2", "role": "address0" }} , 
 	{ "name": "filter_buff_9_0_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_9_0_2", "role": "ce0" }} , 
 	{ "name": "filter_buff_9_0_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_9_0_2", "role": "we0" }} , 
 	{ "name": "filter_buff_9_0_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_9_0_2", "role": "d0" }} , 
 	{ "name": "filter_buff_9_1_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_9_1_0", "role": "address0" }} , 
 	{ "name": "filter_buff_9_1_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_9_1_0", "role": "ce0" }} , 
 	{ "name": "filter_buff_9_1_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_9_1_0", "role": "we0" }} , 
 	{ "name": "filter_buff_9_1_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_9_1_0", "role": "d0" }} , 
 	{ "name": "filter_buff_9_1_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_9_1_1", "role": "address0" }} , 
 	{ "name": "filter_buff_9_1_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_9_1_1", "role": "ce0" }} , 
 	{ "name": "filter_buff_9_1_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_9_1_1", "role": "we0" }} , 
 	{ "name": "filter_buff_9_1_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_9_1_1", "role": "d0" }} , 
 	{ "name": "filter_buff_9_1_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_9_1_2", "role": "address0" }} , 
 	{ "name": "filter_buff_9_1_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_9_1_2", "role": "ce0" }} , 
 	{ "name": "filter_buff_9_1_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_9_1_2", "role": "we0" }} , 
 	{ "name": "filter_buff_9_1_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_9_1_2", "role": "d0" }} , 
 	{ "name": "filter_buff_9_2_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_9_2_0", "role": "address0" }} , 
 	{ "name": "filter_buff_9_2_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_9_2_0", "role": "ce0" }} , 
 	{ "name": "filter_buff_9_2_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_9_2_0", "role": "we0" }} , 
 	{ "name": "filter_buff_9_2_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_9_2_0", "role": "d0" }} , 
 	{ "name": "filter_buff_9_2_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_9_2_1", "role": "address0" }} , 
 	{ "name": "filter_buff_9_2_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_9_2_1", "role": "ce0" }} , 
 	{ "name": "filter_buff_9_2_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_9_2_1", "role": "we0" }} , 
 	{ "name": "filter_buff_9_2_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_9_2_1", "role": "d0" }} , 
 	{ "name": "filter_buff_9_2_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_9_2_2", "role": "address0" }} , 
 	{ "name": "filter_buff_9_2_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_9_2_2", "role": "ce0" }} , 
 	{ "name": "filter_buff_9_2_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_9_2_2", "role": "we0" }} , 
 	{ "name": "filter_buff_9_2_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_9_2_2", "role": "d0" }} , 
 	{ "name": "filter_buff_10_0_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_10_0_0", "role": "address0" }} , 
 	{ "name": "filter_buff_10_0_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_10_0_0", "role": "ce0" }} , 
 	{ "name": "filter_buff_10_0_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_10_0_0", "role": "we0" }} , 
 	{ "name": "filter_buff_10_0_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_10_0_0", "role": "d0" }} , 
 	{ "name": "filter_buff_10_0_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_10_0_1", "role": "address0" }} , 
 	{ "name": "filter_buff_10_0_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_10_0_1", "role": "ce0" }} , 
 	{ "name": "filter_buff_10_0_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_10_0_1", "role": "we0" }} , 
 	{ "name": "filter_buff_10_0_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_10_0_1", "role": "d0" }} , 
 	{ "name": "filter_buff_10_0_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_10_0_2", "role": "address0" }} , 
 	{ "name": "filter_buff_10_0_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_10_0_2", "role": "ce0" }} , 
 	{ "name": "filter_buff_10_0_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_10_0_2", "role": "we0" }} , 
 	{ "name": "filter_buff_10_0_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_10_0_2", "role": "d0" }} , 
 	{ "name": "filter_buff_10_1_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_10_1_0", "role": "address0" }} , 
 	{ "name": "filter_buff_10_1_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_10_1_0", "role": "ce0" }} , 
 	{ "name": "filter_buff_10_1_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_10_1_0", "role": "we0" }} , 
 	{ "name": "filter_buff_10_1_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_10_1_0", "role": "d0" }} , 
 	{ "name": "filter_buff_10_1_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_10_1_1", "role": "address0" }} , 
 	{ "name": "filter_buff_10_1_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_10_1_1", "role": "ce0" }} , 
 	{ "name": "filter_buff_10_1_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_10_1_1", "role": "we0" }} , 
 	{ "name": "filter_buff_10_1_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_10_1_1", "role": "d0" }} , 
 	{ "name": "filter_buff_10_1_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_10_1_2", "role": "address0" }} , 
 	{ "name": "filter_buff_10_1_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_10_1_2", "role": "ce0" }} , 
 	{ "name": "filter_buff_10_1_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_10_1_2", "role": "we0" }} , 
 	{ "name": "filter_buff_10_1_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_10_1_2", "role": "d0" }} , 
 	{ "name": "filter_buff_10_2_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_10_2_0", "role": "address0" }} , 
 	{ "name": "filter_buff_10_2_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_10_2_0", "role": "ce0" }} , 
 	{ "name": "filter_buff_10_2_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_10_2_0", "role": "we0" }} , 
 	{ "name": "filter_buff_10_2_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_10_2_0", "role": "d0" }} , 
 	{ "name": "filter_buff_10_2_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_10_2_1", "role": "address0" }} , 
 	{ "name": "filter_buff_10_2_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_10_2_1", "role": "ce0" }} , 
 	{ "name": "filter_buff_10_2_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_10_2_1", "role": "we0" }} , 
 	{ "name": "filter_buff_10_2_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_10_2_1", "role": "d0" }} , 
 	{ "name": "filter_buff_10_2_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_10_2_2", "role": "address0" }} , 
 	{ "name": "filter_buff_10_2_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_10_2_2", "role": "ce0" }} , 
 	{ "name": "filter_buff_10_2_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_10_2_2", "role": "we0" }} , 
 	{ "name": "filter_buff_10_2_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_10_2_2", "role": "d0" }} , 
 	{ "name": "filter_buff_11_0_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_11_0_0", "role": "address0" }} , 
 	{ "name": "filter_buff_11_0_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_11_0_0", "role": "ce0" }} , 
 	{ "name": "filter_buff_11_0_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_11_0_0", "role": "we0" }} , 
 	{ "name": "filter_buff_11_0_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_11_0_0", "role": "d0" }} , 
 	{ "name": "filter_buff_11_0_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_11_0_1", "role": "address0" }} , 
 	{ "name": "filter_buff_11_0_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_11_0_1", "role": "ce0" }} , 
 	{ "name": "filter_buff_11_0_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_11_0_1", "role": "we0" }} , 
 	{ "name": "filter_buff_11_0_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_11_0_1", "role": "d0" }} , 
 	{ "name": "filter_buff_11_0_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_11_0_2", "role": "address0" }} , 
 	{ "name": "filter_buff_11_0_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_11_0_2", "role": "ce0" }} , 
 	{ "name": "filter_buff_11_0_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_11_0_2", "role": "we0" }} , 
 	{ "name": "filter_buff_11_0_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_11_0_2", "role": "d0" }} , 
 	{ "name": "filter_buff_11_1_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_11_1_0", "role": "address0" }} , 
 	{ "name": "filter_buff_11_1_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_11_1_0", "role": "ce0" }} , 
 	{ "name": "filter_buff_11_1_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_11_1_0", "role": "we0" }} , 
 	{ "name": "filter_buff_11_1_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_11_1_0", "role": "d0" }} , 
 	{ "name": "filter_buff_11_1_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_11_1_1", "role": "address0" }} , 
 	{ "name": "filter_buff_11_1_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_11_1_1", "role": "ce0" }} , 
 	{ "name": "filter_buff_11_1_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_11_1_1", "role": "we0" }} , 
 	{ "name": "filter_buff_11_1_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_11_1_1", "role": "d0" }} , 
 	{ "name": "filter_buff_11_1_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_11_1_2", "role": "address0" }} , 
 	{ "name": "filter_buff_11_1_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_11_1_2", "role": "ce0" }} , 
 	{ "name": "filter_buff_11_1_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_11_1_2", "role": "we0" }} , 
 	{ "name": "filter_buff_11_1_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_11_1_2", "role": "d0" }} , 
 	{ "name": "filter_buff_11_2_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_11_2_0", "role": "address0" }} , 
 	{ "name": "filter_buff_11_2_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_11_2_0", "role": "ce0" }} , 
 	{ "name": "filter_buff_11_2_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_11_2_0", "role": "we0" }} , 
 	{ "name": "filter_buff_11_2_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_11_2_0", "role": "d0" }} , 
 	{ "name": "filter_buff_11_2_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_11_2_1", "role": "address0" }} , 
 	{ "name": "filter_buff_11_2_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_11_2_1", "role": "ce0" }} , 
 	{ "name": "filter_buff_11_2_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_11_2_1", "role": "we0" }} , 
 	{ "name": "filter_buff_11_2_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_11_2_1", "role": "d0" }} , 
 	{ "name": "filter_buff_11_2_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_11_2_2", "role": "address0" }} , 
 	{ "name": "filter_buff_11_2_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_11_2_2", "role": "ce0" }} , 
 	{ "name": "filter_buff_11_2_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_11_2_2", "role": "we0" }} , 
 	{ "name": "filter_buff_11_2_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_11_2_2", "role": "d0" }} , 
 	{ "name": "filter_buff_12_0_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_12_0_0", "role": "address0" }} , 
 	{ "name": "filter_buff_12_0_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_12_0_0", "role": "ce0" }} , 
 	{ "name": "filter_buff_12_0_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_12_0_0", "role": "we0" }} , 
 	{ "name": "filter_buff_12_0_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_12_0_0", "role": "d0" }} , 
 	{ "name": "filter_buff_12_0_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_12_0_1", "role": "address0" }} , 
 	{ "name": "filter_buff_12_0_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_12_0_1", "role": "ce0" }} , 
 	{ "name": "filter_buff_12_0_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_12_0_1", "role": "we0" }} , 
 	{ "name": "filter_buff_12_0_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_12_0_1", "role": "d0" }} , 
 	{ "name": "filter_buff_12_0_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_12_0_2", "role": "address0" }} , 
 	{ "name": "filter_buff_12_0_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_12_0_2", "role": "ce0" }} , 
 	{ "name": "filter_buff_12_0_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_12_0_2", "role": "we0" }} , 
 	{ "name": "filter_buff_12_0_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_12_0_2", "role": "d0" }} , 
 	{ "name": "filter_buff_12_1_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_12_1_0", "role": "address0" }} , 
 	{ "name": "filter_buff_12_1_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_12_1_0", "role": "ce0" }} , 
 	{ "name": "filter_buff_12_1_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_12_1_0", "role": "we0" }} , 
 	{ "name": "filter_buff_12_1_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_12_1_0", "role": "d0" }} , 
 	{ "name": "filter_buff_12_1_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_12_1_1", "role": "address0" }} , 
 	{ "name": "filter_buff_12_1_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_12_1_1", "role": "ce0" }} , 
 	{ "name": "filter_buff_12_1_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_12_1_1", "role": "we0" }} , 
 	{ "name": "filter_buff_12_1_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_12_1_1", "role": "d0" }} , 
 	{ "name": "filter_buff_12_1_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_12_1_2", "role": "address0" }} , 
 	{ "name": "filter_buff_12_1_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_12_1_2", "role": "ce0" }} , 
 	{ "name": "filter_buff_12_1_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_12_1_2", "role": "we0" }} , 
 	{ "name": "filter_buff_12_1_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_12_1_2", "role": "d0" }} , 
 	{ "name": "filter_buff_12_2_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_12_2_0", "role": "address0" }} , 
 	{ "name": "filter_buff_12_2_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_12_2_0", "role": "ce0" }} , 
 	{ "name": "filter_buff_12_2_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_12_2_0", "role": "we0" }} , 
 	{ "name": "filter_buff_12_2_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_12_2_0", "role": "d0" }} , 
 	{ "name": "filter_buff_12_2_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_12_2_1", "role": "address0" }} , 
 	{ "name": "filter_buff_12_2_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_12_2_1", "role": "ce0" }} , 
 	{ "name": "filter_buff_12_2_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_12_2_1", "role": "we0" }} , 
 	{ "name": "filter_buff_12_2_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_12_2_1", "role": "d0" }} , 
 	{ "name": "filter_buff_12_2_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_12_2_2", "role": "address0" }} , 
 	{ "name": "filter_buff_12_2_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_12_2_2", "role": "ce0" }} , 
 	{ "name": "filter_buff_12_2_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_12_2_2", "role": "we0" }} , 
 	{ "name": "filter_buff_12_2_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_12_2_2", "role": "d0" }} , 
 	{ "name": "filter_buff_13_0_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_13_0_0", "role": "address0" }} , 
 	{ "name": "filter_buff_13_0_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_13_0_0", "role": "ce0" }} , 
 	{ "name": "filter_buff_13_0_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_13_0_0", "role": "we0" }} , 
 	{ "name": "filter_buff_13_0_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_13_0_0", "role": "d0" }} , 
 	{ "name": "filter_buff_13_0_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_13_0_1", "role": "address0" }} , 
 	{ "name": "filter_buff_13_0_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_13_0_1", "role": "ce0" }} , 
 	{ "name": "filter_buff_13_0_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_13_0_1", "role": "we0" }} , 
 	{ "name": "filter_buff_13_0_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_13_0_1", "role": "d0" }} , 
 	{ "name": "filter_buff_13_0_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_13_0_2", "role": "address0" }} , 
 	{ "name": "filter_buff_13_0_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_13_0_2", "role": "ce0" }} , 
 	{ "name": "filter_buff_13_0_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_13_0_2", "role": "we0" }} , 
 	{ "name": "filter_buff_13_0_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_13_0_2", "role": "d0" }} , 
 	{ "name": "filter_buff_13_1_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_13_1_0", "role": "address0" }} , 
 	{ "name": "filter_buff_13_1_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_13_1_0", "role": "ce0" }} , 
 	{ "name": "filter_buff_13_1_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_13_1_0", "role": "we0" }} , 
 	{ "name": "filter_buff_13_1_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_13_1_0", "role": "d0" }} , 
 	{ "name": "filter_buff_13_1_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_13_1_1", "role": "address0" }} , 
 	{ "name": "filter_buff_13_1_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_13_1_1", "role": "ce0" }} , 
 	{ "name": "filter_buff_13_1_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_13_1_1", "role": "we0" }} , 
 	{ "name": "filter_buff_13_1_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_13_1_1", "role": "d0" }} , 
 	{ "name": "filter_buff_13_1_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_13_1_2", "role": "address0" }} , 
 	{ "name": "filter_buff_13_1_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_13_1_2", "role": "ce0" }} , 
 	{ "name": "filter_buff_13_1_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_13_1_2", "role": "we0" }} , 
 	{ "name": "filter_buff_13_1_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_13_1_2", "role": "d0" }} , 
 	{ "name": "filter_buff_13_2_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_13_2_0", "role": "address0" }} , 
 	{ "name": "filter_buff_13_2_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_13_2_0", "role": "ce0" }} , 
 	{ "name": "filter_buff_13_2_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_13_2_0", "role": "we0" }} , 
 	{ "name": "filter_buff_13_2_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_13_2_0", "role": "d0" }} , 
 	{ "name": "filter_buff_13_2_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_13_2_1", "role": "address0" }} , 
 	{ "name": "filter_buff_13_2_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_13_2_1", "role": "ce0" }} , 
 	{ "name": "filter_buff_13_2_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_13_2_1", "role": "we0" }} , 
 	{ "name": "filter_buff_13_2_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_13_2_1", "role": "d0" }} , 
 	{ "name": "filter_buff_13_2_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_13_2_2", "role": "address0" }} , 
 	{ "name": "filter_buff_13_2_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_13_2_2", "role": "ce0" }} , 
 	{ "name": "filter_buff_13_2_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_13_2_2", "role": "we0" }} , 
 	{ "name": "filter_buff_13_2_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_13_2_2", "role": "d0" }} , 
 	{ "name": "filter_buff_14_0_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_14_0_0", "role": "address0" }} , 
 	{ "name": "filter_buff_14_0_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_14_0_0", "role": "ce0" }} , 
 	{ "name": "filter_buff_14_0_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_14_0_0", "role": "we0" }} , 
 	{ "name": "filter_buff_14_0_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_14_0_0", "role": "d0" }} , 
 	{ "name": "filter_buff_14_0_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_14_0_1", "role": "address0" }} , 
 	{ "name": "filter_buff_14_0_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_14_0_1", "role": "ce0" }} , 
 	{ "name": "filter_buff_14_0_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_14_0_1", "role": "we0" }} , 
 	{ "name": "filter_buff_14_0_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_14_0_1", "role": "d0" }} , 
 	{ "name": "filter_buff_14_0_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_14_0_2", "role": "address0" }} , 
 	{ "name": "filter_buff_14_0_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_14_0_2", "role": "ce0" }} , 
 	{ "name": "filter_buff_14_0_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_14_0_2", "role": "we0" }} , 
 	{ "name": "filter_buff_14_0_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_14_0_2", "role": "d0" }} , 
 	{ "name": "filter_buff_14_1_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_14_1_0", "role": "address0" }} , 
 	{ "name": "filter_buff_14_1_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_14_1_0", "role": "ce0" }} , 
 	{ "name": "filter_buff_14_1_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_14_1_0", "role": "we0" }} , 
 	{ "name": "filter_buff_14_1_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_14_1_0", "role": "d0" }} , 
 	{ "name": "filter_buff_14_1_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_14_1_1", "role": "address0" }} , 
 	{ "name": "filter_buff_14_1_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_14_1_1", "role": "ce0" }} , 
 	{ "name": "filter_buff_14_1_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_14_1_1", "role": "we0" }} , 
 	{ "name": "filter_buff_14_1_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_14_1_1", "role": "d0" }} , 
 	{ "name": "filter_buff_14_1_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_14_1_2", "role": "address0" }} , 
 	{ "name": "filter_buff_14_1_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_14_1_2", "role": "ce0" }} , 
 	{ "name": "filter_buff_14_1_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_14_1_2", "role": "we0" }} , 
 	{ "name": "filter_buff_14_1_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_14_1_2", "role": "d0" }} , 
 	{ "name": "filter_buff_14_2_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_14_2_0", "role": "address0" }} , 
 	{ "name": "filter_buff_14_2_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_14_2_0", "role": "ce0" }} , 
 	{ "name": "filter_buff_14_2_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_14_2_0", "role": "we0" }} , 
 	{ "name": "filter_buff_14_2_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_14_2_0", "role": "d0" }} , 
 	{ "name": "filter_buff_14_2_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_14_2_1", "role": "address0" }} , 
 	{ "name": "filter_buff_14_2_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_14_2_1", "role": "ce0" }} , 
 	{ "name": "filter_buff_14_2_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_14_2_1", "role": "we0" }} , 
 	{ "name": "filter_buff_14_2_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_14_2_1", "role": "d0" }} , 
 	{ "name": "filter_buff_14_2_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_14_2_2", "role": "address0" }} , 
 	{ "name": "filter_buff_14_2_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_14_2_2", "role": "ce0" }} , 
 	{ "name": "filter_buff_14_2_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_14_2_2", "role": "we0" }} , 
 	{ "name": "filter_buff_14_2_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_14_2_2", "role": "d0" }} , 
 	{ "name": "filter_buff_15_0_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_15_0_0", "role": "address0" }} , 
 	{ "name": "filter_buff_15_0_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_15_0_0", "role": "ce0" }} , 
 	{ "name": "filter_buff_15_0_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_15_0_0", "role": "we0" }} , 
 	{ "name": "filter_buff_15_0_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_15_0_0", "role": "d0" }} , 
 	{ "name": "filter_buff_15_0_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_15_0_1", "role": "address0" }} , 
 	{ "name": "filter_buff_15_0_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_15_0_1", "role": "ce0" }} , 
 	{ "name": "filter_buff_15_0_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_15_0_1", "role": "we0" }} , 
 	{ "name": "filter_buff_15_0_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_15_0_1", "role": "d0" }} , 
 	{ "name": "filter_buff_15_0_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_15_0_2", "role": "address0" }} , 
 	{ "name": "filter_buff_15_0_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_15_0_2", "role": "ce0" }} , 
 	{ "name": "filter_buff_15_0_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_15_0_2", "role": "we0" }} , 
 	{ "name": "filter_buff_15_0_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_15_0_2", "role": "d0" }} , 
 	{ "name": "filter_buff_15_1_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_15_1_0", "role": "address0" }} , 
 	{ "name": "filter_buff_15_1_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_15_1_0", "role": "ce0" }} , 
 	{ "name": "filter_buff_15_1_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_15_1_0", "role": "we0" }} , 
 	{ "name": "filter_buff_15_1_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_15_1_0", "role": "d0" }} , 
 	{ "name": "filter_buff_15_1_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_15_1_1", "role": "address0" }} , 
 	{ "name": "filter_buff_15_1_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_15_1_1", "role": "ce0" }} , 
 	{ "name": "filter_buff_15_1_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_15_1_1", "role": "we0" }} , 
 	{ "name": "filter_buff_15_1_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_15_1_1", "role": "d0" }} , 
 	{ "name": "filter_buff_15_1_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_15_1_2", "role": "address0" }} , 
 	{ "name": "filter_buff_15_1_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_15_1_2", "role": "ce0" }} , 
 	{ "name": "filter_buff_15_1_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_15_1_2", "role": "we0" }} , 
 	{ "name": "filter_buff_15_1_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_15_1_2", "role": "d0" }} , 
 	{ "name": "filter_buff_15_2_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_15_2_0", "role": "address0" }} , 
 	{ "name": "filter_buff_15_2_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_15_2_0", "role": "ce0" }} , 
 	{ "name": "filter_buff_15_2_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_15_2_0", "role": "we0" }} , 
 	{ "name": "filter_buff_15_2_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_15_2_0", "role": "d0" }} , 
 	{ "name": "filter_buff_15_2_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_15_2_1", "role": "address0" }} , 
 	{ "name": "filter_buff_15_2_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_15_2_1", "role": "ce0" }} , 
 	{ "name": "filter_buff_15_2_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_15_2_1", "role": "we0" }} , 
 	{ "name": "filter_buff_15_2_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_15_2_1", "role": "d0" }} , 
 	{ "name": "filter_buff_15_2_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "filter_buff_15_2_2", "role": "address0" }} , 
 	{ "name": "filter_buff_15_2_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_15_2_2", "role": "ce0" }} , 
 	{ "name": "filter_buff_15_2_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_buff_15_2_2", "role": "we0" }} , 
 	{ "name": "filter_buff_15_2_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_buff_15_2_2", "role": "d0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
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
			{"Name" : "filter_buff_15_2_2", "Type" : "Memory", "Direction" : "O"}]}]}


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
		filter_buff_15_2_2 {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "258", "Max" : "258"}
	, {"Name" : "Interval", "Min" : "258", "Max" : "258"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	wgt { axis {  { wgt_TDATA in_data 0 512 }  { wgt_TVALID in_vld 0 1 }  { wgt_TREADY in_acc 1 1 } } }
	filter_buff_0_0_0 { ap_memory {  { filter_buff_0_0_0_address0 mem_address 1 4 }  { filter_buff_0_0_0_ce0 mem_ce 1 1 }  { filter_buff_0_0_0_we0 mem_we 1 1 }  { filter_buff_0_0_0_d0 mem_din 1 32 } } }
	filter_buff_0_0_1 { ap_memory {  { filter_buff_0_0_1_address0 mem_address 1 4 }  { filter_buff_0_0_1_ce0 mem_ce 1 1 }  { filter_buff_0_0_1_we0 mem_we 1 1 }  { filter_buff_0_0_1_d0 mem_din 1 32 } } }
	filter_buff_0_0_2 { ap_memory {  { filter_buff_0_0_2_address0 mem_address 1 4 }  { filter_buff_0_0_2_ce0 mem_ce 1 1 }  { filter_buff_0_0_2_we0 mem_we 1 1 }  { filter_buff_0_0_2_d0 mem_din 1 32 } } }
	filter_buff_0_1_0 { ap_memory {  { filter_buff_0_1_0_address0 mem_address 1 4 }  { filter_buff_0_1_0_ce0 mem_ce 1 1 }  { filter_buff_0_1_0_we0 mem_we 1 1 }  { filter_buff_0_1_0_d0 mem_din 1 32 } } }
	filter_buff_0_1_1 { ap_memory {  { filter_buff_0_1_1_address0 mem_address 1 4 }  { filter_buff_0_1_1_ce0 mem_ce 1 1 }  { filter_buff_0_1_1_we0 mem_we 1 1 }  { filter_buff_0_1_1_d0 mem_din 1 32 } } }
	filter_buff_0_1_2 { ap_memory {  { filter_buff_0_1_2_address0 mem_address 1 4 }  { filter_buff_0_1_2_ce0 mem_ce 1 1 }  { filter_buff_0_1_2_we0 mem_we 1 1 }  { filter_buff_0_1_2_d0 mem_din 1 32 } } }
	filter_buff_0_2_0 { ap_memory {  { filter_buff_0_2_0_address0 mem_address 1 4 }  { filter_buff_0_2_0_ce0 mem_ce 1 1 }  { filter_buff_0_2_0_we0 mem_we 1 1 }  { filter_buff_0_2_0_d0 mem_din 1 32 } } }
	filter_buff_0_2_1 { ap_memory {  { filter_buff_0_2_1_address0 mem_address 1 4 }  { filter_buff_0_2_1_ce0 mem_ce 1 1 }  { filter_buff_0_2_1_we0 mem_we 1 1 }  { filter_buff_0_2_1_d0 mem_din 1 32 } } }
	filter_buff_0_2_2 { ap_memory {  { filter_buff_0_2_2_address0 mem_address 1 4 }  { filter_buff_0_2_2_ce0 mem_ce 1 1 }  { filter_buff_0_2_2_we0 mem_we 1 1 }  { filter_buff_0_2_2_d0 mem_din 1 32 } } }
	filter_buff_1_0_0 { ap_memory {  { filter_buff_1_0_0_address0 mem_address 1 4 }  { filter_buff_1_0_0_ce0 mem_ce 1 1 }  { filter_buff_1_0_0_we0 mem_we 1 1 }  { filter_buff_1_0_0_d0 mem_din 1 32 } } }
	filter_buff_1_0_1 { ap_memory {  { filter_buff_1_0_1_address0 mem_address 1 4 }  { filter_buff_1_0_1_ce0 mem_ce 1 1 }  { filter_buff_1_0_1_we0 mem_we 1 1 }  { filter_buff_1_0_1_d0 mem_din 1 32 } } }
	filter_buff_1_0_2 { ap_memory {  { filter_buff_1_0_2_address0 mem_address 1 4 }  { filter_buff_1_0_2_ce0 mem_ce 1 1 }  { filter_buff_1_0_2_we0 mem_we 1 1 }  { filter_buff_1_0_2_d0 mem_din 1 32 } } }
	filter_buff_1_1_0 { ap_memory {  { filter_buff_1_1_0_address0 mem_address 1 4 }  { filter_buff_1_1_0_ce0 mem_ce 1 1 }  { filter_buff_1_1_0_we0 mem_we 1 1 }  { filter_buff_1_1_0_d0 mem_din 1 32 } } }
	filter_buff_1_1_1 { ap_memory {  { filter_buff_1_1_1_address0 mem_address 1 4 }  { filter_buff_1_1_1_ce0 mem_ce 1 1 }  { filter_buff_1_1_1_we0 mem_we 1 1 }  { filter_buff_1_1_1_d0 mem_din 1 32 } } }
	filter_buff_1_1_2 { ap_memory {  { filter_buff_1_1_2_address0 mem_address 1 4 }  { filter_buff_1_1_2_ce0 mem_ce 1 1 }  { filter_buff_1_1_2_we0 mem_we 1 1 }  { filter_buff_1_1_2_d0 mem_din 1 32 } } }
	filter_buff_1_2_0 { ap_memory {  { filter_buff_1_2_0_address0 mem_address 1 4 }  { filter_buff_1_2_0_ce0 mem_ce 1 1 }  { filter_buff_1_2_0_we0 mem_we 1 1 }  { filter_buff_1_2_0_d0 mem_din 1 32 } } }
	filter_buff_1_2_1 { ap_memory {  { filter_buff_1_2_1_address0 mem_address 1 4 }  { filter_buff_1_2_1_ce0 mem_ce 1 1 }  { filter_buff_1_2_1_we0 mem_we 1 1 }  { filter_buff_1_2_1_d0 mem_din 1 32 } } }
	filter_buff_1_2_2 { ap_memory {  { filter_buff_1_2_2_address0 mem_address 1 4 }  { filter_buff_1_2_2_ce0 mem_ce 1 1 }  { filter_buff_1_2_2_we0 mem_we 1 1 }  { filter_buff_1_2_2_d0 mem_din 1 32 } } }
	filter_buff_2_0_0 { ap_memory {  { filter_buff_2_0_0_address0 mem_address 1 4 }  { filter_buff_2_0_0_ce0 mem_ce 1 1 }  { filter_buff_2_0_0_we0 mem_we 1 1 }  { filter_buff_2_0_0_d0 mem_din 1 32 } } }
	filter_buff_2_0_1 { ap_memory {  { filter_buff_2_0_1_address0 mem_address 1 4 }  { filter_buff_2_0_1_ce0 mem_ce 1 1 }  { filter_buff_2_0_1_we0 mem_we 1 1 }  { filter_buff_2_0_1_d0 mem_din 1 32 } } }
	filter_buff_2_0_2 { ap_memory {  { filter_buff_2_0_2_address0 mem_address 1 4 }  { filter_buff_2_0_2_ce0 mem_ce 1 1 }  { filter_buff_2_0_2_we0 mem_we 1 1 }  { filter_buff_2_0_2_d0 mem_din 1 32 } } }
	filter_buff_2_1_0 { ap_memory {  { filter_buff_2_1_0_address0 mem_address 1 4 }  { filter_buff_2_1_0_ce0 mem_ce 1 1 }  { filter_buff_2_1_0_we0 mem_we 1 1 }  { filter_buff_2_1_0_d0 mem_din 1 32 } } }
	filter_buff_2_1_1 { ap_memory {  { filter_buff_2_1_1_address0 mem_address 1 4 }  { filter_buff_2_1_1_ce0 mem_ce 1 1 }  { filter_buff_2_1_1_we0 mem_we 1 1 }  { filter_buff_2_1_1_d0 mem_din 1 32 } } }
	filter_buff_2_1_2 { ap_memory {  { filter_buff_2_1_2_address0 mem_address 1 4 }  { filter_buff_2_1_2_ce0 mem_ce 1 1 }  { filter_buff_2_1_2_we0 mem_we 1 1 }  { filter_buff_2_1_2_d0 mem_din 1 32 } } }
	filter_buff_2_2_0 { ap_memory {  { filter_buff_2_2_0_address0 mem_address 1 4 }  { filter_buff_2_2_0_ce0 mem_ce 1 1 }  { filter_buff_2_2_0_we0 mem_we 1 1 }  { filter_buff_2_2_0_d0 mem_din 1 32 } } }
	filter_buff_2_2_1 { ap_memory {  { filter_buff_2_2_1_address0 mem_address 1 4 }  { filter_buff_2_2_1_ce0 mem_ce 1 1 }  { filter_buff_2_2_1_we0 mem_we 1 1 }  { filter_buff_2_2_1_d0 mem_din 1 32 } } }
	filter_buff_2_2_2 { ap_memory {  { filter_buff_2_2_2_address0 mem_address 1 4 }  { filter_buff_2_2_2_ce0 mem_ce 1 1 }  { filter_buff_2_2_2_we0 mem_we 1 1 }  { filter_buff_2_2_2_d0 mem_din 1 32 } } }
	filter_buff_3_0_0 { ap_memory {  { filter_buff_3_0_0_address0 mem_address 1 4 }  { filter_buff_3_0_0_ce0 mem_ce 1 1 }  { filter_buff_3_0_0_we0 mem_we 1 1 }  { filter_buff_3_0_0_d0 mem_din 1 32 } } }
	filter_buff_3_0_1 { ap_memory {  { filter_buff_3_0_1_address0 mem_address 1 4 }  { filter_buff_3_0_1_ce0 mem_ce 1 1 }  { filter_buff_3_0_1_we0 mem_we 1 1 }  { filter_buff_3_0_1_d0 mem_din 1 32 } } }
	filter_buff_3_0_2 { ap_memory {  { filter_buff_3_0_2_address0 mem_address 1 4 }  { filter_buff_3_0_2_ce0 mem_ce 1 1 }  { filter_buff_3_0_2_we0 mem_we 1 1 }  { filter_buff_3_0_2_d0 mem_din 1 32 } } }
	filter_buff_3_1_0 { ap_memory {  { filter_buff_3_1_0_address0 mem_address 1 4 }  { filter_buff_3_1_0_ce0 mem_ce 1 1 }  { filter_buff_3_1_0_we0 mem_we 1 1 }  { filter_buff_3_1_0_d0 mem_din 1 32 } } }
	filter_buff_3_1_1 { ap_memory {  { filter_buff_3_1_1_address0 mem_address 1 4 }  { filter_buff_3_1_1_ce0 mem_ce 1 1 }  { filter_buff_3_1_1_we0 mem_we 1 1 }  { filter_buff_3_1_1_d0 mem_din 1 32 } } }
	filter_buff_3_1_2 { ap_memory {  { filter_buff_3_1_2_address0 mem_address 1 4 }  { filter_buff_3_1_2_ce0 mem_ce 1 1 }  { filter_buff_3_1_2_we0 mem_we 1 1 }  { filter_buff_3_1_2_d0 mem_din 1 32 } } }
	filter_buff_3_2_0 { ap_memory {  { filter_buff_3_2_0_address0 mem_address 1 4 }  { filter_buff_3_2_0_ce0 mem_ce 1 1 }  { filter_buff_3_2_0_we0 mem_we 1 1 }  { filter_buff_3_2_0_d0 mem_din 1 32 } } }
	filter_buff_3_2_1 { ap_memory {  { filter_buff_3_2_1_address0 mem_address 1 4 }  { filter_buff_3_2_1_ce0 mem_ce 1 1 }  { filter_buff_3_2_1_we0 mem_we 1 1 }  { filter_buff_3_2_1_d0 mem_din 1 32 } } }
	filter_buff_3_2_2 { ap_memory {  { filter_buff_3_2_2_address0 mem_address 1 4 }  { filter_buff_3_2_2_ce0 mem_ce 1 1 }  { filter_buff_3_2_2_we0 mem_we 1 1 }  { filter_buff_3_2_2_d0 mem_din 1 32 } } }
	filter_buff_4_0_0 { ap_memory {  { filter_buff_4_0_0_address0 mem_address 1 4 }  { filter_buff_4_0_0_ce0 mem_ce 1 1 }  { filter_buff_4_0_0_we0 mem_we 1 1 }  { filter_buff_4_0_0_d0 mem_din 1 32 } } }
	filter_buff_4_0_1 { ap_memory {  { filter_buff_4_0_1_address0 mem_address 1 4 }  { filter_buff_4_0_1_ce0 mem_ce 1 1 }  { filter_buff_4_0_1_we0 mem_we 1 1 }  { filter_buff_4_0_1_d0 mem_din 1 32 } } }
	filter_buff_4_0_2 { ap_memory {  { filter_buff_4_0_2_address0 mem_address 1 4 }  { filter_buff_4_0_2_ce0 mem_ce 1 1 }  { filter_buff_4_0_2_we0 mem_we 1 1 }  { filter_buff_4_0_2_d0 mem_din 1 32 } } }
	filter_buff_4_1_0 { ap_memory {  { filter_buff_4_1_0_address0 mem_address 1 4 }  { filter_buff_4_1_0_ce0 mem_ce 1 1 }  { filter_buff_4_1_0_we0 mem_we 1 1 }  { filter_buff_4_1_0_d0 mem_din 1 32 } } }
	filter_buff_4_1_1 { ap_memory {  { filter_buff_4_1_1_address0 mem_address 1 4 }  { filter_buff_4_1_1_ce0 mem_ce 1 1 }  { filter_buff_4_1_1_we0 mem_we 1 1 }  { filter_buff_4_1_1_d0 mem_din 1 32 } } }
	filter_buff_4_1_2 { ap_memory {  { filter_buff_4_1_2_address0 mem_address 1 4 }  { filter_buff_4_1_2_ce0 mem_ce 1 1 }  { filter_buff_4_1_2_we0 mem_we 1 1 }  { filter_buff_4_1_2_d0 mem_din 1 32 } } }
	filter_buff_4_2_0 { ap_memory {  { filter_buff_4_2_0_address0 mem_address 1 4 }  { filter_buff_4_2_0_ce0 mem_ce 1 1 }  { filter_buff_4_2_0_we0 mem_we 1 1 }  { filter_buff_4_2_0_d0 mem_din 1 32 } } }
	filter_buff_4_2_1 { ap_memory {  { filter_buff_4_2_1_address0 mem_address 1 4 }  { filter_buff_4_2_1_ce0 mem_ce 1 1 }  { filter_buff_4_2_1_we0 mem_we 1 1 }  { filter_buff_4_2_1_d0 mem_din 1 32 } } }
	filter_buff_4_2_2 { ap_memory {  { filter_buff_4_2_2_address0 mem_address 1 4 }  { filter_buff_4_2_2_ce0 mem_ce 1 1 }  { filter_buff_4_2_2_we0 mem_we 1 1 }  { filter_buff_4_2_2_d0 mem_din 1 32 } } }
	filter_buff_5_0_0 { ap_memory {  { filter_buff_5_0_0_address0 mem_address 1 4 }  { filter_buff_5_0_0_ce0 mem_ce 1 1 }  { filter_buff_5_0_0_we0 mem_we 1 1 }  { filter_buff_5_0_0_d0 mem_din 1 32 } } }
	filter_buff_5_0_1 { ap_memory {  { filter_buff_5_0_1_address0 mem_address 1 4 }  { filter_buff_5_0_1_ce0 mem_ce 1 1 }  { filter_buff_5_0_1_we0 mem_we 1 1 }  { filter_buff_5_0_1_d0 mem_din 1 32 } } }
	filter_buff_5_0_2 { ap_memory {  { filter_buff_5_0_2_address0 mem_address 1 4 }  { filter_buff_5_0_2_ce0 mem_ce 1 1 }  { filter_buff_5_0_2_we0 mem_we 1 1 }  { filter_buff_5_0_2_d0 mem_din 1 32 } } }
	filter_buff_5_1_0 { ap_memory {  { filter_buff_5_1_0_address0 mem_address 1 4 }  { filter_buff_5_1_0_ce0 mem_ce 1 1 }  { filter_buff_5_1_0_we0 mem_we 1 1 }  { filter_buff_5_1_0_d0 mem_din 1 32 } } }
	filter_buff_5_1_1 { ap_memory {  { filter_buff_5_1_1_address0 mem_address 1 4 }  { filter_buff_5_1_1_ce0 mem_ce 1 1 }  { filter_buff_5_1_1_we0 mem_we 1 1 }  { filter_buff_5_1_1_d0 mem_din 1 32 } } }
	filter_buff_5_1_2 { ap_memory {  { filter_buff_5_1_2_address0 mem_address 1 4 }  { filter_buff_5_1_2_ce0 mem_ce 1 1 }  { filter_buff_5_1_2_we0 mem_we 1 1 }  { filter_buff_5_1_2_d0 mem_din 1 32 } } }
	filter_buff_5_2_0 { ap_memory {  { filter_buff_5_2_0_address0 mem_address 1 4 }  { filter_buff_5_2_0_ce0 mem_ce 1 1 }  { filter_buff_5_2_0_we0 mem_we 1 1 }  { filter_buff_5_2_0_d0 mem_din 1 32 } } }
	filter_buff_5_2_1 { ap_memory {  { filter_buff_5_2_1_address0 mem_address 1 4 }  { filter_buff_5_2_1_ce0 mem_ce 1 1 }  { filter_buff_5_2_1_we0 mem_we 1 1 }  { filter_buff_5_2_1_d0 mem_din 1 32 } } }
	filter_buff_5_2_2 { ap_memory {  { filter_buff_5_2_2_address0 mem_address 1 4 }  { filter_buff_5_2_2_ce0 mem_ce 1 1 }  { filter_buff_5_2_2_we0 mem_we 1 1 }  { filter_buff_5_2_2_d0 mem_din 1 32 } } }
	filter_buff_6_0_0 { ap_memory {  { filter_buff_6_0_0_address0 mem_address 1 4 }  { filter_buff_6_0_0_ce0 mem_ce 1 1 }  { filter_buff_6_0_0_we0 mem_we 1 1 }  { filter_buff_6_0_0_d0 mem_din 1 32 } } }
	filter_buff_6_0_1 { ap_memory {  { filter_buff_6_0_1_address0 mem_address 1 4 }  { filter_buff_6_0_1_ce0 mem_ce 1 1 }  { filter_buff_6_0_1_we0 mem_we 1 1 }  { filter_buff_6_0_1_d0 mem_din 1 32 } } }
	filter_buff_6_0_2 { ap_memory {  { filter_buff_6_0_2_address0 mem_address 1 4 }  { filter_buff_6_0_2_ce0 mem_ce 1 1 }  { filter_buff_6_0_2_we0 mem_we 1 1 }  { filter_buff_6_0_2_d0 mem_din 1 32 } } }
	filter_buff_6_1_0 { ap_memory {  { filter_buff_6_1_0_address0 mem_address 1 4 }  { filter_buff_6_1_0_ce0 mem_ce 1 1 }  { filter_buff_6_1_0_we0 mem_we 1 1 }  { filter_buff_6_1_0_d0 mem_din 1 32 } } }
	filter_buff_6_1_1 { ap_memory {  { filter_buff_6_1_1_address0 mem_address 1 4 }  { filter_buff_6_1_1_ce0 mem_ce 1 1 }  { filter_buff_6_1_1_we0 mem_we 1 1 }  { filter_buff_6_1_1_d0 mem_din 1 32 } } }
	filter_buff_6_1_2 { ap_memory {  { filter_buff_6_1_2_address0 mem_address 1 4 }  { filter_buff_6_1_2_ce0 mem_ce 1 1 }  { filter_buff_6_1_2_we0 mem_we 1 1 }  { filter_buff_6_1_2_d0 mem_din 1 32 } } }
	filter_buff_6_2_0 { ap_memory {  { filter_buff_6_2_0_address0 mem_address 1 4 }  { filter_buff_6_2_0_ce0 mem_ce 1 1 }  { filter_buff_6_2_0_we0 mem_we 1 1 }  { filter_buff_6_2_0_d0 mem_din 1 32 } } }
	filter_buff_6_2_1 { ap_memory {  { filter_buff_6_2_1_address0 mem_address 1 4 }  { filter_buff_6_2_1_ce0 mem_ce 1 1 }  { filter_buff_6_2_1_we0 mem_we 1 1 }  { filter_buff_6_2_1_d0 mem_din 1 32 } } }
	filter_buff_6_2_2 { ap_memory {  { filter_buff_6_2_2_address0 mem_address 1 4 }  { filter_buff_6_2_2_ce0 mem_ce 1 1 }  { filter_buff_6_2_2_we0 mem_we 1 1 }  { filter_buff_6_2_2_d0 mem_din 1 32 } } }
	filter_buff_7_0_0 { ap_memory {  { filter_buff_7_0_0_address0 mem_address 1 4 }  { filter_buff_7_0_0_ce0 mem_ce 1 1 }  { filter_buff_7_0_0_we0 mem_we 1 1 }  { filter_buff_7_0_0_d0 mem_din 1 32 } } }
	filter_buff_7_0_1 { ap_memory {  { filter_buff_7_0_1_address0 mem_address 1 4 }  { filter_buff_7_0_1_ce0 mem_ce 1 1 }  { filter_buff_7_0_1_we0 mem_we 1 1 }  { filter_buff_7_0_1_d0 mem_din 1 32 } } }
	filter_buff_7_0_2 { ap_memory {  { filter_buff_7_0_2_address0 mem_address 1 4 }  { filter_buff_7_0_2_ce0 mem_ce 1 1 }  { filter_buff_7_0_2_we0 mem_we 1 1 }  { filter_buff_7_0_2_d0 mem_din 1 32 } } }
	filter_buff_7_1_0 { ap_memory {  { filter_buff_7_1_0_address0 mem_address 1 4 }  { filter_buff_7_1_0_ce0 mem_ce 1 1 }  { filter_buff_7_1_0_we0 mem_we 1 1 }  { filter_buff_7_1_0_d0 mem_din 1 32 } } }
	filter_buff_7_1_1 { ap_memory {  { filter_buff_7_1_1_address0 mem_address 1 4 }  { filter_buff_7_1_1_ce0 mem_ce 1 1 }  { filter_buff_7_1_1_we0 mem_we 1 1 }  { filter_buff_7_1_1_d0 mem_din 1 32 } } }
	filter_buff_7_1_2 { ap_memory {  { filter_buff_7_1_2_address0 mem_address 1 4 }  { filter_buff_7_1_2_ce0 mem_ce 1 1 }  { filter_buff_7_1_2_we0 mem_we 1 1 }  { filter_buff_7_1_2_d0 mem_din 1 32 } } }
	filter_buff_7_2_0 { ap_memory {  { filter_buff_7_2_0_address0 mem_address 1 4 }  { filter_buff_7_2_0_ce0 mem_ce 1 1 }  { filter_buff_7_2_0_we0 mem_we 1 1 }  { filter_buff_7_2_0_d0 mem_din 1 32 } } }
	filter_buff_7_2_1 { ap_memory {  { filter_buff_7_2_1_address0 mem_address 1 4 }  { filter_buff_7_2_1_ce0 mem_ce 1 1 }  { filter_buff_7_2_1_we0 mem_we 1 1 }  { filter_buff_7_2_1_d0 mem_din 1 32 } } }
	filter_buff_7_2_2 { ap_memory {  { filter_buff_7_2_2_address0 mem_address 1 4 }  { filter_buff_7_2_2_ce0 mem_ce 1 1 }  { filter_buff_7_2_2_we0 mem_we 1 1 }  { filter_buff_7_2_2_d0 mem_din 1 32 } } }
	filter_buff_8_0_0 { ap_memory {  { filter_buff_8_0_0_address0 mem_address 1 4 }  { filter_buff_8_0_0_ce0 mem_ce 1 1 }  { filter_buff_8_0_0_we0 mem_we 1 1 }  { filter_buff_8_0_0_d0 mem_din 1 32 } } }
	filter_buff_8_0_1 { ap_memory {  { filter_buff_8_0_1_address0 mem_address 1 4 }  { filter_buff_8_0_1_ce0 mem_ce 1 1 }  { filter_buff_8_0_1_we0 mem_we 1 1 }  { filter_buff_8_0_1_d0 mem_din 1 32 } } }
	filter_buff_8_0_2 { ap_memory {  { filter_buff_8_0_2_address0 mem_address 1 4 }  { filter_buff_8_0_2_ce0 mem_ce 1 1 }  { filter_buff_8_0_2_we0 mem_we 1 1 }  { filter_buff_8_0_2_d0 mem_din 1 32 } } }
	filter_buff_8_1_0 { ap_memory {  { filter_buff_8_1_0_address0 mem_address 1 4 }  { filter_buff_8_1_0_ce0 mem_ce 1 1 }  { filter_buff_8_1_0_we0 mem_we 1 1 }  { filter_buff_8_1_0_d0 mem_din 1 32 } } }
	filter_buff_8_1_1 { ap_memory {  { filter_buff_8_1_1_address0 mem_address 1 4 }  { filter_buff_8_1_1_ce0 mem_ce 1 1 }  { filter_buff_8_1_1_we0 mem_we 1 1 }  { filter_buff_8_1_1_d0 mem_din 1 32 } } }
	filter_buff_8_1_2 { ap_memory {  { filter_buff_8_1_2_address0 mem_address 1 4 }  { filter_buff_8_1_2_ce0 mem_ce 1 1 }  { filter_buff_8_1_2_we0 mem_we 1 1 }  { filter_buff_8_1_2_d0 mem_din 1 32 } } }
	filter_buff_8_2_0 { ap_memory {  { filter_buff_8_2_0_address0 mem_address 1 4 }  { filter_buff_8_2_0_ce0 mem_ce 1 1 }  { filter_buff_8_2_0_we0 mem_we 1 1 }  { filter_buff_8_2_0_d0 mem_din 1 32 } } }
	filter_buff_8_2_1 { ap_memory {  { filter_buff_8_2_1_address0 mem_address 1 4 }  { filter_buff_8_2_1_ce0 mem_ce 1 1 }  { filter_buff_8_2_1_we0 mem_we 1 1 }  { filter_buff_8_2_1_d0 mem_din 1 32 } } }
	filter_buff_8_2_2 { ap_memory {  { filter_buff_8_2_2_address0 mem_address 1 4 }  { filter_buff_8_2_2_ce0 mem_ce 1 1 }  { filter_buff_8_2_2_we0 mem_we 1 1 }  { filter_buff_8_2_2_d0 mem_din 1 32 } } }
	filter_buff_9_0_0 { ap_memory {  { filter_buff_9_0_0_address0 mem_address 1 4 }  { filter_buff_9_0_0_ce0 mem_ce 1 1 }  { filter_buff_9_0_0_we0 mem_we 1 1 }  { filter_buff_9_0_0_d0 mem_din 1 32 } } }
	filter_buff_9_0_1 { ap_memory {  { filter_buff_9_0_1_address0 mem_address 1 4 }  { filter_buff_9_0_1_ce0 mem_ce 1 1 }  { filter_buff_9_0_1_we0 mem_we 1 1 }  { filter_buff_9_0_1_d0 mem_din 1 32 } } }
	filter_buff_9_0_2 { ap_memory {  { filter_buff_9_0_2_address0 mem_address 1 4 }  { filter_buff_9_0_2_ce0 mem_ce 1 1 }  { filter_buff_9_0_2_we0 mem_we 1 1 }  { filter_buff_9_0_2_d0 mem_din 1 32 } } }
	filter_buff_9_1_0 { ap_memory {  { filter_buff_9_1_0_address0 mem_address 1 4 }  { filter_buff_9_1_0_ce0 mem_ce 1 1 }  { filter_buff_9_1_0_we0 mem_we 1 1 }  { filter_buff_9_1_0_d0 mem_din 1 32 } } }
	filter_buff_9_1_1 { ap_memory {  { filter_buff_9_1_1_address0 mem_address 1 4 }  { filter_buff_9_1_1_ce0 mem_ce 1 1 }  { filter_buff_9_1_1_we0 mem_we 1 1 }  { filter_buff_9_1_1_d0 mem_din 1 32 } } }
	filter_buff_9_1_2 { ap_memory {  { filter_buff_9_1_2_address0 mem_address 1 4 }  { filter_buff_9_1_2_ce0 mem_ce 1 1 }  { filter_buff_9_1_2_we0 mem_we 1 1 }  { filter_buff_9_1_2_d0 mem_din 1 32 } } }
	filter_buff_9_2_0 { ap_memory {  { filter_buff_9_2_0_address0 mem_address 1 4 }  { filter_buff_9_2_0_ce0 mem_ce 1 1 }  { filter_buff_9_2_0_we0 mem_we 1 1 }  { filter_buff_9_2_0_d0 mem_din 1 32 } } }
	filter_buff_9_2_1 { ap_memory {  { filter_buff_9_2_1_address0 mem_address 1 4 }  { filter_buff_9_2_1_ce0 mem_ce 1 1 }  { filter_buff_9_2_1_we0 mem_we 1 1 }  { filter_buff_9_2_1_d0 mem_din 1 32 } } }
	filter_buff_9_2_2 { ap_memory {  { filter_buff_9_2_2_address0 mem_address 1 4 }  { filter_buff_9_2_2_ce0 mem_ce 1 1 }  { filter_buff_9_2_2_we0 mem_we 1 1 }  { filter_buff_9_2_2_d0 mem_din 1 32 } } }
	filter_buff_10_0_0 { ap_memory {  { filter_buff_10_0_0_address0 mem_address 1 4 }  { filter_buff_10_0_0_ce0 mem_ce 1 1 }  { filter_buff_10_0_0_we0 mem_we 1 1 }  { filter_buff_10_0_0_d0 mem_din 1 32 } } }
	filter_buff_10_0_1 { ap_memory {  { filter_buff_10_0_1_address0 mem_address 1 4 }  { filter_buff_10_0_1_ce0 mem_ce 1 1 }  { filter_buff_10_0_1_we0 mem_we 1 1 }  { filter_buff_10_0_1_d0 mem_din 1 32 } } }
	filter_buff_10_0_2 { ap_memory {  { filter_buff_10_0_2_address0 mem_address 1 4 }  { filter_buff_10_0_2_ce0 mem_ce 1 1 }  { filter_buff_10_0_2_we0 mem_we 1 1 }  { filter_buff_10_0_2_d0 mem_din 1 32 } } }
	filter_buff_10_1_0 { ap_memory {  { filter_buff_10_1_0_address0 mem_address 1 4 }  { filter_buff_10_1_0_ce0 mem_ce 1 1 }  { filter_buff_10_1_0_we0 mem_we 1 1 }  { filter_buff_10_1_0_d0 mem_din 1 32 } } }
	filter_buff_10_1_1 { ap_memory {  { filter_buff_10_1_1_address0 mem_address 1 4 }  { filter_buff_10_1_1_ce0 mem_ce 1 1 }  { filter_buff_10_1_1_we0 mem_we 1 1 }  { filter_buff_10_1_1_d0 mem_din 1 32 } } }
	filter_buff_10_1_2 { ap_memory {  { filter_buff_10_1_2_address0 mem_address 1 4 }  { filter_buff_10_1_2_ce0 mem_ce 1 1 }  { filter_buff_10_1_2_we0 mem_we 1 1 }  { filter_buff_10_1_2_d0 mem_din 1 32 } } }
	filter_buff_10_2_0 { ap_memory {  { filter_buff_10_2_0_address0 mem_address 1 4 }  { filter_buff_10_2_0_ce0 mem_ce 1 1 }  { filter_buff_10_2_0_we0 mem_we 1 1 }  { filter_buff_10_2_0_d0 mem_din 1 32 } } }
	filter_buff_10_2_1 { ap_memory {  { filter_buff_10_2_1_address0 mem_address 1 4 }  { filter_buff_10_2_1_ce0 mem_ce 1 1 }  { filter_buff_10_2_1_we0 mem_we 1 1 }  { filter_buff_10_2_1_d0 mem_din 1 32 } } }
	filter_buff_10_2_2 { ap_memory {  { filter_buff_10_2_2_address0 mem_address 1 4 }  { filter_buff_10_2_2_ce0 mem_ce 1 1 }  { filter_buff_10_2_2_we0 mem_we 1 1 }  { filter_buff_10_2_2_d0 mem_din 1 32 } } }
	filter_buff_11_0_0 { ap_memory {  { filter_buff_11_0_0_address0 mem_address 1 4 }  { filter_buff_11_0_0_ce0 mem_ce 1 1 }  { filter_buff_11_0_0_we0 mem_we 1 1 }  { filter_buff_11_0_0_d0 mem_din 1 32 } } }
	filter_buff_11_0_1 { ap_memory {  { filter_buff_11_0_1_address0 mem_address 1 4 }  { filter_buff_11_0_1_ce0 mem_ce 1 1 }  { filter_buff_11_0_1_we0 mem_we 1 1 }  { filter_buff_11_0_1_d0 mem_din 1 32 } } }
	filter_buff_11_0_2 { ap_memory {  { filter_buff_11_0_2_address0 mem_address 1 4 }  { filter_buff_11_0_2_ce0 mem_ce 1 1 }  { filter_buff_11_0_2_we0 mem_we 1 1 }  { filter_buff_11_0_2_d0 mem_din 1 32 } } }
	filter_buff_11_1_0 { ap_memory {  { filter_buff_11_1_0_address0 mem_address 1 4 }  { filter_buff_11_1_0_ce0 mem_ce 1 1 }  { filter_buff_11_1_0_we0 mem_we 1 1 }  { filter_buff_11_1_0_d0 mem_din 1 32 } } }
	filter_buff_11_1_1 { ap_memory {  { filter_buff_11_1_1_address0 mem_address 1 4 }  { filter_buff_11_1_1_ce0 mem_ce 1 1 }  { filter_buff_11_1_1_we0 mem_we 1 1 }  { filter_buff_11_1_1_d0 mem_din 1 32 } } }
	filter_buff_11_1_2 { ap_memory {  { filter_buff_11_1_2_address0 mem_address 1 4 }  { filter_buff_11_1_2_ce0 mem_ce 1 1 }  { filter_buff_11_1_2_we0 mem_we 1 1 }  { filter_buff_11_1_2_d0 mem_din 1 32 } } }
	filter_buff_11_2_0 { ap_memory {  { filter_buff_11_2_0_address0 mem_address 1 4 }  { filter_buff_11_2_0_ce0 mem_ce 1 1 }  { filter_buff_11_2_0_we0 mem_we 1 1 }  { filter_buff_11_2_0_d0 mem_din 1 32 } } }
	filter_buff_11_2_1 { ap_memory {  { filter_buff_11_2_1_address0 mem_address 1 4 }  { filter_buff_11_2_1_ce0 mem_ce 1 1 }  { filter_buff_11_2_1_we0 mem_we 1 1 }  { filter_buff_11_2_1_d0 mem_din 1 32 } } }
	filter_buff_11_2_2 { ap_memory {  { filter_buff_11_2_2_address0 mem_address 1 4 }  { filter_buff_11_2_2_ce0 mem_ce 1 1 }  { filter_buff_11_2_2_we0 mem_we 1 1 }  { filter_buff_11_2_2_d0 mem_din 1 32 } } }
	filter_buff_12_0_0 { ap_memory {  { filter_buff_12_0_0_address0 mem_address 1 4 }  { filter_buff_12_0_0_ce0 mem_ce 1 1 }  { filter_buff_12_0_0_we0 mem_we 1 1 }  { filter_buff_12_0_0_d0 mem_din 1 32 } } }
	filter_buff_12_0_1 { ap_memory {  { filter_buff_12_0_1_address0 mem_address 1 4 }  { filter_buff_12_0_1_ce0 mem_ce 1 1 }  { filter_buff_12_0_1_we0 mem_we 1 1 }  { filter_buff_12_0_1_d0 mem_din 1 32 } } }
	filter_buff_12_0_2 { ap_memory {  { filter_buff_12_0_2_address0 mem_address 1 4 }  { filter_buff_12_0_2_ce0 mem_ce 1 1 }  { filter_buff_12_0_2_we0 mem_we 1 1 }  { filter_buff_12_0_2_d0 mem_din 1 32 } } }
	filter_buff_12_1_0 { ap_memory {  { filter_buff_12_1_0_address0 mem_address 1 4 }  { filter_buff_12_1_0_ce0 mem_ce 1 1 }  { filter_buff_12_1_0_we0 mem_we 1 1 }  { filter_buff_12_1_0_d0 mem_din 1 32 } } }
	filter_buff_12_1_1 { ap_memory {  { filter_buff_12_1_1_address0 mem_address 1 4 }  { filter_buff_12_1_1_ce0 mem_ce 1 1 }  { filter_buff_12_1_1_we0 mem_we 1 1 }  { filter_buff_12_1_1_d0 mem_din 1 32 } } }
	filter_buff_12_1_2 { ap_memory {  { filter_buff_12_1_2_address0 mem_address 1 4 }  { filter_buff_12_1_2_ce0 mem_ce 1 1 }  { filter_buff_12_1_2_we0 mem_we 1 1 }  { filter_buff_12_1_2_d0 mem_din 1 32 } } }
	filter_buff_12_2_0 { ap_memory {  { filter_buff_12_2_0_address0 mem_address 1 4 }  { filter_buff_12_2_0_ce0 mem_ce 1 1 }  { filter_buff_12_2_0_we0 mem_we 1 1 }  { filter_buff_12_2_0_d0 mem_din 1 32 } } }
	filter_buff_12_2_1 { ap_memory {  { filter_buff_12_2_1_address0 mem_address 1 4 }  { filter_buff_12_2_1_ce0 mem_ce 1 1 }  { filter_buff_12_2_1_we0 mem_we 1 1 }  { filter_buff_12_2_1_d0 mem_din 1 32 } } }
	filter_buff_12_2_2 { ap_memory {  { filter_buff_12_2_2_address0 mem_address 1 4 }  { filter_buff_12_2_2_ce0 mem_ce 1 1 }  { filter_buff_12_2_2_we0 mem_we 1 1 }  { filter_buff_12_2_2_d0 mem_din 1 32 } } }
	filter_buff_13_0_0 { ap_memory {  { filter_buff_13_0_0_address0 mem_address 1 4 }  { filter_buff_13_0_0_ce0 mem_ce 1 1 }  { filter_buff_13_0_0_we0 mem_we 1 1 }  { filter_buff_13_0_0_d0 mem_din 1 32 } } }
	filter_buff_13_0_1 { ap_memory {  { filter_buff_13_0_1_address0 mem_address 1 4 }  { filter_buff_13_0_1_ce0 mem_ce 1 1 }  { filter_buff_13_0_1_we0 mem_we 1 1 }  { filter_buff_13_0_1_d0 mem_din 1 32 } } }
	filter_buff_13_0_2 { ap_memory {  { filter_buff_13_0_2_address0 mem_address 1 4 }  { filter_buff_13_0_2_ce0 mem_ce 1 1 }  { filter_buff_13_0_2_we0 mem_we 1 1 }  { filter_buff_13_0_2_d0 mem_din 1 32 } } }
	filter_buff_13_1_0 { ap_memory {  { filter_buff_13_1_0_address0 mem_address 1 4 }  { filter_buff_13_1_0_ce0 mem_ce 1 1 }  { filter_buff_13_1_0_we0 mem_we 1 1 }  { filter_buff_13_1_0_d0 mem_din 1 32 } } }
	filter_buff_13_1_1 { ap_memory {  { filter_buff_13_1_1_address0 mem_address 1 4 }  { filter_buff_13_1_1_ce0 mem_ce 1 1 }  { filter_buff_13_1_1_we0 mem_we 1 1 }  { filter_buff_13_1_1_d0 mem_din 1 32 } } }
	filter_buff_13_1_2 { ap_memory {  { filter_buff_13_1_2_address0 mem_address 1 4 }  { filter_buff_13_1_2_ce0 mem_ce 1 1 }  { filter_buff_13_1_2_we0 mem_we 1 1 }  { filter_buff_13_1_2_d0 mem_din 1 32 } } }
	filter_buff_13_2_0 { ap_memory {  { filter_buff_13_2_0_address0 mem_address 1 4 }  { filter_buff_13_2_0_ce0 mem_ce 1 1 }  { filter_buff_13_2_0_we0 mem_we 1 1 }  { filter_buff_13_2_0_d0 mem_din 1 32 } } }
	filter_buff_13_2_1 { ap_memory {  { filter_buff_13_2_1_address0 mem_address 1 4 }  { filter_buff_13_2_1_ce0 mem_ce 1 1 }  { filter_buff_13_2_1_we0 mem_we 1 1 }  { filter_buff_13_2_1_d0 mem_din 1 32 } } }
	filter_buff_13_2_2 { ap_memory {  { filter_buff_13_2_2_address0 mem_address 1 4 }  { filter_buff_13_2_2_ce0 mem_ce 1 1 }  { filter_buff_13_2_2_we0 mem_we 1 1 }  { filter_buff_13_2_2_d0 mem_din 1 32 } } }
	filter_buff_14_0_0 { ap_memory {  { filter_buff_14_0_0_address0 mem_address 1 4 }  { filter_buff_14_0_0_ce0 mem_ce 1 1 }  { filter_buff_14_0_0_we0 mem_we 1 1 }  { filter_buff_14_0_0_d0 mem_din 1 32 } } }
	filter_buff_14_0_1 { ap_memory {  { filter_buff_14_0_1_address0 mem_address 1 4 }  { filter_buff_14_0_1_ce0 mem_ce 1 1 }  { filter_buff_14_0_1_we0 mem_we 1 1 }  { filter_buff_14_0_1_d0 mem_din 1 32 } } }
	filter_buff_14_0_2 { ap_memory {  { filter_buff_14_0_2_address0 mem_address 1 4 }  { filter_buff_14_0_2_ce0 mem_ce 1 1 }  { filter_buff_14_0_2_we0 mem_we 1 1 }  { filter_buff_14_0_2_d0 mem_din 1 32 } } }
	filter_buff_14_1_0 { ap_memory {  { filter_buff_14_1_0_address0 mem_address 1 4 }  { filter_buff_14_1_0_ce0 mem_ce 1 1 }  { filter_buff_14_1_0_we0 mem_we 1 1 }  { filter_buff_14_1_0_d0 mem_din 1 32 } } }
	filter_buff_14_1_1 { ap_memory {  { filter_buff_14_1_1_address0 mem_address 1 4 }  { filter_buff_14_1_1_ce0 mem_ce 1 1 }  { filter_buff_14_1_1_we0 mem_we 1 1 }  { filter_buff_14_1_1_d0 mem_din 1 32 } } }
	filter_buff_14_1_2 { ap_memory {  { filter_buff_14_1_2_address0 mem_address 1 4 }  { filter_buff_14_1_2_ce0 mem_ce 1 1 }  { filter_buff_14_1_2_we0 mem_we 1 1 }  { filter_buff_14_1_2_d0 mem_din 1 32 } } }
	filter_buff_14_2_0 { ap_memory {  { filter_buff_14_2_0_address0 mem_address 1 4 }  { filter_buff_14_2_0_ce0 mem_ce 1 1 }  { filter_buff_14_2_0_we0 mem_we 1 1 }  { filter_buff_14_2_0_d0 mem_din 1 32 } } }
	filter_buff_14_2_1 { ap_memory {  { filter_buff_14_2_1_address0 mem_address 1 4 }  { filter_buff_14_2_1_ce0 mem_ce 1 1 }  { filter_buff_14_2_1_we0 mem_we 1 1 }  { filter_buff_14_2_1_d0 mem_din 1 32 } } }
	filter_buff_14_2_2 { ap_memory {  { filter_buff_14_2_2_address0 mem_address 1 4 }  { filter_buff_14_2_2_ce0 mem_ce 1 1 }  { filter_buff_14_2_2_we0 mem_we 1 1 }  { filter_buff_14_2_2_d0 mem_din 1 32 } } }
	filter_buff_15_0_0 { ap_memory {  { filter_buff_15_0_0_address0 mem_address 1 4 }  { filter_buff_15_0_0_ce0 mem_ce 1 1 }  { filter_buff_15_0_0_we0 mem_we 1 1 }  { filter_buff_15_0_0_d0 mem_din 1 32 } } }
	filter_buff_15_0_1 { ap_memory {  { filter_buff_15_0_1_address0 mem_address 1 4 }  { filter_buff_15_0_1_ce0 mem_ce 1 1 }  { filter_buff_15_0_1_we0 mem_we 1 1 }  { filter_buff_15_0_1_d0 mem_din 1 32 } } }
	filter_buff_15_0_2 { ap_memory {  { filter_buff_15_0_2_address0 mem_address 1 4 }  { filter_buff_15_0_2_ce0 mem_ce 1 1 }  { filter_buff_15_0_2_we0 mem_we 1 1 }  { filter_buff_15_0_2_d0 mem_din 1 32 } } }
	filter_buff_15_1_0 { ap_memory {  { filter_buff_15_1_0_address0 mem_address 1 4 }  { filter_buff_15_1_0_ce0 mem_ce 1 1 }  { filter_buff_15_1_0_we0 mem_we 1 1 }  { filter_buff_15_1_0_d0 mem_din 1 32 } } }
	filter_buff_15_1_1 { ap_memory {  { filter_buff_15_1_1_address0 mem_address 1 4 }  { filter_buff_15_1_1_ce0 mem_ce 1 1 }  { filter_buff_15_1_1_we0 mem_we 1 1 }  { filter_buff_15_1_1_d0 mem_din 1 32 } } }
	filter_buff_15_1_2 { ap_memory {  { filter_buff_15_1_2_address0 mem_address 1 4 }  { filter_buff_15_1_2_ce0 mem_ce 1 1 }  { filter_buff_15_1_2_we0 mem_we 1 1 }  { filter_buff_15_1_2_d0 mem_din 1 32 } } }
	filter_buff_15_2_0 { ap_memory {  { filter_buff_15_2_0_address0 mem_address 1 4 }  { filter_buff_15_2_0_ce0 mem_ce 1 1 }  { filter_buff_15_2_0_we0 mem_we 1 1 }  { filter_buff_15_2_0_d0 mem_din 1 32 } } }
	filter_buff_15_2_1 { ap_memory {  { filter_buff_15_2_1_address0 mem_address 1 4 }  { filter_buff_15_2_1_ce0 mem_ce 1 1 }  { filter_buff_15_2_1_we0 mem_we 1 1 }  { filter_buff_15_2_1_d0 mem_din 1 32 } } }
	filter_buff_15_2_2 { ap_memory {  { filter_buff_15_2_2_address0 mem_address 1 4 }  { filter_buff_15_2_2_ce0 mem_ce 1 1 }  { filter_buff_15_2_2_we0 mem_we 1 1 }  { filter_buff_15_2_2_d0 mem_din 1 32 } } }
}
