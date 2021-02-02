# This script segment is generated automatically by AutoPilot

# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 149 \
    name cifm \
    reset_level 1 \
    sync_rst true \
    corename {} \
    metadata {  } \
    op interface \
    ports { cifm_TDATA { I 512 vector } cifm_TVALID { I 1 bit } cifm_TREADY { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'cifm'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 150 \
    name ifm_buff0_0 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename ifm_buff0_0 \
    op interface \
    ports { ifm_buff0_0_address0 { O 6 vector } ifm_buff0_0_ce0 { O 1 bit } ifm_buff0_0_we0 { O 1 bit } ifm_buff0_0_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff0_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 151 \
    name ifm_buff0_1 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename ifm_buff0_1 \
    op interface \
    ports { ifm_buff0_1_address0 { O 6 vector } ifm_buff0_1_ce0 { O 1 bit } ifm_buff0_1_we0 { O 1 bit } ifm_buff0_1_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff0_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 152 \
    name ifm_buff0_2 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename ifm_buff0_2 \
    op interface \
    ports { ifm_buff0_2_address0 { O 6 vector } ifm_buff0_2_ce0 { O 1 bit } ifm_buff0_2_we0 { O 1 bit } ifm_buff0_2_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff0_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 153 \
    name ifm_buff0_3 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename ifm_buff0_3 \
    op interface \
    ports { ifm_buff0_3_address0 { O 6 vector } ifm_buff0_3_ce0 { O 1 bit } ifm_buff0_3_we0 { O 1 bit } ifm_buff0_3_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff0_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 154 \
    name ifm_buff0_4 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename ifm_buff0_4 \
    op interface \
    ports { ifm_buff0_4_address0 { O 6 vector } ifm_buff0_4_ce0 { O 1 bit } ifm_buff0_4_we0 { O 1 bit } ifm_buff0_4_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff0_4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 155 \
    name ifm_buff0_5 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename ifm_buff0_5 \
    op interface \
    ports { ifm_buff0_5_address0 { O 6 vector } ifm_buff0_5_ce0 { O 1 bit } ifm_buff0_5_we0 { O 1 bit } ifm_buff0_5_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff0_5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 156 \
    name ifm_buff0_6 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename ifm_buff0_6 \
    op interface \
    ports { ifm_buff0_6_address0 { O 6 vector } ifm_buff0_6_ce0 { O 1 bit } ifm_buff0_6_we0 { O 1 bit } ifm_buff0_6_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff0_6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 157 \
    name ifm_buff0_7 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename ifm_buff0_7 \
    op interface \
    ports { ifm_buff0_7_address0 { O 6 vector } ifm_buff0_7_ce0 { O 1 bit } ifm_buff0_7_we0 { O 1 bit } ifm_buff0_7_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff0_7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 158 \
    name ifm_buff0_8 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename ifm_buff0_8 \
    op interface \
    ports { ifm_buff0_8_address0 { O 6 vector } ifm_buff0_8_ce0 { O 1 bit } ifm_buff0_8_we0 { O 1 bit } ifm_buff0_8_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff0_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 159 \
    name ifm_buff0_9 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename ifm_buff0_9 \
    op interface \
    ports { ifm_buff0_9_address0 { O 6 vector } ifm_buff0_9_ce0 { O 1 bit } ifm_buff0_9_we0 { O 1 bit } ifm_buff0_9_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff0_9'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 160 \
    name ifm_buff0_10 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename ifm_buff0_10 \
    op interface \
    ports { ifm_buff0_10_address0 { O 6 vector } ifm_buff0_10_ce0 { O 1 bit } ifm_buff0_10_we0 { O 1 bit } ifm_buff0_10_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff0_10'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 161 \
    name ifm_buff0_11 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename ifm_buff0_11 \
    op interface \
    ports { ifm_buff0_11_address0 { O 6 vector } ifm_buff0_11_ce0 { O 1 bit } ifm_buff0_11_we0 { O 1 bit } ifm_buff0_11_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff0_11'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 162 \
    name ifm_buff0_12 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename ifm_buff0_12 \
    op interface \
    ports { ifm_buff0_12_address0 { O 6 vector } ifm_buff0_12_ce0 { O 1 bit } ifm_buff0_12_we0 { O 1 bit } ifm_buff0_12_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff0_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 163 \
    name ifm_buff0_13 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename ifm_buff0_13 \
    op interface \
    ports { ifm_buff0_13_address0 { O 6 vector } ifm_buff0_13_ce0 { O 1 bit } ifm_buff0_13_we0 { O 1 bit } ifm_buff0_13_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff0_13'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 164 \
    name ifm_buff0_14 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename ifm_buff0_14 \
    op interface \
    ports { ifm_buff0_14_address0 { O 6 vector } ifm_buff0_14_ce0 { O 1 bit } ifm_buff0_14_we0 { O 1 bit } ifm_buff0_14_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff0_14'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 165 \
    name ifm_buff0_15 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename ifm_buff0_15 \
    op interface \
    ports { ifm_buff0_15_address0 { O 6 vector } ifm_buff0_15_ce0 { O 1 bit } ifm_buff0_15_we0 { O 1 bit } ifm_buff0_15_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff0_15'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 166 \
    name ifm_buff1_0 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename ifm_buff1_0 \
    op interface \
    ports { ifm_buff1_0_address0 { O 6 vector } ifm_buff1_0_ce0 { O 1 bit } ifm_buff1_0_we0 { O 1 bit } ifm_buff1_0_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff1_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 167 \
    name ifm_buff1_1 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename ifm_buff1_1 \
    op interface \
    ports { ifm_buff1_1_address0 { O 6 vector } ifm_buff1_1_ce0 { O 1 bit } ifm_buff1_1_we0 { O 1 bit } ifm_buff1_1_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff1_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 168 \
    name ifm_buff1_2 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename ifm_buff1_2 \
    op interface \
    ports { ifm_buff1_2_address0 { O 6 vector } ifm_buff1_2_ce0 { O 1 bit } ifm_buff1_2_we0 { O 1 bit } ifm_buff1_2_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff1_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 169 \
    name ifm_buff1_3 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename ifm_buff1_3 \
    op interface \
    ports { ifm_buff1_3_address0 { O 6 vector } ifm_buff1_3_ce0 { O 1 bit } ifm_buff1_3_we0 { O 1 bit } ifm_buff1_3_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff1_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 170 \
    name ifm_buff1_4 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename ifm_buff1_4 \
    op interface \
    ports { ifm_buff1_4_address0 { O 6 vector } ifm_buff1_4_ce0 { O 1 bit } ifm_buff1_4_we0 { O 1 bit } ifm_buff1_4_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff1_4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 171 \
    name ifm_buff1_5 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename ifm_buff1_5 \
    op interface \
    ports { ifm_buff1_5_address0 { O 6 vector } ifm_buff1_5_ce0 { O 1 bit } ifm_buff1_5_we0 { O 1 bit } ifm_buff1_5_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff1_5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 172 \
    name ifm_buff1_6 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename ifm_buff1_6 \
    op interface \
    ports { ifm_buff1_6_address0 { O 6 vector } ifm_buff1_6_ce0 { O 1 bit } ifm_buff1_6_we0 { O 1 bit } ifm_buff1_6_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff1_6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 173 \
    name ifm_buff1_7 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename ifm_buff1_7 \
    op interface \
    ports { ifm_buff1_7_address0 { O 6 vector } ifm_buff1_7_ce0 { O 1 bit } ifm_buff1_7_we0 { O 1 bit } ifm_buff1_7_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff1_7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 174 \
    name ifm_buff1_8 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename ifm_buff1_8 \
    op interface \
    ports { ifm_buff1_8_address0 { O 6 vector } ifm_buff1_8_ce0 { O 1 bit } ifm_buff1_8_we0 { O 1 bit } ifm_buff1_8_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff1_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 175 \
    name ifm_buff1_9 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename ifm_buff1_9 \
    op interface \
    ports { ifm_buff1_9_address0 { O 6 vector } ifm_buff1_9_ce0 { O 1 bit } ifm_buff1_9_we0 { O 1 bit } ifm_buff1_9_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff1_9'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 176 \
    name ifm_buff1_10 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename ifm_buff1_10 \
    op interface \
    ports { ifm_buff1_10_address0 { O 6 vector } ifm_buff1_10_ce0 { O 1 bit } ifm_buff1_10_we0 { O 1 bit } ifm_buff1_10_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff1_10'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 177 \
    name ifm_buff1_11 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename ifm_buff1_11 \
    op interface \
    ports { ifm_buff1_11_address0 { O 6 vector } ifm_buff1_11_ce0 { O 1 bit } ifm_buff1_11_we0 { O 1 bit } ifm_buff1_11_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff1_11'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 178 \
    name ifm_buff1_12 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename ifm_buff1_12 \
    op interface \
    ports { ifm_buff1_12_address0 { O 6 vector } ifm_buff1_12_ce0 { O 1 bit } ifm_buff1_12_we0 { O 1 bit } ifm_buff1_12_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff1_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 179 \
    name ifm_buff1_13 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename ifm_buff1_13 \
    op interface \
    ports { ifm_buff1_13_address0 { O 6 vector } ifm_buff1_13_ce0 { O 1 bit } ifm_buff1_13_we0 { O 1 bit } ifm_buff1_13_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff1_13'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 180 \
    name ifm_buff1_14 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename ifm_buff1_14 \
    op interface \
    ports { ifm_buff1_14_address0 { O 6 vector } ifm_buff1_14_ce0 { O 1 bit } ifm_buff1_14_we0 { O 1 bit } ifm_buff1_14_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff1_14'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 181 \
    name ifm_buff1_15 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename ifm_buff1_15 \
    op interface \
    ports { ifm_buff1_15_address0 { O 6 vector } ifm_buff1_15_ce0 { O 1 bit } ifm_buff1_15_we0 { O 1 bit } ifm_buff1_15_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff1_15'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 182 \
    name ifm_buff2_0 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename ifm_buff2_0 \
    op interface \
    ports { ifm_buff2_0_address0 { O 6 vector } ifm_buff2_0_ce0 { O 1 bit } ifm_buff2_0_we0 { O 1 bit } ifm_buff2_0_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff2_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 183 \
    name ifm_buff2_1 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename ifm_buff2_1 \
    op interface \
    ports { ifm_buff2_1_address0 { O 6 vector } ifm_buff2_1_ce0 { O 1 bit } ifm_buff2_1_we0 { O 1 bit } ifm_buff2_1_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff2_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 184 \
    name ifm_buff2_2 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename ifm_buff2_2 \
    op interface \
    ports { ifm_buff2_2_address0 { O 6 vector } ifm_buff2_2_ce0 { O 1 bit } ifm_buff2_2_we0 { O 1 bit } ifm_buff2_2_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff2_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 185 \
    name ifm_buff2_3 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename ifm_buff2_3 \
    op interface \
    ports { ifm_buff2_3_address0 { O 6 vector } ifm_buff2_3_ce0 { O 1 bit } ifm_buff2_3_we0 { O 1 bit } ifm_buff2_3_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff2_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 186 \
    name ifm_buff2_4 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename ifm_buff2_4 \
    op interface \
    ports { ifm_buff2_4_address0 { O 6 vector } ifm_buff2_4_ce0 { O 1 bit } ifm_buff2_4_we0 { O 1 bit } ifm_buff2_4_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff2_4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 187 \
    name ifm_buff2_5 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename ifm_buff2_5 \
    op interface \
    ports { ifm_buff2_5_address0 { O 6 vector } ifm_buff2_5_ce0 { O 1 bit } ifm_buff2_5_we0 { O 1 bit } ifm_buff2_5_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff2_5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 188 \
    name ifm_buff2_6 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename ifm_buff2_6 \
    op interface \
    ports { ifm_buff2_6_address0 { O 6 vector } ifm_buff2_6_ce0 { O 1 bit } ifm_buff2_6_we0 { O 1 bit } ifm_buff2_6_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff2_6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 189 \
    name ifm_buff2_7 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename ifm_buff2_7 \
    op interface \
    ports { ifm_buff2_7_address0 { O 6 vector } ifm_buff2_7_ce0 { O 1 bit } ifm_buff2_7_we0 { O 1 bit } ifm_buff2_7_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff2_7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 190 \
    name ifm_buff2_8 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename ifm_buff2_8 \
    op interface \
    ports { ifm_buff2_8_address0 { O 6 vector } ifm_buff2_8_ce0 { O 1 bit } ifm_buff2_8_we0 { O 1 bit } ifm_buff2_8_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff2_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 191 \
    name ifm_buff2_9 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename ifm_buff2_9 \
    op interface \
    ports { ifm_buff2_9_address0 { O 6 vector } ifm_buff2_9_ce0 { O 1 bit } ifm_buff2_9_we0 { O 1 bit } ifm_buff2_9_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff2_9'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 192 \
    name ifm_buff2_10 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename ifm_buff2_10 \
    op interface \
    ports { ifm_buff2_10_address0 { O 6 vector } ifm_buff2_10_ce0 { O 1 bit } ifm_buff2_10_we0 { O 1 bit } ifm_buff2_10_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff2_10'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 193 \
    name ifm_buff2_11 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename ifm_buff2_11 \
    op interface \
    ports { ifm_buff2_11_address0 { O 6 vector } ifm_buff2_11_ce0 { O 1 bit } ifm_buff2_11_we0 { O 1 bit } ifm_buff2_11_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff2_11'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 194 \
    name ifm_buff2_12 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename ifm_buff2_12 \
    op interface \
    ports { ifm_buff2_12_address0 { O 6 vector } ifm_buff2_12_ce0 { O 1 bit } ifm_buff2_12_we0 { O 1 bit } ifm_buff2_12_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff2_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 195 \
    name ifm_buff2_13 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename ifm_buff2_13 \
    op interface \
    ports { ifm_buff2_13_address0 { O 6 vector } ifm_buff2_13_ce0 { O 1 bit } ifm_buff2_13_we0 { O 1 bit } ifm_buff2_13_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff2_13'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 196 \
    name ifm_buff2_14 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename ifm_buff2_14 \
    op interface \
    ports { ifm_buff2_14_address0 { O 6 vector } ifm_buff2_14_ce0 { O 1 bit } ifm_buff2_14_we0 { O 1 bit } ifm_buff2_14_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff2_14'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 197 \
    name ifm_buff2_15 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename ifm_buff2_15 \
    op interface \
    ports { ifm_buff2_15_address0 { O 6 vector } ifm_buff2_15_ce0 { O 1 bit } ifm_buff2_15_we0 { O 1 bit } ifm_buff2_15_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ifm_buff2_15'"
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


