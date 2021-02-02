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
    id 11 \
    name wgt \
    reset_level 1 \
    sync_rst true \
    corename {} \
    metadata {  } \
    op interface \
    ports { wgt_TDATA { I 512 vector } wgt_TVALID { I 1 bit } wgt_TREADY { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'wgt'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 12 \
    name filter_buff_0_0_0 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename filter_buff_0_0_0 \
    op interface \
    ports { filter_buff_0_0_0_address0 { O 3 vector } filter_buff_0_0_0_ce0 { O 1 bit } filter_buff_0_0_0_we0 { O 1 bit } filter_buff_0_0_0_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'filter_buff_0_0_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 13 \
    name filter_buff_0_0_1 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename filter_buff_0_0_1 \
    op interface \
    ports { filter_buff_0_0_1_address0 { O 3 vector } filter_buff_0_0_1_ce0 { O 1 bit } filter_buff_0_0_1_we0 { O 1 bit } filter_buff_0_0_1_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'filter_buff_0_0_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 14 \
    name filter_buff_0_0_2 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename filter_buff_0_0_2 \
    op interface \
    ports { filter_buff_0_0_2_address0 { O 3 vector } filter_buff_0_0_2_ce0 { O 1 bit } filter_buff_0_0_2_we0 { O 1 bit } filter_buff_0_0_2_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'filter_buff_0_0_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 15 \
    name filter_buff_0_1_0 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename filter_buff_0_1_0 \
    op interface \
    ports { filter_buff_0_1_0_address0 { O 3 vector } filter_buff_0_1_0_ce0 { O 1 bit } filter_buff_0_1_0_we0 { O 1 bit } filter_buff_0_1_0_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'filter_buff_0_1_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 16 \
    name filter_buff_0_1_1 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename filter_buff_0_1_1 \
    op interface \
    ports { filter_buff_0_1_1_address0 { O 3 vector } filter_buff_0_1_1_ce0 { O 1 bit } filter_buff_0_1_1_we0 { O 1 bit } filter_buff_0_1_1_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'filter_buff_0_1_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 17 \
    name filter_buff_0_1_2 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename filter_buff_0_1_2 \
    op interface \
    ports { filter_buff_0_1_2_address0 { O 3 vector } filter_buff_0_1_2_ce0 { O 1 bit } filter_buff_0_1_2_we0 { O 1 bit } filter_buff_0_1_2_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'filter_buff_0_1_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 18 \
    name filter_buff_0_2_0 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename filter_buff_0_2_0 \
    op interface \
    ports { filter_buff_0_2_0_address0 { O 3 vector } filter_buff_0_2_0_ce0 { O 1 bit } filter_buff_0_2_0_we0 { O 1 bit } filter_buff_0_2_0_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'filter_buff_0_2_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 19 \
    name filter_buff_0_2_1 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename filter_buff_0_2_1 \
    op interface \
    ports { filter_buff_0_2_1_address0 { O 3 vector } filter_buff_0_2_1_ce0 { O 1 bit } filter_buff_0_2_1_we0 { O 1 bit } filter_buff_0_2_1_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'filter_buff_0_2_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 20 \
    name filter_buff_0_2_2 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename filter_buff_0_2_2 \
    op interface \
    ports { filter_buff_0_2_2_address0 { O 3 vector } filter_buff_0_2_2_ce0 { O 1 bit } filter_buff_0_2_2_we0 { O 1 bit } filter_buff_0_2_2_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'filter_buff_0_2_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 21 \
    name filter_buff_1_0_0 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename filter_buff_1_0_0 \
    op interface \
    ports { filter_buff_1_0_0_address0 { O 3 vector } filter_buff_1_0_0_ce0 { O 1 bit } filter_buff_1_0_0_we0 { O 1 bit } filter_buff_1_0_0_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'filter_buff_1_0_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 22 \
    name filter_buff_1_0_1 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename filter_buff_1_0_1 \
    op interface \
    ports { filter_buff_1_0_1_address0 { O 3 vector } filter_buff_1_0_1_ce0 { O 1 bit } filter_buff_1_0_1_we0 { O 1 bit } filter_buff_1_0_1_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'filter_buff_1_0_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 23 \
    name filter_buff_1_0_2 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename filter_buff_1_0_2 \
    op interface \
    ports { filter_buff_1_0_2_address0 { O 3 vector } filter_buff_1_0_2_ce0 { O 1 bit } filter_buff_1_0_2_we0 { O 1 bit } filter_buff_1_0_2_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'filter_buff_1_0_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 24 \
    name filter_buff_1_1_0 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename filter_buff_1_1_0 \
    op interface \
    ports { filter_buff_1_1_0_address0 { O 3 vector } filter_buff_1_1_0_ce0 { O 1 bit } filter_buff_1_1_0_we0 { O 1 bit } filter_buff_1_1_0_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'filter_buff_1_1_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 25 \
    name filter_buff_1_1_1 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename filter_buff_1_1_1 \
    op interface \
    ports { filter_buff_1_1_1_address0 { O 3 vector } filter_buff_1_1_1_ce0 { O 1 bit } filter_buff_1_1_1_we0 { O 1 bit } filter_buff_1_1_1_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'filter_buff_1_1_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 26 \
    name filter_buff_1_1_2 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename filter_buff_1_1_2 \
    op interface \
    ports { filter_buff_1_1_2_address0 { O 3 vector } filter_buff_1_1_2_ce0 { O 1 bit } filter_buff_1_1_2_we0 { O 1 bit } filter_buff_1_1_2_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'filter_buff_1_1_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 27 \
    name filter_buff_1_2_0 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename filter_buff_1_2_0 \
    op interface \
    ports { filter_buff_1_2_0_address0 { O 3 vector } filter_buff_1_2_0_ce0 { O 1 bit } filter_buff_1_2_0_we0 { O 1 bit } filter_buff_1_2_0_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'filter_buff_1_2_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 28 \
    name filter_buff_1_2_1 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename filter_buff_1_2_1 \
    op interface \
    ports { filter_buff_1_2_1_address0 { O 3 vector } filter_buff_1_2_1_ce0 { O 1 bit } filter_buff_1_2_1_we0 { O 1 bit } filter_buff_1_2_1_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'filter_buff_1_2_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 29 \
    name filter_buff_1_2_2 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename filter_buff_1_2_2 \
    op interface \
    ports { filter_buff_1_2_2_address0 { O 3 vector } filter_buff_1_2_2_ce0 { O 1 bit } filter_buff_1_2_2_we0 { O 1 bit } filter_buff_1_2_2_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'filter_buff_1_2_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 30 \
    name filter_buff_2_0_0 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename filter_buff_2_0_0 \
    op interface \
    ports { filter_buff_2_0_0_address0 { O 3 vector } filter_buff_2_0_0_ce0 { O 1 bit } filter_buff_2_0_0_we0 { O 1 bit } filter_buff_2_0_0_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'filter_buff_2_0_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 31 \
    name filter_buff_2_0_1 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename filter_buff_2_0_1 \
    op interface \
    ports { filter_buff_2_0_1_address0 { O 3 vector } filter_buff_2_0_1_ce0 { O 1 bit } filter_buff_2_0_1_we0 { O 1 bit } filter_buff_2_0_1_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'filter_buff_2_0_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 32 \
    name filter_buff_2_0_2 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename filter_buff_2_0_2 \
    op interface \
    ports { filter_buff_2_0_2_address0 { O 3 vector } filter_buff_2_0_2_ce0 { O 1 bit } filter_buff_2_0_2_we0 { O 1 bit } filter_buff_2_0_2_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'filter_buff_2_0_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 33 \
    name filter_buff_2_1_0 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename filter_buff_2_1_0 \
    op interface \
    ports { filter_buff_2_1_0_address0 { O 3 vector } filter_buff_2_1_0_ce0 { O 1 bit } filter_buff_2_1_0_we0 { O 1 bit } filter_buff_2_1_0_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'filter_buff_2_1_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 34 \
    name filter_buff_2_1_1 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename filter_buff_2_1_1 \
    op interface \
    ports { filter_buff_2_1_1_address0 { O 3 vector } filter_buff_2_1_1_ce0 { O 1 bit } filter_buff_2_1_1_we0 { O 1 bit } filter_buff_2_1_1_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'filter_buff_2_1_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 35 \
    name filter_buff_2_1_2 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename filter_buff_2_1_2 \
    op interface \
    ports { filter_buff_2_1_2_address0 { O 3 vector } filter_buff_2_1_2_ce0 { O 1 bit } filter_buff_2_1_2_we0 { O 1 bit } filter_buff_2_1_2_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'filter_buff_2_1_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 36 \
    name filter_buff_2_2_0 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename filter_buff_2_2_0 \
    op interface \
    ports { filter_buff_2_2_0_address0 { O 3 vector } filter_buff_2_2_0_ce0 { O 1 bit } filter_buff_2_2_0_we0 { O 1 bit } filter_buff_2_2_0_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'filter_buff_2_2_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 37 \
    name filter_buff_2_2_1 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename filter_buff_2_2_1 \
    op interface \
    ports { filter_buff_2_2_1_address0 { O 3 vector } filter_buff_2_2_1_ce0 { O 1 bit } filter_buff_2_2_1_we0 { O 1 bit } filter_buff_2_2_1_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'filter_buff_2_2_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 38 \
    name filter_buff_2_2_2 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename filter_buff_2_2_2 \
    op interface \
    ports { filter_buff_2_2_2_address0 { O 3 vector } filter_buff_2_2_2_ce0 { O 1 bit } filter_buff_2_2_2_we0 { O 1 bit } filter_buff_2_2_2_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'filter_buff_2_2_2'"
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


