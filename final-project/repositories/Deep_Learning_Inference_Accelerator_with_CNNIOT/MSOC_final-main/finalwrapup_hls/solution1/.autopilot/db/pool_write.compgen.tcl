# This script segment is generated automatically by AutoPilot

set id 53
set name dnn_hw_fcmp_32ns_bkb
set corename simcore_fcmp
set op fcmp
set stage_num 2
set max_latency -1
set registered_input 1
set Futype4reduceCEFanout 1
set clk_width 1
set clk_signed 0
set reset_width 1
set reset_signed 0
set in0_width 32
set in0_signed 0
set in1_width 32
set in1_signed 0
set ce_width 1
set ce_signed 0
set opcode_width 5
set opcode_signed 0
set out_width 1
if {${::AESL::PGuard_simmodel_gen}} {
if {[info proc ap_gen_simcore_fcmp] == "ap_gen_simcore_fcmp"} {
eval "ap_gen_simcore_fcmp { \
    id ${id} \
    name ${name} \
    corename ${corename} \
    op ${op} \
    reset_level 1 \
    sync_rst true \
    stage_num ${stage_num} \
    max_latency ${max_latency} \
    registered_input ${registered_input} \
    Futype4reduceCEFanout ${Futype4reduceCEFanout} \
    clk_width ${clk_width} \
    clk_signed ${clk_signed} \
    reset_width ${reset_width} \
    reset_signed ${reset_signed} \
    in0_width ${in0_width} \
    in0_signed ${in0_signed} \
    in1_width ${in1_width} \
    in1_signed ${in1_signed} \
    ce_width ${ce_width} \
    ce_signed ${ce_signed} \
    opcode_width ${opcode_width} \
    opcode_signed ${opcode_signed} \
    out_width ${out_width} \
}"
} else {
puts "@W \[IMPL-100\] Cannot find ap_gen_simcore_fcmp, check your AutoPilot builtin lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler ${name}
}


set op fcmp
set corename FCmp
if {${::AESL::PGuard_autocg_gen} && (${::AESL::PGuard_autocg_fpip} || ${::AESL::PGuard_autocg_fpv6en} || ${::AESL::PGuard_autocg_hpen})} {
if {[info proc ::AESL_LIB_XILINX_FPV6::fpv6_gen] == "::AESL_LIB_XILINX_FPV6::fpv6_gen"} {
eval "::AESL_LIB_XILINX_FPV6::fpv6_gen { \
    id ${id} \
    name ${name} \
    corename ${corename} \
    op ${op} \
    reset_level 1 \
    sync_rst true \
    stage_num ${stage_num} \
    max_latency ${max_latency} \
    registered_input ${registered_input} \
    Futype4reduceCEFanout ${Futype4reduceCEFanout} \
    clk_width ${clk_width} \
    clk_signed ${clk_signed} \
    reset_width ${reset_width} \
    reset_signed ${reset_signed} \
    in0_width ${in0_width} \
    in0_signed ${in0_signed} \
    in1_width ${in1_width} \
    in1_signed ${in1_signed} \
    ce_width ${ce_width} \
    ce_signed ${ce_signed} \
    opcode_width ${opcode_width} \
    opcode_signed ${opcode_signed} \
    out_width ${out_width} \
}"
} else {
puts "@W \[IMPL-101\] Cannot find ::AESL_LIB_XILINX_FPV6::fpv6_gen, check your platform lib"
}
}


# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 78 \
    name ifm_buff0_0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename ifm_buff0_0 \
    op interface \
    ports { ifm_buff0_0_address0 { O 6 vector } ifm_buff0_0_ce0 { O 1 bit } ifm_buff0_0_q0 { I 32 vector } ifm_buff0_0_address1 { O 6 vector } ifm_buff0_0_ce1 { O 1 bit } ifm_buff0_0_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff0_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 79 \
    name ifm_buff0_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename ifm_buff0_1 \
    op interface \
    ports { ifm_buff0_1_address0 { O 6 vector } ifm_buff0_1_ce0 { O 1 bit } ifm_buff0_1_q0 { I 32 vector } ifm_buff0_1_address1 { O 6 vector } ifm_buff0_1_ce1 { O 1 bit } ifm_buff0_1_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff0_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 80 \
    name ifm_buff0_2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename ifm_buff0_2 \
    op interface \
    ports { ifm_buff0_2_address0 { O 6 vector } ifm_buff0_2_ce0 { O 1 bit } ifm_buff0_2_q0 { I 32 vector } ifm_buff0_2_address1 { O 6 vector } ifm_buff0_2_ce1 { O 1 bit } ifm_buff0_2_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff0_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 81 \
    name ifm_buff0_3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename ifm_buff0_3 \
    op interface \
    ports { ifm_buff0_3_address0 { O 6 vector } ifm_buff0_3_ce0 { O 1 bit } ifm_buff0_3_q0 { I 32 vector } ifm_buff0_3_address1 { O 6 vector } ifm_buff0_3_ce1 { O 1 bit } ifm_buff0_3_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff0_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 82 \
    name ifm_buff0_4 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename ifm_buff0_4 \
    op interface \
    ports { ifm_buff0_4_address0 { O 6 vector } ifm_buff0_4_ce0 { O 1 bit } ifm_buff0_4_q0 { I 32 vector } ifm_buff0_4_address1 { O 6 vector } ifm_buff0_4_ce1 { O 1 bit } ifm_buff0_4_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff0_4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 83 \
    name ifm_buff0_5 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename ifm_buff0_5 \
    op interface \
    ports { ifm_buff0_5_address0 { O 6 vector } ifm_buff0_5_ce0 { O 1 bit } ifm_buff0_5_q0 { I 32 vector } ifm_buff0_5_address1 { O 6 vector } ifm_buff0_5_ce1 { O 1 bit } ifm_buff0_5_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff0_5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 84 \
    name ifm_buff0_6 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename ifm_buff0_6 \
    op interface \
    ports { ifm_buff0_6_address0 { O 6 vector } ifm_buff0_6_ce0 { O 1 bit } ifm_buff0_6_q0 { I 32 vector } ifm_buff0_6_address1 { O 6 vector } ifm_buff0_6_ce1 { O 1 bit } ifm_buff0_6_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff0_6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 85 \
    name ifm_buff0_7 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename ifm_buff0_7 \
    op interface \
    ports { ifm_buff0_7_address0 { O 6 vector } ifm_buff0_7_ce0 { O 1 bit } ifm_buff0_7_q0 { I 32 vector } ifm_buff0_7_address1 { O 6 vector } ifm_buff0_7_ce1 { O 1 bit } ifm_buff0_7_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff0_7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 86 \
    name ifm_buff0_8 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename ifm_buff0_8 \
    op interface \
    ports { ifm_buff0_8_address0 { O 6 vector } ifm_buff0_8_ce0 { O 1 bit } ifm_buff0_8_q0 { I 32 vector } ifm_buff0_8_address1 { O 6 vector } ifm_buff0_8_ce1 { O 1 bit } ifm_buff0_8_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff0_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 87 \
    name ifm_buff0_9 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename ifm_buff0_9 \
    op interface \
    ports { ifm_buff0_9_address0 { O 6 vector } ifm_buff0_9_ce0 { O 1 bit } ifm_buff0_9_q0 { I 32 vector } ifm_buff0_9_address1 { O 6 vector } ifm_buff0_9_ce1 { O 1 bit } ifm_buff0_9_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff0_9'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 88 \
    name ifm_buff0_10 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename ifm_buff0_10 \
    op interface \
    ports { ifm_buff0_10_address0 { O 6 vector } ifm_buff0_10_ce0 { O 1 bit } ifm_buff0_10_q0 { I 32 vector } ifm_buff0_10_address1 { O 6 vector } ifm_buff0_10_ce1 { O 1 bit } ifm_buff0_10_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff0_10'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 89 \
    name ifm_buff0_11 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename ifm_buff0_11 \
    op interface \
    ports { ifm_buff0_11_address0 { O 6 vector } ifm_buff0_11_ce0 { O 1 bit } ifm_buff0_11_q0 { I 32 vector } ifm_buff0_11_address1 { O 6 vector } ifm_buff0_11_ce1 { O 1 bit } ifm_buff0_11_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff0_11'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 90 \
    name ifm_buff0_12 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename ifm_buff0_12 \
    op interface \
    ports { ifm_buff0_12_address0 { O 6 vector } ifm_buff0_12_ce0 { O 1 bit } ifm_buff0_12_q0 { I 32 vector } ifm_buff0_12_address1 { O 6 vector } ifm_buff0_12_ce1 { O 1 bit } ifm_buff0_12_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff0_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 91 \
    name ifm_buff0_13 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename ifm_buff0_13 \
    op interface \
    ports { ifm_buff0_13_address0 { O 6 vector } ifm_buff0_13_ce0 { O 1 bit } ifm_buff0_13_q0 { I 32 vector } ifm_buff0_13_address1 { O 6 vector } ifm_buff0_13_ce1 { O 1 bit } ifm_buff0_13_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff0_13'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 92 \
    name ifm_buff0_14 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename ifm_buff0_14 \
    op interface \
    ports { ifm_buff0_14_address0 { O 6 vector } ifm_buff0_14_ce0 { O 1 bit } ifm_buff0_14_q0 { I 32 vector } ifm_buff0_14_address1 { O 6 vector } ifm_buff0_14_ce1 { O 1 bit } ifm_buff0_14_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff0_14'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 93 \
    name ifm_buff0_15 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename ifm_buff0_15 \
    op interface \
    ports { ifm_buff0_15_address0 { O 6 vector } ifm_buff0_15_ce0 { O 1 bit } ifm_buff0_15_q0 { I 32 vector } ifm_buff0_15_address1 { O 6 vector } ifm_buff0_15_ce1 { O 1 bit } ifm_buff0_15_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff0_15'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 94 \
    name ifm_buff1_0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename ifm_buff1_0 \
    op interface \
    ports { ifm_buff1_0_address0 { O 6 vector } ifm_buff1_0_ce0 { O 1 bit } ifm_buff1_0_q0 { I 32 vector } ifm_buff1_0_address1 { O 6 vector } ifm_buff1_0_ce1 { O 1 bit } ifm_buff1_0_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff1_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 95 \
    name ifm_buff1_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename ifm_buff1_1 \
    op interface \
    ports { ifm_buff1_1_address0 { O 6 vector } ifm_buff1_1_ce0 { O 1 bit } ifm_buff1_1_q0 { I 32 vector } ifm_buff1_1_address1 { O 6 vector } ifm_buff1_1_ce1 { O 1 bit } ifm_buff1_1_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff1_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 96 \
    name ifm_buff1_2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename ifm_buff1_2 \
    op interface \
    ports { ifm_buff1_2_address0 { O 6 vector } ifm_buff1_2_ce0 { O 1 bit } ifm_buff1_2_q0 { I 32 vector } ifm_buff1_2_address1 { O 6 vector } ifm_buff1_2_ce1 { O 1 bit } ifm_buff1_2_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff1_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 97 \
    name ifm_buff1_3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename ifm_buff1_3 \
    op interface \
    ports { ifm_buff1_3_address0 { O 6 vector } ifm_buff1_3_ce0 { O 1 bit } ifm_buff1_3_q0 { I 32 vector } ifm_buff1_3_address1 { O 6 vector } ifm_buff1_3_ce1 { O 1 bit } ifm_buff1_3_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff1_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 98 \
    name ifm_buff1_4 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename ifm_buff1_4 \
    op interface \
    ports { ifm_buff1_4_address0 { O 6 vector } ifm_buff1_4_ce0 { O 1 bit } ifm_buff1_4_q0 { I 32 vector } ifm_buff1_4_address1 { O 6 vector } ifm_buff1_4_ce1 { O 1 bit } ifm_buff1_4_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff1_4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 99 \
    name ifm_buff1_5 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename ifm_buff1_5 \
    op interface \
    ports { ifm_buff1_5_address0 { O 6 vector } ifm_buff1_5_ce0 { O 1 bit } ifm_buff1_5_q0 { I 32 vector } ifm_buff1_5_address1 { O 6 vector } ifm_buff1_5_ce1 { O 1 bit } ifm_buff1_5_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff1_5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 100 \
    name ifm_buff1_6 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename ifm_buff1_6 \
    op interface \
    ports { ifm_buff1_6_address0 { O 6 vector } ifm_buff1_6_ce0 { O 1 bit } ifm_buff1_6_q0 { I 32 vector } ifm_buff1_6_address1 { O 6 vector } ifm_buff1_6_ce1 { O 1 bit } ifm_buff1_6_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff1_6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 101 \
    name ifm_buff1_7 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename ifm_buff1_7 \
    op interface \
    ports { ifm_buff1_7_address0 { O 6 vector } ifm_buff1_7_ce0 { O 1 bit } ifm_buff1_7_q0 { I 32 vector } ifm_buff1_7_address1 { O 6 vector } ifm_buff1_7_ce1 { O 1 bit } ifm_buff1_7_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff1_7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 102 \
    name ifm_buff1_8 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename ifm_buff1_8 \
    op interface \
    ports { ifm_buff1_8_address0 { O 6 vector } ifm_buff1_8_ce0 { O 1 bit } ifm_buff1_8_q0 { I 32 vector } ifm_buff1_8_address1 { O 6 vector } ifm_buff1_8_ce1 { O 1 bit } ifm_buff1_8_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff1_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 103 \
    name ifm_buff1_9 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename ifm_buff1_9 \
    op interface \
    ports { ifm_buff1_9_address0 { O 6 vector } ifm_buff1_9_ce0 { O 1 bit } ifm_buff1_9_q0 { I 32 vector } ifm_buff1_9_address1 { O 6 vector } ifm_buff1_9_ce1 { O 1 bit } ifm_buff1_9_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff1_9'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 104 \
    name ifm_buff1_10 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename ifm_buff1_10 \
    op interface \
    ports { ifm_buff1_10_address0 { O 6 vector } ifm_buff1_10_ce0 { O 1 bit } ifm_buff1_10_q0 { I 32 vector } ifm_buff1_10_address1 { O 6 vector } ifm_buff1_10_ce1 { O 1 bit } ifm_buff1_10_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff1_10'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 105 \
    name ifm_buff1_11 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename ifm_buff1_11 \
    op interface \
    ports { ifm_buff1_11_address0 { O 6 vector } ifm_buff1_11_ce0 { O 1 bit } ifm_buff1_11_q0 { I 32 vector } ifm_buff1_11_address1 { O 6 vector } ifm_buff1_11_ce1 { O 1 bit } ifm_buff1_11_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff1_11'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 106 \
    name ifm_buff1_12 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename ifm_buff1_12 \
    op interface \
    ports { ifm_buff1_12_address0 { O 6 vector } ifm_buff1_12_ce0 { O 1 bit } ifm_buff1_12_q0 { I 32 vector } ifm_buff1_12_address1 { O 6 vector } ifm_buff1_12_ce1 { O 1 bit } ifm_buff1_12_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff1_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 107 \
    name ifm_buff1_13 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename ifm_buff1_13 \
    op interface \
    ports { ifm_buff1_13_address0 { O 6 vector } ifm_buff1_13_ce0 { O 1 bit } ifm_buff1_13_q0 { I 32 vector } ifm_buff1_13_address1 { O 6 vector } ifm_buff1_13_ce1 { O 1 bit } ifm_buff1_13_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff1_13'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 108 \
    name ifm_buff1_14 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename ifm_buff1_14 \
    op interface \
    ports { ifm_buff1_14_address0 { O 6 vector } ifm_buff1_14_ce0 { O 1 bit } ifm_buff1_14_q0 { I 32 vector } ifm_buff1_14_address1 { O 6 vector } ifm_buff1_14_ce1 { O 1 bit } ifm_buff1_14_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff1_14'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 109 \
    name ifm_buff1_15 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename ifm_buff1_15 \
    op interface \
    ports { ifm_buff1_15_address0 { O 6 vector } ifm_buff1_15_ce0 { O 1 bit } ifm_buff1_15_q0 { I 32 vector } ifm_buff1_15_address1 { O 6 vector } ifm_buff1_15_ce1 { O 1 bit } ifm_buff1_15_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff1_15'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 110 \
    name ofm_buff0_0 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename ofm_buff0_0 \
    op interface \
    ports { ofm_buff0_0_address0 { O 6 vector } ofm_buff0_0_ce0 { O 1 bit } ofm_buff0_0_we0 { O 1 bit } ofm_buff0_0_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ofm_buff0_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 111 \
    name ofm_buff0_1 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename ofm_buff0_1 \
    op interface \
    ports { ofm_buff0_1_address0 { O 6 vector } ofm_buff0_1_ce0 { O 1 bit } ofm_buff0_1_we0 { O 1 bit } ofm_buff0_1_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ofm_buff0_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 112 \
    name ofm_buff0_2 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename ofm_buff0_2 \
    op interface \
    ports { ofm_buff0_2_address0 { O 6 vector } ofm_buff0_2_ce0 { O 1 bit } ofm_buff0_2_we0 { O 1 bit } ofm_buff0_2_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ofm_buff0_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 113 \
    name ofm_buff0_3 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename ofm_buff0_3 \
    op interface \
    ports { ofm_buff0_3_address0 { O 6 vector } ofm_buff0_3_ce0 { O 1 bit } ofm_buff0_3_we0 { O 1 bit } ofm_buff0_3_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ofm_buff0_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 114 \
    name ofm_buff0_4 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename ofm_buff0_4 \
    op interface \
    ports { ofm_buff0_4_address0 { O 6 vector } ofm_buff0_4_ce0 { O 1 bit } ofm_buff0_4_we0 { O 1 bit } ofm_buff0_4_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ofm_buff0_4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 115 \
    name ofm_buff0_5 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename ofm_buff0_5 \
    op interface \
    ports { ofm_buff0_5_address0 { O 6 vector } ofm_buff0_5_ce0 { O 1 bit } ofm_buff0_5_we0 { O 1 bit } ofm_buff0_5_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ofm_buff0_5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 116 \
    name ofm_buff0_6 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename ofm_buff0_6 \
    op interface \
    ports { ofm_buff0_6_address0 { O 6 vector } ofm_buff0_6_ce0 { O 1 bit } ofm_buff0_6_we0 { O 1 bit } ofm_buff0_6_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ofm_buff0_6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 117 \
    name ofm_buff0_7 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename ofm_buff0_7 \
    op interface \
    ports { ofm_buff0_7_address0 { O 6 vector } ofm_buff0_7_ce0 { O 1 bit } ofm_buff0_7_we0 { O 1 bit } ofm_buff0_7_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ofm_buff0_7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 118 \
    name ofm_buff0_8 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename ofm_buff0_8 \
    op interface \
    ports { ofm_buff0_8_address0 { O 6 vector } ofm_buff0_8_ce0 { O 1 bit } ofm_buff0_8_we0 { O 1 bit } ofm_buff0_8_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ofm_buff0_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 119 \
    name ofm_buff0_9 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename ofm_buff0_9 \
    op interface \
    ports { ofm_buff0_9_address0 { O 6 vector } ofm_buff0_9_ce0 { O 1 bit } ofm_buff0_9_we0 { O 1 bit } ofm_buff0_9_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ofm_buff0_9'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 120 \
    name ofm_buff0_10 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename ofm_buff0_10 \
    op interface \
    ports { ofm_buff0_10_address0 { O 6 vector } ofm_buff0_10_ce0 { O 1 bit } ofm_buff0_10_we0 { O 1 bit } ofm_buff0_10_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ofm_buff0_10'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 121 \
    name ofm_buff0_11 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename ofm_buff0_11 \
    op interface \
    ports { ofm_buff0_11_address0 { O 6 vector } ofm_buff0_11_ce0 { O 1 bit } ofm_buff0_11_we0 { O 1 bit } ofm_buff0_11_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ofm_buff0_11'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 122 \
    name ofm_buff0_12 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename ofm_buff0_12 \
    op interface \
    ports { ofm_buff0_12_address0 { O 6 vector } ofm_buff0_12_ce0 { O 1 bit } ofm_buff0_12_we0 { O 1 bit } ofm_buff0_12_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ofm_buff0_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 123 \
    name ofm_buff0_13 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename ofm_buff0_13 \
    op interface \
    ports { ofm_buff0_13_address0 { O 6 vector } ofm_buff0_13_ce0 { O 1 bit } ofm_buff0_13_we0 { O 1 bit } ofm_buff0_13_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ofm_buff0_13'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 124 \
    name ofm_buff0_14 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename ofm_buff0_14 \
    op interface \
    ports { ofm_buff0_14_address0 { O 6 vector } ofm_buff0_14_ce0 { O 1 bit } ofm_buff0_14_we0 { O 1 bit } ofm_buff0_14_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ofm_buff0_14'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 125 \
    name ofm_buff0_15 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename ofm_buff0_15 \
    op interface \
    ports { ofm_buff0_15_address0 { O 6 vector } ofm_buff0_15_ce0 { O 1 bit } ofm_buff0_15_we0 { O 1 bit } ofm_buff0_15_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ofm_buff0_15'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -1 \
    name ap_ctrl \
    type ap_ctrl \
    reset_level 1 \
    sync_rst true \
    corename ap_ctrl \
    op interface \
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -2 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_clk \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}


# Adapter definition:
set PortName ap_rst
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -3 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_rst \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


