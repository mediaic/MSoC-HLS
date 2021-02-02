#include "convolution_hw.h"
#include "AESL_pkg.h"

using namespace std;

namespace ap_rtl {

void convolution_hw::thread_ap_CS_fsm_state1() {
    ap_CS_fsm_state1 = ap_CS_fsm.read()[0];
}

void convolution_hw::thread_ap_CS_fsm_state2() {
    ap_CS_fsm_state2 = ap_CS_fsm.read()[1];
}

void convolution_hw::thread_ap_CS_fsm_state3() {
    ap_CS_fsm_state3 = ap_CS_fsm.read()[2];
}

void convolution_hw::thread_ap_CS_fsm_state4() {
    ap_CS_fsm_state4 = ap_CS_fsm.read()[3];
}

void convolution_hw::thread_ap_CS_fsm_state5() {
    ap_CS_fsm_state5 = ap_CS_fsm.read()[4];
}

void convolution_hw::thread_ap_block_state2_on_subcall_done() {
    ap_block_state2_on_subcall_done = (esl_seteq<1,1,1>(ap_const_logic_0, grp_load_cifm_data_fu_1603_ap_done.read()) || esl_seteq<1,1,1>(ap_const_logic_0, grp_load_filter_buffer_fu_1284_ap_done.read()));
}

void convolution_hw::thread_ap_block_state4_on_subcall_done() {
    ap_block_state4_on_subcall_done = ((esl_seteq<1,1,1>(ap_const_logic_0, grp_write_row_ifm_fu_1578_ap_done.read()) && 
  esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op296_call_state4.read())) || (esl_seteq<1,1,1>(ap_const_logic_0, grp_conv_write_fu_1047_ap_done.read()) && 
  esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || (esl_seteq<1,1,1>(ap_const_logic_0, grp_conv_read_fu_1259_ap_done.read()) && 
  esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op298_call_state4.read())) || (esl_seteq<1,1,1>(ap_const_logic_0, grp_write_row_ifm_fu_1578_ap_done.read()) && 
  esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op302_call_state4.read())) || (esl_seteq<1,1,1>(ap_const_logic_0, grp_conv_write_fu_1047_ap_done.read()) && 
  esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || (esl_seteq<1,1,1>(ap_const_logic_0, grp_conv_read_fu_1259_ap_done.read()) && 
  esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op304_call_state4.read())) || (esl_seteq<1,1,1>(ap_const_logic_0, grp_write_row_ifm_fu_1578_ap_done.read()) && 
  esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op308_call_state4.read())) || (esl_seteq<1,1,1>(ap_const_logic_0, grp_conv_write_fu_1047_ap_done.read()) && 
  esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || (esl_seteq<1,1,1>(ap_const_logic_0, grp_conv_read_fu_1259_ap_done.read()) && 
  esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op310_call_state4.read())) || (esl_seteq<1,1,1>(ap_const_logic_0, grp_write_row_ifm_fu_1578_ap_done.read()) && 
  esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) || (esl_seteq<1,1,1>(ap_const_logic_0, grp_conv_write_fu_1047_ap_done.read()) && 
  esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) || (esl_seteq<1,1,1>(ap_const_logic_0, grp_conv_read_fu_1259_ap_done.read()) && 
  esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())));
}

void convolution_hw::thread_ap_done() {
    if (((esl_seteq<1,1,1>(ap_const_logic_0, ap_start.read()) && 
          esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state1.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state5.read()) && 
          esl_seteq<1,1,1>(grp_conv_read_fu_1259_ap_done.read(), ap_const_logic_1)))) {
        ap_done = ap_const_logic_1;
    } else {
        ap_done = ap_const_logic_0;
    }
}

void convolution_hw::thread_ap_idle() {
    if ((esl_seteq<1,1,1>(ap_const_logic_0, ap_start.read()) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state1.read()))) {
        ap_idle = ap_const_logic_1;
    } else {
        ap_idle = ap_const_logic_0;
    }
}

void convolution_hw::thread_ap_predicate_op296_call_state4() {
    ap_predicate_op296_call_state4 = (esl_seteq<1,1,1>(ap_const_lv1_0, icmp_ln648_reg_1835.read()) && esl_seteq<1,1,1>(ap_const_lv1_0, icmp_ln658_reg_1839.read()) && esl_seteq<1,1,1>(ap_const_lv1_0, icmp_ln667_reg_1843.read()) && esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln676_reg_1847.read()));
}

void convolution_hw::thread_ap_predicate_op297_call_state4() {
    ap_predicate_op297_call_state4 = (esl_seteq<1,1,1>(ap_const_lv1_0, icmp_ln648_reg_1835.read()) && esl_seteq<1,1,1>(ap_const_lv1_0, icmp_ln658_reg_1839.read()) && esl_seteq<1,1,1>(ap_const_lv1_0, icmp_ln667_reg_1843.read()) && esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln676_reg_1847.read()));
}

void convolution_hw::thread_ap_predicate_op298_call_state4() {
    ap_predicate_op298_call_state4 = (esl_seteq<1,1,1>(ap_const_lv1_0, icmp_ln648_reg_1835.read()) && esl_seteq<1,1,1>(ap_const_lv1_0, icmp_ln658_reg_1839.read()) && esl_seteq<1,1,1>(ap_const_lv1_0, icmp_ln667_reg_1843.read()) && esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln676_reg_1847.read()));
}

void convolution_hw::thread_ap_predicate_op302_call_state4() {
    ap_predicate_op302_call_state4 = (esl_seteq<1,1,1>(ap_const_lv1_0, icmp_ln648_reg_1835.read()) && esl_seteq<1,1,1>(ap_const_lv1_0, icmp_ln658_reg_1839.read()) && esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln667_reg_1843.read()));
}

void convolution_hw::thread_ap_predicate_op303_call_state4() {
    ap_predicate_op303_call_state4 = (esl_seteq<1,1,1>(ap_const_lv1_0, icmp_ln648_reg_1835.read()) && esl_seteq<1,1,1>(ap_const_lv1_0, icmp_ln658_reg_1839.read()) && esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln667_reg_1843.read()));
}

void convolution_hw::thread_ap_predicate_op304_call_state4() {
    ap_predicate_op304_call_state4 = (esl_seteq<1,1,1>(ap_const_lv1_0, icmp_ln648_reg_1835.read()) && esl_seteq<1,1,1>(ap_const_lv1_0, icmp_ln658_reg_1839.read()) && esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln667_reg_1843.read()));
}

void convolution_hw::thread_ap_predicate_op308_call_state4() {
    ap_predicate_op308_call_state4 = (esl_seteq<1,1,1>(ap_const_lv1_0, icmp_ln648_reg_1835.read()) && esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln658_reg_1839.read()));
}

void convolution_hw::thread_ap_predicate_op309_call_state4() {
    ap_predicate_op309_call_state4 = (esl_seteq<1,1,1>(ap_const_lv1_0, icmp_ln648_reg_1835.read()) && esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln658_reg_1839.read()));
}

void convolution_hw::thread_ap_predicate_op310_call_state4() {
    ap_predicate_op310_call_state4 = (esl_seteq<1,1,1>(ap_const_lv1_0, icmp_ln648_reg_1835.read()) && esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln658_reg_1839.read()));
}

void convolution_hw::thread_ap_ready() {
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state5.read()) && 
         esl_seteq<1,1,1>(grp_conv_read_fu_1259_ap_done.read(), ap_const_logic_1))) {
        ap_ready = ap_const_logic_1;
    } else {
        ap_ready = ap_const_logic_0;
    }
}

void convolution_hw::thread_cifm_TREADY() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        cifm_TREADY = grp_load_cifm_data_fu_1603_cifm_TREADY.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op296_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op302_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op308_call_state4.read())))) {
        cifm_TREADY = grp_write_row_ifm_fu_1578_cifm_TREADY.read();
    } else {
        cifm_TREADY = ap_const_logic_0;
    }
}

void convolution_hw::thread_cofm_TDATA() {
    cofm_TDATA = grp_conv_read_fu_1259_cofm_TDATA.read();
}

void convolution_hw::thread_cofm_TVALID() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op298_call_state4.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op304_call_state4.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op310_call_state4.read())) || 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state5.read()))) {
        cofm_TVALID = grp_conv_read_fu_1259_cofm_TVALID.read();
    } else {
        cofm_TVALID = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_0_0_0_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_0_0_0_address0 = grp_load_filter_buffer_fu_1284_filter_buff_0_0_0_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_0_0_0_address0 = grp_conv_write_fu_1047_filter_buff_0_0_0_address0.read();
    } else {
        filter_buff_0_0_0_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_0_0_0_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_0_0_0_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_0_0_0_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_0_0_0_ce0 = grp_conv_write_fu_1047_filter_buff_0_0_0_ce0.read();
    } else {
        filter_buff_0_0_0_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_0_0_0_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_0_0_0_we0 = grp_load_filter_buffer_fu_1284_filter_buff_0_0_0_we0.read();
    } else {
        filter_buff_0_0_0_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_0_0_1_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_0_0_1_address0 = grp_load_filter_buffer_fu_1284_filter_buff_0_0_1_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_0_0_1_address0 = grp_conv_write_fu_1047_filter_buff_0_0_1_address0.read();
    } else {
        filter_buff_0_0_1_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_0_0_1_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_0_0_1_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_0_0_1_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_0_0_1_ce0 = grp_conv_write_fu_1047_filter_buff_0_0_1_ce0.read();
    } else {
        filter_buff_0_0_1_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_0_0_1_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_0_0_1_we0 = grp_load_filter_buffer_fu_1284_filter_buff_0_0_1_we0.read();
    } else {
        filter_buff_0_0_1_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_0_0_2_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_0_0_2_address0 = grp_load_filter_buffer_fu_1284_filter_buff_0_0_2_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_0_0_2_address0 = grp_conv_write_fu_1047_filter_buff_0_0_2_address0.read();
    } else {
        filter_buff_0_0_2_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_0_0_2_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_0_0_2_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_0_0_2_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_0_0_2_ce0 = grp_conv_write_fu_1047_filter_buff_0_0_2_ce0.read();
    } else {
        filter_buff_0_0_2_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_0_0_2_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_0_0_2_we0 = grp_load_filter_buffer_fu_1284_filter_buff_0_0_2_we0.read();
    } else {
        filter_buff_0_0_2_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_0_1_0_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_0_1_0_address0 = grp_load_filter_buffer_fu_1284_filter_buff_0_1_0_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_0_1_0_address0 = grp_conv_write_fu_1047_filter_buff_0_1_0_address0.read();
    } else {
        filter_buff_0_1_0_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_0_1_0_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_0_1_0_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_0_1_0_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_0_1_0_ce0 = grp_conv_write_fu_1047_filter_buff_0_1_0_ce0.read();
    } else {
        filter_buff_0_1_0_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_0_1_0_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_0_1_0_we0 = grp_load_filter_buffer_fu_1284_filter_buff_0_1_0_we0.read();
    } else {
        filter_buff_0_1_0_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_0_1_1_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_0_1_1_address0 = grp_load_filter_buffer_fu_1284_filter_buff_0_1_1_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_0_1_1_address0 = grp_conv_write_fu_1047_filter_buff_0_1_1_address0.read();
    } else {
        filter_buff_0_1_1_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_0_1_1_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_0_1_1_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_0_1_1_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_0_1_1_ce0 = grp_conv_write_fu_1047_filter_buff_0_1_1_ce0.read();
    } else {
        filter_buff_0_1_1_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_0_1_1_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_0_1_1_we0 = grp_load_filter_buffer_fu_1284_filter_buff_0_1_1_we0.read();
    } else {
        filter_buff_0_1_1_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_0_1_2_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_0_1_2_address0 = grp_load_filter_buffer_fu_1284_filter_buff_0_1_2_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_0_1_2_address0 = grp_conv_write_fu_1047_filter_buff_0_1_2_address0.read();
    } else {
        filter_buff_0_1_2_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_0_1_2_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_0_1_2_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_0_1_2_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_0_1_2_ce0 = grp_conv_write_fu_1047_filter_buff_0_1_2_ce0.read();
    } else {
        filter_buff_0_1_2_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_0_1_2_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_0_1_2_we0 = grp_load_filter_buffer_fu_1284_filter_buff_0_1_2_we0.read();
    } else {
        filter_buff_0_1_2_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_0_2_0_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_0_2_0_address0 = grp_load_filter_buffer_fu_1284_filter_buff_0_2_0_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_0_2_0_address0 = grp_conv_write_fu_1047_filter_buff_0_2_0_address0.read();
    } else {
        filter_buff_0_2_0_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_0_2_0_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_0_2_0_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_0_2_0_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_0_2_0_ce0 = grp_conv_write_fu_1047_filter_buff_0_2_0_ce0.read();
    } else {
        filter_buff_0_2_0_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_0_2_0_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_0_2_0_we0 = grp_load_filter_buffer_fu_1284_filter_buff_0_2_0_we0.read();
    } else {
        filter_buff_0_2_0_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_0_2_1_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_0_2_1_address0 = grp_load_filter_buffer_fu_1284_filter_buff_0_2_1_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_0_2_1_address0 = grp_conv_write_fu_1047_filter_buff_0_2_1_address0.read();
    } else {
        filter_buff_0_2_1_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_0_2_1_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_0_2_1_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_0_2_1_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_0_2_1_ce0 = grp_conv_write_fu_1047_filter_buff_0_2_1_ce0.read();
    } else {
        filter_buff_0_2_1_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_0_2_1_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_0_2_1_we0 = grp_load_filter_buffer_fu_1284_filter_buff_0_2_1_we0.read();
    } else {
        filter_buff_0_2_1_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_0_2_2_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_0_2_2_address0 = grp_load_filter_buffer_fu_1284_filter_buff_0_2_2_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_0_2_2_address0 = grp_conv_write_fu_1047_filter_buff_0_2_2_address0.read();
    } else {
        filter_buff_0_2_2_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_0_2_2_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_0_2_2_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_0_2_2_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_0_2_2_ce0 = grp_conv_write_fu_1047_filter_buff_0_2_2_ce0.read();
    } else {
        filter_buff_0_2_2_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_0_2_2_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_0_2_2_we0 = grp_load_filter_buffer_fu_1284_filter_buff_0_2_2_we0.read();
    } else {
        filter_buff_0_2_2_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_10_0_0_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_10_0_0_address0 = grp_load_filter_buffer_fu_1284_filter_buff_10_0_0_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_10_0_0_address0 = grp_conv_write_fu_1047_filter_buff_10_0_0_address0.read();
    } else {
        filter_buff_10_0_0_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_10_0_0_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_10_0_0_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_10_0_0_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_10_0_0_ce0 = grp_conv_write_fu_1047_filter_buff_10_0_0_ce0.read();
    } else {
        filter_buff_10_0_0_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_10_0_0_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_10_0_0_we0 = grp_load_filter_buffer_fu_1284_filter_buff_10_0_0_we0.read();
    } else {
        filter_buff_10_0_0_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_10_0_1_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_10_0_1_address0 = grp_load_filter_buffer_fu_1284_filter_buff_10_0_1_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_10_0_1_address0 = grp_conv_write_fu_1047_filter_buff_10_0_1_address0.read();
    } else {
        filter_buff_10_0_1_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_10_0_1_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_10_0_1_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_10_0_1_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_10_0_1_ce0 = grp_conv_write_fu_1047_filter_buff_10_0_1_ce0.read();
    } else {
        filter_buff_10_0_1_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_10_0_1_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_10_0_1_we0 = grp_load_filter_buffer_fu_1284_filter_buff_10_0_1_we0.read();
    } else {
        filter_buff_10_0_1_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_10_0_2_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_10_0_2_address0 = grp_load_filter_buffer_fu_1284_filter_buff_10_0_2_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_10_0_2_address0 = grp_conv_write_fu_1047_filter_buff_10_0_2_address0.read();
    } else {
        filter_buff_10_0_2_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_10_0_2_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_10_0_2_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_10_0_2_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_10_0_2_ce0 = grp_conv_write_fu_1047_filter_buff_10_0_2_ce0.read();
    } else {
        filter_buff_10_0_2_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_10_0_2_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_10_0_2_we0 = grp_load_filter_buffer_fu_1284_filter_buff_10_0_2_we0.read();
    } else {
        filter_buff_10_0_2_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_10_1_0_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_10_1_0_address0 = grp_load_filter_buffer_fu_1284_filter_buff_10_1_0_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_10_1_0_address0 = grp_conv_write_fu_1047_filter_buff_10_1_0_address0.read();
    } else {
        filter_buff_10_1_0_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_10_1_0_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_10_1_0_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_10_1_0_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_10_1_0_ce0 = grp_conv_write_fu_1047_filter_buff_10_1_0_ce0.read();
    } else {
        filter_buff_10_1_0_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_10_1_0_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_10_1_0_we0 = grp_load_filter_buffer_fu_1284_filter_buff_10_1_0_we0.read();
    } else {
        filter_buff_10_1_0_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_10_1_1_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_10_1_1_address0 = grp_load_filter_buffer_fu_1284_filter_buff_10_1_1_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_10_1_1_address0 = grp_conv_write_fu_1047_filter_buff_10_1_1_address0.read();
    } else {
        filter_buff_10_1_1_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_10_1_1_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_10_1_1_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_10_1_1_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_10_1_1_ce0 = grp_conv_write_fu_1047_filter_buff_10_1_1_ce0.read();
    } else {
        filter_buff_10_1_1_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_10_1_1_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_10_1_1_we0 = grp_load_filter_buffer_fu_1284_filter_buff_10_1_1_we0.read();
    } else {
        filter_buff_10_1_1_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_10_1_2_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_10_1_2_address0 = grp_load_filter_buffer_fu_1284_filter_buff_10_1_2_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_10_1_2_address0 = grp_conv_write_fu_1047_filter_buff_10_1_2_address0.read();
    } else {
        filter_buff_10_1_2_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_10_1_2_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_10_1_2_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_10_1_2_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_10_1_2_ce0 = grp_conv_write_fu_1047_filter_buff_10_1_2_ce0.read();
    } else {
        filter_buff_10_1_2_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_10_1_2_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_10_1_2_we0 = grp_load_filter_buffer_fu_1284_filter_buff_10_1_2_we0.read();
    } else {
        filter_buff_10_1_2_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_10_2_0_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_10_2_0_address0 = grp_load_filter_buffer_fu_1284_filter_buff_10_2_0_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_10_2_0_address0 = grp_conv_write_fu_1047_filter_buff_10_2_0_address0.read();
    } else {
        filter_buff_10_2_0_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_10_2_0_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_10_2_0_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_10_2_0_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_10_2_0_ce0 = grp_conv_write_fu_1047_filter_buff_10_2_0_ce0.read();
    } else {
        filter_buff_10_2_0_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_10_2_0_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_10_2_0_we0 = grp_load_filter_buffer_fu_1284_filter_buff_10_2_0_we0.read();
    } else {
        filter_buff_10_2_0_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_10_2_1_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_10_2_1_address0 = grp_load_filter_buffer_fu_1284_filter_buff_10_2_1_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_10_2_1_address0 = grp_conv_write_fu_1047_filter_buff_10_2_1_address0.read();
    } else {
        filter_buff_10_2_1_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_10_2_1_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_10_2_1_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_10_2_1_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_10_2_1_ce0 = grp_conv_write_fu_1047_filter_buff_10_2_1_ce0.read();
    } else {
        filter_buff_10_2_1_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_10_2_1_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_10_2_1_we0 = grp_load_filter_buffer_fu_1284_filter_buff_10_2_1_we0.read();
    } else {
        filter_buff_10_2_1_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_10_2_2_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_10_2_2_address0 = grp_load_filter_buffer_fu_1284_filter_buff_10_2_2_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_10_2_2_address0 = grp_conv_write_fu_1047_filter_buff_10_2_2_address0.read();
    } else {
        filter_buff_10_2_2_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_10_2_2_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_10_2_2_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_10_2_2_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_10_2_2_ce0 = grp_conv_write_fu_1047_filter_buff_10_2_2_ce0.read();
    } else {
        filter_buff_10_2_2_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_10_2_2_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_10_2_2_we0 = grp_load_filter_buffer_fu_1284_filter_buff_10_2_2_we0.read();
    } else {
        filter_buff_10_2_2_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_11_0_0_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_11_0_0_address0 = grp_load_filter_buffer_fu_1284_filter_buff_11_0_0_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_11_0_0_address0 = grp_conv_write_fu_1047_filter_buff_11_0_0_address0.read();
    } else {
        filter_buff_11_0_0_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_11_0_0_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_11_0_0_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_11_0_0_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_11_0_0_ce0 = grp_conv_write_fu_1047_filter_buff_11_0_0_ce0.read();
    } else {
        filter_buff_11_0_0_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_11_0_0_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_11_0_0_we0 = grp_load_filter_buffer_fu_1284_filter_buff_11_0_0_we0.read();
    } else {
        filter_buff_11_0_0_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_11_0_1_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_11_0_1_address0 = grp_load_filter_buffer_fu_1284_filter_buff_11_0_1_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_11_0_1_address0 = grp_conv_write_fu_1047_filter_buff_11_0_1_address0.read();
    } else {
        filter_buff_11_0_1_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_11_0_1_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_11_0_1_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_11_0_1_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_11_0_1_ce0 = grp_conv_write_fu_1047_filter_buff_11_0_1_ce0.read();
    } else {
        filter_buff_11_0_1_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_11_0_1_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_11_0_1_we0 = grp_load_filter_buffer_fu_1284_filter_buff_11_0_1_we0.read();
    } else {
        filter_buff_11_0_1_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_11_0_2_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_11_0_2_address0 = grp_load_filter_buffer_fu_1284_filter_buff_11_0_2_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_11_0_2_address0 = grp_conv_write_fu_1047_filter_buff_11_0_2_address0.read();
    } else {
        filter_buff_11_0_2_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_11_0_2_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_11_0_2_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_11_0_2_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_11_0_2_ce0 = grp_conv_write_fu_1047_filter_buff_11_0_2_ce0.read();
    } else {
        filter_buff_11_0_2_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_11_0_2_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_11_0_2_we0 = grp_load_filter_buffer_fu_1284_filter_buff_11_0_2_we0.read();
    } else {
        filter_buff_11_0_2_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_11_1_0_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_11_1_0_address0 = grp_load_filter_buffer_fu_1284_filter_buff_11_1_0_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_11_1_0_address0 = grp_conv_write_fu_1047_filter_buff_11_1_0_address0.read();
    } else {
        filter_buff_11_1_0_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_11_1_0_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_11_1_0_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_11_1_0_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_11_1_0_ce0 = grp_conv_write_fu_1047_filter_buff_11_1_0_ce0.read();
    } else {
        filter_buff_11_1_0_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_11_1_0_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_11_1_0_we0 = grp_load_filter_buffer_fu_1284_filter_buff_11_1_0_we0.read();
    } else {
        filter_buff_11_1_0_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_11_1_1_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_11_1_1_address0 = grp_load_filter_buffer_fu_1284_filter_buff_11_1_1_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_11_1_1_address0 = grp_conv_write_fu_1047_filter_buff_11_1_1_address0.read();
    } else {
        filter_buff_11_1_1_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_11_1_1_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_11_1_1_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_11_1_1_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_11_1_1_ce0 = grp_conv_write_fu_1047_filter_buff_11_1_1_ce0.read();
    } else {
        filter_buff_11_1_1_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_11_1_1_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_11_1_1_we0 = grp_load_filter_buffer_fu_1284_filter_buff_11_1_1_we0.read();
    } else {
        filter_buff_11_1_1_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_11_1_2_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_11_1_2_address0 = grp_load_filter_buffer_fu_1284_filter_buff_11_1_2_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_11_1_2_address0 = grp_conv_write_fu_1047_filter_buff_11_1_2_address0.read();
    } else {
        filter_buff_11_1_2_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_11_1_2_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_11_1_2_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_11_1_2_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_11_1_2_ce0 = grp_conv_write_fu_1047_filter_buff_11_1_2_ce0.read();
    } else {
        filter_buff_11_1_2_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_11_1_2_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_11_1_2_we0 = grp_load_filter_buffer_fu_1284_filter_buff_11_1_2_we0.read();
    } else {
        filter_buff_11_1_2_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_11_2_0_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_11_2_0_address0 = grp_load_filter_buffer_fu_1284_filter_buff_11_2_0_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_11_2_0_address0 = grp_conv_write_fu_1047_filter_buff_11_2_0_address0.read();
    } else {
        filter_buff_11_2_0_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_11_2_0_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_11_2_0_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_11_2_0_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_11_2_0_ce0 = grp_conv_write_fu_1047_filter_buff_11_2_0_ce0.read();
    } else {
        filter_buff_11_2_0_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_11_2_0_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_11_2_0_we0 = grp_load_filter_buffer_fu_1284_filter_buff_11_2_0_we0.read();
    } else {
        filter_buff_11_2_0_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_11_2_1_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_11_2_1_address0 = grp_load_filter_buffer_fu_1284_filter_buff_11_2_1_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_11_2_1_address0 = grp_conv_write_fu_1047_filter_buff_11_2_1_address0.read();
    } else {
        filter_buff_11_2_1_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_11_2_1_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_11_2_1_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_11_2_1_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_11_2_1_ce0 = grp_conv_write_fu_1047_filter_buff_11_2_1_ce0.read();
    } else {
        filter_buff_11_2_1_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_11_2_1_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_11_2_1_we0 = grp_load_filter_buffer_fu_1284_filter_buff_11_2_1_we0.read();
    } else {
        filter_buff_11_2_1_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_11_2_2_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_11_2_2_address0 = grp_load_filter_buffer_fu_1284_filter_buff_11_2_2_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_11_2_2_address0 = grp_conv_write_fu_1047_filter_buff_11_2_2_address0.read();
    } else {
        filter_buff_11_2_2_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_11_2_2_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_11_2_2_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_11_2_2_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_11_2_2_ce0 = grp_conv_write_fu_1047_filter_buff_11_2_2_ce0.read();
    } else {
        filter_buff_11_2_2_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_11_2_2_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_11_2_2_we0 = grp_load_filter_buffer_fu_1284_filter_buff_11_2_2_we0.read();
    } else {
        filter_buff_11_2_2_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_12_0_0_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_12_0_0_address0 = grp_load_filter_buffer_fu_1284_filter_buff_12_0_0_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_12_0_0_address0 = grp_conv_write_fu_1047_filter_buff_12_0_0_address0.read();
    } else {
        filter_buff_12_0_0_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_12_0_0_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_12_0_0_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_12_0_0_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_12_0_0_ce0 = grp_conv_write_fu_1047_filter_buff_12_0_0_ce0.read();
    } else {
        filter_buff_12_0_0_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_12_0_0_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_12_0_0_we0 = grp_load_filter_buffer_fu_1284_filter_buff_12_0_0_we0.read();
    } else {
        filter_buff_12_0_0_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_12_0_1_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_12_0_1_address0 = grp_load_filter_buffer_fu_1284_filter_buff_12_0_1_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_12_0_1_address0 = grp_conv_write_fu_1047_filter_buff_12_0_1_address0.read();
    } else {
        filter_buff_12_0_1_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_12_0_1_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_12_0_1_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_12_0_1_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_12_0_1_ce0 = grp_conv_write_fu_1047_filter_buff_12_0_1_ce0.read();
    } else {
        filter_buff_12_0_1_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_12_0_1_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_12_0_1_we0 = grp_load_filter_buffer_fu_1284_filter_buff_12_0_1_we0.read();
    } else {
        filter_buff_12_0_1_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_12_0_2_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_12_0_2_address0 = grp_load_filter_buffer_fu_1284_filter_buff_12_0_2_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_12_0_2_address0 = grp_conv_write_fu_1047_filter_buff_12_0_2_address0.read();
    } else {
        filter_buff_12_0_2_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_12_0_2_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_12_0_2_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_12_0_2_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_12_0_2_ce0 = grp_conv_write_fu_1047_filter_buff_12_0_2_ce0.read();
    } else {
        filter_buff_12_0_2_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_12_0_2_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_12_0_2_we0 = grp_load_filter_buffer_fu_1284_filter_buff_12_0_2_we0.read();
    } else {
        filter_buff_12_0_2_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_12_1_0_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_12_1_0_address0 = grp_load_filter_buffer_fu_1284_filter_buff_12_1_0_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_12_1_0_address0 = grp_conv_write_fu_1047_filter_buff_12_1_0_address0.read();
    } else {
        filter_buff_12_1_0_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_12_1_0_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_12_1_0_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_12_1_0_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_12_1_0_ce0 = grp_conv_write_fu_1047_filter_buff_12_1_0_ce0.read();
    } else {
        filter_buff_12_1_0_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_12_1_0_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_12_1_0_we0 = grp_load_filter_buffer_fu_1284_filter_buff_12_1_0_we0.read();
    } else {
        filter_buff_12_1_0_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_12_1_1_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_12_1_1_address0 = grp_load_filter_buffer_fu_1284_filter_buff_12_1_1_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_12_1_1_address0 = grp_conv_write_fu_1047_filter_buff_12_1_1_address0.read();
    } else {
        filter_buff_12_1_1_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_12_1_1_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_12_1_1_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_12_1_1_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_12_1_1_ce0 = grp_conv_write_fu_1047_filter_buff_12_1_1_ce0.read();
    } else {
        filter_buff_12_1_1_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_12_1_1_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_12_1_1_we0 = grp_load_filter_buffer_fu_1284_filter_buff_12_1_1_we0.read();
    } else {
        filter_buff_12_1_1_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_12_1_2_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_12_1_2_address0 = grp_load_filter_buffer_fu_1284_filter_buff_12_1_2_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_12_1_2_address0 = grp_conv_write_fu_1047_filter_buff_12_1_2_address0.read();
    } else {
        filter_buff_12_1_2_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_12_1_2_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_12_1_2_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_12_1_2_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_12_1_2_ce0 = grp_conv_write_fu_1047_filter_buff_12_1_2_ce0.read();
    } else {
        filter_buff_12_1_2_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_12_1_2_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_12_1_2_we0 = grp_load_filter_buffer_fu_1284_filter_buff_12_1_2_we0.read();
    } else {
        filter_buff_12_1_2_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_12_2_0_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_12_2_0_address0 = grp_load_filter_buffer_fu_1284_filter_buff_12_2_0_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_12_2_0_address0 = grp_conv_write_fu_1047_filter_buff_12_2_0_address0.read();
    } else {
        filter_buff_12_2_0_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_12_2_0_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_12_2_0_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_12_2_0_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_12_2_0_ce0 = grp_conv_write_fu_1047_filter_buff_12_2_0_ce0.read();
    } else {
        filter_buff_12_2_0_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_12_2_0_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_12_2_0_we0 = grp_load_filter_buffer_fu_1284_filter_buff_12_2_0_we0.read();
    } else {
        filter_buff_12_2_0_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_12_2_1_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_12_2_1_address0 = grp_load_filter_buffer_fu_1284_filter_buff_12_2_1_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_12_2_1_address0 = grp_conv_write_fu_1047_filter_buff_12_2_1_address0.read();
    } else {
        filter_buff_12_2_1_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_12_2_1_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_12_2_1_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_12_2_1_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_12_2_1_ce0 = grp_conv_write_fu_1047_filter_buff_12_2_1_ce0.read();
    } else {
        filter_buff_12_2_1_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_12_2_1_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_12_2_1_we0 = grp_load_filter_buffer_fu_1284_filter_buff_12_2_1_we0.read();
    } else {
        filter_buff_12_2_1_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_12_2_2_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_12_2_2_address0 = grp_load_filter_buffer_fu_1284_filter_buff_12_2_2_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_12_2_2_address0 = grp_conv_write_fu_1047_filter_buff_12_2_2_address0.read();
    } else {
        filter_buff_12_2_2_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_12_2_2_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_12_2_2_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_12_2_2_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_12_2_2_ce0 = grp_conv_write_fu_1047_filter_buff_12_2_2_ce0.read();
    } else {
        filter_buff_12_2_2_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_12_2_2_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_12_2_2_we0 = grp_load_filter_buffer_fu_1284_filter_buff_12_2_2_we0.read();
    } else {
        filter_buff_12_2_2_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_13_0_0_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_13_0_0_address0 = grp_load_filter_buffer_fu_1284_filter_buff_13_0_0_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_13_0_0_address0 = grp_conv_write_fu_1047_filter_buff_13_0_0_address0.read();
    } else {
        filter_buff_13_0_0_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_13_0_0_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_13_0_0_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_13_0_0_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_13_0_0_ce0 = grp_conv_write_fu_1047_filter_buff_13_0_0_ce0.read();
    } else {
        filter_buff_13_0_0_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_13_0_0_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_13_0_0_we0 = grp_load_filter_buffer_fu_1284_filter_buff_13_0_0_we0.read();
    } else {
        filter_buff_13_0_0_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_13_0_1_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_13_0_1_address0 = grp_load_filter_buffer_fu_1284_filter_buff_13_0_1_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_13_0_1_address0 = grp_conv_write_fu_1047_filter_buff_13_0_1_address0.read();
    } else {
        filter_buff_13_0_1_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_13_0_1_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_13_0_1_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_13_0_1_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_13_0_1_ce0 = grp_conv_write_fu_1047_filter_buff_13_0_1_ce0.read();
    } else {
        filter_buff_13_0_1_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_13_0_1_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_13_0_1_we0 = grp_load_filter_buffer_fu_1284_filter_buff_13_0_1_we0.read();
    } else {
        filter_buff_13_0_1_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_13_0_2_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_13_0_2_address0 = grp_load_filter_buffer_fu_1284_filter_buff_13_0_2_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_13_0_2_address0 = grp_conv_write_fu_1047_filter_buff_13_0_2_address0.read();
    } else {
        filter_buff_13_0_2_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_13_0_2_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_13_0_2_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_13_0_2_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_13_0_2_ce0 = grp_conv_write_fu_1047_filter_buff_13_0_2_ce0.read();
    } else {
        filter_buff_13_0_2_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_13_0_2_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_13_0_2_we0 = grp_load_filter_buffer_fu_1284_filter_buff_13_0_2_we0.read();
    } else {
        filter_buff_13_0_2_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_13_1_0_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_13_1_0_address0 = grp_load_filter_buffer_fu_1284_filter_buff_13_1_0_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_13_1_0_address0 = grp_conv_write_fu_1047_filter_buff_13_1_0_address0.read();
    } else {
        filter_buff_13_1_0_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_13_1_0_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_13_1_0_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_13_1_0_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_13_1_0_ce0 = grp_conv_write_fu_1047_filter_buff_13_1_0_ce0.read();
    } else {
        filter_buff_13_1_0_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_13_1_0_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_13_1_0_we0 = grp_load_filter_buffer_fu_1284_filter_buff_13_1_0_we0.read();
    } else {
        filter_buff_13_1_0_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_13_1_1_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_13_1_1_address0 = grp_load_filter_buffer_fu_1284_filter_buff_13_1_1_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_13_1_1_address0 = grp_conv_write_fu_1047_filter_buff_13_1_1_address0.read();
    } else {
        filter_buff_13_1_1_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_13_1_1_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_13_1_1_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_13_1_1_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_13_1_1_ce0 = grp_conv_write_fu_1047_filter_buff_13_1_1_ce0.read();
    } else {
        filter_buff_13_1_1_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_13_1_1_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_13_1_1_we0 = grp_load_filter_buffer_fu_1284_filter_buff_13_1_1_we0.read();
    } else {
        filter_buff_13_1_1_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_13_1_2_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_13_1_2_address0 = grp_load_filter_buffer_fu_1284_filter_buff_13_1_2_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_13_1_2_address0 = grp_conv_write_fu_1047_filter_buff_13_1_2_address0.read();
    } else {
        filter_buff_13_1_2_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_13_1_2_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_13_1_2_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_13_1_2_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_13_1_2_ce0 = grp_conv_write_fu_1047_filter_buff_13_1_2_ce0.read();
    } else {
        filter_buff_13_1_2_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_13_1_2_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_13_1_2_we0 = grp_load_filter_buffer_fu_1284_filter_buff_13_1_2_we0.read();
    } else {
        filter_buff_13_1_2_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_13_2_0_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_13_2_0_address0 = grp_load_filter_buffer_fu_1284_filter_buff_13_2_0_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_13_2_0_address0 = grp_conv_write_fu_1047_filter_buff_13_2_0_address0.read();
    } else {
        filter_buff_13_2_0_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_13_2_0_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_13_2_0_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_13_2_0_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_13_2_0_ce0 = grp_conv_write_fu_1047_filter_buff_13_2_0_ce0.read();
    } else {
        filter_buff_13_2_0_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_13_2_0_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_13_2_0_we0 = grp_load_filter_buffer_fu_1284_filter_buff_13_2_0_we0.read();
    } else {
        filter_buff_13_2_0_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_13_2_1_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_13_2_1_address0 = grp_load_filter_buffer_fu_1284_filter_buff_13_2_1_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_13_2_1_address0 = grp_conv_write_fu_1047_filter_buff_13_2_1_address0.read();
    } else {
        filter_buff_13_2_1_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_13_2_1_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_13_2_1_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_13_2_1_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_13_2_1_ce0 = grp_conv_write_fu_1047_filter_buff_13_2_1_ce0.read();
    } else {
        filter_buff_13_2_1_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_13_2_1_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_13_2_1_we0 = grp_load_filter_buffer_fu_1284_filter_buff_13_2_1_we0.read();
    } else {
        filter_buff_13_2_1_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_13_2_2_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_13_2_2_address0 = grp_load_filter_buffer_fu_1284_filter_buff_13_2_2_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_13_2_2_address0 = grp_conv_write_fu_1047_filter_buff_13_2_2_address0.read();
    } else {
        filter_buff_13_2_2_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_13_2_2_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_13_2_2_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_13_2_2_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_13_2_2_ce0 = grp_conv_write_fu_1047_filter_buff_13_2_2_ce0.read();
    } else {
        filter_buff_13_2_2_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_13_2_2_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_13_2_2_we0 = grp_load_filter_buffer_fu_1284_filter_buff_13_2_2_we0.read();
    } else {
        filter_buff_13_2_2_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_14_0_0_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_14_0_0_address0 = grp_load_filter_buffer_fu_1284_filter_buff_14_0_0_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_14_0_0_address0 = grp_conv_write_fu_1047_filter_buff_14_0_0_address0.read();
    } else {
        filter_buff_14_0_0_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_14_0_0_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_14_0_0_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_14_0_0_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_14_0_0_ce0 = grp_conv_write_fu_1047_filter_buff_14_0_0_ce0.read();
    } else {
        filter_buff_14_0_0_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_14_0_0_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_14_0_0_we0 = grp_load_filter_buffer_fu_1284_filter_buff_14_0_0_we0.read();
    } else {
        filter_buff_14_0_0_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_14_0_1_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_14_0_1_address0 = grp_load_filter_buffer_fu_1284_filter_buff_14_0_1_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_14_0_1_address0 = grp_conv_write_fu_1047_filter_buff_14_0_1_address0.read();
    } else {
        filter_buff_14_0_1_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_14_0_1_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_14_0_1_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_14_0_1_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_14_0_1_ce0 = grp_conv_write_fu_1047_filter_buff_14_0_1_ce0.read();
    } else {
        filter_buff_14_0_1_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_14_0_1_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_14_0_1_we0 = grp_load_filter_buffer_fu_1284_filter_buff_14_0_1_we0.read();
    } else {
        filter_buff_14_0_1_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_14_0_2_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_14_0_2_address0 = grp_load_filter_buffer_fu_1284_filter_buff_14_0_2_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_14_0_2_address0 = grp_conv_write_fu_1047_filter_buff_14_0_2_address0.read();
    } else {
        filter_buff_14_0_2_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_14_0_2_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_14_0_2_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_14_0_2_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_14_0_2_ce0 = grp_conv_write_fu_1047_filter_buff_14_0_2_ce0.read();
    } else {
        filter_buff_14_0_2_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_14_0_2_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_14_0_2_we0 = grp_load_filter_buffer_fu_1284_filter_buff_14_0_2_we0.read();
    } else {
        filter_buff_14_0_2_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_14_1_0_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_14_1_0_address0 = grp_load_filter_buffer_fu_1284_filter_buff_14_1_0_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_14_1_0_address0 = grp_conv_write_fu_1047_filter_buff_14_1_0_address0.read();
    } else {
        filter_buff_14_1_0_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_14_1_0_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_14_1_0_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_14_1_0_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_14_1_0_ce0 = grp_conv_write_fu_1047_filter_buff_14_1_0_ce0.read();
    } else {
        filter_buff_14_1_0_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_14_1_0_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_14_1_0_we0 = grp_load_filter_buffer_fu_1284_filter_buff_14_1_0_we0.read();
    } else {
        filter_buff_14_1_0_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_14_1_1_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_14_1_1_address0 = grp_load_filter_buffer_fu_1284_filter_buff_14_1_1_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_14_1_1_address0 = grp_conv_write_fu_1047_filter_buff_14_1_1_address0.read();
    } else {
        filter_buff_14_1_1_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_14_1_1_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_14_1_1_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_14_1_1_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_14_1_1_ce0 = grp_conv_write_fu_1047_filter_buff_14_1_1_ce0.read();
    } else {
        filter_buff_14_1_1_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_14_1_1_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_14_1_1_we0 = grp_load_filter_buffer_fu_1284_filter_buff_14_1_1_we0.read();
    } else {
        filter_buff_14_1_1_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_14_1_2_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_14_1_2_address0 = grp_load_filter_buffer_fu_1284_filter_buff_14_1_2_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_14_1_2_address0 = grp_conv_write_fu_1047_filter_buff_14_1_2_address0.read();
    } else {
        filter_buff_14_1_2_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_14_1_2_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_14_1_2_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_14_1_2_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_14_1_2_ce0 = grp_conv_write_fu_1047_filter_buff_14_1_2_ce0.read();
    } else {
        filter_buff_14_1_2_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_14_1_2_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_14_1_2_we0 = grp_load_filter_buffer_fu_1284_filter_buff_14_1_2_we0.read();
    } else {
        filter_buff_14_1_2_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_14_2_0_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_14_2_0_address0 = grp_load_filter_buffer_fu_1284_filter_buff_14_2_0_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_14_2_0_address0 = grp_conv_write_fu_1047_filter_buff_14_2_0_address0.read();
    } else {
        filter_buff_14_2_0_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_14_2_0_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_14_2_0_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_14_2_0_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_14_2_0_ce0 = grp_conv_write_fu_1047_filter_buff_14_2_0_ce0.read();
    } else {
        filter_buff_14_2_0_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_14_2_0_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_14_2_0_we0 = grp_load_filter_buffer_fu_1284_filter_buff_14_2_0_we0.read();
    } else {
        filter_buff_14_2_0_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_14_2_1_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_14_2_1_address0 = grp_load_filter_buffer_fu_1284_filter_buff_14_2_1_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_14_2_1_address0 = grp_conv_write_fu_1047_filter_buff_14_2_1_address0.read();
    } else {
        filter_buff_14_2_1_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_14_2_1_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_14_2_1_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_14_2_1_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_14_2_1_ce0 = grp_conv_write_fu_1047_filter_buff_14_2_1_ce0.read();
    } else {
        filter_buff_14_2_1_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_14_2_1_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_14_2_1_we0 = grp_load_filter_buffer_fu_1284_filter_buff_14_2_1_we0.read();
    } else {
        filter_buff_14_2_1_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_14_2_2_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_14_2_2_address0 = grp_load_filter_buffer_fu_1284_filter_buff_14_2_2_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_14_2_2_address0 = grp_conv_write_fu_1047_filter_buff_14_2_2_address0.read();
    } else {
        filter_buff_14_2_2_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_14_2_2_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_14_2_2_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_14_2_2_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_14_2_2_ce0 = grp_conv_write_fu_1047_filter_buff_14_2_2_ce0.read();
    } else {
        filter_buff_14_2_2_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_14_2_2_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_14_2_2_we0 = grp_load_filter_buffer_fu_1284_filter_buff_14_2_2_we0.read();
    } else {
        filter_buff_14_2_2_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_15_0_0_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_15_0_0_address0 = grp_load_filter_buffer_fu_1284_filter_buff_15_0_0_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_15_0_0_address0 = grp_conv_write_fu_1047_filter_buff_15_0_0_address0.read();
    } else {
        filter_buff_15_0_0_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_15_0_0_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_15_0_0_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_15_0_0_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_15_0_0_ce0 = grp_conv_write_fu_1047_filter_buff_15_0_0_ce0.read();
    } else {
        filter_buff_15_0_0_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_15_0_0_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_15_0_0_we0 = grp_load_filter_buffer_fu_1284_filter_buff_15_0_0_we0.read();
    } else {
        filter_buff_15_0_0_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_15_0_1_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_15_0_1_address0 = grp_load_filter_buffer_fu_1284_filter_buff_15_0_1_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_15_0_1_address0 = grp_conv_write_fu_1047_filter_buff_15_0_1_address0.read();
    } else {
        filter_buff_15_0_1_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_15_0_1_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_15_0_1_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_15_0_1_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_15_0_1_ce0 = grp_conv_write_fu_1047_filter_buff_15_0_1_ce0.read();
    } else {
        filter_buff_15_0_1_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_15_0_1_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_15_0_1_we0 = grp_load_filter_buffer_fu_1284_filter_buff_15_0_1_we0.read();
    } else {
        filter_buff_15_0_1_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_15_0_2_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_15_0_2_address0 = grp_load_filter_buffer_fu_1284_filter_buff_15_0_2_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_15_0_2_address0 = grp_conv_write_fu_1047_filter_buff_15_0_2_address0.read();
    } else {
        filter_buff_15_0_2_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_15_0_2_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_15_0_2_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_15_0_2_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_15_0_2_ce0 = grp_conv_write_fu_1047_filter_buff_15_0_2_ce0.read();
    } else {
        filter_buff_15_0_2_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_15_0_2_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_15_0_2_we0 = grp_load_filter_buffer_fu_1284_filter_buff_15_0_2_we0.read();
    } else {
        filter_buff_15_0_2_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_15_1_0_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_15_1_0_address0 = grp_load_filter_buffer_fu_1284_filter_buff_15_1_0_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_15_1_0_address0 = grp_conv_write_fu_1047_filter_buff_15_1_0_address0.read();
    } else {
        filter_buff_15_1_0_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_15_1_0_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_15_1_0_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_15_1_0_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_15_1_0_ce0 = grp_conv_write_fu_1047_filter_buff_15_1_0_ce0.read();
    } else {
        filter_buff_15_1_0_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_15_1_0_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_15_1_0_we0 = grp_load_filter_buffer_fu_1284_filter_buff_15_1_0_we0.read();
    } else {
        filter_buff_15_1_0_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_15_1_1_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_15_1_1_address0 = grp_load_filter_buffer_fu_1284_filter_buff_15_1_1_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_15_1_1_address0 = grp_conv_write_fu_1047_filter_buff_15_1_1_address0.read();
    } else {
        filter_buff_15_1_1_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_15_1_1_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_15_1_1_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_15_1_1_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_15_1_1_ce0 = grp_conv_write_fu_1047_filter_buff_15_1_1_ce0.read();
    } else {
        filter_buff_15_1_1_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_15_1_1_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_15_1_1_we0 = grp_load_filter_buffer_fu_1284_filter_buff_15_1_1_we0.read();
    } else {
        filter_buff_15_1_1_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_15_1_2_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_15_1_2_address0 = grp_load_filter_buffer_fu_1284_filter_buff_15_1_2_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_15_1_2_address0 = grp_conv_write_fu_1047_filter_buff_15_1_2_address0.read();
    } else {
        filter_buff_15_1_2_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_15_1_2_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_15_1_2_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_15_1_2_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_15_1_2_ce0 = grp_conv_write_fu_1047_filter_buff_15_1_2_ce0.read();
    } else {
        filter_buff_15_1_2_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_15_1_2_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_15_1_2_we0 = grp_load_filter_buffer_fu_1284_filter_buff_15_1_2_we0.read();
    } else {
        filter_buff_15_1_2_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_15_2_0_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_15_2_0_address0 = grp_load_filter_buffer_fu_1284_filter_buff_15_2_0_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_15_2_0_address0 = grp_conv_write_fu_1047_filter_buff_15_2_0_address0.read();
    } else {
        filter_buff_15_2_0_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_15_2_0_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_15_2_0_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_15_2_0_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_15_2_0_ce0 = grp_conv_write_fu_1047_filter_buff_15_2_0_ce0.read();
    } else {
        filter_buff_15_2_0_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_15_2_0_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_15_2_0_we0 = grp_load_filter_buffer_fu_1284_filter_buff_15_2_0_we0.read();
    } else {
        filter_buff_15_2_0_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_15_2_1_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_15_2_1_address0 = grp_load_filter_buffer_fu_1284_filter_buff_15_2_1_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_15_2_1_address0 = grp_conv_write_fu_1047_filter_buff_15_2_1_address0.read();
    } else {
        filter_buff_15_2_1_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_15_2_1_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_15_2_1_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_15_2_1_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_15_2_1_ce0 = grp_conv_write_fu_1047_filter_buff_15_2_1_ce0.read();
    } else {
        filter_buff_15_2_1_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_15_2_1_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_15_2_1_we0 = grp_load_filter_buffer_fu_1284_filter_buff_15_2_1_we0.read();
    } else {
        filter_buff_15_2_1_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_15_2_2_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_15_2_2_address0 = grp_load_filter_buffer_fu_1284_filter_buff_15_2_2_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_15_2_2_address0 = grp_conv_write_fu_1047_filter_buff_15_2_2_address0.read();
    } else {
        filter_buff_15_2_2_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_15_2_2_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_15_2_2_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_15_2_2_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_15_2_2_ce0 = grp_conv_write_fu_1047_filter_buff_15_2_2_ce0.read();
    } else {
        filter_buff_15_2_2_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_15_2_2_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_15_2_2_we0 = grp_load_filter_buffer_fu_1284_filter_buff_15_2_2_we0.read();
    } else {
        filter_buff_15_2_2_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_1_0_0_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_1_0_0_address0 = grp_load_filter_buffer_fu_1284_filter_buff_1_0_0_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_1_0_0_address0 = grp_conv_write_fu_1047_filter_buff_1_0_0_address0.read();
    } else {
        filter_buff_1_0_0_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_1_0_0_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_1_0_0_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_1_0_0_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_1_0_0_ce0 = grp_conv_write_fu_1047_filter_buff_1_0_0_ce0.read();
    } else {
        filter_buff_1_0_0_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_1_0_0_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_1_0_0_we0 = grp_load_filter_buffer_fu_1284_filter_buff_1_0_0_we0.read();
    } else {
        filter_buff_1_0_0_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_1_0_1_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_1_0_1_address0 = grp_load_filter_buffer_fu_1284_filter_buff_1_0_1_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_1_0_1_address0 = grp_conv_write_fu_1047_filter_buff_1_0_1_address0.read();
    } else {
        filter_buff_1_0_1_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_1_0_1_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_1_0_1_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_1_0_1_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_1_0_1_ce0 = grp_conv_write_fu_1047_filter_buff_1_0_1_ce0.read();
    } else {
        filter_buff_1_0_1_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_1_0_1_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_1_0_1_we0 = grp_load_filter_buffer_fu_1284_filter_buff_1_0_1_we0.read();
    } else {
        filter_buff_1_0_1_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_1_0_2_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_1_0_2_address0 = grp_load_filter_buffer_fu_1284_filter_buff_1_0_2_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_1_0_2_address0 = grp_conv_write_fu_1047_filter_buff_1_0_2_address0.read();
    } else {
        filter_buff_1_0_2_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_1_0_2_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_1_0_2_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_1_0_2_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_1_0_2_ce0 = grp_conv_write_fu_1047_filter_buff_1_0_2_ce0.read();
    } else {
        filter_buff_1_0_2_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_1_0_2_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_1_0_2_we0 = grp_load_filter_buffer_fu_1284_filter_buff_1_0_2_we0.read();
    } else {
        filter_buff_1_0_2_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_1_1_0_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_1_1_0_address0 = grp_load_filter_buffer_fu_1284_filter_buff_1_1_0_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_1_1_0_address0 = grp_conv_write_fu_1047_filter_buff_1_1_0_address0.read();
    } else {
        filter_buff_1_1_0_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_1_1_0_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_1_1_0_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_1_1_0_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_1_1_0_ce0 = grp_conv_write_fu_1047_filter_buff_1_1_0_ce0.read();
    } else {
        filter_buff_1_1_0_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_1_1_0_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_1_1_0_we0 = grp_load_filter_buffer_fu_1284_filter_buff_1_1_0_we0.read();
    } else {
        filter_buff_1_1_0_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_1_1_1_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_1_1_1_address0 = grp_load_filter_buffer_fu_1284_filter_buff_1_1_1_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_1_1_1_address0 = grp_conv_write_fu_1047_filter_buff_1_1_1_address0.read();
    } else {
        filter_buff_1_1_1_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_1_1_1_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_1_1_1_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_1_1_1_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_1_1_1_ce0 = grp_conv_write_fu_1047_filter_buff_1_1_1_ce0.read();
    } else {
        filter_buff_1_1_1_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_1_1_1_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_1_1_1_we0 = grp_load_filter_buffer_fu_1284_filter_buff_1_1_1_we0.read();
    } else {
        filter_buff_1_1_1_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_1_1_2_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_1_1_2_address0 = grp_load_filter_buffer_fu_1284_filter_buff_1_1_2_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_1_1_2_address0 = grp_conv_write_fu_1047_filter_buff_1_1_2_address0.read();
    } else {
        filter_buff_1_1_2_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_1_1_2_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_1_1_2_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_1_1_2_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_1_1_2_ce0 = grp_conv_write_fu_1047_filter_buff_1_1_2_ce0.read();
    } else {
        filter_buff_1_1_2_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_1_1_2_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_1_1_2_we0 = grp_load_filter_buffer_fu_1284_filter_buff_1_1_2_we0.read();
    } else {
        filter_buff_1_1_2_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_1_2_0_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_1_2_0_address0 = grp_load_filter_buffer_fu_1284_filter_buff_1_2_0_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_1_2_0_address0 = grp_conv_write_fu_1047_filter_buff_1_2_0_address0.read();
    } else {
        filter_buff_1_2_0_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_1_2_0_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_1_2_0_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_1_2_0_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_1_2_0_ce0 = grp_conv_write_fu_1047_filter_buff_1_2_0_ce0.read();
    } else {
        filter_buff_1_2_0_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_1_2_0_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_1_2_0_we0 = grp_load_filter_buffer_fu_1284_filter_buff_1_2_0_we0.read();
    } else {
        filter_buff_1_2_0_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_1_2_1_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_1_2_1_address0 = grp_load_filter_buffer_fu_1284_filter_buff_1_2_1_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_1_2_1_address0 = grp_conv_write_fu_1047_filter_buff_1_2_1_address0.read();
    } else {
        filter_buff_1_2_1_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_1_2_1_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_1_2_1_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_1_2_1_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_1_2_1_ce0 = grp_conv_write_fu_1047_filter_buff_1_2_1_ce0.read();
    } else {
        filter_buff_1_2_1_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_1_2_1_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_1_2_1_we0 = grp_load_filter_buffer_fu_1284_filter_buff_1_2_1_we0.read();
    } else {
        filter_buff_1_2_1_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_1_2_2_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_1_2_2_address0 = grp_load_filter_buffer_fu_1284_filter_buff_1_2_2_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_1_2_2_address0 = grp_conv_write_fu_1047_filter_buff_1_2_2_address0.read();
    } else {
        filter_buff_1_2_2_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_1_2_2_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_1_2_2_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_1_2_2_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_1_2_2_ce0 = grp_conv_write_fu_1047_filter_buff_1_2_2_ce0.read();
    } else {
        filter_buff_1_2_2_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_1_2_2_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_1_2_2_we0 = grp_load_filter_buffer_fu_1284_filter_buff_1_2_2_we0.read();
    } else {
        filter_buff_1_2_2_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_2_0_0_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_2_0_0_address0 = grp_load_filter_buffer_fu_1284_filter_buff_2_0_0_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_2_0_0_address0 = grp_conv_write_fu_1047_filter_buff_2_0_0_address0.read();
    } else {
        filter_buff_2_0_0_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_2_0_0_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_2_0_0_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_2_0_0_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_2_0_0_ce0 = grp_conv_write_fu_1047_filter_buff_2_0_0_ce0.read();
    } else {
        filter_buff_2_0_0_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_2_0_0_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_2_0_0_we0 = grp_load_filter_buffer_fu_1284_filter_buff_2_0_0_we0.read();
    } else {
        filter_buff_2_0_0_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_2_0_1_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_2_0_1_address0 = grp_load_filter_buffer_fu_1284_filter_buff_2_0_1_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_2_0_1_address0 = grp_conv_write_fu_1047_filter_buff_2_0_1_address0.read();
    } else {
        filter_buff_2_0_1_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_2_0_1_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_2_0_1_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_2_0_1_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_2_0_1_ce0 = grp_conv_write_fu_1047_filter_buff_2_0_1_ce0.read();
    } else {
        filter_buff_2_0_1_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_2_0_1_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_2_0_1_we0 = grp_load_filter_buffer_fu_1284_filter_buff_2_0_1_we0.read();
    } else {
        filter_buff_2_0_1_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_2_0_2_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_2_0_2_address0 = grp_load_filter_buffer_fu_1284_filter_buff_2_0_2_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_2_0_2_address0 = grp_conv_write_fu_1047_filter_buff_2_0_2_address0.read();
    } else {
        filter_buff_2_0_2_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_2_0_2_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_2_0_2_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_2_0_2_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_2_0_2_ce0 = grp_conv_write_fu_1047_filter_buff_2_0_2_ce0.read();
    } else {
        filter_buff_2_0_2_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_2_0_2_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_2_0_2_we0 = grp_load_filter_buffer_fu_1284_filter_buff_2_0_2_we0.read();
    } else {
        filter_buff_2_0_2_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_2_1_0_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_2_1_0_address0 = grp_load_filter_buffer_fu_1284_filter_buff_2_1_0_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_2_1_0_address0 = grp_conv_write_fu_1047_filter_buff_2_1_0_address0.read();
    } else {
        filter_buff_2_1_0_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_2_1_0_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_2_1_0_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_2_1_0_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_2_1_0_ce0 = grp_conv_write_fu_1047_filter_buff_2_1_0_ce0.read();
    } else {
        filter_buff_2_1_0_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_2_1_0_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_2_1_0_we0 = grp_load_filter_buffer_fu_1284_filter_buff_2_1_0_we0.read();
    } else {
        filter_buff_2_1_0_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_2_1_1_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_2_1_1_address0 = grp_load_filter_buffer_fu_1284_filter_buff_2_1_1_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_2_1_1_address0 = grp_conv_write_fu_1047_filter_buff_2_1_1_address0.read();
    } else {
        filter_buff_2_1_1_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_2_1_1_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_2_1_1_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_2_1_1_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_2_1_1_ce0 = grp_conv_write_fu_1047_filter_buff_2_1_1_ce0.read();
    } else {
        filter_buff_2_1_1_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_2_1_1_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_2_1_1_we0 = grp_load_filter_buffer_fu_1284_filter_buff_2_1_1_we0.read();
    } else {
        filter_buff_2_1_1_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_2_1_2_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_2_1_2_address0 = grp_load_filter_buffer_fu_1284_filter_buff_2_1_2_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_2_1_2_address0 = grp_conv_write_fu_1047_filter_buff_2_1_2_address0.read();
    } else {
        filter_buff_2_1_2_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_2_1_2_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_2_1_2_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_2_1_2_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_2_1_2_ce0 = grp_conv_write_fu_1047_filter_buff_2_1_2_ce0.read();
    } else {
        filter_buff_2_1_2_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_2_1_2_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_2_1_2_we0 = grp_load_filter_buffer_fu_1284_filter_buff_2_1_2_we0.read();
    } else {
        filter_buff_2_1_2_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_2_2_0_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_2_2_0_address0 = grp_load_filter_buffer_fu_1284_filter_buff_2_2_0_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_2_2_0_address0 = grp_conv_write_fu_1047_filter_buff_2_2_0_address0.read();
    } else {
        filter_buff_2_2_0_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_2_2_0_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_2_2_0_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_2_2_0_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_2_2_0_ce0 = grp_conv_write_fu_1047_filter_buff_2_2_0_ce0.read();
    } else {
        filter_buff_2_2_0_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_2_2_0_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_2_2_0_we0 = grp_load_filter_buffer_fu_1284_filter_buff_2_2_0_we0.read();
    } else {
        filter_buff_2_2_0_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_2_2_1_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_2_2_1_address0 = grp_load_filter_buffer_fu_1284_filter_buff_2_2_1_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_2_2_1_address0 = grp_conv_write_fu_1047_filter_buff_2_2_1_address0.read();
    } else {
        filter_buff_2_2_1_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_2_2_1_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_2_2_1_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_2_2_1_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_2_2_1_ce0 = grp_conv_write_fu_1047_filter_buff_2_2_1_ce0.read();
    } else {
        filter_buff_2_2_1_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_2_2_1_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_2_2_1_we0 = grp_load_filter_buffer_fu_1284_filter_buff_2_2_1_we0.read();
    } else {
        filter_buff_2_2_1_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_2_2_2_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_2_2_2_address0 = grp_load_filter_buffer_fu_1284_filter_buff_2_2_2_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_2_2_2_address0 = grp_conv_write_fu_1047_filter_buff_2_2_2_address0.read();
    } else {
        filter_buff_2_2_2_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_2_2_2_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_2_2_2_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_2_2_2_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_2_2_2_ce0 = grp_conv_write_fu_1047_filter_buff_2_2_2_ce0.read();
    } else {
        filter_buff_2_2_2_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_2_2_2_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_2_2_2_we0 = grp_load_filter_buffer_fu_1284_filter_buff_2_2_2_we0.read();
    } else {
        filter_buff_2_2_2_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_3_0_0_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_3_0_0_address0 = grp_load_filter_buffer_fu_1284_filter_buff_3_0_0_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_3_0_0_address0 = grp_conv_write_fu_1047_filter_buff_3_0_0_address0.read();
    } else {
        filter_buff_3_0_0_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_3_0_0_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_3_0_0_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_3_0_0_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_3_0_0_ce0 = grp_conv_write_fu_1047_filter_buff_3_0_0_ce0.read();
    } else {
        filter_buff_3_0_0_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_3_0_0_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_3_0_0_we0 = grp_load_filter_buffer_fu_1284_filter_buff_3_0_0_we0.read();
    } else {
        filter_buff_3_0_0_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_3_0_1_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_3_0_1_address0 = grp_load_filter_buffer_fu_1284_filter_buff_3_0_1_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_3_0_1_address0 = grp_conv_write_fu_1047_filter_buff_3_0_1_address0.read();
    } else {
        filter_buff_3_0_1_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_3_0_1_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_3_0_1_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_3_0_1_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_3_0_1_ce0 = grp_conv_write_fu_1047_filter_buff_3_0_1_ce0.read();
    } else {
        filter_buff_3_0_1_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_3_0_1_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_3_0_1_we0 = grp_load_filter_buffer_fu_1284_filter_buff_3_0_1_we0.read();
    } else {
        filter_buff_3_0_1_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_3_0_2_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_3_0_2_address0 = grp_load_filter_buffer_fu_1284_filter_buff_3_0_2_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_3_0_2_address0 = grp_conv_write_fu_1047_filter_buff_3_0_2_address0.read();
    } else {
        filter_buff_3_0_2_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_3_0_2_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_3_0_2_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_3_0_2_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_3_0_2_ce0 = grp_conv_write_fu_1047_filter_buff_3_0_2_ce0.read();
    } else {
        filter_buff_3_0_2_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_3_0_2_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_3_0_2_we0 = grp_load_filter_buffer_fu_1284_filter_buff_3_0_2_we0.read();
    } else {
        filter_buff_3_0_2_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_3_1_0_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_3_1_0_address0 = grp_load_filter_buffer_fu_1284_filter_buff_3_1_0_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_3_1_0_address0 = grp_conv_write_fu_1047_filter_buff_3_1_0_address0.read();
    } else {
        filter_buff_3_1_0_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_3_1_0_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_3_1_0_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_3_1_0_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_3_1_0_ce0 = grp_conv_write_fu_1047_filter_buff_3_1_0_ce0.read();
    } else {
        filter_buff_3_1_0_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_3_1_0_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_3_1_0_we0 = grp_load_filter_buffer_fu_1284_filter_buff_3_1_0_we0.read();
    } else {
        filter_buff_3_1_0_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_3_1_1_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_3_1_1_address0 = grp_load_filter_buffer_fu_1284_filter_buff_3_1_1_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_3_1_1_address0 = grp_conv_write_fu_1047_filter_buff_3_1_1_address0.read();
    } else {
        filter_buff_3_1_1_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_3_1_1_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_3_1_1_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_3_1_1_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_3_1_1_ce0 = grp_conv_write_fu_1047_filter_buff_3_1_1_ce0.read();
    } else {
        filter_buff_3_1_1_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_3_1_1_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_3_1_1_we0 = grp_load_filter_buffer_fu_1284_filter_buff_3_1_1_we0.read();
    } else {
        filter_buff_3_1_1_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_3_1_2_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_3_1_2_address0 = grp_load_filter_buffer_fu_1284_filter_buff_3_1_2_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_3_1_2_address0 = grp_conv_write_fu_1047_filter_buff_3_1_2_address0.read();
    } else {
        filter_buff_3_1_2_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_3_1_2_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_3_1_2_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_3_1_2_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_3_1_2_ce0 = grp_conv_write_fu_1047_filter_buff_3_1_2_ce0.read();
    } else {
        filter_buff_3_1_2_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_3_1_2_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_3_1_2_we0 = grp_load_filter_buffer_fu_1284_filter_buff_3_1_2_we0.read();
    } else {
        filter_buff_3_1_2_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_3_2_0_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_3_2_0_address0 = grp_load_filter_buffer_fu_1284_filter_buff_3_2_0_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_3_2_0_address0 = grp_conv_write_fu_1047_filter_buff_3_2_0_address0.read();
    } else {
        filter_buff_3_2_0_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_3_2_0_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_3_2_0_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_3_2_0_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_3_2_0_ce0 = grp_conv_write_fu_1047_filter_buff_3_2_0_ce0.read();
    } else {
        filter_buff_3_2_0_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_3_2_0_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_3_2_0_we0 = grp_load_filter_buffer_fu_1284_filter_buff_3_2_0_we0.read();
    } else {
        filter_buff_3_2_0_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_3_2_1_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_3_2_1_address0 = grp_load_filter_buffer_fu_1284_filter_buff_3_2_1_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_3_2_1_address0 = grp_conv_write_fu_1047_filter_buff_3_2_1_address0.read();
    } else {
        filter_buff_3_2_1_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_3_2_1_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_3_2_1_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_3_2_1_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_3_2_1_ce0 = grp_conv_write_fu_1047_filter_buff_3_2_1_ce0.read();
    } else {
        filter_buff_3_2_1_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_3_2_1_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_3_2_1_we0 = grp_load_filter_buffer_fu_1284_filter_buff_3_2_1_we0.read();
    } else {
        filter_buff_3_2_1_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_3_2_2_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_3_2_2_address0 = grp_load_filter_buffer_fu_1284_filter_buff_3_2_2_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_3_2_2_address0 = grp_conv_write_fu_1047_filter_buff_3_2_2_address0.read();
    } else {
        filter_buff_3_2_2_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_3_2_2_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_3_2_2_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_3_2_2_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_3_2_2_ce0 = grp_conv_write_fu_1047_filter_buff_3_2_2_ce0.read();
    } else {
        filter_buff_3_2_2_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_3_2_2_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_3_2_2_we0 = grp_load_filter_buffer_fu_1284_filter_buff_3_2_2_we0.read();
    } else {
        filter_buff_3_2_2_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_4_0_0_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_4_0_0_address0 = grp_load_filter_buffer_fu_1284_filter_buff_4_0_0_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_4_0_0_address0 = grp_conv_write_fu_1047_filter_buff_4_0_0_address0.read();
    } else {
        filter_buff_4_0_0_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_4_0_0_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_4_0_0_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_4_0_0_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_4_0_0_ce0 = grp_conv_write_fu_1047_filter_buff_4_0_0_ce0.read();
    } else {
        filter_buff_4_0_0_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_4_0_0_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_4_0_0_we0 = grp_load_filter_buffer_fu_1284_filter_buff_4_0_0_we0.read();
    } else {
        filter_buff_4_0_0_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_4_0_1_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_4_0_1_address0 = grp_load_filter_buffer_fu_1284_filter_buff_4_0_1_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_4_0_1_address0 = grp_conv_write_fu_1047_filter_buff_4_0_1_address0.read();
    } else {
        filter_buff_4_0_1_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_4_0_1_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_4_0_1_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_4_0_1_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_4_0_1_ce0 = grp_conv_write_fu_1047_filter_buff_4_0_1_ce0.read();
    } else {
        filter_buff_4_0_1_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_4_0_1_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_4_0_1_we0 = grp_load_filter_buffer_fu_1284_filter_buff_4_0_1_we0.read();
    } else {
        filter_buff_4_0_1_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_4_0_2_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_4_0_2_address0 = grp_load_filter_buffer_fu_1284_filter_buff_4_0_2_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_4_0_2_address0 = grp_conv_write_fu_1047_filter_buff_4_0_2_address0.read();
    } else {
        filter_buff_4_0_2_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_4_0_2_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_4_0_2_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_4_0_2_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_4_0_2_ce0 = grp_conv_write_fu_1047_filter_buff_4_0_2_ce0.read();
    } else {
        filter_buff_4_0_2_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_4_0_2_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_4_0_2_we0 = grp_load_filter_buffer_fu_1284_filter_buff_4_0_2_we0.read();
    } else {
        filter_buff_4_0_2_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_4_1_0_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_4_1_0_address0 = grp_load_filter_buffer_fu_1284_filter_buff_4_1_0_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_4_1_0_address0 = grp_conv_write_fu_1047_filter_buff_4_1_0_address0.read();
    } else {
        filter_buff_4_1_0_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_4_1_0_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_4_1_0_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_4_1_0_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_4_1_0_ce0 = grp_conv_write_fu_1047_filter_buff_4_1_0_ce0.read();
    } else {
        filter_buff_4_1_0_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_4_1_0_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_4_1_0_we0 = grp_load_filter_buffer_fu_1284_filter_buff_4_1_0_we0.read();
    } else {
        filter_buff_4_1_0_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_4_1_1_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_4_1_1_address0 = grp_load_filter_buffer_fu_1284_filter_buff_4_1_1_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_4_1_1_address0 = grp_conv_write_fu_1047_filter_buff_4_1_1_address0.read();
    } else {
        filter_buff_4_1_1_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_4_1_1_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_4_1_1_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_4_1_1_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_4_1_1_ce0 = grp_conv_write_fu_1047_filter_buff_4_1_1_ce0.read();
    } else {
        filter_buff_4_1_1_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_4_1_1_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_4_1_1_we0 = grp_load_filter_buffer_fu_1284_filter_buff_4_1_1_we0.read();
    } else {
        filter_buff_4_1_1_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_4_1_2_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_4_1_2_address0 = grp_load_filter_buffer_fu_1284_filter_buff_4_1_2_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_4_1_2_address0 = grp_conv_write_fu_1047_filter_buff_4_1_2_address0.read();
    } else {
        filter_buff_4_1_2_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_4_1_2_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_4_1_2_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_4_1_2_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_4_1_2_ce0 = grp_conv_write_fu_1047_filter_buff_4_1_2_ce0.read();
    } else {
        filter_buff_4_1_2_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_4_1_2_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_4_1_2_we0 = grp_load_filter_buffer_fu_1284_filter_buff_4_1_2_we0.read();
    } else {
        filter_buff_4_1_2_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_4_2_0_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_4_2_0_address0 = grp_load_filter_buffer_fu_1284_filter_buff_4_2_0_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_4_2_0_address0 = grp_conv_write_fu_1047_filter_buff_4_2_0_address0.read();
    } else {
        filter_buff_4_2_0_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_4_2_0_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_4_2_0_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_4_2_0_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_4_2_0_ce0 = grp_conv_write_fu_1047_filter_buff_4_2_0_ce0.read();
    } else {
        filter_buff_4_2_0_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_4_2_0_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_4_2_0_we0 = grp_load_filter_buffer_fu_1284_filter_buff_4_2_0_we0.read();
    } else {
        filter_buff_4_2_0_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_4_2_1_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_4_2_1_address0 = grp_load_filter_buffer_fu_1284_filter_buff_4_2_1_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_4_2_1_address0 = grp_conv_write_fu_1047_filter_buff_4_2_1_address0.read();
    } else {
        filter_buff_4_2_1_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_4_2_1_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_4_2_1_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_4_2_1_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_4_2_1_ce0 = grp_conv_write_fu_1047_filter_buff_4_2_1_ce0.read();
    } else {
        filter_buff_4_2_1_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_4_2_1_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_4_2_1_we0 = grp_load_filter_buffer_fu_1284_filter_buff_4_2_1_we0.read();
    } else {
        filter_buff_4_2_1_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_4_2_2_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_4_2_2_address0 = grp_load_filter_buffer_fu_1284_filter_buff_4_2_2_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_4_2_2_address0 = grp_conv_write_fu_1047_filter_buff_4_2_2_address0.read();
    } else {
        filter_buff_4_2_2_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_4_2_2_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_4_2_2_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_4_2_2_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_4_2_2_ce0 = grp_conv_write_fu_1047_filter_buff_4_2_2_ce0.read();
    } else {
        filter_buff_4_2_2_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_4_2_2_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_4_2_2_we0 = grp_load_filter_buffer_fu_1284_filter_buff_4_2_2_we0.read();
    } else {
        filter_buff_4_2_2_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_5_0_0_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_5_0_0_address0 = grp_load_filter_buffer_fu_1284_filter_buff_5_0_0_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_5_0_0_address0 = grp_conv_write_fu_1047_filter_buff_5_0_0_address0.read();
    } else {
        filter_buff_5_0_0_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_5_0_0_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_5_0_0_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_5_0_0_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_5_0_0_ce0 = grp_conv_write_fu_1047_filter_buff_5_0_0_ce0.read();
    } else {
        filter_buff_5_0_0_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_5_0_0_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_5_0_0_we0 = grp_load_filter_buffer_fu_1284_filter_buff_5_0_0_we0.read();
    } else {
        filter_buff_5_0_0_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_5_0_1_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_5_0_1_address0 = grp_load_filter_buffer_fu_1284_filter_buff_5_0_1_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_5_0_1_address0 = grp_conv_write_fu_1047_filter_buff_5_0_1_address0.read();
    } else {
        filter_buff_5_0_1_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_5_0_1_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_5_0_1_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_5_0_1_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_5_0_1_ce0 = grp_conv_write_fu_1047_filter_buff_5_0_1_ce0.read();
    } else {
        filter_buff_5_0_1_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_5_0_1_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_5_0_1_we0 = grp_load_filter_buffer_fu_1284_filter_buff_5_0_1_we0.read();
    } else {
        filter_buff_5_0_1_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_5_0_2_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_5_0_2_address0 = grp_load_filter_buffer_fu_1284_filter_buff_5_0_2_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_5_0_2_address0 = grp_conv_write_fu_1047_filter_buff_5_0_2_address0.read();
    } else {
        filter_buff_5_0_2_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_5_0_2_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_5_0_2_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_5_0_2_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_5_0_2_ce0 = grp_conv_write_fu_1047_filter_buff_5_0_2_ce0.read();
    } else {
        filter_buff_5_0_2_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_5_0_2_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_5_0_2_we0 = grp_load_filter_buffer_fu_1284_filter_buff_5_0_2_we0.read();
    } else {
        filter_buff_5_0_2_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_5_1_0_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_5_1_0_address0 = grp_load_filter_buffer_fu_1284_filter_buff_5_1_0_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_5_1_0_address0 = grp_conv_write_fu_1047_filter_buff_5_1_0_address0.read();
    } else {
        filter_buff_5_1_0_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_5_1_0_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_5_1_0_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_5_1_0_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_5_1_0_ce0 = grp_conv_write_fu_1047_filter_buff_5_1_0_ce0.read();
    } else {
        filter_buff_5_1_0_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_5_1_0_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_5_1_0_we0 = grp_load_filter_buffer_fu_1284_filter_buff_5_1_0_we0.read();
    } else {
        filter_buff_5_1_0_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_5_1_1_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_5_1_1_address0 = grp_load_filter_buffer_fu_1284_filter_buff_5_1_1_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_5_1_1_address0 = grp_conv_write_fu_1047_filter_buff_5_1_1_address0.read();
    } else {
        filter_buff_5_1_1_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_5_1_1_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_5_1_1_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_5_1_1_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_5_1_1_ce0 = grp_conv_write_fu_1047_filter_buff_5_1_1_ce0.read();
    } else {
        filter_buff_5_1_1_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_5_1_1_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_5_1_1_we0 = grp_load_filter_buffer_fu_1284_filter_buff_5_1_1_we0.read();
    } else {
        filter_buff_5_1_1_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_5_1_2_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_5_1_2_address0 = grp_load_filter_buffer_fu_1284_filter_buff_5_1_2_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_5_1_2_address0 = grp_conv_write_fu_1047_filter_buff_5_1_2_address0.read();
    } else {
        filter_buff_5_1_2_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_5_1_2_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_5_1_2_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_5_1_2_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_5_1_2_ce0 = grp_conv_write_fu_1047_filter_buff_5_1_2_ce0.read();
    } else {
        filter_buff_5_1_2_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_5_1_2_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_5_1_2_we0 = grp_load_filter_buffer_fu_1284_filter_buff_5_1_2_we0.read();
    } else {
        filter_buff_5_1_2_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_5_2_0_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_5_2_0_address0 = grp_load_filter_buffer_fu_1284_filter_buff_5_2_0_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_5_2_0_address0 = grp_conv_write_fu_1047_filter_buff_5_2_0_address0.read();
    } else {
        filter_buff_5_2_0_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_5_2_0_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_5_2_0_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_5_2_0_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_5_2_0_ce0 = grp_conv_write_fu_1047_filter_buff_5_2_0_ce0.read();
    } else {
        filter_buff_5_2_0_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_5_2_0_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_5_2_0_we0 = grp_load_filter_buffer_fu_1284_filter_buff_5_2_0_we0.read();
    } else {
        filter_buff_5_2_0_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_5_2_1_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_5_2_1_address0 = grp_load_filter_buffer_fu_1284_filter_buff_5_2_1_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_5_2_1_address0 = grp_conv_write_fu_1047_filter_buff_5_2_1_address0.read();
    } else {
        filter_buff_5_2_1_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_5_2_1_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_5_2_1_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_5_2_1_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_5_2_1_ce0 = grp_conv_write_fu_1047_filter_buff_5_2_1_ce0.read();
    } else {
        filter_buff_5_2_1_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_5_2_1_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_5_2_1_we0 = grp_load_filter_buffer_fu_1284_filter_buff_5_2_1_we0.read();
    } else {
        filter_buff_5_2_1_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_5_2_2_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_5_2_2_address0 = grp_load_filter_buffer_fu_1284_filter_buff_5_2_2_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_5_2_2_address0 = grp_conv_write_fu_1047_filter_buff_5_2_2_address0.read();
    } else {
        filter_buff_5_2_2_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_5_2_2_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_5_2_2_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_5_2_2_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_5_2_2_ce0 = grp_conv_write_fu_1047_filter_buff_5_2_2_ce0.read();
    } else {
        filter_buff_5_2_2_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_5_2_2_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_5_2_2_we0 = grp_load_filter_buffer_fu_1284_filter_buff_5_2_2_we0.read();
    } else {
        filter_buff_5_2_2_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_6_0_0_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_6_0_0_address0 = grp_load_filter_buffer_fu_1284_filter_buff_6_0_0_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_6_0_0_address0 = grp_conv_write_fu_1047_filter_buff_6_0_0_address0.read();
    } else {
        filter_buff_6_0_0_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_6_0_0_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_6_0_0_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_6_0_0_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_6_0_0_ce0 = grp_conv_write_fu_1047_filter_buff_6_0_0_ce0.read();
    } else {
        filter_buff_6_0_0_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_6_0_0_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_6_0_0_we0 = grp_load_filter_buffer_fu_1284_filter_buff_6_0_0_we0.read();
    } else {
        filter_buff_6_0_0_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_6_0_1_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_6_0_1_address0 = grp_load_filter_buffer_fu_1284_filter_buff_6_0_1_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_6_0_1_address0 = grp_conv_write_fu_1047_filter_buff_6_0_1_address0.read();
    } else {
        filter_buff_6_0_1_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_6_0_1_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_6_0_1_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_6_0_1_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_6_0_1_ce0 = grp_conv_write_fu_1047_filter_buff_6_0_1_ce0.read();
    } else {
        filter_buff_6_0_1_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_6_0_1_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_6_0_1_we0 = grp_load_filter_buffer_fu_1284_filter_buff_6_0_1_we0.read();
    } else {
        filter_buff_6_0_1_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_6_0_2_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_6_0_2_address0 = grp_load_filter_buffer_fu_1284_filter_buff_6_0_2_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_6_0_2_address0 = grp_conv_write_fu_1047_filter_buff_6_0_2_address0.read();
    } else {
        filter_buff_6_0_2_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_6_0_2_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_6_0_2_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_6_0_2_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_6_0_2_ce0 = grp_conv_write_fu_1047_filter_buff_6_0_2_ce0.read();
    } else {
        filter_buff_6_0_2_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_6_0_2_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_6_0_2_we0 = grp_load_filter_buffer_fu_1284_filter_buff_6_0_2_we0.read();
    } else {
        filter_buff_6_0_2_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_6_1_0_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_6_1_0_address0 = grp_load_filter_buffer_fu_1284_filter_buff_6_1_0_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_6_1_0_address0 = grp_conv_write_fu_1047_filter_buff_6_1_0_address0.read();
    } else {
        filter_buff_6_1_0_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_6_1_0_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_6_1_0_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_6_1_0_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_6_1_0_ce0 = grp_conv_write_fu_1047_filter_buff_6_1_0_ce0.read();
    } else {
        filter_buff_6_1_0_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_6_1_0_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_6_1_0_we0 = grp_load_filter_buffer_fu_1284_filter_buff_6_1_0_we0.read();
    } else {
        filter_buff_6_1_0_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_6_1_1_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_6_1_1_address0 = grp_load_filter_buffer_fu_1284_filter_buff_6_1_1_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_6_1_1_address0 = grp_conv_write_fu_1047_filter_buff_6_1_1_address0.read();
    } else {
        filter_buff_6_1_1_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_6_1_1_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_6_1_1_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_6_1_1_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_6_1_1_ce0 = grp_conv_write_fu_1047_filter_buff_6_1_1_ce0.read();
    } else {
        filter_buff_6_1_1_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_6_1_1_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_6_1_1_we0 = grp_load_filter_buffer_fu_1284_filter_buff_6_1_1_we0.read();
    } else {
        filter_buff_6_1_1_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_6_1_2_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_6_1_2_address0 = grp_load_filter_buffer_fu_1284_filter_buff_6_1_2_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_6_1_2_address0 = grp_conv_write_fu_1047_filter_buff_6_1_2_address0.read();
    } else {
        filter_buff_6_1_2_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_6_1_2_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_6_1_2_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_6_1_2_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_6_1_2_ce0 = grp_conv_write_fu_1047_filter_buff_6_1_2_ce0.read();
    } else {
        filter_buff_6_1_2_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_6_1_2_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_6_1_2_we0 = grp_load_filter_buffer_fu_1284_filter_buff_6_1_2_we0.read();
    } else {
        filter_buff_6_1_2_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_6_2_0_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_6_2_0_address0 = grp_load_filter_buffer_fu_1284_filter_buff_6_2_0_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_6_2_0_address0 = grp_conv_write_fu_1047_filter_buff_6_2_0_address0.read();
    } else {
        filter_buff_6_2_0_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_6_2_0_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_6_2_0_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_6_2_0_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_6_2_0_ce0 = grp_conv_write_fu_1047_filter_buff_6_2_0_ce0.read();
    } else {
        filter_buff_6_2_0_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_6_2_0_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_6_2_0_we0 = grp_load_filter_buffer_fu_1284_filter_buff_6_2_0_we0.read();
    } else {
        filter_buff_6_2_0_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_6_2_1_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_6_2_1_address0 = grp_load_filter_buffer_fu_1284_filter_buff_6_2_1_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_6_2_1_address0 = grp_conv_write_fu_1047_filter_buff_6_2_1_address0.read();
    } else {
        filter_buff_6_2_1_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_6_2_1_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_6_2_1_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_6_2_1_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_6_2_1_ce0 = grp_conv_write_fu_1047_filter_buff_6_2_1_ce0.read();
    } else {
        filter_buff_6_2_1_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_6_2_1_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_6_2_1_we0 = grp_load_filter_buffer_fu_1284_filter_buff_6_2_1_we0.read();
    } else {
        filter_buff_6_2_1_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_6_2_2_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_6_2_2_address0 = grp_load_filter_buffer_fu_1284_filter_buff_6_2_2_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_6_2_2_address0 = grp_conv_write_fu_1047_filter_buff_6_2_2_address0.read();
    } else {
        filter_buff_6_2_2_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_6_2_2_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_6_2_2_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_6_2_2_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_6_2_2_ce0 = grp_conv_write_fu_1047_filter_buff_6_2_2_ce0.read();
    } else {
        filter_buff_6_2_2_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_6_2_2_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_6_2_2_we0 = grp_load_filter_buffer_fu_1284_filter_buff_6_2_2_we0.read();
    } else {
        filter_buff_6_2_2_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_7_0_0_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_7_0_0_address0 = grp_load_filter_buffer_fu_1284_filter_buff_7_0_0_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_7_0_0_address0 = grp_conv_write_fu_1047_filter_buff_7_0_0_address0.read();
    } else {
        filter_buff_7_0_0_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_7_0_0_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_7_0_0_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_7_0_0_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_7_0_0_ce0 = grp_conv_write_fu_1047_filter_buff_7_0_0_ce0.read();
    } else {
        filter_buff_7_0_0_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_7_0_0_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_7_0_0_we0 = grp_load_filter_buffer_fu_1284_filter_buff_7_0_0_we0.read();
    } else {
        filter_buff_7_0_0_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_7_0_1_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_7_0_1_address0 = grp_load_filter_buffer_fu_1284_filter_buff_7_0_1_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_7_0_1_address0 = grp_conv_write_fu_1047_filter_buff_7_0_1_address0.read();
    } else {
        filter_buff_7_0_1_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_7_0_1_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_7_0_1_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_7_0_1_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_7_0_1_ce0 = grp_conv_write_fu_1047_filter_buff_7_0_1_ce0.read();
    } else {
        filter_buff_7_0_1_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_7_0_1_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_7_0_1_we0 = grp_load_filter_buffer_fu_1284_filter_buff_7_0_1_we0.read();
    } else {
        filter_buff_7_0_1_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_7_0_2_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_7_0_2_address0 = grp_load_filter_buffer_fu_1284_filter_buff_7_0_2_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_7_0_2_address0 = grp_conv_write_fu_1047_filter_buff_7_0_2_address0.read();
    } else {
        filter_buff_7_0_2_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_7_0_2_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_7_0_2_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_7_0_2_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_7_0_2_ce0 = grp_conv_write_fu_1047_filter_buff_7_0_2_ce0.read();
    } else {
        filter_buff_7_0_2_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_7_0_2_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_7_0_2_we0 = grp_load_filter_buffer_fu_1284_filter_buff_7_0_2_we0.read();
    } else {
        filter_buff_7_0_2_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_7_1_0_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_7_1_0_address0 = grp_load_filter_buffer_fu_1284_filter_buff_7_1_0_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_7_1_0_address0 = grp_conv_write_fu_1047_filter_buff_7_1_0_address0.read();
    } else {
        filter_buff_7_1_0_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_7_1_0_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_7_1_0_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_7_1_0_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_7_1_0_ce0 = grp_conv_write_fu_1047_filter_buff_7_1_0_ce0.read();
    } else {
        filter_buff_7_1_0_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_7_1_0_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_7_1_0_we0 = grp_load_filter_buffer_fu_1284_filter_buff_7_1_0_we0.read();
    } else {
        filter_buff_7_1_0_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_7_1_1_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_7_1_1_address0 = grp_load_filter_buffer_fu_1284_filter_buff_7_1_1_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_7_1_1_address0 = grp_conv_write_fu_1047_filter_buff_7_1_1_address0.read();
    } else {
        filter_buff_7_1_1_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_7_1_1_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_7_1_1_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_7_1_1_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_7_1_1_ce0 = grp_conv_write_fu_1047_filter_buff_7_1_1_ce0.read();
    } else {
        filter_buff_7_1_1_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_7_1_1_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_7_1_1_we0 = grp_load_filter_buffer_fu_1284_filter_buff_7_1_1_we0.read();
    } else {
        filter_buff_7_1_1_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_7_1_2_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_7_1_2_address0 = grp_load_filter_buffer_fu_1284_filter_buff_7_1_2_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_7_1_2_address0 = grp_conv_write_fu_1047_filter_buff_7_1_2_address0.read();
    } else {
        filter_buff_7_1_2_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_7_1_2_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_7_1_2_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_7_1_2_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_7_1_2_ce0 = grp_conv_write_fu_1047_filter_buff_7_1_2_ce0.read();
    } else {
        filter_buff_7_1_2_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_7_1_2_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_7_1_2_we0 = grp_load_filter_buffer_fu_1284_filter_buff_7_1_2_we0.read();
    } else {
        filter_buff_7_1_2_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_7_2_0_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_7_2_0_address0 = grp_load_filter_buffer_fu_1284_filter_buff_7_2_0_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_7_2_0_address0 = grp_conv_write_fu_1047_filter_buff_7_2_0_address0.read();
    } else {
        filter_buff_7_2_0_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_7_2_0_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_7_2_0_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_7_2_0_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_7_2_0_ce0 = grp_conv_write_fu_1047_filter_buff_7_2_0_ce0.read();
    } else {
        filter_buff_7_2_0_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_7_2_0_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_7_2_0_we0 = grp_load_filter_buffer_fu_1284_filter_buff_7_2_0_we0.read();
    } else {
        filter_buff_7_2_0_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_7_2_1_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_7_2_1_address0 = grp_load_filter_buffer_fu_1284_filter_buff_7_2_1_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_7_2_1_address0 = grp_conv_write_fu_1047_filter_buff_7_2_1_address0.read();
    } else {
        filter_buff_7_2_1_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_7_2_1_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_7_2_1_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_7_2_1_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_7_2_1_ce0 = grp_conv_write_fu_1047_filter_buff_7_2_1_ce0.read();
    } else {
        filter_buff_7_2_1_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_7_2_1_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_7_2_1_we0 = grp_load_filter_buffer_fu_1284_filter_buff_7_2_1_we0.read();
    } else {
        filter_buff_7_2_1_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_7_2_2_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_7_2_2_address0 = grp_load_filter_buffer_fu_1284_filter_buff_7_2_2_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_7_2_2_address0 = grp_conv_write_fu_1047_filter_buff_7_2_2_address0.read();
    } else {
        filter_buff_7_2_2_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_7_2_2_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_7_2_2_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_7_2_2_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_7_2_2_ce0 = grp_conv_write_fu_1047_filter_buff_7_2_2_ce0.read();
    } else {
        filter_buff_7_2_2_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_7_2_2_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_7_2_2_we0 = grp_load_filter_buffer_fu_1284_filter_buff_7_2_2_we0.read();
    } else {
        filter_buff_7_2_2_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_8_0_0_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_8_0_0_address0 = grp_load_filter_buffer_fu_1284_filter_buff_8_0_0_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_8_0_0_address0 = grp_conv_write_fu_1047_filter_buff_8_0_0_address0.read();
    } else {
        filter_buff_8_0_0_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_8_0_0_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_8_0_0_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_8_0_0_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_8_0_0_ce0 = grp_conv_write_fu_1047_filter_buff_8_0_0_ce0.read();
    } else {
        filter_buff_8_0_0_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_8_0_0_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_8_0_0_we0 = grp_load_filter_buffer_fu_1284_filter_buff_8_0_0_we0.read();
    } else {
        filter_buff_8_0_0_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_8_0_1_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_8_0_1_address0 = grp_load_filter_buffer_fu_1284_filter_buff_8_0_1_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_8_0_1_address0 = grp_conv_write_fu_1047_filter_buff_8_0_1_address0.read();
    } else {
        filter_buff_8_0_1_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_8_0_1_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_8_0_1_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_8_0_1_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_8_0_1_ce0 = grp_conv_write_fu_1047_filter_buff_8_0_1_ce0.read();
    } else {
        filter_buff_8_0_1_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_8_0_1_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_8_0_1_we0 = grp_load_filter_buffer_fu_1284_filter_buff_8_0_1_we0.read();
    } else {
        filter_buff_8_0_1_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_8_0_2_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_8_0_2_address0 = grp_load_filter_buffer_fu_1284_filter_buff_8_0_2_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_8_0_2_address0 = grp_conv_write_fu_1047_filter_buff_8_0_2_address0.read();
    } else {
        filter_buff_8_0_2_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_8_0_2_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_8_0_2_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_8_0_2_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_8_0_2_ce0 = grp_conv_write_fu_1047_filter_buff_8_0_2_ce0.read();
    } else {
        filter_buff_8_0_2_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_8_0_2_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_8_0_2_we0 = grp_load_filter_buffer_fu_1284_filter_buff_8_0_2_we0.read();
    } else {
        filter_buff_8_0_2_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_8_1_0_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_8_1_0_address0 = grp_load_filter_buffer_fu_1284_filter_buff_8_1_0_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_8_1_0_address0 = grp_conv_write_fu_1047_filter_buff_8_1_0_address0.read();
    } else {
        filter_buff_8_1_0_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_8_1_0_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_8_1_0_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_8_1_0_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_8_1_0_ce0 = grp_conv_write_fu_1047_filter_buff_8_1_0_ce0.read();
    } else {
        filter_buff_8_1_0_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_8_1_0_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_8_1_0_we0 = grp_load_filter_buffer_fu_1284_filter_buff_8_1_0_we0.read();
    } else {
        filter_buff_8_1_0_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_8_1_1_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_8_1_1_address0 = grp_load_filter_buffer_fu_1284_filter_buff_8_1_1_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_8_1_1_address0 = grp_conv_write_fu_1047_filter_buff_8_1_1_address0.read();
    } else {
        filter_buff_8_1_1_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_8_1_1_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_8_1_1_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_8_1_1_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_8_1_1_ce0 = grp_conv_write_fu_1047_filter_buff_8_1_1_ce0.read();
    } else {
        filter_buff_8_1_1_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_8_1_1_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_8_1_1_we0 = grp_load_filter_buffer_fu_1284_filter_buff_8_1_1_we0.read();
    } else {
        filter_buff_8_1_1_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_8_1_2_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_8_1_2_address0 = grp_load_filter_buffer_fu_1284_filter_buff_8_1_2_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_8_1_2_address0 = grp_conv_write_fu_1047_filter_buff_8_1_2_address0.read();
    } else {
        filter_buff_8_1_2_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_8_1_2_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_8_1_2_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_8_1_2_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_8_1_2_ce0 = grp_conv_write_fu_1047_filter_buff_8_1_2_ce0.read();
    } else {
        filter_buff_8_1_2_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_8_1_2_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_8_1_2_we0 = grp_load_filter_buffer_fu_1284_filter_buff_8_1_2_we0.read();
    } else {
        filter_buff_8_1_2_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_8_2_0_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_8_2_0_address0 = grp_load_filter_buffer_fu_1284_filter_buff_8_2_0_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_8_2_0_address0 = grp_conv_write_fu_1047_filter_buff_8_2_0_address0.read();
    } else {
        filter_buff_8_2_0_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_8_2_0_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_8_2_0_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_8_2_0_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_8_2_0_ce0 = grp_conv_write_fu_1047_filter_buff_8_2_0_ce0.read();
    } else {
        filter_buff_8_2_0_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_8_2_0_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_8_2_0_we0 = grp_load_filter_buffer_fu_1284_filter_buff_8_2_0_we0.read();
    } else {
        filter_buff_8_2_0_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_8_2_1_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_8_2_1_address0 = grp_load_filter_buffer_fu_1284_filter_buff_8_2_1_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_8_2_1_address0 = grp_conv_write_fu_1047_filter_buff_8_2_1_address0.read();
    } else {
        filter_buff_8_2_1_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_8_2_1_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_8_2_1_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_8_2_1_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_8_2_1_ce0 = grp_conv_write_fu_1047_filter_buff_8_2_1_ce0.read();
    } else {
        filter_buff_8_2_1_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_8_2_1_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_8_2_1_we0 = grp_load_filter_buffer_fu_1284_filter_buff_8_2_1_we0.read();
    } else {
        filter_buff_8_2_1_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_8_2_2_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_8_2_2_address0 = grp_load_filter_buffer_fu_1284_filter_buff_8_2_2_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_8_2_2_address0 = grp_conv_write_fu_1047_filter_buff_8_2_2_address0.read();
    } else {
        filter_buff_8_2_2_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_8_2_2_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_8_2_2_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_8_2_2_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_8_2_2_ce0 = grp_conv_write_fu_1047_filter_buff_8_2_2_ce0.read();
    } else {
        filter_buff_8_2_2_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_8_2_2_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_8_2_2_we0 = grp_load_filter_buffer_fu_1284_filter_buff_8_2_2_we0.read();
    } else {
        filter_buff_8_2_2_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_9_0_0_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_9_0_0_address0 = grp_load_filter_buffer_fu_1284_filter_buff_9_0_0_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_9_0_0_address0 = grp_conv_write_fu_1047_filter_buff_9_0_0_address0.read();
    } else {
        filter_buff_9_0_0_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_9_0_0_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_9_0_0_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_9_0_0_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_9_0_0_ce0 = grp_conv_write_fu_1047_filter_buff_9_0_0_ce0.read();
    } else {
        filter_buff_9_0_0_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_9_0_0_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_9_0_0_we0 = grp_load_filter_buffer_fu_1284_filter_buff_9_0_0_we0.read();
    } else {
        filter_buff_9_0_0_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_9_0_1_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_9_0_1_address0 = grp_load_filter_buffer_fu_1284_filter_buff_9_0_1_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_9_0_1_address0 = grp_conv_write_fu_1047_filter_buff_9_0_1_address0.read();
    } else {
        filter_buff_9_0_1_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_9_0_1_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_9_0_1_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_9_0_1_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_9_0_1_ce0 = grp_conv_write_fu_1047_filter_buff_9_0_1_ce0.read();
    } else {
        filter_buff_9_0_1_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_9_0_1_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_9_0_1_we0 = grp_load_filter_buffer_fu_1284_filter_buff_9_0_1_we0.read();
    } else {
        filter_buff_9_0_1_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_9_0_2_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_9_0_2_address0 = grp_load_filter_buffer_fu_1284_filter_buff_9_0_2_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_9_0_2_address0 = grp_conv_write_fu_1047_filter_buff_9_0_2_address0.read();
    } else {
        filter_buff_9_0_2_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_9_0_2_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_9_0_2_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_9_0_2_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_9_0_2_ce0 = grp_conv_write_fu_1047_filter_buff_9_0_2_ce0.read();
    } else {
        filter_buff_9_0_2_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_9_0_2_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_9_0_2_we0 = grp_load_filter_buffer_fu_1284_filter_buff_9_0_2_we0.read();
    } else {
        filter_buff_9_0_2_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_9_1_0_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_9_1_0_address0 = grp_load_filter_buffer_fu_1284_filter_buff_9_1_0_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_9_1_0_address0 = grp_conv_write_fu_1047_filter_buff_9_1_0_address0.read();
    } else {
        filter_buff_9_1_0_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_9_1_0_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_9_1_0_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_9_1_0_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_9_1_0_ce0 = grp_conv_write_fu_1047_filter_buff_9_1_0_ce0.read();
    } else {
        filter_buff_9_1_0_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_9_1_0_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_9_1_0_we0 = grp_load_filter_buffer_fu_1284_filter_buff_9_1_0_we0.read();
    } else {
        filter_buff_9_1_0_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_9_1_1_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_9_1_1_address0 = grp_load_filter_buffer_fu_1284_filter_buff_9_1_1_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_9_1_1_address0 = grp_conv_write_fu_1047_filter_buff_9_1_1_address0.read();
    } else {
        filter_buff_9_1_1_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_9_1_1_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_9_1_1_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_9_1_1_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_9_1_1_ce0 = grp_conv_write_fu_1047_filter_buff_9_1_1_ce0.read();
    } else {
        filter_buff_9_1_1_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_9_1_1_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_9_1_1_we0 = grp_load_filter_buffer_fu_1284_filter_buff_9_1_1_we0.read();
    } else {
        filter_buff_9_1_1_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_9_1_2_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_9_1_2_address0 = grp_load_filter_buffer_fu_1284_filter_buff_9_1_2_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_9_1_2_address0 = grp_conv_write_fu_1047_filter_buff_9_1_2_address0.read();
    } else {
        filter_buff_9_1_2_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_9_1_2_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_9_1_2_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_9_1_2_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_9_1_2_ce0 = grp_conv_write_fu_1047_filter_buff_9_1_2_ce0.read();
    } else {
        filter_buff_9_1_2_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_9_1_2_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_9_1_2_we0 = grp_load_filter_buffer_fu_1284_filter_buff_9_1_2_we0.read();
    } else {
        filter_buff_9_1_2_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_9_2_0_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_9_2_0_address0 = grp_load_filter_buffer_fu_1284_filter_buff_9_2_0_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_9_2_0_address0 = grp_conv_write_fu_1047_filter_buff_9_2_0_address0.read();
    } else {
        filter_buff_9_2_0_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_9_2_0_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_9_2_0_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_9_2_0_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_9_2_0_ce0 = grp_conv_write_fu_1047_filter_buff_9_2_0_ce0.read();
    } else {
        filter_buff_9_2_0_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_9_2_0_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_9_2_0_we0 = grp_load_filter_buffer_fu_1284_filter_buff_9_2_0_we0.read();
    } else {
        filter_buff_9_2_0_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_9_2_1_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_9_2_1_address0 = grp_load_filter_buffer_fu_1284_filter_buff_9_2_1_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_9_2_1_address0 = grp_conv_write_fu_1047_filter_buff_9_2_1_address0.read();
    } else {
        filter_buff_9_2_1_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_9_2_1_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_9_2_1_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_9_2_1_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_9_2_1_ce0 = grp_conv_write_fu_1047_filter_buff_9_2_1_ce0.read();
    } else {
        filter_buff_9_2_1_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_9_2_1_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_9_2_1_we0 = grp_load_filter_buffer_fu_1284_filter_buff_9_2_1_we0.read();
    } else {
        filter_buff_9_2_1_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_9_2_2_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_9_2_2_address0 = grp_load_filter_buffer_fu_1284_filter_buff_9_2_2_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_9_2_2_address0 = grp_conv_write_fu_1047_filter_buff_9_2_2_address0.read();
    } else {
        filter_buff_9_2_2_address0 = "XXXX";
    }
}

void convolution_hw::thread_filter_buff_9_2_2_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_9_2_2_ce0 = grp_load_filter_buffer_fu_1284_filter_buff_9_2_2_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        filter_buff_9_2_2_ce0 = grp_conv_write_fu_1047_filter_buff_9_2_2_ce0.read();
    } else {
        filter_buff_9_2_2_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_filter_buff_9_2_2_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        filter_buff_9_2_2_we0 = grp_load_filter_buffer_fu_1284_filter_buff_9_2_2_we0.read();
    } else {
        filter_buff_9_2_2_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_grp_conv_read_fu_1259_ap_start() {
    grp_conv_read_fu_1259_ap_start = grp_conv_read_fu_1259_ap_start_reg.read();
}

void convolution_hw::thread_grp_conv_read_fu_1259_cofm_TREADY() {
    grp_conv_read_fu_1259_cofm_TREADY = ((cofm_TREADY.read() & 
  ap_CS_fsm_state4.read()) | (cofm_TREADY.read() & 
  ap_CS_fsm_state5.read()));
}

void convolution_hw::thread_grp_conv_read_fu_1259_enable() {
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
         esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        grp_conv_read_fu_1259_enable =  (sc_logic) (icmp_ln652_reg_1856.read()[0]);
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op298_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op304_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op310_call_state4.read())) || 
                esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state5.read()))) {
        grp_conv_read_fu_1259_enable =  (sc_logic) (ap_const_lv1_1[0]);
    } else {
        grp_conv_read_fu_1259_enable = sc_logic('X');
    }
}

void convolution_hw::thread_grp_conv_read_fu_1259_ofm_buff0_0_q0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op304_call_state4.read())) || 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state5.read()))) {
        grp_conv_read_fu_1259_ofm_buff0_0_q0 = ofm_buff1_0_q0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op298_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op310_call_state4.read())))) {
        grp_conv_read_fu_1259_ofm_buff0_0_q0 = ofm_buff0_0_q0.read();
    } else {
        grp_conv_read_fu_1259_ofm_buff0_0_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_read_fu_1259_ofm_buff0_10_q0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op304_call_state4.read())) || 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state5.read()))) {
        grp_conv_read_fu_1259_ofm_buff0_10_q0 = ofm_buff1_10_q0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op298_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op310_call_state4.read())))) {
        grp_conv_read_fu_1259_ofm_buff0_10_q0 = ofm_buff0_10_q0.read();
    } else {
        grp_conv_read_fu_1259_ofm_buff0_10_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_read_fu_1259_ofm_buff0_11_q0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op304_call_state4.read())) || 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state5.read()))) {
        grp_conv_read_fu_1259_ofm_buff0_11_q0 = ofm_buff1_11_q0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op298_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op310_call_state4.read())))) {
        grp_conv_read_fu_1259_ofm_buff0_11_q0 = ofm_buff0_11_q0.read();
    } else {
        grp_conv_read_fu_1259_ofm_buff0_11_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_read_fu_1259_ofm_buff0_12_q0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op304_call_state4.read())) || 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state5.read()))) {
        grp_conv_read_fu_1259_ofm_buff0_12_q0 = ofm_buff1_12_q0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op298_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op310_call_state4.read())))) {
        grp_conv_read_fu_1259_ofm_buff0_12_q0 = ofm_buff0_12_q0.read();
    } else {
        grp_conv_read_fu_1259_ofm_buff0_12_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_read_fu_1259_ofm_buff0_13_q0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op304_call_state4.read())) || 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state5.read()))) {
        grp_conv_read_fu_1259_ofm_buff0_13_q0 = ofm_buff1_13_q0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op298_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op310_call_state4.read())))) {
        grp_conv_read_fu_1259_ofm_buff0_13_q0 = ofm_buff0_13_q0.read();
    } else {
        grp_conv_read_fu_1259_ofm_buff0_13_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_read_fu_1259_ofm_buff0_14_q0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op304_call_state4.read())) || 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state5.read()))) {
        grp_conv_read_fu_1259_ofm_buff0_14_q0 = ofm_buff1_14_q0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op298_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op310_call_state4.read())))) {
        grp_conv_read_fu_1259_ofm_buff0_14_q0 = ofm_buff0_14_q0.read();
    } else {
        grp_conv_read_fu_1259_ofm_buff0_14_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_read_fu_1259_ofm_buff0_15_q0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op304_call_state4.read())) || 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state5.read()))) {
        grp_conv_read_fu_1259_ofm_buff0_15_q0 = ofm_buff1_15_q0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op298_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op310_call_state4.read())))) {
        grp_conv_read_fu_1259_ofm_buff0_15_q0 = ofm_buff0_15_q0.read();
    } else {
        grp_conv_read_fu_1259_ofm_buff0_15_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_read_fu_1259_ofm_buff0_1_q0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op304_call_state4.read())) || 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state5.read()))) {
        grp_conv_read_fu_1259_ofm_buff0_1_q0 = ofm_buff1_1_q0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op298_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op310_call_state4.read())))) {
        grp_conv_read_fu_1259_ofm_buff0_1_q0 = ofm_buff0_1_q0.read();
    } else {
        grp_conv_read_fu_1259_ofm_buff0_1_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_read_fu_1259_ofm_buff0_2_q0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op304_call_state4.read())) || 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state5.read()))) {
        grp_conv_read_fu_1259_ofm_buff0_2_q0 = ofm_buff1_2_q0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op298_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op310_call_state4.read())))) {
        grp_conv_read_fu_1259_ofm_buff0_2_q0 = ofm_buff0_2_q0.read();
    } else {
        grp_conv_read_fu_1259_ofm_buff0_2_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_read_fu_1259_ofm_buff0_3_q0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op304_call_state4.read())) || 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state5.read()))) {
        grp_conv_read_fu_1259_ofm_buff0_3_q0 = ofm_buff1_3_q0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op298_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op310_call_state4.read())))) {
        grp_conv_read_fu_1259_ofm_buff0_3_q0 = ofm_buff0_3_q0.read();
    } else {
        grp_conv_read_fu_1259_ofm_buff0_3_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_read_fu_1259_ofm_buff0_4_q0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op304_call_state4.read())) || 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state5.read()))) {
        grp_conv_read_fu_1259_ofm_buff0_4_q0 = ofm_buff1_4_q0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op298_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op310_call_state4.read())))) {
        grp_conv_read_fu_1259_ofm_buff0_4_q0 = ofm_buff0_4_q0.read();
    } else {
        grp_conv_read_fu_1259_ofm_buff0_4_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_read_fu_1259_ofm_buff0_5_q0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op304_call_state4.read())) || 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state5.read()))) {
        grp_conv_read_fu_1259_ofm_buff0_5_q0 = ofm_buff1_5_q0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op298_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op310_call_state4.read())))) {
        grp_conv_read_fu_1259_ofm_buff0_5_q0 = ofm_buff0_5_q0.read();
    } else {
        grp_conv_read_fu_1259_ofm_buff0_5_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_read_fu_1259_ofm_buff0_6_q0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op304_call_state4.read())) || 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state5.read()))) {
        grp_conv_read_fu_1259_ofm_buff0_6_q0 = ofm_buff1_6_q0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op298_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op310_call_state4.read())))) {
        grp_conv_read_fu_1259_ofm_buff0_6_q0 = ofm_buff0_6_q0.read();
    } else {
        grp_conv_read_fu_1259_ofm_buff0_6_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_read_fu_1259_ofm_buff0_7_q0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op304_call_state4.read())) || 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state5.read()))) {
        grp_conv_read_fu_1259_ofm_buff0_7_q0 = ofm_buff1_7_q0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op298_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op310_call_state4.read())))) {
        grp_conv_read_fu_1259_ofm_buff0_7_q0 = ofm_buff0_7_q0.read();
    } else {
        grp_conv_read_fu_1259_ofm_buff0_7_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_read_fu_1259_ofm_buff0_8_q0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op304_call_state4.read())) || 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state5.read()))) {
        grp_conv_read_fu_1259_ofm_buff0_8_q0 = ofm_buff1_8_q0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op298_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op310_call_state4.read())))) {
        grp_conv_read_fu_1259_ofm_buff0_8_q0 = ofm_buff0_8_q0.read();
    } else {
        grp_conv_read_fu_1259_ofm_buff0_8_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_read_fu_1259_ofm_buff0_9_q0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op304_call_state4.read())) || 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state5.read()))) {
        grp_conv_read_fu_1259_ofm_buff0_9_q0 = ofm_buff1_9_q0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op298_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op310_call_state4.read())))) {
        grp_conv_read_fu_1259_ofm_buff0_9_q0 = ofm_buff0_9_q0.read();
    } else {
        grp_conv_read_fu_1259_ofm_buff0_9_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ap_start() {
    grp_conv_write_fu_1047_ap_start = grp_conv_write_fu_1047_ap_start_reg.read();
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff0_0_q0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff0_0_q0 = ifm_buff1_0_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_0_q0 = ifm_buff2_0_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_0_q0 = ifm_buff3_0_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_0_q0 = ifm_buff0_0_q0.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff0_0_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff0_0_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff0_0_q1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff0_0_q1 = ifm_buff1_0_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_0_q1 = ifm_buff2_0_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_0_q1 = ifm_buff3_0_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_0_q1 = ifm_buff0_0_q1.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff0_0_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff0_0_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff0_10_q0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff0_10_q0 = ifm_buff1_10_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_10_q0 = ifm_buff2_10_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_10_q0 = ifm_buff3_10_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_10_q0 = ifm_buff0_10_q0.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff0_10_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff0_10_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff0_10_q1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff0_10_q1 = ifm_buff1_10_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_10_q1 = ifm_buff2_10_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_10_q1 = ifm_buff3_10_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_10_q1 = ifm_buff0_10_q1.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff0_10_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff0_10_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff0_11_q0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff0_11_q0 = ifm_buff1_11_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_11_q0 = ifm_buff2_11_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_11_q0 = ifm_buff3_11_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_11_q0 = ifm_buff0_11_q0.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff0_11_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff0_11_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff0_11_q1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff0_11_q1 = ifm_buff1_11_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_11_q1 = ifm_buff2_11_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_11_q1 = ifm_buff3_11_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_11_q1 = ifm_buff0_11_q1.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff0_11_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff0_11_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff0_12_q0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff0_12_q0 = ifm_buff1_12_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_12_q0 = ifm_buff2_12_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_12_q0 = ifm_buff3_12_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_12_q0 = ifm_buff0_12_q0.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff0_12_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff0_12_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff0_12_q1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff0_12_q1 = ifm_buff1_12_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_12_q1 = ifm_buff2_12_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_12_q1 = ifm_buff3_12_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_12_q1 = ifm_buff0_12_q1.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff0_12_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff0_12_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff0_13_q0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff0_13_q0 = ifm_buff1_13_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_13_q0 = ifm_buff2_13_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_13_q0 = ifm_buff3_13_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_13_q0 = ifm_buff0_13_q0.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff0_13_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff0_13_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff0_13_q1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff0_13_q1 = ifm_buff1_13_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_13_q1 = ifm_buff2_13_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_13_q1 = ifm_buff3_13_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_13_q1 = ifm_buff0_13_q1.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff0_13_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff0_13_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff0_14_q0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff0_14_q0 = ifm_buff1_14_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_14_q0 = ifm_buff2_14_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_14_q0 = ifm_buff3_14_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_14_q0 = ifm_buff0_14_q0.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff0_14_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff0_14_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff0_14_q1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff0_14_q1 = ifm_buff1_14_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_14_q1 = ifm_buff2_14_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_14_q1 = ifm_buff3_14_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_14_q1 = ifm_buff0_14_q1.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff0_14_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff0_14_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff0_15_q0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff0_15_q0 = ifm_buff1_15_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_15_q0 = ifm_buff2_15_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_15_q0 = ifm_buff3_15_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_15_q0 = ifm_buff0_15_q0.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff0_15_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff0_15_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff0_15_q1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff0_15_q1 = ifm_buff1_15_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_15_q1 = ifm_buff2_15_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_15_q1 = ifm_buff3_15_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_15_q1 = ifm_buff0_15_q1.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff0_15_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff0_15_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff0_1_q0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff0_1_q0 = ifm_buff1_1_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_1_q0 = ifm_buff2_1_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_1_q0 = ifm_buff3_1_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_1_q0 = ifm_buff0_1_q0.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff0_1_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff0_1_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff0_1_q1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff0_1_q1 = ifm_buff1_1_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_1_q1 = ifm_buff2_1_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_1_q1 = ifm_buff3_1_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_1_q1 = ifm_buff0_1_q1.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff0_1_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff0_1_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff0_2_q0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff0_2_q0 = ifm_buff1_2_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_2_q0 = ifm_buff2_2_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_2_q0 = ifm_buff3_2_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_2_q0 = ifm_buff0_2_q0.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff0_2_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff0_2_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff0_2_q1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff0_2_q1 = ifm_buff1_2_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_2_q1 = ifm_buff2_2_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_2_q1 = ifm_buff3_2_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_2_q1 = ifm_buff0_2_q1.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff0_2_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff0_2_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff0_3_q0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff0_3_q0 = ifm_buff1_3_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_3_q0 = ifm_buff2_3_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_3_q0 = ifm_buff3_3_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_3_q0 = ifm_buff0_3_q0.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff0_3_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff0_3_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff0_3_q1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff0_3_q1 = ifm_buff1_3_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_3_q1 = ifm_buff2_3_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_3_q1 = ifm_buff3_3_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_3_q1 = ifm_buff0_3_q1.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff0_3_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff0_3_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff0_4_q0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff0_4_q0 = ifm_buff1_4_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_4_q0 = ifm_buff2_4_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_4_q0 = ifm_buff3_4_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_4_q0 = ifm_buff0_4_q0.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff0_4_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff0_4_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff0_4_q1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff0_4_q1 = ifm_buff1_4_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_4_q1 = ifm_buff2_4_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_4_q1 = ifm_buff3_4_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_4_q1 = ifm_buff0_4_q1.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff0_4_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff0_4_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff0_5_q0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff0_5_q0 = ifm_buff1_5_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_5_q0 = ifm_buff2_5_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_5_q0 = ifm_buff3_5_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_5_q0 = ifm_buff0_5_q0.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff0_5_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff0_5_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff0_5_q1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff0_5_q1 = ifm_buff1_5_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_5_q1 = ifm_buff2_5_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_5_q1 = ifm_buff3_5_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_5_q1 = ifm_buff0_5_q1.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff0_5_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff0_5_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff0_6_q0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff0_6_q0 = ifm_buff1_6_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_6_q0 = ifm_buff2_6_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_6_q0 = ifm_buff3_6_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_6_q0 = ifm_buff0_6_q0.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff0_6_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff0_6_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff0_6_q1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff0_6_q1 = ifm_buff1_6_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_6_q1 = ifm_buff2_6_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_6_q1 = ifm_buff3_6_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_6_q1 = ifm_buff0_6_q1.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff0_6_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff0_6_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff0_7_q0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff0_7_q0 = ifm_buff1_7_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_7_q0 = ifm_buff2_7_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_7_q0 = ifm_buff3_7_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_7_q0 = ifm_buff0_7_q0.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff0_7_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff0_7_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff0_7_q1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff0_7_q1 = ifm_buff1_7_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_7_q1 = ifm_buff2_7_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_7_q1 = ifm_buff3_7_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_7_q1 = ifm_buff0_7_q1.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff0_7_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff0_7_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff0_8_q0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff0_8_q0 = ifm_buff1_8_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_8_q0 = ifm_buff2_8_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_8_q0 = ifm_buff3_8_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_8_q0 = ifm_buff0_8_q0.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff0_8_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff0_8_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff0_8_q1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff0_8_q1 = ifm_buff1_8_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_8_q1 = ifm_buff2_8_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_8_q1 = ifm_buff3_8_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_8_q1 = ifm_buff0_8_q1.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff0_8_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff0_8_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff0_9_q0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff0_9_q0 = ifm_buff1_9_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_9_q0 = ifm_buff2_9_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_9_q0 = ifm_buff3_9_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_9_q0 = ifm_buff0_9_q0.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff0_9_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff0_9_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff0_9_q1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff0_9_q1 = ifm_buff1_9_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_9_q1 = ifm_buff2_9_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_9_q1 = ifm_buff3_9_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff0_9_q1 = ifm_buff0_9_q1.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff0_9_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff0_9_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff1_0_q0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff1_0_q0 = ifm_buff2_0_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_0_q0 = ifm_buff3_0_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_0_q0 = ifm_buff0_0_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_0_q0 = ifm_buff1_0_q0.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff1_0_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff1_0_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff1_0_q1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff1_0_q1 = ifm_buff2_0_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_0_q1 = ifm_buff3_0_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_0_q1 = ifm_buff0_0_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_0_q1 = ifm_buff1_0_q1.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff1_0_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff1_0_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff1_10_q0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff1_10_q0 = ifm_buff2_10_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_10_q0 = ifm_buff3_10_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_10_q0 = ifm_buff0_10_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_10_q0 = ifm_buff1_10_q0.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff1_10_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff1_10_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff1_10_q1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff1_10_q1 = ifm_buff2_10_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_10_q1 = ifm_buff3_10_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_10_q1 = ifm_buff0_10_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_10_q1 = ifm_buff1_10_q1.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff1_10_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff1_10_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff1_11_q0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff1_11_q0 = ifm_buff2_11_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_11_q0 = ifm_buff3_11_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_11_q0 = ifm_buff0_11_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_11_q0 = ifm_buff1_11_q0.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff1_11_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff1_11_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff1_11_q1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff1_11_q1 = ifm_buff2_11_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_11_q1 = ifm_buff3_11_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_11_q1 = ifm_buff0_11_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_11_q1 = ifm_buff1_11_q1.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff1_11_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff1_11_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff1_12_q0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff1_12_q0 = ifm_buff2_12_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_12_q0 = ifm_buff3_12_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_12_q0 = ifm_buff0_12_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_12_q0 = ifm_buff1_12_q0.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff1_12_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff1_12_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff1_12_q1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff1_12_q1 = ifm_buff2_12_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_12_q1 = ifm_buff3_12_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_12_q1 = ifm_buff0_12_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_12_q1 = ifm_buff1_12_q1.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff1_12_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff1_12_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff1_13_q0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff1_13_q0 = ifm_buff2_13_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_13_q0 = ifm_buff3_13_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_13_q0 = ifm_buff0_13_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_13_q0 = ifm_buff1_13_q0.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff1_13_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff1_13_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff1_13_q1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff1_13_q1 = ifm_buff2_13_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_13_q1 = ifm_buff3_13_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_13_q1 = ifm_buff0_13_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_13_q1 = ifm_buff1_13_q1.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff1_13_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff1_13_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff1_14_q0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff1_14_q0 = ifm_buff2_14_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_14_q0 = ifm_buff3_14_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_14_q0 = ifm_buff0_14_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_14_q0 = ifm_buff1_14_q0.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff1_14_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff1_14_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff1_14_q1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff1_14_q1 = ifm_buff2_14_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_14_q1 = ifm_buff3_14_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_14_q1 = ifm_buff0_14_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_14_q1 = ifm_buff1_14_q1.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff1_14_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff1_14_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff1_15_q0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff1_15_q0 = ifm_buff2_15_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_15_q0 = ifm_buff3_15_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_15_q0 = ifm_buff0_15_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_15_q0 = ifm_buff1_15_q0.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff1_15_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff1_15_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff1_15_q1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff1_15_q1 = ifm_buff2_15_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_15_q1 = ifm_buff3_15_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_15_q1 = ifm_buff0_15_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_15_q1 = ifm_buff1_15_q1.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff1_15_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff1_15_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff1_1_q0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff1_1_q0 = ifm_buff2_1_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_1_q0 = ifm_buff3_1_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_1_q0 = ifm_buff0_1_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_1_q0 = ifm_buff1_1_q0.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff1_1_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff1_1_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff1_1_q1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff1_1_q1 = ifm_buff2_1_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_1_q1 = ifm_buff3_1_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_1_q1 = ifm_buff0_1_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_1_q1 = ifm_buff1_1_q1.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff1_1_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff1_1_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff1_2_q0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff1_2_q0 = ifm_buff2_2_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_2_q0 = ifm_buff3_2_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_2_q0 = ifm_buff0_2_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_2_q0 = ifm_buff1_2_q0.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff1_2_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff1_2_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff1_2_q1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff1_2_q1 = ifm_buff2_2_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_2_q1 = ifm_buff3_2_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_2_q1 = ifm_buff0_2_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_2_q1 = ifm_buff1_2_q1.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff1_2_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff1_2_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff1_3_q0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff1_3_q0 = ifm_buff2_3_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_3_q0 = ifm_buff3_3_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_3_q0 = ifm_buff0_3_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_3_q0 = ifm_buff1_3_q0.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff1_3_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff1_3_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff1_3_q1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff1_3_q1 = ifm_buff2_3_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_3_q1 = ifm_buff3_3_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_3_q1 = ifm_buff0_3_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_3_q1 = ifm_buff1_3_q1.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff1_3_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff1_3_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff1_4_q0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff1_4_q0 = ifm_buff2_4_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_4_q0 = ifm_buff3_4_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_4_q0 = ifm_buff0_4_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_4_q0 = ifm_buff1_4_q0.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff1_4_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff1_4_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff1_4_q1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff1_4_q1 = ifm_buff2_4_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_4_q1 = ifm_buff3_4_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_4_q1 = ifm_buff0_4_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_4_q1 = ifm_buff1_4_q1.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff1_4_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff1_4_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff1_5_q0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff1_5_q0 = ifm_buff2_5_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_5_q0 = ifm_buff3_5_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_5_q0 = ifm_buff0_5_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_5_q0 = ifm_buff1_5_q0.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff1_5_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff1_5_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff1_5_q1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff1_5_q1 = ifm_buff2_5_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_5_q1 = ifm_buff3_5_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_5_q1 = ifm_buff0_5_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_5_q1 = ifm_buff1_5_q1.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff1_5_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff1_5_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff1_6_q0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff1_6_q0 = ifm_buff2_6_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_6_q0 = ifm_buff3_6_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_6_q0 = ifm_buff0_6_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_6_q0 = ifm_buff1_6_q0.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff1_6_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff1_6_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff1_6_q1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff1_6_q1 = ifm_buff2_6_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_6_q1 = ifm_buff3_6_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_6_q1 = ifm_buff0_6_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_6_q1 = ifm_buff1_6_q1.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff1_6_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff1_6_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff1_7_q0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff1_7_q0 = ifm_buff2_7_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_7_q0 = ifm_buff3_7_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_7_q0 = ifm_buff0_7_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_7_q0 = ifm_buff1_7_q0.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff1_7_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff1_7_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff1_7_q1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff1_7_q1 = ifm_buff2_7_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_7_q1 = ifm_buff3_7_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_7_q1 = ifm_buff0_7_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_7_q1 = ifm_buff1_7_q1.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff1_7_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff1_7_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff1_8_q0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff1_8_q0 = ifm_buff2_8_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_8_q0 = ifm_buff3_8_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_8_q0 = ifm_buff0_8_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_8_q0 = ifm_buff1_8_q0.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff1_8_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff1_8_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff1_8_q1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff1_8_q1 = ifm_buff2_8_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_8_q1 = ifm_buff3_8_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_8_q1 = ifm_buff0_8_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_8_q1 = ifm_buff1_8_q1.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff1_8_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff1_8_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff1_9_q0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff1_9_q0 = ifm_buff2_9_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_9_q0 = ifm_buff3_9_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_9_q0 = ifm_buff0_9_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_9_q0 = ifm_buff1_9_q0.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff1_9_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff1_9_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff1_9_q1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff1_9_q1 = ifm_buff2_9_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_9_q1 = ifm_buff3_9_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_9_q1 = ifm_buff0_9_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff1_9_q1 = ifm_buff1_9_q1.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff1_9_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff1_9_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff2_0_q0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff2_0_q0 = ifm_buff3_0_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_0_q0 = ifm_buff0_0_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_0_q0 = ifm_buff1_0_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_0_q0 = ifm_buff2_0_q0.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff2_0_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff2_0_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff2_0_q1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff2_0_q1 = ifm_buff3_0_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_0_q1 = ifm_buff0_0_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_0_q1 = ifm_buff1_0_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_0_q1 = ifm_buff2_0_q1.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff2_0_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff2_0_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff2_10_q0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff2_10_q0 = ifm_buff3_10_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_10_q0 = ifm_buff0_10_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_10_q0 = ifm_buff1_10_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_10_q0 = ifm_buff2_10_q0.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff2_10_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff2_10_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff2_10_q1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff2_10_q1 = ifm_buff3_10_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_10_q1 = ifm_buff0_10_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_10_q1 = ifm_buff1_10_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_10_q1 = ifm_buff2_10_q1.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff2_10_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff2_10_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff2_11_q0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff2_11_q0 = ifm_buff3_11_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_11_q0 = ifm_buff0_11_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_11_q0 = ifm_buff1_11_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_11_q0 = ifm_buff2_11_q0.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff2_11_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff2_11_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff2_11_q1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff2_11_q1 = ifm_buff3_11_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_11_q1 = ifm_buff0_11_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_11_q1 = ifm_buff1_11_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_11_q1 = ifm_buff2_11_q1.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff2_11_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff2_11_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff2_12_q0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff2_12_q0 = ifm_buff3_12_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_12_q0 = ifm_buff0_12_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_12_q0 = ifm_buff1_12_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_12_q0 = ifm_buff2_12_q0.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff2_12_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff2_12_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff2_12_q1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff2_12_q1 = ifm_buff3_12_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_12_q1 = ifm_buff0_12_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_12_q1 = ifm_buff1_12_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_12_q1 = ifm_buff2_12_q1.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff2_12_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff2_12_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff2_13_q0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff2_13_q0 = ifm_buff3_13_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_13_q0 = ifm_buff0_13_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_13_q0 = ifm_buff1_13_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_13_q0 = ifm_buff2_13_q0.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff2_13_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff2_13_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff2_13_q1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff2_13_q1 = ifm_buff3_13_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_13_q1 = ifm_buff0_13_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_13_q1 = ifm_buff1_13_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_13_q1 = ifm_buff2_13_q1.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff2_13_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff2_13_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff2_14_q0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff2_14_q0 = ifm_buff3_14_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_14_q0 = ifm_buff0_14_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_14_q0 = ifm_buff1_14_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_14_q0 = ifm_buff2_14_q0.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff2_14_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff2_14_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff2_14_q1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff2_14_q1 = ifm_buff3_14_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_14_q1 = ifm_buff0_14_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_14_q1 = ifm_buff1_14_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_14_q1 = ifm_buff2_14_q1.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff2_14_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff2_14_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff2_15_q0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff2_15_q0 = ifm_buff3_15_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_15_q0 = ifm_buff0_15_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_15_q0 = ifm_buff1_15_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_15_q0 = ifm_buff2_15_q0.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff2_15_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff2_15_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff2_15_q1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff2_15_q1 = ifm_buff3_15_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_15_q1 = ifm_buff0_15_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_15_q1 = ifm_buff1_15_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_15_q1 = ifm_buff2_15_q1.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff2_15_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff2_15_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff2_1_q0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff2_1_q0 = ifm_buff3_1_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_1_q0 = ifm_buff0_1_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_1_q0 = ifm_buff1_1_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_1_q0 = ifm_buff2_1_q0.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff2_1_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff2_1_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff2_1_q1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff2_1_q1 = ifm_buff3_1_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_1_q1 = ifm_buff0_1_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_1_q1 = ifm_buff1_1_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_1_q1 = ifm_buff2_1_q1.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff2_1_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff2_1_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff2_2_q0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff2_2_q0 = ifm_buff3_2_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_2_q0 = ifm_buff0_2_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_2_q0 = ifm_buff1_2_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_2_q0 = ifm_buff2_2_q0.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff2_2_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff2_2_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff2_2_q1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff2_2_q1 = ifm_buff3_2_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_2_q1 = ifm_buff0_2_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_2_q1 = ifm_buff1_2_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_2_q1 = ifm_buff2_2_q1.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff2_2_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff2_2_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff2_3_q0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff2_3_q0 = ifm_buff3_3_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_3_q0 = ifm_buff0_3_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_3_q0 = ifm_buff1_3_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_3_q0 = ifm_buff2_3_q0.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff2_3_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff2_3_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff2_3_q1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff2_3_q1 = ifm_buff3_3_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_3_q1 = ifm_buff0_3_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_3_q1 = ifm_buff1_3_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_3_q1 = ifm_buff2_3_q1.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff2_3_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff2_3_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff2_4_q0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff2_4_q0 = ifm_buff3_4_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_4_q0 = ifm_buff0_4_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_4_q0 = ifm_buff1_4_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_4_q0 = ifm_buff2_4_q0.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff2_4_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff2_4_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff2_4_q1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff2_4_q1 = ifm_buff3_4_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_4_q1 = ifm_buff0_4_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_4_q1 = ifm_buff1_4_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_4_q1 = ifm_buff2_4_q1.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff2_4_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff2_4_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff2_5_q0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff2_5_q0 = ifm_buff3_5_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_5_q0 = ifm_buff0_5_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_5_q0 = ifm_buff1_5_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_5_q0 = ifm_buff2_5_q0.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff2_5_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff2_5_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff2_5_q1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff2_5_q1 = ifm_buff3_5_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_5_q1 = ifm_buff0_5_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_5_q1 = ifm_buff1_5_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_5_q1 = ifm_buff2_5_q1.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff2_5_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff2_5_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff2_6_q0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff2_6_q0 = ifm_buff3_6_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_6_q0 = ifm_buff0_6_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_6_q0 = ifm_buff1_6_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_6_q0 = ifm_buff2_6_q0.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff2_6_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff2_6_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff2_6_q1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff2_6_q1 = ifm_buff3_6_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_6_q1 = ifm_buff0_6_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_6_q1 = ifm_buff1_6_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_6_q1 = ifm_buff2_6_q1.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff2_6_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff2_6_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff2_7_q0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff2_7_q0 = ifm_buff3_7_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_7_q0 = ifm_buff0_7_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_7_q0 = ifm_buff1_7_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_7_q0 = ifm_buff2_7_q0.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff2_7_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff2_7_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff2_7_q1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff2_7_q1 = ifm_buff3_7_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_7_q1 = ifm_buff0_7_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_7_q1 = ifm_buff1_7_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_7_q1 = ifm_buff2_7_q1.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff2_7_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff2_7_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff2_8_q0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff2_8_q0 = ifm_buff3_8_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_8_q0 = ifm_buff0_8_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_8_q0 = ifm_buff1_8_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_8_q0 = ifm_buff2_8_q0.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff2_8_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff2_8_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff2_8_q1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff2_8_q1 = ifm_buff3_8_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_8_q1 = ifm_buff0_8_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_8_q1 = ifm_buff1_8_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_8_q1 = ifm_buff2_8_q1.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff2_8_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff2_8_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff2_9_q0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff2_9_q0 = ifm_buff3_9_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_9_q0 = ifm_buff0_9_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_9_q0 = ifm_buff1_9_q0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_9_q0 = ifm_buff2_9_q0.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff2_9_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff2_9_q0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_conv_write_fu_1047_ifm_buff2_9_q1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            grp_conv_write_fu_1047_ifm_buff2_9_q1 = ifm_buff3_9_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_9_q1 = ifm_buff0_9_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_9_q1 = ifm_buff1_9_q1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            grp_conv_write_fu_1047_ifm_buff2_9_q1 = ifm_buff2_9_q1.read();
        } else {
            grp_conv_write_fu_1047_ifm_buff2_9_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        }
    } else {
        grp_conv_write_fu_1047_ifm_buff2_9_q1 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_grp_load_cifm_data_fu_1603_ap_start() {
    grp_load_cifm_data_fu_1603_ap_start = grp_load_cifm_data_fu_1603_ap_start_reg.read();
}

void convolution_hw::thread_grp_load_filter_buffer_fu_1284_ap_start() {
    grp_load_filter_buffer_fu_1284_ap_start = grp_load_filter_buffer_fu_1284_ap_start_reg.read();
}

void convolution_hw::thread_grp_write_row_ifm_fu_1578_ap_start() {
    grp_write_row_ifm_fu_1578_ap_start = grp_write_row_ifm_fu_1578_ap_start_reg.read();
}

void convolution_hw::thread_grp_write_row_ifm_fu_1578_enable() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op302_call_state4.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op308_call_state4.read())))) {
        grp_write_row_ifm_fu_1578_enable =  (sc_logic) (ap_const_lv1_1[0]);
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op296_call_state4.read()))) {
        grp_write_row_ifm_fu_1578_enable =  (sc_logic) (icmp_ln678_reg_1851.read()[0]);
    } else {
        grp_write_row_ifm_fu_1578_enable = sc_logic('X');
    }
}

void convolution_hw::thread_icmp_ln644_fu_1743_p2() {
    icmp_ln644_fu_1743_p2 = (!row_0_reg_1036.read().is_01() || !ap_const_lv6_38.is_01())? sc_lv<1>(): sc_lv<1>(row_0_reg_1036.read() == ap_const_lv6_38);
}

void convolution_hw::thread_icmp_ln648_fu_1755_p2() {
    icmp_ln648_fu_1755_p2 = (!rotate_counter_0_reg_1024.read().is_01() || !ap_const_lv16_0.is_01())? sc_lv<1>(): sc_lv<1>(rotate_counter_0_reg_1024.read() == ap_const_lv16_0);
}

void convolution_hw::thread_icmp_ln652_fu_1786_p2() {
    icmp_ln652_fu_1786_p2 = (!row_0_reg_1036.read().is_01() || !ap_const_lv6_0.is_01())? sc_lv<1>(): sc_lv<1>(row_0_reg_1036.read() != ap_const_lv6_0);
}

void convolution_hw::thread_icmp_ln658_fu_1761_p2() {
    icmp_ln658_fu_1761_p2 = (!rotate_counter_0_reg_1024.read().is_01() || !ap_const_lv16_1.is_01())? sc_lv<1>(): sc_lv<1>(rotate_counter_0_reg_1024.read() == ap_const_lv16_1);
}

void convolution_hw::thread_icmp_ln667_fu_1767_p2() {
    icmp_ln667_fu_1767_p2 = (!rotate_counter_0_reg_1024.read().is_01() || !ap_const_lv16_2.is_01())? sc_lv<1>(): sc_lv<1>(rotate_counter_0_reg_1024.read() == ap_const_lv16_2);
}

void convolution_hw::thread_icmp_ln676_fu_1773_p2() {
    icmp_ln676_fu_1773_p2 = (!rotate_counter_0_reg_1024.read().is_01() || !ap_const_lv16_3.is_01())? sc_lv<1>(): sc_lv<1>(rotate_counter_0_reg_1024.read() == ap_const_lv16_3);
}

void convolution_hw::thread_icmp_ln678_fu_1779_p2() {
    icmp_ln678_fu_1779_p2 = (!row_0_reg_1036.read().is_01() || !ap_const_lv6_37.is_01())? sc_lv<1>(): sc_lv<1>(row_0_reg_1036.read() != ap_const_lv6_37);
}

void convolution_hw::thread_icmp_ln687_fu_1799_p2() {
    icmp_ln687_fu_1799_p2 = (!rotate_counter_fu_1793_p2.read().is_01() || !ap_const_lv16_4.is_01())? sc_lv<1>(): sc_lv<1>(rotate_counter_fu_1793_p2.read() == ap_const_lv16_4);
}

void convolution_hw::thread_ifm_buff0_0_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff0_0_address0 = grp_write_row_ifm_fu_1578_ifm_buff0_0_address0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff0_0_address0 = grp_conv_write_fu_1047_ifm_buff2_0_address0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff0_0_address0 = grp_conv_write_fu_1047_ifm_buff1_0_address0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff0_0_address0 = grp_conv_write_fu_1047_ifm_buff0_0_address0.read();
        } else {
            ifm_buff0_0_address0 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff0_0_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff0_0_address1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff0_0_address1 = grp_conv_write_fu_1047_ifm_buff2_0_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff0_0_address1 = grp_conv_write_fu_1047_ifm_buff1_0_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff0_0_address1 = grp_conv_write_fu_1047_ifm_buff0_0_address1.read();
        } else {
            ifm_buff0_0_address1 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff0_0_address1 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff0_0_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff0_0_ce0 = grp_write_row_ifm_fu_1578_ifm_buff0_0_ce0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff0_0_ce0 = grp_conv_write_fu_1047_ifm_buff2_0_ce0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff0_0_ce0 = grp_conv_write_fu_1047_ifm_buff1_0_ce0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff0_0_ce0 = grp_conv_write_fu_1047_ifm_buff0_0_ce0.read();
        } else {
            ifm_buff0_0_ce0 = ap_const_logic_0;
        }
    } else {
        ifm_buff0_0_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff0_0_ce1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff0_0_ce1 = grp_conv_write_fu_1047_ifm_buff2_0_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff0_0_ce1 = grp_conv_write_fu_1047_ifm_buff1_0_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff0_0_ce1 = grp_conv_write_fu_1047_ifm_buff0_0_ce1.read();
        } else {
            ifm_buff0_0_ce1 = ap_const_logic_0;
        }
    } else {
        ifm_buff0_0_ce1 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff0_0_we0() {
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
         esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff0_0_we0 = grp_write_row_ifm_fu_1578_ifm_buff0_0_we0.read();
    } else {
        ifm_buff0_0_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff0_10_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff0_10_address0 = grp_write_row_ifm_fu_1578_ifm_buff0_10_address0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff0_10_address0 = grp_conv_write_fu_1047_ifm_buff2_10_address0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff0_10_address0 = grp_conv_write_fu_1047_ifm_buff1_10_address0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff0_10_address0 = grp_conv_write_fu_1047_ifm_buff0_10_address0.read();
        } else {
            ifm_buff0_10_address0 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff0_10_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff0_10_address1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff0_10_address1 = grp_conv_write_fu_1047_ifm_buff2_10_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff0_10_address1 = grp_conv_write_fu_1047_ifm_buff1_10_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff0_10_address1 = grp_conv_write_fu_1047_ifm_buff0_10_address1.read();
        } else {
            ifm_buff0_10_address1 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff0_10_address1 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff0_10_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff0_10_ce0 = grp_write_row_ifm_fu_1578_ifm_buff0_10_ce0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff0_10_ce0 = grp_conv_write_fu_1047_ifm_buff2_10_ce0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff0_10_ce0 = grp_conv_write_fu_1047_ifm_buff1_10_ce0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff0_10_ce0 = grp_conv_write_fu_1047_ifm_buff0_10_ce0.read();
        } else {
            ifm_buff0_10_ce0 = ap_const_logic_0;
        }
    } else {
        ifm_buff0_10_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff0_10_ce1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff0_10_ce1 = grp_conv_write_fu_1047_ifm_buff2_10_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff0_10_ce1 = grp_conv_write_fu_1047_ifm_buff1_10_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff0_10_ce1 = grp_conv_write_fu_1047_ifm_buff0_10_ce1.read();
        } else {
            ifm_buff0_10_ce1 = ap_const_logic_0;
        }
    } else {
        ifm_buff0_10_ce1 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff0_10_we0() {
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
         esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff0_10_we0 = grp_write_row_ifm_fu_1578_ifm_buff0_10_we0.read();
    } else {
        ifm_buff0_10_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff0_11_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff0_11_address0 = grp_write_row_ifm_fu_1578_ifm_buff0_11_address0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff0_11_address0 = grp_conv_write_fu_1047_ifm_buff2_11_address0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff0_11_address0 = grp_conv_write_fu_1047_ifm_buff1_11_address0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff0_11_address0 = grp_conv_write_fu_1047_ifm_buff0_11_address0.read();
        } else {
            ifm_buff0_11_address0 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff0_11_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff0_11_address1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff0_11_address1 = grp_conv_write_fu_1047_ifm_buff2_11_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff0_11_address1 = grp_conv_write_fu_1047_ifm_buff1_11_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff0_11_address1 = grp_conv_write_fu_1047_ifm_buff0_11_address1.read();
        } else {
            ifm_buff0_11_address1 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff0_11_address1 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff0_11_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff0_11_ce0 = grp_write_row_ifm_fu_1578_ifm_buff0_11_ce0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff0_11_ce0 = grp_conv_write_fu_1047_ifm_buff2_11_ce0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff0_11_ce0 = grp_conv_write_fu_1047_ifm_buff1_11_ce0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff0_11_ce0 = grp_conv_write_fu_1047_ifm_buff0_11_ce0.read();
        } else {
            ifm_buff0_11_ce0 = ap_const_logic_0;
        }
    } else {
        ifm_buff0_11_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff0_11_ce1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff0_11_ce1 = grp_conv_write_fu_1047_ifm_buff2_11_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff0_11_ce1 = grp_conv_write_fu_1047_ifm_buff1_11_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff0_11_ce1 = grp_conv_write_fu_1047_ifm_buff0_11_ce1.read();
        } else {
            ifm_buff0_11_ce1 = ap_const_logic_0;
        }
    } else {
        ifm_buff0_11_ce1 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff0_11_we0() {
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
         esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff0_11_we0 = grp_write_row_ifm_fu_1578_ifm_buff0_11_we0.read();
    } else {
        ifm_buff0_11_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff0_12_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff0_12_address0 = grp_write_row_ifm_fu_1578_ifm_buff0_12_address0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff0_12_address0 = grp_conv_write_fu_1047_ifm_buff2_12_address0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff0_12_address0 = grp_conv_write_fu_1047_ifm_buff1_12_address0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff0_12_address0 = grp_conv_write_fu_1047_ifm_buff0_12_address0.read();
        } else {
            ifm_buff0_12_address0 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff0_12_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff0_12_address1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff0_12_address1 = grp_conv_write_fu_1047_ifm_buff2_12_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff0_12_address1 = grp_conv_write_fu_1047_ifm_buff1_12_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff0_12_address1 = grp_conv_write_fu_1047_ifm_buff0_12_address1.read();
        } else {
            ifm_buff0_12_address1 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff0_12_address1 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff0_12_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff0_12_ce0 = grp_write_row_ifm_fu_1578_ifm_buff0_12_ce0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff0_12_ce0 = grp_conv_write_fu_1047_ifm_buff2_12_ce0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff0_12_ce0 = grp_conv_write_fu_1047_ifm_buff1_12_ce0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff0_12_ce0 = grp_conv_write_fu_1047_ifm_buff0_12_ce0.read();
        } else {
            ifm_buff0_12_ce0 = ap_const_logic_0;
        }
    } else {
        ifm_buff0_12_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff0_12_ce1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff0_12_ce1 = grp_conv_write_fu_1047_ifm_buff2_12_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff0_12_ce1 = grp_conv_write_fu_1047_ifm_buff1_12_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff0_12_ce1 = grp_conv_write_fu_1047_ifm_buff0_12_ce1.read();
        } else {
            ifm_buff0_12_ce1 = ap_const_logic_0;
        }
    } else {
        ifm_buff0_12_ce1 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff0_12_we0() {
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
         esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff0_12_we0 = grp_write_row_ifm_fu_1578_ifm_buff0_12_we0.read();
    } else {
        ifm_buff0_12_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff0_13_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff0_13_address0 = grp_write_row_ifm_fu_1578_ifm_buff0_13_address0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff0_13_address0 = grp_conv_write_fu_1047_ifm_buff2_13_address0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff0_13_address0 = grp_conv_write_fu_1047_ifm_buff1_13_address0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff0_13_address0 = grp_conv_write_fu_1047_ifm_buff0_13_address0.read();
        } else {
            ifm_buff0_13_address0 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff0_13_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff0_13_address1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff0_13_address1 = grp_conv_write_fu_1047_ifm_buff2_13_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff0_13_address1 = grp_conv_write_fu_1047_ifm_buff1_13_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff0_13_address1 = grp_conv_write_fu_1047_ifm_buff0_13_address1.read();
        } else {
            ifm_buff0_13_address1 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff0_13_address1 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff0_13_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff0_13_ce0 = grp_write_row_ifm_fu_1578_ifm_buff0_13_ce0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff0_13_ce0 = grp_conv_write_fu_1047_ifm_buff2_13_ce0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff0_13_ce0 = grp_conv_write_fu_1047_ifm_buff1_13_ce0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff0_13_ce0 = grp_conv_write_fu_1047_ifm_buff0_13_ce0.read();
        } else {
            ifm_buff0_13_ce0 = ap_const_logic_0;
        }
    } else {
        ifm_buff0_13_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff0_13_ce1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff0_13_ce1 = grp_conv_write_fu_1047_ifm_buff2_13_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff0_13_ce1 = grp_conv_write_fu_1047_ifm_buff1_13_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff0_13_ce1 = grp_conv_write_fu_1047_ifm_buff0_13_ce1.read();
        } else {
            ifm_buff0_13_ce1 = ap_const_logic_0;
        }
    } else {
        ifm_buff0_13_ce1 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff0_13_we0() {
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
         esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff0_13_we0 = grp_write_row_ifm_fu_1578_ifm_buff0_13_we0.read();
    } else {
        ifm_buff0_13_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff0_14_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff0_14_address0 = grp_write_row_ifm_fu_1578_ifm_buff0_14_address0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff0_14_address0 = grp_conv_write_fu_1047_ifm_buff2_14_address0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff0_14_address0 = grp_conv_write_fu_1047_ifm_buff1_14_address0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff0_14_address0 = grp_conv_write_fu_1047_ifm_buff0_14_address0.read();
        } else {
            ifm_buff0_14_address0 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff0_14_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff0_14_address1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff0_14_address1 = grp_conv_write_fu_1047_ifm_buff2_14_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff0_14_address1 = grp_conv_write_fu_1047_ifm_buff1_14_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff0_14_address1 = grp_conv_write_fu_1047_ifm_buff0_14_address1.read();
        } else {
            ifm_buff0_14_address1 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff0_14_address1 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff0_14_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff0_14_ce0 = grp_write_row_ifm_fu_1578_ifm_buff0_14_ce0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff0_14_ce0 = grp_conv_write_fu_1047_ifm_buff2_14_ce0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff0_14_ce0 = grp_conv_write_fu_1047_ifm_buff1_14_ce0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff0_14_ce0 = grp_conv_write_fu_1047_ifm_buff0_14_ce0.read();
        } else {
            ifm_buff0_14_ce0 = ap_const_logic_0;
        }
    } else {
        ifm_buff0_14_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff0_14_ce1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff0_14_ce1 = grp_conv_write_fu_1047_ifm_buff2_14_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff0_14_ce1 = grp_conv_write_fu_1047_ifm_buff1_14_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff0_14_ce1 = grp_conv_write_fu_1047_ifm_buff0_14_ce1.read();
        } else {
            ifm_buff0_14_ce1 = ap_const_logic_0;
        }
    } else {
        ifm_buff0_14_ce1 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff0_14_we0() {
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
         esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff0_14_we0 = grp_write_row_ifm_fu_1578_ifm_buff0_14_we0.read();
    } else {
        ifm_buff0_14_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff0_15_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff0_15_address0 = grp_write_row_ifm_fu_1578_ifm_buff0_15_address0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff0_15_address0 = grp_conv_write_fu_1047_ifm_buff2_15_address0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff0_15_address0 = grp_conv_write_fu_1047_ifm_buff1_15_address0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff0_15_address0 = grp_conv_write_fu_1047_ifm_buff0_15_address0.read();
        } else {
            ifm_buff0_15_address0 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff0_15_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff0_15_address1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff0_15_address1 = grp_conv_write_fu_1047_ifm_buff2_15_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff0_15_address1 = grp_conv_write_fu_1047_ifm_buff1_15_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff0_15_address1 = grp_conv_write_fu_1047_ifm_buff0_15_address1.read();
        } else {
            ifm_buff0_15_address1 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff0_15_address1 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff0_15_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff0_15_ce0 = grp_write_row_ifm_fu_1578_ifm_buff0_15_ce0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff0_15_ce0 = grp_conv_write_fu_1047_ifm_buff2_15_ce0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff0_15_ce0 = grp_conv_write_fu_1047_ifm_buff1_15_ce0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff0_15_ce0 = grp_conv_write_fu_1047_ifm_buff0_15_ce0.read();
        } else {
            ifm_buff0_15_ce0 = ap_const_logic_0;
        }
    } else {
        ifm_buff0_15_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff0_15_ce1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff0_15_ce1 = grp_conv_write_fu_1047_ifm_buff2_15_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff0_15_ce1 = grp_conv_write_fu_1047_ifm_buff1_15_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff0_15_ce1 = grp_conv_write_fu_1047_ifm_buff0_15_ce1.read();
        } else {
            ifm_buff0_15_ce1 = ap_const_logic_0;
        }
    } else {
        ifm_buff0_15_ce1 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff0_15_we0() {
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
         esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff0_15_we0 = grp_write_row_ifm_fu_1578_ifm_buff0_15_we0.read();
    } else {
        ifm_buff0_15_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff0_1_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff0_1_address0 = grp_write_row_ifm_fu_1578_ifm_buff0_1_address0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff0_1_address0 = grp_conv_write_fu_1047_ifm_buff2_1_address0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff0_1_address0 = grp_conv_write_fu_1047_ifm_buff1_1_address0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff0_1_address0 = grp_conv_write_fu_1047_ifm_buff0_1_address0.read();
        } else {
            ifm_buff0_1_address0 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff0_1_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff0_1_address1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff0_1_address1 = grp_conv_write_fu_1047_ifm_buff2_1_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff0_1_address1 = grp_conv_write_fu_1047_ifm_buff1_1_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff0_1_address1 = grp_conv_write_fu_1047_ifm_buff0_1_address1.read();
        } else {
            ifm_buff0_1_address1 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff0_1_address1 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff0_1_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff0_1_ce0 = grp_write_row_ifm_fu_1578_ifm_buff0_1_ce0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff0_1_ce0 = grp_conv_write_fu_1047_ifm_buff2_1_ce0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff0_1_ce0 = grp_conv_write_fu_1047_ifm_buff1_1_ce0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff0_1_ce0 = grp_conv_write_fu_1047_ifm_buff0_1_ce0.read();
        } else {
            ifm_buff0_1_ce0 = ap_const_logic_0;
        }
    } else {
        ifm_buff0_1_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff0_1_ce1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff0_1_ce1 = grp_conv_write_fu_1047_ifm_buff2_1_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff0_1_ce1 = grp_conv_write_fu_1047_ifm_buff1_1_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff0_1_ce1 = grp_conv_write_fu_1047_ifm_buff0_1_ce1.read();
        } else {
            ifm_buff0_1_ce1 = ap_const_logic_0;
        }
    } else {
        ifm_buff0_1_ce1 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff0_1_we0() {
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
         esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff0_1_we0 = grp_write_row_ifm_fu_1578_ifm_buff0_1_we0.read();
    } else {
        ifm_buff0_1_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff0_2_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff0_2_address0 = grp_write_row_ifm_fu_1578_ifm_buff0_2_address0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff0_2_address0 = grp_conv_write_fu_1047_ifm_buff2_2_address0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff0_2_address0 = grp_conv_write_fu_1047_ifm_buff1_2_address0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff0_2_address0 = grp_conv_write_fu_1047_ifm_buff0_2_address0.read();
        } else {
            ifm_buff0_2_address0 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff0_2_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff0_2_address1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff0_2_address1 = grp_conv_write_fu_1047_ifm_buff2_2_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff0_2_address1 = grp_conv_write_fu_1047_ifm_buff1_2_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff0_2_address1 = grp_conv_write_fu_1047_ifm_buff0_2_address1.read();
        } else {
            ifm_buff0_2_address1 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff0_2_address1 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff0_2_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff0_2_ce0 = grp_write_row_ifm_fu_1578_ifm_buff0_2_ce0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff0_2_ce0 = grp_conv_write_fu_1047_ifm_buff2_2_ce0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff0_2_ce0 = grp_conv_write_fu_1047_ifm_buff1_2_ce0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff0_2_ce0 = grp_conv_write_fu_1047_ifm_buff0_2_ce0.read();
        } else {
            ifm_buff0_2_ce0 = ap_const_logic_0;
        }
    } else {
        ifm_buff0_2_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff0_2_ce1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff0_2_ce1 = grp_conv_write_fu_1047_ifm_buff2_2_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff0_2_ce1 = grp_conv_write_fu_1047_ifm_buff1_2_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff0_2_ce1 = grp_conv_write_fu_1047_ifm_buff0_2_ce1.read();
        } else {
            ifm_buff0_2_ce1 = ap_const_logic_0;
        }
    } else {
        ifm_buff0_2_ce1 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff0_2_we0() {
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
         esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff0_2_we0 = grp_write_row_ifm_fu_1578_ifm_buff0_2_we0.read();
    } else {
        ifm_buff0_2_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff0_3_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff0_3_address0 = grp_write_row_ifm_fu_1578_ifm_buff0_3_address0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff0_3_address0 = grp_conv_write_fu_1047_ifm_buff2_3_address0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff0_3_address0 = grp_conv_write_fu_1047_ifm_buff1_3_address0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff0_3_address0 = grp_conv_write_fu_1047_ifm_buff0_3_address0.read();
        } else {
            ifm_buff0_3_address0 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff0_3_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff0_3_address1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff0_3_address1 = grp_conv_write_fu_1047_ifm_buff2_3_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff0_3_address1 = grp_conv_write_fu_1047_ifm_buff1_3_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff0_3_address1 = grp_conv_write_fu_1047_ifm_buff0_3_address1.read();
        } else {
            ifm_buff0_3_address1 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff0_3_address1 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff0_3_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff0_3_ce0 = grp_write_row_ifm_fu_1578_ifm_buff0_3_ce0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff0_3_ce0 = grp_conv_write_fu_1047_ifm_buff2_3_ce0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff0_3_ce0 = grp_conv_write_fu_1047_ifm_buff1_3_ce0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff0_3_ce0 = grp_conv_write_fu_1047_ifm_buff0_3_ce0.read();
        } else {
            ifm_buff0_3_ce0 = ap_const_logic_0;
        }
    } else {
        ifm_buff0_3_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff0_3_ce1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff0_3_ce1 = grp_conv_write_fu_1047_ifm_buff2_3_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff0_3_ce1 = grp_conv_write_fu_1047_ifm_buff1_3_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff0_3_ce1 = grp_conv_write_fu_1047_ifm_buff0_3_ce1.read();
        } else {
            ifm_buff0_3_ce1 = ap_const_logic_0;
        }
    } else {
        ifm_buff0_3_ce1 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff0_3_we0() {
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
         esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff0_3_we0 = grp_write_row_ifm_fu_1578_ifm_buff0_3_we0.read();
    } else {
        ifm_buff0_3_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff0_4_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff0_4_address0 = grp_write_row_ifm_fu_1578_ifm_buff0_4_address0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff0_4_address0 = grp_conv_write_fu_1047_ifm_buff2_4_address0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff0_4_address0 = grp_conv_write_fu_1047_ifm_buff1_4_address0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff0_4_address0 = grp_conv_write_fu_1047_ifm_buff0_4_address0.read();
        } else {
            ifm_buff0_4_address0 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff0_4_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff0_4_address1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff0_4_address1 = grp_conv_write_fu_1047_ifm_buff2_4_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff0_4_address1 = grp_conv_write_fu_1047_ifm_buff1_4_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff0_4_address1 = grp_conv_write_fu_1047_ifm_buff0_4_address1.read();
        } else {
            ifm_buff0_4_address1 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff0_4_address1 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff0_4_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff0_4_ce0 = grp_write_row_ifm_fu_1578_ifm_buff0_4_ce0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff0_4_ce0 = grp_conv_write_fu_1047_ifm_buff2_4_ce0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff0_4_ce0 = grp_conv_write_fu_1047_ifm_buff1_4_ce0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff0_4_ce0 = grp_conv_write_fu_1047_ifm_buff0_4_ce0.read();
        } else {
            ifm_buff0_4_ce0 = ap_const_logic_0;
        }
    } else {
        ifm_buff0_4_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff0_4_ce1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff0_4_ce1 = grp_conv_write_fu_1047_ifm_buff2_4_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff0_4_ce1 = grp_conv_write_fu_1047_ifm_buff1_4_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff0_4_ce1 = grp_conv_write_fu_1047_ifm_buff0_4_ce1.read();
        } else {
            ifm_buff0_4_ce1 = ap_const_logic_0;
        }
    } else {
        ifm_buff0_4_ce1 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff0_4_we0() {
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
         esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff0_4_we0 = grp_write_row_ifm_fu_1578_ifm_buff0_4_we0.read();
    } else {
        ifm_buff0_4_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff0_5_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff0_5_address0 = grp_write_row_ifm_fu_1578_ifm_buff0_5_address0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff0_5_address0 = grp_conv_write_fu_1047_ifm_buff2_5_address0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff0_5_address0 = grp_conv_write_fu_1047_ifm_buff1_5_address0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff0_5_address0 = grp_conv_write_fu_1047_ifm_buff0_5_address0.read();
        } else {
            ifm_buff0_5_address0 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff0_5_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff0_5_address1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff0_5_address1 = grp_conv_write_fu_1047_ifm_buff2_5_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff0_5_address1 = grp_conv_write_fu_1047_ifm_buff1_5_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff0_5_address1 = grp_conv_write_fu_1047_ifm_buff0_5_address1.read();
        } else {
            ifm_buff0_5_address1 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff0_5_address1 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff0_5_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff0_5_ce0 = grp_write_row_ifm_fu_1578_ifm_buff0_5_ce0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff0_5_ce0 = grp_conv_write_fu_1047_ifm_buff2_5_ce0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff0_5_ce0 = grp_conv_write_fu_1047_ifm_buff1_5_ce0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff0_5_ce0 = grp_conv_write_fu_1047_ifm_buff0_5_ce0.read();
        } else {
            ifm_buff0_5_ce0 = ap_const_logic_0;
        }
    } else {
        ifm_buff0_5_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff0_5_ce1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff0_5_ce1 = grp_conv_write_fu_1047_ifm_buff2_5_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff0_5_ce1 = grp_conv_write_fu_1047_ifm_buff1_5_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff0_5_ce1 = grp_conv_write_fu_1047_ifm_buff0_5_ce1.read();
        } else {
            ifm_buff0_5_ce1 = ap_const_logic_0;
        }
    } else {
        ifm_buff0_5_ce1 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff0_5_we0() {
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
         esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff0_5_we0 = grp_write_row_ifm_fu_1578_ifm_buff0_5_we0.read();
    } else {
        ifm_buff0_5_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff0_6_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff0_6_address0 = grp_write_row_ifm_fu_1578_ifm_buff0_6_address0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff0_6_address0 = grp_conv_write_fu_1047_ifm_buff2_6_address0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff0_6_address0 = grp_conv_write_fu_1047_ifm_buff1_6_address0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff0_6_address0 = grp_conv_write_fu_1047_ifm_buff0_6_address0.read();
        } else {
            ifm_buff0_6_address0 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff0_6_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff0_6_address1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff0_6_address1 = grp_conv_write_fu_1047_ifm_buff2_6_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff0_6_address1 = grp_conv_write_fu_1047_ifm_buff1_6_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff0_6_address1 = grp_conv_write_fu_1047_ifm_buff0_6_address1.read();
        } else {
            ifm_buff0_6_address1 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff0_6_address1 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff0_6_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff0_6_ce0 = grp_write_row_ifm_fu_1578_ifm_buff0_6_ce0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff0_6_ce0 = grp_conv_write_fu_1047_ifm_buff2_6_ce0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff0_6_ce0 = grp_conv_write_fu_1047_ifm_buff1_6_ce0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff0_6_ce0 = grp_conv_write_fu_1047_ifm_buff0_6_ce0.read();
        } else {
            ifm_buff0_6_ce0 = ap_const_logic_0;
        }
    } else {
        ifm_buff0_6_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff0_6_ce1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff0_6_ce1 = grp_conv_write_fu_1047_ifm_buff2_6_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff0_6_ce1 = grp_conv_write_fu_1047_ifm_buff1_6_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff0_6_ce1 = grp_conv_write_fu_1047_ifm_buff0_6_ce1.read();
        } else {
            ifm_buff0_6_ce1 = ap_const_logic_0;
        }
    } else {
        ifm_buff0_6_ce1 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff0_6_we0() {
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
         esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff0_6_we0 = grp_write_row_ifm_fu_1578_ifm_buff0_6_we0.read();
    } else {
        ifm_buff0_6_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff0_7_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff0_7_address0 = grp_write_row_ifm_fu_1578_ifm_buff0_7_address0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff0_7_address0 = grp_conv_write_fu_1047_ifm_buff2_7_address0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff0_7_address0 = grp_conv_write_fu_1047_ifm_buff1_7_address0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff0_7_address0 = grp_conv_write_fu_1047_ifm_buff0_7_address0.read();
        } else {
            ifm_buff0_7_address0 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff0_7_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff0_7_address1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff0_7_address1 = grp_conv_write_fu_1047_ifm_buff2_7_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff0_7_address1 = grp_conv_write_fu_1047_ifm_buff1_7_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff0_7_address1 = grp_conv_write_fu_1047_ifm_buff0_7_address1.read();
        } else {
            ifm_buff0_7_address1 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff0_7_address1 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff0_7_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff0_7_ce0 = grp_write_row_ifm_fu_1578_ifm_buff0_7_ce0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff0_7_ce0 = grp_conv_write_fu_1047_ifm_buff2_7_ce0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff0_7_ce0 = grp_conv_write_fu_1047_ifm_buff1_7_ce0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff0_7_ce0 = grp_conv_write_fu_1047_ifm_buff0_7_ce0.read();
        } else {
            ifm_buff0_7_ce0 = ap_const_logic_0;
        }
    } else {
        ifm_buff0_7_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff0_7_ce1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff0_7_ce1 = grp_conv_write_fu_1047_ifm_buff2_7_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff0_7_ce1 = grp_conv_write_fu_1047_ifm_buff1_7_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff0_7_ce1 = grp_conv_write_fu_1047_ifm_buff0_7_ce1.read();
        } else {
            ifm_buff0_7_ce1 = ap_const_logic_0;
        }
    } else {
        ifm_buff0_7_ce1 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff0_7_we0() {
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
         esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff0_7_we0 = grp_write_row_ifm_fu_1578_ifm_buff0_7_we0.read();
    } else {
        ifm_buff0_7_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff0_8_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff0_8_address0 = grp_write_row_ifm_fu_1578_ifm_buff0_8_address0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff0_8_address0 = grp_conv_write_fu_1047_ifm_buff2_8_address0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff0_8_address0 = grp_conv_write_fu_1047_ifm_buff1_8_address0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff0_8_address0 = grp_conv_write_fu_1047_ifm_buff0_8_address0.read();
        } else {
            ifm_buff0_8_address0 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff0_8_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff0_8_address1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff0_8_address1 = grp_conv_write_fu_1047_ifm_buff2_8_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff0_8_address1 = grp_conv_write_fu_1047_ifm_buff1_8_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff0_8_address1 = grp_conv_write_fu_1047_ifm_buff0_8_address1.read();
        } else {
            ifm_buff0_8_address1 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff0_8_address1 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff0_8_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff0_8_ce0 = grp_write_row_ifm_fu_1578_ifm_buff0_8_ce0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff0_8_ce0 = grp_conv_write_fu_1047_ifm_buff2_8_ce0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff0_8_ce0 = grp_conv_write_fu_1047_ifm_buff1_8_ce0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff0_8_ce0 = grp_conv_write_fu_1047_ifm_buff0_8_ce0.read();
        } else {
            ifm_buff0_8_ce0 = ap_const_logic_0;
        }
    } else {
        ifm_buff0_8_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff0_8_ce1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff0_8_ce1 = grp_conv_write_fu_1047_ifm_buff2_8_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff0_8_ce1 = grp_conv_write_fu_1047_ifm_buff1_8_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff0_8_ce1 = grp_conv_write_fu_1047_ifm_buff0_8_ce1.read();
        } else {
            ifm_buff0_8_ce1 = ap_const_logic_0;
        }
    } else {
        ifm_buff0_8_ce1 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff0_8_we0() {
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
         esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff0_8_we0 = grp_write_row_ifm_fu_1578_ifm_buff0_8_we0.read();
    } else {
        ifm_buff0_8_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff0_9_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff0_9_address0 = grp_write_row_ifm_fu_1578_ifm_buff0_9_address0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff0_9_address0 = grp_conv_write_fu_1047_ifm_buff2_9_address0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff0_9_address0 = grp_conv_write_fu_1047_ifm_buff1_9_address0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff0_9_address0 = grp_conv_write_fu_1047_ifm_buff0_9_address0.read();
        } else {
            ifm_buff0_9_address0 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff0_9_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff0_9_address1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff0_9_address1 = grp_conv_write_fu_1047_ifm_buff2_9_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff0_9_address1 = grp_conv_write_fu_1047_ifm_buff1_9_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff0_9_address1 = grp_conv_write_fu_1047_ifm_buff0_9_address1.read();
        } else {
            ifm_buff0_9_address1 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff0_9_address1 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff0_9_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff0_9_ce0 = grp_write_row_ifm_fu_1578_ifm_buff0_9_ce0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff0_9_ce0 = grp_conv_write_fu_1047_ifm_buff2_9_ce0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff0_9_ce0 = grp_conv_write_fu_1047_ifm_buff1_9_ce0.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff0_9_ce0 = grp_conv_write_fu_1047_ifm_buff0_9_ce0.read();
        } else {
            ifm_buff0_9_ce0 = ap_const_logic_0;
        }
    } else {
        ifm_buff0_9_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff0_9_ce1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff0_9_ce1 = grp_conv_write_fu_1047_ifm_buff2_9_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff0_9_ce1 = grp_conv_write_fu_1047_ifm_buff1_9_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff0_9_ce1 = grp_conv_write_fu_1047_ifm_buff0_9_ce1.read();
        } else {
            ifm_buff0_9_ce1 = ap_const_logic_0;
        }
    } else {
        ifm_buff0_9_ce1 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff0_9_we0() {
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
         esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff0_9_we0 = grp_write_row_ifm_fu_1578_ifm_buff0_9_we0.read();
    } else {
        ifm_buff0_9_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff1_0_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff1_0_address0 = grp_load_cifm_data_fu_1603_ifm_buff0_0_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op308_call_state4.read()))) {
        ifm_buff1_0_address0 = grp_write_row_ifm_fu_1578_ifm_buff0_0_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read()))) {
        ifm_buff1_0_address0 = grp_conv_write_fu_1047_ifm_buff2_0_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read()))) {
        ifm_buff1_0_address0 = grp_conv_write_fu_1047_ifm_buff1_0_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff1_0_address0 = grp_conv_write_fu_1047_ifm_buff0_0_address0.read();
    } else {
        ifm_buff1_0_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff1_0_address1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff1_0_address1 = grp_conv_write_fu_1047_ifm_buff2_0_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff1_0_address1 = grp_conv_write_fu_1047_ifm_buff1_0_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff1_0_address1 = grp_conv_write_fu_1047_ifm_buff0_0_address1.read();
        } else {
            ifm_buff1_0_address1 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff1_0_address1 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff1_0_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff1_0_ce0 = grp_load_cifm_data_fu_1603_ifm_buff0_0_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op308_call_state4.read()))) {
        ifm_buff1_0_ce0 = grp_write_row_ifm_fu_1578_ifm_buff0_0_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read()))) {
        ifm_buff1_0_ce0 = grp_conv_write_fu_1047_ifm_buff2_0_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read()))) {
        ifm_buff1_0_ce0 = grp_conv_write_fu_1047_ifm_buff1_0_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff1_0_ce0 = grp_conv_write_fu_1047_ifm_buff0_0_ce0.read();
    } else {
        ifm_buff1_0_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff1_0_ce1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff1_0_ce1 = grp_conv_write_fu_1047_ifm_buff2_0_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff1_0_ce1 = grp_conv_write_fu_1047_ifm_buff1_0_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff1_0_ce1 = grp_conv_write_fu_1047_ifm_buff0_0_ce1.read();
        } else {
            ifm_buff1_0_ce1 = ap_const_logic_0;
        }
    } else {
        ifm_buff1_0_ce1 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff1_0_d0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff1_0_d0 = grp_load_cifm_data_fu_1603_ifm_buff0_0_d0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op308_call_state4.read()))) {
        ifm_buff1_0_d0 = grp_write_row_ifm_fu_1578_ifm_buff0_0_d0.read();
    } else {
        ifm_buff1_0_d0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_ifm_buff1_0_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff1_0_we0 = grp_load_cifm_data_fu_1603_ifm_buff0_0_we0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op308_call_state4.read()))) {
        ifm_buff1_0_we0 = grp_write_row_ifm_fu_1578_ifm_buff0_0_we0.read();
    } else {
        ifm_buff1_0_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff1_10_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff1_10_address0 = grp_load_cifm_data_fu_1603_ifm_buff0_10_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op308_call_state4.read()))) {
        ifm_buff1_10_address0 = grp_write_row_ifm_fu_1578_ifm_buff0_10_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read()))) {
        ifm_buff1_10_address0 = grp_conv_write_fu_1047_ifm_buff2_10_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read()))) {
        ifm_buff1_10_address0 = grp_conv_write_fu_1047_ifm_buff1_10_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff1_10_address0 = grp_conv_write_fu_1047_ifm_buff0_10_address0.read();
    } else {
        ifm_buff1_10_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff1_10_address1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff1_10_address1 = grp_conv_write_fu_1047_ifm_buff2_10_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff1_10_address1 = grp_conv_write_fu_1047_ifm_buff1_10_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff1_10_address1 = grp_conv_write_fu_1047_ifm_buff0_10_address1.read();
        } else {
            ifm_buff1_10_address1 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff1_10_address1 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff1_10_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff1_10_ce0 = grp_load_cifm_data_fu_1603_ifm_buff0_10_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op308_call_state4.read()))) {
        ifm_buff1_10_ce0 = grp_write_row_ifm_fu_1578_ifm_buff0_10_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read()))) {
        ifm_buff1_10_ce0 = grp_conv_write_fu_1047_ifm_buff2_10_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read()))) {
        ifm_buff1_10_ce0 = grp_conv_write_fu_1047_ifm_buff1_10_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff1_10_ce0 = grp_conv_write_fu_1047_ifm_buff0_10_ce0.read();
    } else {
        ifm_buff1_10_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff1_10_ce1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff1_10_ce1 = grp_conv_write_fu_1047_ifm_buff2_10_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff1_10_ce1 = grp_conv_write_fu_1047_ifm_buff1_10_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff1_10_ce1 = grp_conv_write_fu_1047_ifm_buff0_10_ce1.read();
        } else {
            ifm_buff1_10_ce1 = ap_const_logic_0;
        }
    } else {
        ifm_buff1_10_ce1 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff1_10_d0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff1_10_d0 = grp_load_cifm_data_fu_1603_ifm_buff0_10_d0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op308_call_state4.read()))) {
        ifm_buff1_10_d0 = grp_write_row_ifm_fu_1578_ifm_buff0_10_d0.read();
    } else {
        ifm_buff1_10_d0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_ifm_buff1_10_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff1_10_we0 = grp_load_cifm_data_fu_1603_ifm_buff0_10_we0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op308_call_state4.read()))) {
        ifm_buff1_10_we0 = grp_write_row_ifm_fu_1578_ifm_buff0_10_we0.read();
    } else {
        ifm_buff1_10_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff1_11_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff1_11_address0 = grp_load_cifm_data_fu_1603_ifm_buff0_11_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op308_call_state4.read()))) {
        ifm_buff1_11_address0 = grp_write_row_ifm_fu_1578_ifm_buff0_11_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read()))) {
        ifm_buff1_11_address0 = grp_conv_write_fu_1047_ifm_buff2_11_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read()))) {
        ifm_buff1_11_address0 = grp_conv_write_fu_1047_ifm_buff1_11_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff1_11_address0 = grp_conv_write_fu_1047_ifm_buff0_11_address0.read();
    } else {
        ifm_buff1_11_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff1_11_address1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff1_11_address1 = grp_conv_write_fu_1047_ifm_buff2_11_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff1_11_address1 = grp_conv_write_fu_1047_ifm_buff1_11_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff1_11_address1 = grp_conv_write_fu_1047_ifm_buff0_11_address1.read();
        } else {
            ifm_buff1_11_address1 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff1_11_address1 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff1_11_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff1_11_ce0 = grp_load_cifm_data_fu_1603_ifm_buff0_11_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op308_call_state4.read()))) {
        ifm_buff1_11_ce0 = grp_write_row_ifm_fu_1578_ifm_buff0_11_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read()))) {
        ifm_buff1_11_ce0 = grp_conv_write_fu_1047_ifm_buff2_11_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read()))) {
        ifm_buff1_11_ce0 = grp_conv_write_fu_1047_ifm_buff1_11_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff1_11_ce0 = grp_conv_write_fu_1047_ifm_buff0_11_ce0.read();
    } else {
        ifm_buff1_11_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff1_11_ce1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff1_11_ce1 = grp_conv_write_fu_1047_ifm_buff2_11_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff1_11_ce1 = grp_conv_write_fu_1047_ifm_buff1_11_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff1_11_ce1 = grp_conv_write_fu_1047_ifm_buff0_11_ce1.read();
        } else {
            ifm_buff1_11_ce1 = ap_const_logic_0;
        }
    } else {
        ifm_buff1_11_ce1 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff1_11_d0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff1_11_d0 = grp_load_cifm_data_fu_1603_ifm_buff0_11_d0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op308_call_state4.read()))) {
        ifm_buff1_11_d0 = grp_write_row_ifm_fu_1578_ifm_buff0_11_d0.read();
    } else {
        ifm_buff1_11_d0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_ifm_buff1_11_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff1_11_we0 = grp_load_cifm_data_fu_1603_ifm_buff0_11_we0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op308_call_state4.read()))) {
        ifm_buff1_11_we0 = grp_write_row_ifm_fu_1578_ifm_buff0_11_we0.read();
    } else {
        ifm_buff1_11_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff1_12_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff1_12_address0 = grp_load_cifm_data_fu_1603_ifm_buff0_12_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op308_call_state4.read()))) {
        ifm_buff1_12_address0 = grp_write_row_ifm_fu_1578_ifm_buff0_12_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read()))) {
        ifm_buff1_12_address0 = grp_conv_write_fu_1047_ifm_buff2_12_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read()))) {
        ifm_buff1_12_address0 = grp_conv_write_fu_1047_ifm_buff1_12_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff1_12_address0 = grp_conv_write_fu_1047_ifm_buff0_12_address0.read();
    } else {
        ifm_buff1_12_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff1_12_address1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff1_12_address1 = grp_conv_write_fu_1047_ifm_buff2_12_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff1_12_address1 = grp_conv_write_fu_1047_ifm_buff1_12_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff1_12_address1 = grp_conv_write_fu_1047_ifm_buff0_12_address1.read();
        } else {
            ifm_buff1_12_address1 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff1_12_address1 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff1_12_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff1_12_ce0 = grp_load_cifm_data_fu_1603_ifm_buff0_12_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op308_call_state4.read()))) {
        ifm_buff1_12_ce0 = grp_write_row_ifm_fu_1578_ifm_buff0_12_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read()))) {
        ifm_buff1_12_ce0 = grp_conv_write_fu_1047_ifm_buff2_12_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read()))) {
        ifm_buff1_12_ce0 = grp_conv_write_fu_1047_ifm_buff1_12_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff1_12_ce0 = grp_conv_write_fu_1047_ifm_buff0_12_ce0.read();
    } else {
        ifm_buff1_12_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff1_12_ce1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff1_12_ce1 = grp_conv_write_fu_1047_ifm_buff2_12_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff1_12_ce1 = grp_conv_write_fu_1047_ifm_buff1_12_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff1_12_ce1 = grp_conv_write_fu_1047_ifm_buff0_12_ce1.read();
        } else {
            ifm_buff1_12_ce1 = ap_const_logic_0;
        }
    } else {
        ifm_buff1_12_ce1 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff1_12_d0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff1_12_d0 = grp_load_cifm_data_fu_1603_ifm_buff0_12_d0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op308_call_state4.read()))) {
        ifm_buff1_12_d0 = grp_write_row_ifm_fu_1578_ifm_buff0_12_d0.read();
    } else {
        ifm_buff1_12_d0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_ifm_buff1_12_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff1_12_we0 = grp_load_cifm_data_fu_1603_ifm_buff0_12_we0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op308_call_state4.read()))) {
        ifm_buff1_12_we0 = grp_write_row_ifm_fu_1578_ifm_buff0_12_we0.read();
    } else {
        ifm_buff1_12_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff1_13_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff1_13_address0 = grp_load_cifm_data_fu_1603_ifm_buff0_13_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op308_call_state4.read()))) {
        ifm_buff1_13_address0 = grp_write_row_ifm_fu_1578_ifm_buff0_13_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read()))) {
        ifm_buff1_13_address0 = grp_conv_write_fu_1047_ifm_buff2_13_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read()))) {
        ifm_buff1_13_address0 = grp_conv_write_fu_1047_ifm_buff1_13_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff1_13_address0 = grp_conv_write_fu_1047_ifm_buff0_13_address0.read();
    } else {
        ifm_buff1_13_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff1_13_address1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff1_13_address1 = grp_conv_write_fu_1047_ifm_buff2_13_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff1_13_address1 = grp_conv_write_fu_1047_ifm_buff1_13_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff1_13_address1 = grp_conv_write_fu_1047_ifm_buff0_13_address1.read();
        } else {
            ifm_buff1_13_address1 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff1_13_address1 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff1_13_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff1_13_ce0 = grp_load_cifm_data_fu_1603_ifm_buff0_13_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op308_call_state4.read()))) {
        ifm_buff1_13_ce0 = grp_write_row_ifm_fu_1578_ifm_buff0_13_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read()))) {
        ifm_buff1_13_ce0 = grp_conv_write_fu_1047_ifm_buff2_13_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read()))) {
        ifm_buff1_13_ce0 = grp_conv_write_fu_1047_ifm_buff1_13_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff1_13_ce0 = grp_conv_write_fu_1047_ifm_buff0_13_ce0.read();
    } else {
        ifm_buff1_13_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff1_13_ce1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff1_13_ce1 = grp_conv_write_fu_1047_ifm_buff2_13_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff1_13_ce1 = grp_conv_write_fu_1047_ifm_buff1_13_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff1_13_ce1 = grp_conv_write_fu_1047_ifm_buff0_13_ce1.read();
        } else {
            ifm_buff1_13_ce1 = ap_const_logic_0;
        }
    } else {
        ifm_buff1_13_ce1 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff1_13_d0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff1_13_d0 = grp_load_cifm_data_fu_1603_ifm_buff0_13_d0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op308_call_state4.read()))) {
        ifm_buff1_13_d0 = grp_write_row_ifm_fu_1578_ifm_buff0_13_d0.read();
    } else {
        ifm_buff1_13_d0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_ifm_buff1_13_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff1_13_we0 = grp_load_cifm_data_fu_1603_ifm_buff0_13_we0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op308_call_state4.read()))) {
        ifm_buff1_13_we0 = grp_write_row_ifm_fu_1578_ifm_buff0_13_we0.read();
    } else {
        ifm_buff1_13_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff1_14_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff1_14_address0 = grp_load_cifm_data_fu_1603_ifm_buff0_14_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op308_call_state4.read()))) {
        ifm_buff1_14_address0 = grp_write_row_ifm_fu_1578_ifm_buff0_14_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read()))) {
        ifm_buff1_14_address0 = grp_conv_write_fu_1047_ifm_buff2_14_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read()))) {
        ifm_buff1_14_address0 = grp_conv_write_fu_1047_ifm_buff1_14_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff1_14_address0 = grp_conv_write_fu_1047_ifm_buff0_14_address0.read();
    } else {
        ifm_buff1_14_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff1_14_address1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff1_14_address1 = grp_conv_write_fu_1047_ifm_buff2_14_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff1_14_address1 = grp_conv_write_fu_1047_ifm_buff1_14_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff1_14_address1 = grp_conv_write_fu_1047_ifm_buff0_14_address1.read();
        } else {
            ifm_buff1_14_address1 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff1_14_address1 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff1_14_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff1_14_ce0 = grp_load_cifm_data_fu_1603_ifm_buff0_14_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op308_call_state4.read()))) {
        ifm_buff1_14_ce0 = grp_write_row_ifm_fu_1578_ifm_buff0_14_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read()))) {
        ifm_buff1_14_ce0 = grp_conv_write_fu_1047_ifm_buff2_14_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read()))) {
        ifm_buff1_14_ce0 = grp_conv_write_fu_1047_ifm_buff1_14_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff1_14_ce0 = grp_conv_write_fu_1047_ifm_buff0_14_ce0.read();
    } else {
        ifm_buff1_14_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff1_14_ce1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff1_14_ce1 = grp_conv_write_fu_1047_ifm_buff2_14_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff1_14_ce1 = grp_conv_write_fu_1047_ifm_buff1_14_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff1_14_ce1 = grp_conv_write_fu_1047_ifm_buff0_14_ce1.read();
        } else {
            ifm_buff1_14_ce1 = ap_const_logic_0;
        }
    } else {
        ifm_buff1_14_ce1 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff1_14_d0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff1_14_d0 = grp_load_cifm_data_fu_1603_ifm_buff0_14_d0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op308_call_state4.read()))) {
        ifm_buff1_14_d0 = grp_write_row_ifm_fu_1578_ifm_buff0_14_d0.read();
    } else {
        ifm_buff1_14_d0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_ifm_buff1_14_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff1_14_we0 = grp_load_cifm_data_fu_1603_ifm_buff0_14_we0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op308_call_state4.read()))) {
        ifm_buff1_14_we0 = grp_write_row_ifm_fu_1578_ifm_buff0_14_we0.read();
    } else {
        ifm_buff1_14_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff1_15_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff1_15_address0 = grp_load_cifm_data_fu_1603_ifm_buff0_15_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op308_call_state4.read()))) {
        ifm_buff1_15_address0 = grp_write_row_ifm_fu_1578_ifm_buff0_15_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read()))) {
        ifm_buff1_15_address0 = grp_conv_write_fu_1047_ifm_buff2_15_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read()))) {
        ifm_buff1_15_address0 = grp_conv_write_fu_1047_ifm_buff1_15_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff1_15_address0 = grp_conv_write_fu_1047_ifm_buff0_15_address0.read();
    } else {
        ifm_buff1_15_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff1_15_address1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff1_15_address1 = grp_conv_write_fu_1047_ifm_buff2_15_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff1_15_address1 = grp_conv_write_fu_1047_ifm_buff1_15_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff1_15_address1 = grp_conv_write_fu_1047_ifm_buff0_15_address1.read();
        } else {
            ifm_buff1_15_address1 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff1_15_address1 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff1_15_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff1_15_ce0 = grp_load_cifm_data_fu_1603_ifm_buff0_15_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op308_call_state4.read()))) {
        ifm_buff1_15_ce0 = grp_write_row_ifm_fu_1578_ifm_buff0_15_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read()))) {
        ifm_buff1_15_ce0 = grp_conv_write_fu_1047_ifm_buff2_15_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read()))) {
        ifm_buff1_15_ce0 = grp_conv_write_fu_1047_ifm_buff1_15_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff1_15_ce0 = grp_conv_write_fu_1047_ifm_buff0_15_ce0.read();
    } else {
        ifm_buff1_15_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff1_15_ce1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff1_15_ce1 = grp_conv_write_fu_1047_ifm_buff2_15_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff1_15_ce1 = grp_conv_write_fu_1047_ifm_buff1_15_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff1_15_ce1 = grp_conv_write_fu_1047_ifm_buff0_15_ce1.read();
        } else {
            ifm_buff1_15_ce1 = ap_const_logic_0;
        }
    } else {
        ifm_buff1_15_ce1 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff1_15_d0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff1_15_d0 = grp_load_cifm_data_fu_1603_ifm_buff0_15_d0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op308_call_state4.read()))) {
        ifm_buff1_15_d0 = grp_write_row_ifm_fu_1578_ifm_buff0_15_d0.read();
    } else {
        ifm_buff1_15_d0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_ifm_buff1_15_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff1_15_we0 = grp_load_cifm_data_fu_1603_ifm_buff0_15_we0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op308_call_state4.read()))) {
        ifm_buff1_15_we0 = grp_write_row_ifm_fu_1578_ifm_buff0_15_we0.read();
    } else {
        ifm_buff1_15_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff1_1_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff1_1_address0 = grp_load_cifm_data_fu_1603_ifm_buff0_1_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op308_call_state4.read()))) {
        ifm_buff1_1_address0 = grp_write_row_ifm_fu_1578_ifm_buff0_1_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read()))) {
        ifm_buff1_1_address0 = grp_conv_write_fu_1047_ifm_buff2_1_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read()))) {
        ifm_buff1_1_address0 = grp_conv_write_fu_1047_ifm_buff1_1_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff1_1_address0 = grp_conv_write_fu_1047_ifm_buff0_1_address0.read();
    } else {
        ifm_buff1_1_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff1_1_address1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff1_1_address1 = grp_conv_write_fu_1047_ifm_buff2_1_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff1_1_address1 = grp_conv_write_fu_1047_ifm_buff1_1_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff1_1_address1 = grp_conv_write_fu_1047_ifm_buff0_1_address1.read();
        } else {
            ifm_buff1_1_address1 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff1_1_address1 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff1_1_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff1_1_ce0 = grp_load_cifm_data_fu_1603_ifm_buff0_1_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op308_call_state4.read()))) {
        ifm_buff1_1_ce0 = grp_write_row_ifm_fu_1578_ifm_buff0_1_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read()))) {
        ifm_buff1_1_ce0 = grp_conv_write_fu_1047_ifm_buff2_1_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read()))) {
        ifm_buff1_1_ce0 = grp_conv_write_fu_1047_ifm_buff1_1_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff1_1_ce0 = grp_conv_write_fu_1047_ifm_buff0_1_ce0.read();
    } else {
        ifm_buff1_1_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff1_1_ce1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff1_1_ce1 = grp_conv_write_fu_1047_ifm_buff2_1_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff1_1_ce1 = grp_conv_write_fu_1047_ifm_buff1_1_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff1_1_ce1 = grp_conv_write_fu_1047_ifm_buff0_1_ce1.read();
        } else {
            ifm_buff1_1_ce1 = ap_const_logic_0;
        }
    } else {
        ifm_buff1_1_ce1 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff1_1_d0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff1_1_d0 = grp_load_cifm_data_fu_1603_ifm_buff0_1_d0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op308_call_state4.read()))) {
        ifm_buff1_1_d0 = grp_write_row_ifm_fu_1578_ifm_buff0_1_d0.read();
    } else {
        ifm_buff1_1_d0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_ifm_buff1_1_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff1_1_we0 = grp_load_cifm_data_fu_1603_ifm_buff0_1_we0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op308_call_state4.read()))) {
        ifm_buff1_1_we0 = grp_write_row_ifm_fu_1578_ifm_buff0_1_we0.read();
    } else {
        ifm_buff1_1_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff1_2_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff1_2_address0 = grp_load_cifm_data_fu_1603_ifm_buff0_2_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op308_call_state4.read()))) {
        ifm_buff1_2_address0 = grp_write_row_ifm_fu_1578_ifm_buff0_2_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read()))) {
        ifm_buff1_2_address0 = grp_conv_write_fu_1047_ifm_buff2_2_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read()))) {
        ifm_buff1_2_address0 = grp_conv_write_fu_1047_ifm_buff1_2_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff1_2_address0 = grp_conv_write_fu_1047_ifm_buff0_2_address0.read();
    } else {
        ifm_buff1_2_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff1_2_address1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff1_2_address1 = grp_conv_write_fu_1047_ifm_buff2_2_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff1_2_address1 = grp_conv_write_fu_1047_ifm_buff1_2_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff1_2_address1 = grp_conv_write_fu_1047_ifm_buff0_2_address1.read();
        } else {
            ifm_buff1_2_address1 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff1_2_address1 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff1_2_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff1_2_ce0 = grp_load_cifm_data_fu_1603_ifm_buff0_2_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op308_call_state4.read()))) {
        ifm_buff1_2_ce0 = grp_write_row_ifm_fu_1578_ifm_buff0_2_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read()))) {
        ifm_buff1_2_ce0 = grp_conv_write_fu_1047_ifm_buff2_2_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read()))) {
        ifm_buff1_2_ce0 = grp_conv_write_fu_1047_ifm_buff1_2_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff1_2_ce0 = grp_conv_write_fu_1047_ifm_buff0_2_ce0.read();
    } else {
        ifm_buff1_2_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff1_2_ce1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff1_2_ce1 = grp_conv_write_fu_1047_ifm_buff2_2_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff1_2_ce1 = grp_conv_write_fu_1047_ifm_buff1_2_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff1_2_ce1 = grp_conv_write_fu_1047_ifm_buff0_2_ce1.read();
        } else {
            ifm_buff1_2_ce1 = ap_const_logic_0;
        }
    } else {
        ifm_buff1_2_ce1 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff1_2_d0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff1_2_d0 = grp_load_cifm_data_fu_1603_ifm_buff0_2_d0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op308_call_state4.read()))) {
        ifm_buff1_2_d0 = grp_write_row_ifm_fu_1578_ifm_buff0_2_d0.read();
    } else {
        ifm_buff1_2_d0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_ifm_buff1_2_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff1_2_we0 = grp_load_cifm_data_fu_1603_ifm_buff0_2_we0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op308_call_state4.read()))) {
        ifm_buff1_2_we0 = grp_write_row_ifm_fu_1578_ifm_buff0_2_we0.read();
    } else {
        ifm_buff1_2_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff1_3_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff1_3_address0 = grp_load_cifm_data_fu_1603_ifm_buff0_3_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op308_call_state4.read()))) {
        ifm_buff1_3_address0 = grp_write_row_ifm_fu_1578_ifm_buff0_3_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read()))) {
        ifm_buff1_3_address0 = grp_conv_write_fu_1047_ifm_buff2_3_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read()))) {
        ifm_buff1_3_address0 = grp_conv_write_fu_1047_ifm_buff1_3_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff1_3_address0 = grp_conv_write_fu_1047_ifm_buff0_3_address0.read();
    } else {
        ifm_buff1_3_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff1_3_address1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff1_3_address1 = grp_conv_write_fu_1047_ifm_buff2_3_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff1_3_address1 = grp_conv_write_fu_1047_ifm_buff1_3_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff1_3_address1 = grp_conv_write_fu_1047_ifm_buff0_3_address1.read();
        } else {
            ifm_buff1_3_address1 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff1_3_address1 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff1_3_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff1_3_ce0 = grp_load_cifm_data_fu_1603_ifm_buff0_3_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op308_call_state4.read()))) {
        ifm_buff1_3_ce0 = grp_write_row_ifm_fu_1578_ifm_buff0_3_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read()))) {
        ifm_buff1_3_ce0 = grp_conv_write_fu_1047_ifm_buff2_3_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read()))) {
        ifm_buff1_3_ce0 = grp_conv_write_fu_1047_ifm_buff1_3_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff1_3_ce0 = grp_conv_write_fu_1047_ifm_buff0_3_ce0.read();
    } else {
        ifm_buff1_3_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff1_3_ce1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff1_3_ce1 = grp_conv_write_fu_1047_ifm_buff2_3_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff1_3_ce1 = grp_conv_write_fu_1047_ifm_buff1_3_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff1_3_ce1 = grp_conv_write_fu_1047_ifm_buff0_3_ce1.read();
        } else {
            ifm_buff1_3_ce1 = ap_const_logic_0;
        }
    } else {
        ifm_buff1_3_ce1 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff1_3_d0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff1_3_d0 = grp_load_cifm_data_fu_1603_ifm_buff0_3_d0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op308_call_state4.read()))) {
        ifm_buff1_3_d0 = grp_write_row_ifm_fu_1578_ifm_buff0_3_d0.read();
    } else {
        ifm_buff1_3_d0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_ifm_buff1_3_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff1_3_we0 = grp_load_cifm_data_fu_1603_ifm_buff0_3_we0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op308_call_state4.read()))) {
        ifm_buff1_3_we0 = grp_write_row_ifm_fu_1578_ifm_buff0_3_we0.read();
    } else {
        ifm_buff1_3_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff1_4_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff1_4_address0 = grp_load_cifm_data_fu_1603_ifm_buff0_4_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op308_call_state4.read()))) {
        ifm_buff1_4_address0 = grp_write_row_ifm_fu_1578_ifm_buff0_4_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read()))) {
        ifm_buff1_4_address0 = grp_conv_write_fu_1047_ifm_buff2_4_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read()))) {
        ifm_buff1_4_address0 = grp_conv_write_fu_1047_ifm_buff1_4_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff1_4_address0 = grp_conv_write_fu_1047_ifm_buff0_4_address0.read();
    } else {
        ifm_buff1_4_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff1_4_address1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff1_4_address1 = grp_conv_write_fu_1047_ifm_buff2_4_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff1_4_address1 = grp_conv_write_fu_1047_ifm_buff1_4_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff1_4_address1 = grp_conv_write_fu_1047_ifm_buff0_4_address1.read();
        } else {
            ifm_buff1_4_address1 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff1_4_address1 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff1_4_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff1_4_ce0 = grp_load_cifm_data_fu_1603_ifm_buff0_4_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op308_call_state4.read()))) {
        ifm_buff1_4_ce0 = grp_write_row_ifm_fu_1578_ifm_buff0_4_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read()))) {
        ifm_buff1_4_ce0 = grp_conv_write_fu_1047_ifm_buff2_4_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read()))) {
        ifm_buff1_4_ce0 = grp_conv_write_fu_1047_ifm_buff1_4_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff1_4_ce0 = grp_conv_write_fu_1047_ifm_buff0_4_ce0.read();
    } else {
        ifm_buff1_4_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff1_4_ce1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff1_4_ce1 = grp_conv_write_fu_1047_ifm_buff2_4_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff1_4_ce1 = grp_conv_write_fu_1047_ifm_buff1_4_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff1_4_ce1 = grp_conv_write_fu_1047_ifm_buff0_4_ce1.read();
        } else {
            ifm_buff1_4_ce1 = ap_const_logic_0;
        }
    } else {
        ifm_buff1_4_ce1 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff1_4_d0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff1_4_d0 = grp_load_cifm_data_fu_1603_ifm_buff0_4_d0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op308_call_state4.read()))) {
        ifm_buff1_4_d0 = grp_write_row_ifm_fu_1578_ifm_buff0_4_d0.read();
    } else {
        ifm_buff1_4_d0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_ifm_buff1_4_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff1_4_we0 = grp_load_cifm_data_fu_1603_ifm_buff0_4_we0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op308_call_state4.read()))) {
        ifm_buff1_4_we0 = grp_write_row_ifm_fu_1578_ifm_buff0_4_we0.read();
    } else {
        ifm_buff1_4_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff1_5_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff1_5_address0 = grp_load_cifm_data_fu_1603_ifm_buff0_5_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op308_call_state4.read()))) {
        ifm_buff1_5_address0 = grp_write_row_ifm_fu_1578_ifm_buff0_5_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read()))) {
        ifm_buff1_5_address0 = grp_conv_write_fu_1047_ifm_buff2_5_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read()))) {
        ifm_buff1_5_address0 = grp_conv_write_fu_1047_ifm_buff1_5_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff1_5_address0 = grp_conv_write_fu_1047_ifm_buff0_5_address0.read();
    } else {
        ifm_buff1_5_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff1_5_address1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff1_5_address1 = grp_conv_write_fu_1047_ifm_buff2_5_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff1_5_address1 = grp_conv_write_fu_1047_ifm_buff1_5_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff1_5_address1 = grp_conv_write_fu_1047_ifm_buff0_5_address1.read();
        } else {
            ifm_buff1_5_address1 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff1_5_address1 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff1_5_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff1_5_ce0 = grp_load_cifm_data_fu_1603_ifm_buff0_5_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op308_call_state4.read()))) {
        ifm_buff1_5_ce0 = grp_write_row_ifm_fu_1578_ifm_buff0_5_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read()))) {
        ifm_buff1_5_ce0 = grp_conv_write_fu_1047_ifm_buff2_5_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read()))) {
        ifm_buff1_5_ce0 = grp_conv_write_fu_1047_ifm_buff1_5_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff1_5_ce0 = grp_conv_write_fu_1047_ifm_buff0_5_ce0.read();
    } else {
        ifm_buff1_5_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff1_5_ce1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff1_5_ce1 = grp_conv_write_fu_1047_ifm_buff2_5_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff1_5_ce1 = grp_conv_write_fu_1047_ifm_buff1_5_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff1_5_ce1 = grp_conv_write_fu_1047_ifm_buff0_5_ce1.read();
        } else {
            ifm_buff1_5_ce1 = ap_const_logic_0;
        }
    } else {
        ifm_buff1_5_ce1 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff1_5_d0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff1_5_d0 = grp_load_cifm_data_fu_1603_ifm_buff0_5_d0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op308_call_state4.read()))) {
        ifm_buff1_5_d0 = grp_write_row_ifm_fu_1578_ifm_buff0_5_d0.read();
    } else {
        ifm_buff1_5_d0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_ifm_buff1_5_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff1_5_we0 = grp_load_cifm_data_fu_1603_ifm_buff0_5_we0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op308_call_state4.read()))) {
        ifm_buff1_5_we0 = grp_write_row_ifm_fu_1578_ifm_buff0_5_we0.read();
    } else {
        ifm_buff1_5_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff1_6_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff1_6_address0 = grp_load_cifm_data_fu_1603_ifm_buff0_6_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op308_call_state4.read()))) {
        ifm_buff1_6_address0 = grp_write_row_ifm_fu_1578_ifm_buff0_6_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read()))) {
        ifm_buff1_6_address0 = grp_conv_write_fu_1047_ifm_buff2_6_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read()))) {
        ifm_buff1_6_address0 = grp_conv_write_fu_1047_ifm_buff1_6_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff1_6_address0 = grp_conv_write_fu_1047_ifm_buff0_6_address0.read();
    } else {
        ifm_buff1_6_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff1_6_address1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff1_6_address1 = grp_conv_write_fu_1047_ifm_buff2_6_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff1_6_address1 = grp_conv_write_fu_1047_ifm_buff1_6_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff1_6_address1 = grp_conv_write_fu_1047_ifm_buff0_6_address1.read();
        } else {
            ifm_buff1_6_address1 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff1_6_address1 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff1_6_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff1_6_ce0 = grp_load_cifm_data_fu_1603_ifm_buff0_6_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op308_call_state4.read()))) {
        ifm_buff1_6_ce0 = grp_write_row_ifm_fu_1578_ifm_buff0_6_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read()))) {
        ifm_buff1_6_ce0 = grp_conv_write_fu_1047_ifm_buff2_6_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read()))) {
        ifm_buff1_6_ce0 = grp_conv_write_fu_1047_ifm_buff1_6_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff1_6_ce0 = grp_conv_write_fu_1047_ifm_buff0_6_ce0.read();
    } else {
        ifm_buff1_6_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff1_6_ce1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff1_6_ce1 = grp_conv_write_fu_1047_ifm_buff2_6_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff1_6_ce1 = grp_conv_write_fu_1047_ifm_buff1_6_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff1_6_ce1 = grp_conv_write_fu_1047_ifm_buff0_6_ce1.read();
        } else {
            ifm_buff1_6_ce1 = ap_const_logic_0;
        }
    } else {
        ifm_buff1_6_ce1 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff1_6_d0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff1_6_d0 = grp_load_cifm_data_fu_1603_ifm_buff0_6_d0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op308_call_state4.read()))) {
        ifm_buff1_6_d0 = grp_write_row_ifm_fu_1578_ifm_buff0_6_d0.read();
    } else {
        ifm_buff1_6_d0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_ifm_buff1_6_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff1_6_we0 = grp_load_cifm_data_fu_1603_ifm_buff0_6_we0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op308_call_state4.read()))) {
        ifm_buff1_6_we0 = grp_write_row_ifm_fu_1578_ifm_buff0_6_we0.read();
    } else {
        ifm_buff1_6_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff1_7_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff1_7_address0 = grp_load_cifm_data_fu_1603_ifm_buff0_7_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op308_call_state4.read()))) {
        ifm_buff1_7_address0 = grp_write_row_ifm_fu_1578_ifm_buff0_7_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read()))) {
        ifm_buff1_7_address0 = grp_conv_write_fu_1047_ifm_buff2_7_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read()))) {
        ifm_buff1_7_address0 = grp_conv_write_fu_1047_ifm_buff1_7_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff1_7_address0 = grp_conv_write_fu_1047_ifm_buff0_7_address0.read();
    } else {
        ifm_buff1_7_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff1_7_address1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff1_7_address1 = grp_conv_write_fu_1047_ifm_buff2_7_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff1_7_address1 = grp_conv_write_fu_1047_ifm_buff1_7_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff1_7_address1 = grp_conv_write_fu_1047_ifm_buff0_7_address1.read();
        } else {
            ifm_buff1_7_address1 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff1_7_address1 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff1_7_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff1_7_ce0 = grp_load_cifm_data_fu_1603_ifm_buff0_7_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op308_call_state4.read()))) {
        ifm_buff1_7_ce0 = grp_write_row_ifm_fu_1578_ifm_buff0_7_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read()))) {
        ifm_buff1_7_ce0 = grp_conv_write_fu_1047_ifm_buff2_7_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read()))) {
        ifm_buff1_7_ce0 = grp_conv_write_fu_1047_ifm_buff1_7_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff1_7_ce0 = grp_conv_write_fu_1047_ifm_buff0_7_ce0.read();
    } else {
        ifm_buff1_7_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff1_7_ce1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff1_7_ce1 = grp_conv_write_fu_1047_ifm_buff2_7_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff1_7_ce1 = grp_conv_write_fu_1047_ifm_buff1_7_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff1_7_ce1 = grp_conv_write_fu_1047_ifm_buff0_7_ce1.read();
        } else {
            ifm_buff1_7_ce1 = ap_const_logic_0;
        }
    } else {
        ifm_buff1_7_ce1 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff1_7_d0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff1_7_d0 = grp_load_cifm_data_fu_1603_ifm_buff0_7_d0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op308_call_state4.read()))) {
        ifm_buff1_7_d0 = grp_write_row_ifm_fu_1578_ifm_buff0_7_d0.read();
    } else {
        ifm_buff1_7_d0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_ifm_buff1_7_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff1_7_we0 = grp_load_cifm_data_fu_1603_ifm_buff0_7_we0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op308_call_state4.read()))) {
        ifm_buff1_7_we0 = grp_write_row_ifm_fu_1578_ifm_buff0_7_we0.read();
    } else {
        ifm_buff1_7_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff1_8_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff1_8_address0 = grp_load_cifm_data_fu_1603_ifm_buff0_8_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op308_call_state4.read()))) {
        ifm_buff1_8_address0 = grp_write_row_ifm_fu_1578_ifm_buff0_8_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read()))) {
        ifm_buff1_8_address0 = grp_conv_write_fu_1047_ifm_buff2_8_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read()))) {
        ifm_buff1_8_address0 = grp_conv_write_fu_1047_ifm_buff1_8_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff1_8_address0 = grp_conv_write_fu_1047_ifm_buff0_8_address0.read();
    } else {
        ifm_buff1_8_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff1_8_address1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff1_8_address1 = grp_conv_write_fu_1047_ifm_buff2_8_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff1_8_address1 = grp_conv_write_fu_1047_ifm_buff1_8_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff1_8_address1 = grp_conv_write_fu_1047_ifm_buff0_8_address1.read();
        } else {
            ifm_buff1_8_address1 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff1_8_address1 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff1_8_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff1_8_ce0 = grp_load_cifm_data_fu_1603_ifm_buff0_8_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op308_call_state4.read()))) {
        ifm_buff1_8_ce0 = grp_write_row_ifm_fu_1578_ifm_buff0_8_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read()))) {
        ifm_buff1_8_ce0 = grp_conv_write_fu_1047_ifm_buff2_8_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read()))) {
        ifm_buff1_8_ce0 = grp_conv_write_fu_1047_ifm_buff1_8_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff1_8_ce0 = grp_conv_write_fu_1047_ifm_buff0_8_ce0.read();
    } else {
        ifm_buff1_8_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff1_8_ce1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff1_8_ce1 = grp_conv_write_fu_1047_ifm_buff2_8_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff1_8_ce1 = grp_conv_write_fu_1047_ifm_buff1_8_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff1_8_ce1 = grp_conv_write_fu_1047_ifm_buff0_8_ce1.read();
        } else {
            ifm_buff1_8_ce1 = ap_const_logic_0;
        }
    } else {
        ifm_buff1_8_ce1 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff1_8_d0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff1_8_d0 = grp_load_cifm_data_fu_1603_ifm_buff0_8_d0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op308_call_state4.read()))) {
        ifm_buff1_8_d0 = grp_write_row_ifm_fu_1578_ifm_buff0_8_d0.read();
    } else {
        ifm_buff1_8_d0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_ifm_buff1_8_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff1_8_we0 = grp_load_cifm_data_fu_1603_ifm_buff0_8_we0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op308_call_state4.read()))) {
        ifm_buff1_8_we0 = grp_write_row_ifm_fu_1578_ifm_buff0_8_we0.read();
    } else {
        ifm_buff1_8_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff1_9_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff1_9_address0 = grp_load_cifm_data_fu_1603_ifm_buff0_9_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op308_call_state4.read()))) {
        ifm_buff1_9_address0 = grp_write_row_ifm_fu_1578_ifm_buff0_9_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read()))) {
        ifm_buff1_9_address0 = grp_conv_write_fu_1047_ifm_buff2_9_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read()))) {
        ifm_buff1_9_address0 = grp_conv_write_fu_1047_ifm_buff1_9_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff1_9_address0 = grp_conv_write_fu_1047_ifm_buff0_9_address0.read();
    } else {
        ifm_buff1_9_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff1_9_address1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff1_9_address1 = grp_conv_write_fu_1047_ifm_buff2_9_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff1_9_address1 = grp_conv_write_fu_1047_ifm_buff1_9_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff1_9_address1 = grp_conv_write_fu_1047_ifm_buff0_9_address1.read();
        } else {
            ifm_buff1_9_address1 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff1_9_address1 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff1_9_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff1_9_ce0 = grp_load_cifm_data_fu_1603_ifm_buff0_9_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op308_call_state4.read()))) {
        ifm_buff1_9_ce0 = grp_write_row_ifm_fu_1578_ifm_buff0_9_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read()))) {
        ifm_buff1_9_ce0 = grp_conv_write_fu_1047_ifm_buff2_9_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read()))) {
        ifm_buff1_9_ce0 = grp_conv_write_fu_1047_ifm_buff1_9_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff1_9_ce0 = grp_conv_write_fu_1047_ifm_buff0_9_ce0.read();
    } else {
        ifm_buff1_9_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff1_9_ce1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff1_9_ce1 = grp_conv_write_fu_1047_ifm_buff2_9_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff1_9_ce1 = grp_conv_write_fu_1047_ifm_buff1_9_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff1_9_ce1 = grp_conv_write_fu_1047_ifm_buff0_9_ce1.read();
        } else {
            ifm_buff1_9_ce1 = ap_const_logic_0;
        }
    } else {
        ifm_buff1_9_ce1 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff1_9_d0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff1_9_d0 = grp_load_cifm_data_fu_1603_ifm_buff0_9_d0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op308_call_state4.read()))) {
        ifm_buff1_9_d0 = grp_write_row_ifm_fu_1578_ifm_buff0_9_d0.read();
    } else {
        ifm_buff1_9_d0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_ifm_buff1_9_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff1_9_we0 = grp_load_cifm_data_fu_1603_ifm_buff0_9_we0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op308_call_state4.read()))) {
        ifm_buff1_9_we0 = grp_write_row_ifm_fu_1578_ifm_buff0_9_we0.read();
    } else {
        ifm_buff1_9_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff2_0_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff2_0_address0 = grp_load_cifm_data_fu_1603_ifm_buff1_0_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op302_call_state4.read()))) {
        ifm_buff2_0_address0 = grp_write_row_ifm_fu_1578_ifm_buff0_0_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read()))) {
        ifm_buff2_0_address0 = grp_conv_write_fu_1047_ifm_buff2_0_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff2_0_address0 = grp_conv_write_fu_1047_ifm_buff1_0_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read()))) {
        ifm_buff2_0_address0 = grp_conv_write_fu_1047_ifm_buff0_0_address0.read();
    } else {
        ifm_buff2_0_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff2_0_address1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff2_0_address1 = grp_conv_write_fu_1047_ifm_buff2_0_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff2_0_address1 = grp_conv_write_fu_1047_ifm_buff1_0_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff2_0_address1 = grp_conv_write_fu_1047_ifm_buff0_0_address1.read();
        } else {
            ifm_buff2_0_address1 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff2_0_address1 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff2_0_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff2_0_ce0 = grp_load_cifm_data_fu_1603_ifm_buff1_0_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op302_call_state4.read()))) {
        ifm_buff2_0_ce0 = grp_write_row_ifm_fu_1578_ifm_buff0_0_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read()))) {
        ifm_buff2_0_ce0 = grp_conv_write_fu_1047_ifm_buff2_0_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff2_0_ce0 = grp_conv_write_fu_1047_ifm_buff1_0_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read()))) {
        ifm_buff2_0_ce0 = grp_conv_write_fu_1047_ifm_buff0_0_ce0.read();
    } else {
        ifm_buff2_0_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff2_0_ce1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff2_0_ce1 = grp_conv_write_fu_1047_ifm_buff2_0_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff2_0_ce1 = grp_conv_write_fu_1047_ifm_buff1_0_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff2_0_ce1 = grp_conv_write_fu_1047_ifm_buff0_0_ce1.read();
        } else {
            ifm_buff2_0_ce1 = ap_const_logic_0;
        }
    } else {
        ifm_buff2_0_ce1 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff2_0_d0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff2_0_d0 = grp_load_cifm_data_fu_1603_ifm_buff1_0_d0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op302_call_state4.read()))) {
        ifm_buff2_0_d0 = grp_write_row_ifm_fu_1578_ifm_buff0_0_d0.read();
    } else {
        ifm_buff2_0_d0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_ifm_buff2_0_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff2_0_we0 = grp_load_cifm_data_fu_1603_ifm_buff1_0_we0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op302_call_state4.read()))) {
        ifm_buff2_0_we0 = grp_write_row_ifm_fu_1578_ifm_buff0_0_we0.read();
    } else {
        ifm_buff2_0_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff2_10_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff2_10_address0 = grp_load_cifm_data_fu_1603_ifm_buff1_10_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op302_call_state4.read()))) {
        ifm_buff2_10_address0 = grp_write_row_ifm_fu_1578_ifm_buff0_10_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read()))) {
        ifm_buff2_10_address0 = grp_conv_write_fu_1047_ifm_buff2_10_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff2_10_address0 = grp_conv_write_fu_1047_ifm_buff1_10_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read()))) {
        ifm_buff2_10_address0 = grp_conv_write_fu_1047_ifm_buff0_10_address0.read();
    } else {
        ifm_buff2_10_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff2_10_address1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff2_10_address1 = grp_conv_write_fu_1047_ifm_buff2_10_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff2_10_address1 = grp_conv_write_fu_1047_ifm_buff1_10_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff2_10_address1 = grp_conv_write_fu_1047_ifm_buff0_10_address1.read();
        } else {
            ifm_buff2_10_address1 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff2_10_address1 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff2_10_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff2_10_ce0 = grp_load_cifm_data_fu_1603_ifm_buff1_10_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op302_call_state4.read()))) {
        ifm_buff2_10_ce0 = grp_write_row_ifm_fu_1578_ifm_buff0_10_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read()))) {
        ifm_buff2_10_ce0 = grp_conv_write_fu_1047_ifm_buff2_10_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff2_10_ce0 = grp_conv_write_fu_1047_ifm_buff1_10_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read()))) {
        ifm_buff2_10_ce0 = grp_conv_write_fu_1047_ifm_buff0_10_ce0.read();
    } else {
        ifm_buff2_10_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff2_10_ce1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff2_10_ce1 = grp_conv_write_fu_1047_ifm_buff2_10_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff2_10_ce1 = grp_conv_write_fu_1047_ifm_buff1_10_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff2_10_ce1 = grp_conv_write_fu_1047_ifm_buff0_10_ce1.read();
        } else {
            ifm_buff2_10_ce1 = ap_const_logic_0;
        }
    } else {
        ifm_buff2_10_ce1 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff2_10_d0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff2_10_d0 = grp_load_cifm_data_fu_1603_ifm_buff1_10_d0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op302_call_state4.read()))) {
        ifm_buff2_10_d0 = grp_write_row_ifm_fu_1578_ifm_buff0_10_d0.read();
    } else {
        ifm_buff2_10_d0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_ifm_buff2_10_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff2_10_we0 = grp_load_cifm_data_fu_1603_ifm_buff1_10_we0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op302_call_state4.read()))) {
        ifm_buff2_10_we0 = grp_write_row_ifm_fu_1578_ifm_buff0_10_we0.read();
    } else {
        ifm_buff2_10_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff2_11_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff2_11_address0 = grp_load_cifm_data_fu_1603_ifm_buff1_11_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op302_call_state4.read()))) {
        ifm_buff2_11_address0 = grp_write_row_ifm_fu_1578_ifm_buff0_11_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read()))) {
        ifm_buff2_11_address0 = grp_conv_write_fu_1047_ifm_buff2_11_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff2_11_address0 = grp_conv_write_fu_1047_ifm_buff1_11_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read()))) {
        ifm_buff2_11_address0 = grp_conv_write_fu_1047_ifm_buff0_11_address0.read();
    } else {
        ifm_buff2_11_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff2_11_address1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff2_11_address1 = grp_conv_write_fu_1047_ifm_buff2_11_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff2_11_address1 = grp_conv_write_fu_1047_ifm_buff1_11_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff2_11_address1 = grp_conv_write_fu_1047_ifm_buff0_11_address1.read();
        } else {
            ifm_buff2_11_address1 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff2_11_address1 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff2_11_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff2_11_ce0 = grp_load_cifm_data_fu_1603_ifm_buff1_11_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op302_call_state4.read()))) {
        ifm_buff2_11_ce0 = grp_write_row_ifm_fu_1578_ifm_buff0_11_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read()))) {
        ifm_buff2_11_ce0 = grp_conv_write_fu_1047_ifm_buff2_11_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff2_11_ce0 = grp_conv_write_fu_1047_ifm_buff1_11_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read()))) {
        ifm_buff2_11_ce0 = grp_conv_write_fu_1047_ifm_buff0_11_ce0.read();
    } else {
        ifm_buff2_11_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff2_11_ce1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff2_11_ce1 = grp_conv_write_fu_1047_ifm_buff2_11_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff2_11_ce1 = grp_conv_write_fu_1047_ifm_buff1_11_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff2_11_ce1 = grp_conv_write_fu_1047_ifm_buff0_11_ce1.read();
        } else {
            ifm_buff2_11_ce1 = ap_const_logic_0;
        }
    } else {
        ifm_buff2_11_ce1 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff2_11_d0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff2_11_d0 = grp_load_cifm_data_fu_1603_ifm_buff1_11_d0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op302_call_state4.read()))) {
        ifm_buff2_11_d0 = grp_write_row_ifm_fu_1578_ifm_buff0_11_d0.read();
    } else {
        ifm_buff2_11_d0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_ifm_buff2_11_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff2_11_we0 = grp_load_cifm_data_fu_1603_ifm_buff1_11_we0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op302_call_state4.read()))) {
        ifm_buff2_11_we0 = grp_write_row_ifm_fu_1578_ifm_buff0_11_we0.read();
    } else {
        ifm_buff2_11_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff2_12_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff2_12_address0 = grp_load_cifm_data_fu_1603_ifm_buff1_12_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op302_call_state4.read()))) {
        ifm_buff2_12_address0 = grp_write_row_ifm_fu_1578_ifm_buff0_12_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read()))) {
        ifm_buff2_12_address0 = grp_conv_write_fu_1047_ifm_buff2_12_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff2_12_address0 = grp_conv_write_fu_1047_ifm_buff1_12_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read()))) {
        ifm_buff2_12_address0 = grp_conv_write_fu_1047_ifm_buff0_12_address0.read();
    } else {
        ifm_buff2_12_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff2_12_address1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff2_12_address1 = grp_conv_write_fu_1047_ifm_buff2_12_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff2_12_address1 = grp_conv_write_fu_1047_ifm_buff1_12_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff2_12_address1 = grp_conv_write_fu_1047_ifm_buff0_12_address1.read();
        } else {
            ifm_buff2_12_address1 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff2_12_address1 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff2_12_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff2_12_ce0 = grp_load_cifm_data_fu_1603_ifm_buff1_12_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op302_call_state4.read()))) {
        ifm_buff2_12_ce0 = grp_write_row_ifm_fu_1578_ifm_buff0_12_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read()))) {
        ifm_buff2_12_ce0 = grp_conv_write_fu_1047_ifm_buff2_12_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff2_12_ce0 = grp_conv_write_fu_1047_ifm_buff1_12_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read()))) {
        ifm_buff2_12_ce0 = grp_conv_write_fu_1047_ifm_buff0_12_ce0.read();
    } else {
        ifm_buff2_12_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff2_12_ce1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff2_12_ce1 = grp_conv_write_fu_1047_ifm_buff2_12_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff2_12_ce1 = grp_conv_write_fu_1047_ifm_buff1_12_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff2_12_ce1 = grp_conv_write_fu_1047_ifm_buff0_12_ce1.read();
        } else {
            ifm_buff2_12_ce1 = ap_const_logic_0;
        }
    } else {
        ifm_buff2_12_ce1 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff2_12_d0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff2_12_d0 = grp_load_cifm_data_fu_1603_ifm_buff1_12_d0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op302_call_state4.read()))) {
        ifm_buff2_12_d0 = grp_write_row_ifm_fu_1578_ifm_buff0_12_d0.read();
    } else {
        ifm_buff2_12_d0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_ifm_buff2_12_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff2_12_we0 = grp_load_cifm_data_fu_1603_ifm_buff1_12_we0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op302_call_state4.read()))) {
        ifm_buff2_12_we0 = grp_write_row_ifm_fu_1578_ifm_buff0_12_we0.read();
    } else {
        ifm_buff2_12_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff2_13_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff2_13_address0 = grp_load_cifm_data_fu_1603_ifm_buff1_13_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op302_call_state4.read()))) {
        ifm_buff2_13_address0 = grp_write_row_ifm_fu_1578_ifm_buff0_13_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read()))) {
        ifm_buff2_13_address0 = grp_conv_write_fu_1047_ifm_buff2_13_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff2_13_address0 = grp_conv_write_fu_1047_ifm_buff1_13_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read()))) {
        ifm_buff2_13_address0 = grp_conv_write_fu_1047_ifm_buff0_13_address0.read();
    } else {
        ifm_buff2_13_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff2_13_address1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff2_13_address1 = grp_conv_write_fu_1047_ifm_buff2_13_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff2_13_address1 = grp_conv_write_fu_1047_ifm_buff1_13_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff2_13_address1 = grp_conv_write_fu_1047_ifm_buff0_13_address1.read();
        } else {
            ifm_buff2_13_address1 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff2_13_address1 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff2_13_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff2_13_ce0 = grp_load_cifm_data_fu_1603_ifm_buff1_13_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op302_call_state4.read()))) {
        ifm_buff2_13_ce0 = grp_write_row_ifm_fu_1578_ifm_buff0_13_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read()))) {
        ifm_buff2_13_ce0 = grp_conv_write_fu_1047_ifm_buff2_13_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff2_13_ce0 = grp_conv_write_fu_1047_ifm_buff1_13_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read()))) {
        ifm_buff2_13_ce0 = grp_conv_write_fu_1047_ifm_buff0_13_ce0.read();
    } else {
        ifm_buff2_13_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff2_13_ce1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff2_13_ce1 = grp_conv_write_fu_1047_ifm_buff2_13_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff2_13_ce1 = grp_conv_write_fu_1047_ifm_buff1_13_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff2_13_ce1 = grp_conv_write_fu_1047_ifm_buff0_13_ce1.read();
        } else {
            ifm_buff2_13_ce1 = ap_const_logic_0;
        }
    } else {
        ifm_buff2_13_ce1 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff2_13_d0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff2_13_d0 = grp_load_cifm_data_fu_1603_ifm_buff1_13_d0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op302_call_state4.read()))) {
        ifm_buff2_13_d0 = grp_write_row_ifm_fu_1578_ifm_buff0_13_d0.read();
    } else {
        ifm_buff2_13_d0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_ifm_buff2_13_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff2_13_we0 = grp_load_cifm_data_fu_1603_ifm_buff1_13_we0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op302_call_state4.read()))) {
        ifm_buff2_13_we0 = grp_write_row_ifm_fu_1578_ifm_buff0_13_we0.read();
    } else {
        ifm_buff2_13_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff2_14_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff2_14_address0 = grp_load_cifm_data_fu_1603_ifm_buff1_14_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op302_call_state4.read()))) {
        ifm_buff2_14_address0 = grp_write_row_ifm_fu_1578_ifm_buff0_14_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read()))) {
        ifm_buff2_14_address0 = grp_conv_write_fu_1047_ifm_buff2_14_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff2_14_address0 = grp_conv_write_fu_1047_ifm_buff1_14_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read()))) {
        ifm_buff2_14_address0 = grp_conv_write_fu_1047_ifm_buff0_14_address0.read();
    } else {
        ifm_buff2_14_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff2_14_address1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff2_14_address1 = grp_conv_write_fu_1047_ifm_buff2_14_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff2_14_address1 = grp_conv_write_fu_1047_ifm_buff1_14_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff2_14_address1 = grp_conv_write_fu_1047_ifm_buff0_14_address1.read();
        } else {
            ifm_buff2_14_address1 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff2_14_address1 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff2_14_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff2_14_ce0 = grp_load_cifm_data_fu_1603_ifm_buff1_14_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op302_call_state4.read()))) {
        ifm_buff2_14_ce0 = grp_write_row_ifm_fu_1578_ifm_buff0_14_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read()))) {
        ifm_buff2_14_ce0 = grp_conv_write_fu_1047_ifm_buff2_14_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff2_14_ce0 = grp_conv_write_fu_1047_ifm_buff1_14_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read()))) {
        ifm_buff2_14_ce0 = grp_conv_write_fu_1047_ifm_buff0_14_ce0.read();
    } else {
        ifm_buff2_14_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff2_14_ce1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff2_14_ce1 = grp_conv_write_fu_1047_ifm_buff2_14_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff2_14_ce1 = grp_conv_write_fu_1047_ifm_buff1_14_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff2_14_ce1 = grp_conv_write_fu_1047_ifm_buff0_14_ce1.read();
        } else {
            ifm_buff2_14_ce1 = ap_const_logic_0;
        }
    } else {
        ifm_buff2_14_ce1 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff2_14_d0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff2_14_d0 = grp_load_cifm_data_fu_1603_ifm_buff1_14_d0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op302_call_state4.read()))) {
        ifm_buff2_14_d0 = grp_write_row_ifm_fu_1578_ifm_buff0_14_d0.read();
    } else {
        ifm_buff2_14_d0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_ifm_buff2_14_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff2_14_we0 = grp_load_cifm_data_fu_1603_ifm_buff1_14_we0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op302_call_state4.read()))) {
        ifm_buff2_14_we0 = grp_write_row_ifm_fu_1578_ifm_buff0_14_we0.read();
    } else {
        ifm_buff2_14_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff2_15_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff2_15_address0 = grp_load_cifm_data_fu_1603_ifm_buff1_15_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op302_call_state4.read()))) {
        ifm_buff2_15_address0 = grp_write_row_ifm_fu_1578_ifm_buff0_15_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read()))) {
        ifm_buff2_15_address0 = grp_conv_write_fu_1047_ifm_buff2_15_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff2_15_address0 = grp_conv_write_fu_1047_ifm_buff1_15_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read()))) {
        ifm_buff2_15_address0 = grp_conv_write_fu_1047_ifm_buff0_15_address0.read();
    } else {
        ifm_buff2_15_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff2_15_address1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff2_15_address1 = grp_conv_write_fu_1047_ifm_buff2_15_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff2_15_address1 = grp_conv_write_fu_1047_ifm_buff1_15_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff2_15_address1 = grp_conv_write_fu_1047_ifm_buff0_15_address1.read();
        } else {
            ifm_buff2_15_address1 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff2_15_address1 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff2_15_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff2_15_ce0 = grp_load_cifm_data_fu_1603_ifm_buff1_15_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op302_call_state4.read()))) {
        ifm_buff2_15_ce0 = grp_write_row_ifm_fu_1578_ifm_buff0_15_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read()))) {
        ifm_buff2_15_ce0 = grp_conv_write_fu_1047_ifm_buff2_15_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff2_15_ce0 = grp_conv_write_fu_1047_ifm_buff1_15_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read()))) {
        ifm_buff2_15_ce0 = grp_conv_write_fu_1047_ifm_buff0_15_ce0.read();
    } else {
        ifm_buff2_15_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff2_15_ce1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff2_15_ce1 = grp_conv_write_fu_1047_ifm_buff2_15_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff2_15_ce1 = grp_conv_write_fu_1047_ifm_buff1_15_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff2_15_ce1 = grp_conv_write_fu_1047_ifm_buff0_15_ce1.read();
        } else {
            ifm_buff2_15_ce1 = ap_const_logic_0;
        }
    } else {
        ifm_buff2_15_ce1 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff2_15_d0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff2_15_d0 = grp_load_cifm_data_fu_1603_ifm_buff1_15_d0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op302_call_state4.read()))) {
        ifm_buff2_15_d0 = grp_write_row_ifm_fu_1578_ifm_buff0_15_d0.read();
    } else {
        ifm_buff2_15_d0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_ifm_buff2_15_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff2_15_we0 = grp_load_cifm_data_fu_1603_ifm_buff1_15_we0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op302_call_state4.read()))) {
        ifm_buff2_15_we0 = grp_write_row_ifm_fu_1578_ifm_buff0_15_we0.read();
    } else {
        ifm_buff2_15_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff2_1_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff2_1_address0 = grp_load_cifm_data_fu_1603_ifm_buff1_1_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op302_call_state4.read()))) {
        ifm_buff2_1_address0 = grp_write_row_ifm_fu_1578_ifm_buff0_1_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read()))) {
        ifm_buff2_1_address0 = grp_conv_write_fu_1047_ifm_buff2_1_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff2_1_address0 = grp_conv_write_fu_1047_ifm_buff1_1_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read()))) {
        ifm_buff2_1_address0 = grp_conv_write_fu_1047_ifm_buff0_1_address0.read();
    } else {
        ifm_buff2_1_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff2_1_address1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff2_1_address1 = grp_conv_write_fu_1047_ifm_buff2_1_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff2_1_address1 = grp_conv_write_fu_1047_ifm_buff1_1_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff2_1_address1 = grp_conv_write_fu_1047_ifm_buff0_1_address1.read();
        } else {
            ifm_buff2_1_address1 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff2_1_address1 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff2_1_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff2_1_ce0 = grp_load_cifm_data_fu_1603_ifm_buff1_1_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op302_call_state4.read()))) {
        ifm_buff2_1_ce0 = grp_write_row_ifm_fu_1578_ifm_buff0_1_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read()))) {
        ifm_buff2_1_ce0 = grp_conv_write_fu_1047_ifm_buff2_1_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff2_1_ce0 = grp_conv_write_fu_1047_ifm_buff1_1_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read()))) {
        ifm_buff2_1_ce0 = grp_conv_write_fu_1047_ifm_buff0_1_ce0.read();
    } else {
        ifm_buff2_1_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff2_1_ce1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff2_1_ce1 = grp_conv_write_fu_1047_ifm_buff2_1_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff2_1_ce1 = grp_conv_write_fu_1047_ifm_buff1_1_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff2_1_ce1 = grp_conv_write_fu_1047_ifm_buff0_1_ce1.read();
        } else {
            ifm_buff2_1_ce1 = ap_const_logic_0;
        }
    } else {
        ifm_buff2_1_ce1 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff2_1_d0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff2_1_d0 = grp_load_cifm_data_fu_1603_ifm_buff1_1_d0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op302_call_state4.read()))) {
        ifm_buff2_1_d0 = grp_write_row_ifm_fu_1578_ifm_buff0_1_d0.read();
    } else {
        ifm_buff2_1_d0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_ifm_buff2_1_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff2_1_we0 = grp_load_cifm_data_fu_1603_ifm_buff1_1_we0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op302_call_state4.read()))) {
        ifm_buff2_1_we0 = grp_write_row_ifm_fu_1578_ifm_buff0_1_we0.read();
    } else {
        ifm_buff2_1_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff2_2_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff2_2_address0 = grp_load_cifm_data_fu_1603_ifm_buff1_2_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op302_call_state4.read()))) {
        ifm_buff2_2_address0 = grp_write_row_ifm_fu_1578_ifm_buff0_2_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read()))) {
        ifm_buff2_2_address0 = grp_conv_write_fu_1047_ifm_buff2_2_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff2_2_address0 = grp_conv_write_fu_1047_ifm_buff1_2_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read()))) {
        ifm_buff2_2_address0 = grp_conv_write_fu_1047_ifm_buff0_2_address0.read();
    } else {
        ifm_buff2_2_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff2_2_address1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff2_2_address1 = grp_conv_write_fu_1047_ifm_buff2_2_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff2_2_address1 = grp_conv_write_fu_1047_ifm_buff1_2_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff2_2_address1 = grp_conv_write_fu_1047_ifm_buff0_2_address1.read();
        } else {
            ifm_buff2_2_address1 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff2_2_address1 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff2_2_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff2_2_ce0 = grp_load_cifm_data_fu_1603_ifm_buff1_2_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op302_call_state4.read()))) {
        ifm_buff2_2_ce0 = grp_write_row_ifm_fu_1578_ifm_buff0_2_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read()))) {
        ifm_buff2_2_ce0 = grp_conv_write_fu_1047_ifm_buff2_2_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff2_2_ce0 = grp_conv_write_fu_1047_ifm_buff1_2_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read()))) {
        ifm_buff2_2_ce0 = grp_conv_write_fu_1047_ifm_buff0_2_ce0.read();
    } else {
        ifm_buff2_2_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff2_2_ce1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff2_2_ce1 = grp_conv_write_fu_1047_ifm_buff2_2_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff2_2_ce1 = grp_conv_write_fu_1047_ifm_buff1_2_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff2_2_ce1 = grp_conv_write_fu_1047_ifm_buff0_2_ce1.read();
        } else {
            ifm_buff2_2_ce1 = ap_const_logic_0;
        }
    } else {
        ifm_buff2_2_ce1 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff2_2_d0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff2_2_d0 = grp_load_cifm_data_fu_1603_ifm_buff1_2_d0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op302_call_state4.read()))) {
        ifm_buff2_2_d0 = grp_write_row_ifm_fu_1578_ifm_buff0_2_d0.read();
    } else {
        ifm_buff2_2_d0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_ifm_buff2_2_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff2_2_we0 = grp_load_cifm_data_fu_1603_ifm_buff1_2_we0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op302_call_state4.read()))) {
        ifm_buff2_2_we0 = grp_write_row_ifm_fu_1578_ifm_buff0_2_we0.read();
    } else {
        ifm_buff2_2_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff2_3_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff2_3_address0 = grp_load_cifm_data_fu_1603_ifm_buff1_3_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op302_call_state4.read()))) {
        ifm_buff2_3_address0 = grp_write_row_ifm_fu_1578_ifm_buff0_3_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read()))) {
        ifm_buff2_3_address0 = grp_conv_write_fu_1047_ifm_buff2_3_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff2_3_address0 = grp_conv_write_fu_1047_ifm_buff1_3_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read()))) {
        ifm_buff2_3_address0 = grp_conv_write_fu_1047_ifm_buff0_3_address0.read();
    } else {
        ifm_buff2_3_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff2_3_address1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff2_3_address1 = grp_conv_write_fu_1047_ifm_buff2_3_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff2_3_address1 = grp_conv_write_fu_1047_ifm_buff1_3_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff2_3_address1 = grp_conv_write_fu_1047_ifm_buff0_3_address1.read();
        } else {
            ifm_buff2_3_address1 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff2_3_address1 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff2_3_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff2_3_ce0 = grp_load_cifm_data_fu_1603_ifm_buff1_3_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op302_call_state4.read()))) {
        ifm_buff2_3_ce0 = grp_write_row_ifm_fu_1578_ifm_buff0_3_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read()))) {
        ifm_buff2_3_ce0 = grp_conv_write_fu_1047_ifm_buff2_3_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff2_3_ce0 = grp_conv_write_fu_1047_ifm_buff1_3_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read()))) {
        ifm_buff2_3_ce0 = grp_conv_write_fu_1047_ifm_buff0_3_ce0.read();
    } else {
        ifm_buff2_3_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff2_3_ce1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff2_3_ce1 = grp_conv_write_fu_1047_ifm_buff2_3_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff2_3_ce1 = grp_conv_write_fu_1047_ifm_buff1_3_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff2_3_ce1 = grp_conv_write_fu_1047_ifm_buff0_3_ce1.read();
        } else {
            ifm_buff2_3_ce1 = ap_const_logic_0;
        }
    } else {
        ifm_buff2_3_ce1 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff2_3_d0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff2_3_d0 = grp_load_cifm_data_fu_1603_ifm_buff1_3_d0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op302_call_state4.read()))) {
        ifm_buff2_3_d0 = grp_write_row_ifm_fu_1578_ifm_buff0_3_d0.read();
    } else {
        ifm_buff2_3_d0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_ifm_buff2_3_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff2_3_we0 = grp_load_cifm_data_fu_1603_ifm_buff1_3_we0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op302_call_state4.read()))) {
        ifm_buff2_3_we0 = grp_write_row_ifm_fu_1578_ifm_buff0_3_we0.read();
    } else {
        ifm_buff2_3_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff2_4_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff2_4_address0 = grp_load_cifm_data_fu_1603_ifm_buff1_4_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op302_call_state4.read()))) {
        ifm_buff2_4_address0 = grp_write_row_ifm_fu_1578_ifm_buff0_4_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read()))) {
        ifm_buff2_4_address0 = grp_conv_write_fu_1047_ifm_buff2_4_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff2_4_address0 = grp_conv_write_fu_1047_ifm_buff1_4_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read()))) {
        ifm_buff2_4_address0 = grp_conv_write_fu_1047_ifm_buff0_4_address0.read();
    } else {
        ifm_buff2_4_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff2_4_address1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff2_4_address1 = grp_conv_write_fu_1047_ifm_buff2_4_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff2_4_address1 = grp_conv_write_fu_1047_ifm_buff1_4_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff2_4_address1 = grp_conv_write_fu_1047_ifm_buff0_4_address1.read();
        } else {
            ifm_buff2_4_address1 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff2_4_address1 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff2_4_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff2_4_ce0 = grp_load_cifm_data_fu_1603_ifm_buff1_4_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op302_call_state4.read()))) {
        ifm_buff2_4_ce0 = grp_write_row_ifm_fu_1578_ifm_buff0_4_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read()))) {
        ifm_buff2_4_ce0 = grp_conv_write_fu_1047_ifm_buff2_4_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff2_4_ce0 = grp_conv_write_fu_1047_ifm_buff1_4_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read()))) {
        ifm_buff2_4_ce0 = grp_conv_write_fu_1047_ifm_buff0_4_ce0.read();
    } else {
        ifm_buff2_4_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff2_4_ce1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff2_4_ce1 = grp_conv_write_fu_1047_ifm_buff2_4_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff2_4_ce1 = grp_conv_write_fu_1047_ifm_buff1_4_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff2_4_ce1 = grp_conv_write_fu_1047_ifm_buff0_4_ce1.read();
        } else {
            ifm_buff2_4_ce1 = ap_const_logic_0;
        }
    } else {
        ifm_buff2_4_ce1 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff2_4_d0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff2_4_d0 = grp_load_cifm_data_fu_1603_ifm_buff1_4_d0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op302_call_state4.read()))) {
        ifm_buff2_4_d0 = grp_write_row_ifm_fu_1578_ifm_buff0_4_d0.read();
    } else {
        ifm_buff2_4_d0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_ifm_buff2_4_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff2_4_we0 = grp_load_cifm_data_fu_1603_ifm_buff1_4_we0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op302_call_state4.read()))) {
        ifm_buff2_4_we0 = grp_write_row_ifm_fu_1578_ifm_buff0_4_we0.read();
    } else {
        ifm_buff2_4_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff2_5_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff2_5_address0 = grp_load_cifm_data_fu_1603_ifm_buff1_5_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op302_call_state4.read()))) {
        ifm_buff2_5_address0 = grp_write_row_ifm_fu_1578_ifm_buff0_5_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read()))) {
        ifm_buff2_5_address0 = grp_conv_write_fu_1047_ifm_buff2_5_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff2_5_address0 = grp_conv_write_fu_1047_ifm_buff1_5_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read()))) {
        ifm_buff2_5_address0 = grp_conv_write_fu_1047_ifm_buff0_5_address0.read();
    } else {
        ifm_buff2_5_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff2_5_address1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff2_5_address1 = grp_conv_write_fu_1047_ifm_buff2_5_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff2_5_address1 = grp_conv_write_fu_1047_ifm_buff1_5_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff2_5_address1 = grp_conv_write_fu_1047_ifm_buff0_5_address1.read();
        } else {
            ifm_buff2_5_address1 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff2_5_address1 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff2_5_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff2_5_ce0 = grp_load_cifm_data_fu_1603_ifm_buff1_5_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op302_call_state4.read()))) {
        ifm_buff2_5_ce0 = grp_write_row_ifm_fu_1578_ifm_buff0_5_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read()))) {
        ifm_buff2_5_ce0 = grp_conv_write_fu_1047_ifm_buff2_5_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff2_5_ce0 = grp_conv_write_fu_1047_ifm_buff1_5_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read()))) {
        ifm_buff2_5_ce0 = grp_conv_write_fu_1047_ifm_buff0_5_ce0.read();
    } else {
        ifm_buff2_5_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff2_5_ce1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff2_5_ce1 = grp_conv_write_fu_1047_ifm_buff2_5_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff2_5_ce1 = grp_conv_write_fu_1047_ifm_buff1_5_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff2_5_ce1 = grp_conv_write_fu_1047_ifm_buff0_5_ce1.read();
        } else {
            ifm_buff2_5_ce1 = ap_const_logic_0;
        }
    } else {
        ifm_buff2_5_ce1 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff2_5_d0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff2_5_d0 = grp_load_cifm_data_fu_1603_ifm_buff1_5_d0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op302_call_state4.read()))) {
        ifm_buff2_5_d0 = grp_write_row_ifm_fu_1578_ifm_buff0_5_d0.read();
    } else {
        ifm_buff2_5_d0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_ifm_buff2_5_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff2_5_we0 = grp_load_cifm_data_fu_1603_ifm_buff1_5_we0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op302_call_state4.read()))) {
        ifm_buff2_5_we0 = grp_write_row_ifm_fu_1578_ifm_buff0_5_we0.read();
    } else {
        ifm_buff2_5_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff2_6_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff2_6_address0 = grp_load_cifm_data_fu_1603_ifm_buff1_6_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op302_call_state4.read()))) {
        ifm_buff2_6_address0 = grp_write_row_ifm_fu_1578_ifm_buff0_6_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read()))) {
        ifm_buff2_6_address0 = grp_conv_write_fu_1047_ifm_buff2_6_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff2_6_address0 = grp_conv_write_fu_1047_ifm_buff1_6_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read()))) {
        ifm_buff2_6_address0 = grp_conv_write_fu_1047_ifm_buff0_6_address0.read();
    } else {
        ifm_buff2_6_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff2_6_address1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff2_6_address1 = grp_conv_write_fu_1047_ifm_buff2_6_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff2_6_address1 = grp_conv_write_fu_1047_ifm_buff1_6_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff2_6_address1 = grp_conv_write_fu_1047_ifm_buff0_6_address1.read();
        } else {
            ifm_buff2_6_address1 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff2_6_address1 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff2_6_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff2_6_ce0 = grp_load_cifm_data_fu_1603_ifm_buff1_6_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op302_call_state4.read()))) {
        ifm_buff2_6_ce0 = grp_write_row_ifm_fu_1578_ifm_buff0_6_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read()))) {
        ifm_buff2_6_ce0 = grp_conv_write_fu_1047_ifm_buff2_6_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff2_6_ce0 = grp_conv_write_fu_1047_ifm_buff1_6_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read()))) {
        ifm_buff2_6_ce0 = grp_conv_write_fu_1047_ifm_buff0_6_ce0.read();
    } else {
        ifm_buff2_6_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff2_6_ce1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff2_6_ce1 = grp_conv_write_fu_1047_ifm_buff2_6_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff2_6_ce1 = grp_conv_write_fu_1047_ifm_buff1_6_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff2_6_ce1 = grp_conv_write_fu_1047_ifm_buff0_6_ce1.read();
        } else {
            ifm_buff2_6_ce1 = ap_const_logic_0;
        }
    } else {
        ifm_buff2_6_ce1 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff2_6_d0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff2_6_d0 = grp_load_cifm_data_fu_1603_ifm_buff1_6_d0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op302_call_state4.read()))) {
        ifm_buff2_6_d0 = grp_write_row_ifm_fu_1578_ifm_buff0_6_d0.read();
    } else {
        ifm_buff2_6_d0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_ifm_buff2_6_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff2_6_we0 = grp_load_cifm_data_fu_1603_ifm_buff1_6_we0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op302_call_state4.read()))) {
        ifm_buff2_6_we0 = grp_write_row_ifm_fu_1578_ifm_buff0_6_we0.read();
    } else {
        ifm_buff2_6_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff2_7_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff2_7_address0 = grp_load_cifm_data_fu_1603_ifm_buff1_7_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op302_call_state4.read()))) {
        ifm_buff2_7_address0 = grp_write_row_ifm_fu_1578_ifm_buff0_7_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read()))) {
        ifm_buff2_7_address0 = grp_conv_write_fu_1047_ifm_buff2_7_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff2_7_address0 = grp_conv_write_fu_1047_ifm_buff1_7_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read()))) {
        ifm_buff2_7_address0 = grp_conv_write_fu_1047_ifm_buff0_7_address0.read();
    } else {
        ifm_buff2_7_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff2_7_address1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff2_7_address1 = grp_conv_write_fu_1047_ifm_buff2_7_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff2_7_address1 = grp_conv_write_fu_1047_ifm_buff1_7_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff2_7_address1 = grp_conv_write_fu_1047_ifm_buff0_7_address1.read();
        } else {
            ifm_buff2_7_address1 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff2_7_address1 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff2_7_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff2_7_ce0 = grp_load_cifm_data_fu_1603_ifm_buff1_7_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op302_call_state4.read()))) {
        ifm_buff2_7_ce0 = grp_write_row_ifm_fu_1578_ifm_buff0_7_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read()))) {
        ifm_buff2_7_ce0 = grp_conv_write_fu_1047_ifm_buff2_7_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff2_7_ce0 = grp_conv_write_fu_1047_ifm_buff1_7_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read()))) {
        ifm_buff2_7_ce0 = grp_conv_write_fu_1047_ifm_buff0_7_ce0.read();
    } else {
        ifm_buff2_7_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff2_7_ce1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff2_7_ce1 = grp_conv_write_fu_1047_ifm_buff2_7_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff2_7_ce1 = grp_conv_write_fu_1047_ifm_buff1_7_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff2_7_ce1 = grp_conv_write_fu_1047_ifm_buff0_7_ce1.read();
        } else {
            ifm_buff2_7_ce1 = ap_const_logic_0;
        }
    } else {
        ifm_buff2_7_ce1 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff2_7_d0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff2_7_d0 = grp_load_cifm_data_fu_1603_ifm_buff1_7_d0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op302_call_state4.read()))) {
        ifm_buff2_7_d0 = grp_write_row_ifm_fu_1578_ifm_buff0_7_d0.read();
    } else {
        ifm_buff2_7_d0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_ifm_buff2_7_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff2_7_we0 = grp_load_cifm_data_fu_1603_ifm_buff1_7_we0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op302_call_state4.read()))) {
        ifm_buff2_7_we0 = grp_write_row_ifm_fu_1578_ifm_buff0_7_we0.read();
    } else {
        ifm_buff2_7_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff2_8_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff2_8_address0 = grp_load_cifm_data_fu_1603_ifm_buff1_8_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op302_call_state4.read()))) {
        ifm_buff2_8_address0 = grp_write_row_ifm_fu_1578_ifm_buff0_8_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read()))) {
        ifm_buff2_8_address0 = grp_conv_write_fu_1047_ifm_buff2_8_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff2_8_address0 = grp_conv_write_fu_1047_ifm_buff1_8_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read()))) {
        ifm_buff2_8_address0 = grp_conv_write_fu_1047_ifm_buff0_8_address0.read();
    } else {
        ifm_buff2_8_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff2_8_address1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff2_8_address1 = grp_conv_write_fu_1047_ifm_buff2_8_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff2_8_address1 = grp_conv_write_fu_1047_ifm_buff1_8_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff2_8_address1 = grp_conv_write_fu_1047_ifm_buff0_8_address1.read();
        } else {
            ifm_buff2_8_address1 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff2_8_address1 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff2_8_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff2_8_ce0 = grp_load_cifm_data_fu_1603_ifm_buff1_8_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op302_call_state4.read()))) {
        ifm_buff2_8_ce0 = grp_write_row_ifm_fu_1578_ifm_buff0_8_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read()))) {
        ifm_buff2_8_ce0 = grp_conv_write_fu_1047_ifm_buff2_8_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff2_8_ce0 = grp_conv_write_fu_1047_ifm_buff1_8_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read()))) {
        ifm_buff2_8_ce0 = grp_conv_write_fu_1047_ifm_buff0_8_ce0.read();
    } else {
        ifm_buff2_8_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff2_8_ce1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff2_8_ce1 = grp_conv_write_fu_1047_ifm_buff2_8_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff2_8_ce1 = grp_conv_write_fu_1047_ifm_buff1_8_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff2_8_ce1 = grp_conv_write_fu_1047_ifm_buff0_8_ce1.read();
        } else {
            ifm_buff2_8_ce1 = ap_const_logic_0;
        }
    } else {
        ifm_buff2_8_ce1 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff2_8_d0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff2_8_d0 = grp_load_cifm_data_fu_1603_ifm_buff1_8_d0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op302_call_state4.read()))) {
        ifm_buff2_8_d0 = grp_write_row_ifm_fu_1578_ifm_buff0_8_d0.read();
    } else {
        ifm_buff2_8_d0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_ifm_buff2_8_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff2_8_we0 = grp_load_cifm_data_fu_1603_ifm_buff1_8_we0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op302_call_state4.read()))) {
        ifm_buff2_8_we0 = grp_write_row_ifm_fu_1578_ifm_buff0_8_we0.read();
    } else {
        ifm_buff2_8_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff2_9_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff2_9_address0 = grp_load_cifm_data_fu_1603_ifm_buff1_9_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op302_call_state4.read()))) {
        ifm_buff2_9_address0 = grp_write_row_ifm_fu_1578_ifm_buff0_9_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read()))) {
        ifm_buff2_9_address0 = grp_conv_write_fu_1047_ifm_buff2_9_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff2_9_address0 = grp_conv_write_fu_1047_ifm_buff1_9_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read()))) {
        ifm_buff2_9_address0 = grp_conv_write_fu_1047_ifm_buff0_9_address0.read();
    } else {
        ifm_buff2_9_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff2_9_address1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff2_9_address1 = grp_conv_write_fu_1047_ifm_buff2_9_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff2_9_address1 = grp_conv_write_fu_1047_ifm_buff1_9_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff2_9_address1 = grp_conv_write_fu_1047_ifm_buff0_9_address1.read();
        } else {
            ifm_buff2_9_address1 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff2_9_address1 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff2_9_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff2_9_ce0 = grp_load_cifm_data_fu_1603_ifm_buff1_9_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op302_call_state4.read()))) {
        ifm_buff2_9_ce0 = grp_write_row_ifm_fu_1578_ifm_buff0_9_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read()))) {
        ifm_buff2_9_ce0 = grp_conv_write_fu_1047_ifm_buff2_9_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff2_9_ce0 = grp_conv_write_fu_1047_ifm_buff1_9_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read()))) {
        ifm_buff2_9_ce0 = grp_conv_write_fu_1047_ifm_buff0_9_ce0.read();
    } else {
        ifm_buff2_9_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff2_9_ce1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) {
            ifm_buff2_9_ce1 = grp_conv_write_fu_1047_ifm_buff2_9_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff2_9_ce1 = grp_conv_write_fu_1047_ifm_buff1_9_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff2_9_ce1 = grp_conv_write_fu_1047_ifm_buff0_9_ce1.read();
        } else {
            ifm_buff2_9_ce1 = ap_const_logic_0;
        }
    } else {
        ifm_buff2_9_ce1 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff2_9_d0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff2_9_d0 = grp_load_cifm_data_fu_1603_ifm_buff1_9_d0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op302_call_state4.read()))) {
        ifm_buff2_9_d0 = grp_write_row_ifm_fu_1578_ifm_buff0_9_d0.read();
    } else {
        ifm_buff2_9_d0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_ifm_buff2_9_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff2_9_we0 = grp_load_cifm_data_fu_1603_ifm_buff1_9_we0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op302_call_state4.read()))) {
        ifm_buff2_9_we0 = grp_write_row_ifm_fu_1578_ifm_buff0_9_we0.read();
    } else {
        ifm_buff2_9_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff3_0_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff3_0_address0 = grp_load_cifm_data_fu_1603_ifm_buff2_0_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op296_call_state4.read()))) {
        ifm_buff3_0_address0 = grp_write_row_ifm_fu_1578_ifm_buff0_0_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff3_0_address0 = grp_conv_write_fu_1047_ifm_buff2_0_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read()))) {
        ifm_buff3_0_address0 = grp_conv_write_fu_1047_ifm_buff1_0_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read()))) {
        ifm_buff3_0_address0 = grp_conv_write_fu_1047_ifm_buff0_0_address0.read();
    } else {
        ifm_buff3_0_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff3_0_address1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff3_0_address1 = grp_conv_write_fu_1047_ifm_buff2_0_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff3_0_address1 = grp_conv_write_fu_1047_ifm_buff1_0_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff3_0_address1 = grp_conv_write_fu_1047_ifm_buff0_0_address1.read();
        } else {
            ifm_buff3_0_address1 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff3_0_address1 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff3_0_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff3_0_ce0 = grp_load_cifm_data_fu_1603_ifm_buff2_0_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op296_call_state4.read()))) {
        ifm_buff3_0_ce0 = grp_write_row_ifm_fu_1578_ifm_buff0_0_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff3_0_ce0 = grp_conv_write_fu_1047_ifm_buff2_0_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read()))) {
        ifm_buff3_0_ce0 = grp_conv_write_fu_1047_ifm_buff1_0_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read()))) {
        ifm_buff3_0_ce0 = grp_conv_write_fu_1047_ifm_buff0_0_ce0.read();
    } else {
        ifm_buff3_0_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff3_0_ce1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff3_0_ce1 = grp_conv_write_fu_1047_ifm_buff2_0_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff3_0_ce1 = grp_conv_write_fu_1047_ifm_buff1_0_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff3_0_ce1 = grp_conv_write_fu_1047_ifm_buff0_0_ce1.read();
        } else {
            ifm_buff3_0_ce1 = ap_const_logic_0;
        }
    } else {
        ifm_buff3_0_ce1 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff3_0_d0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff3_0_d0 = grp_load_cifm_data_fu_1603_ifm_buff2_0_d0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op296_call_state4.read()))) {
        ifm_buff3_0_d0 = grp_write_row_ifm_fu_1578_ifm_buff0_0_d0.read();
    } else {
        ifm_buff3_0_d0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_ifm_buff3_0_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff3_0_we0 = grp_load_cifm_data_fu_1603_ifm_buff2_0_we0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op296_call_state4.read()))) {
        ifm_buff3_0_we0 = grp_write_row_ifm_fu_1578_ifm_buff0_0_we0.read();
    } else {
        ifm_buff3_0_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff3_10_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff3_10_address0 = grp_load_cifm_data_fu_1603_ifm_buff2_10_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op296_call_state4.read()))) {
        ifm_buff3_10_address0 = grp_write_row_ifm_fu_1578_ifm_buff0_10_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff3_10_address0 = grp_conv_write_fu_1047_ifm_buff2_10_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read()))) {
        ifm_buff3_10_address0 = grp_conv_write_fu_1047_ifm_buff1_10_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read()))) {
        ifm_buff3_10_address0 = grp_conv_write_fu_1047_ifm_buff0_10_address0.read();
    } else {
        ifm_buff3_10_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff3_10_address1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff3_10_address1 = grp_conv_write_fu_1047_ifm_buff2_10_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff3_10_address1 = grp_conv_write_fu_1047_ifm_buff1_10_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff3_10_address1 = grp_conv_write_fu_1047_ifm_buff0_10_address1.read();
        } else {
            ifm_buff3_10_address1 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff3_10_address1 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff3_10_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff3_10_ce0 = grp_load_cifm_data_fu_1603_ifm_buff2_10_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op296_call_state4.read()))) {
        ifm_buff3_10_ce0 = grp_write_row_ifm_fu_1578_ifm_buff0_10_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff3_10_ce0 = grp_conv_write_fu_1047_ifm_buff2_10_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read()))) {
        ifm_buff3_10_ce0 = grp_conv_write_fu_1047_ifm_buff1_10_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read()))) {
        ifm_buff3_10_ce0 = grp_conv_write_fu_1047_ifm_buff0_10_ce0.read();
    } else {
        ifm_buff3_10_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff3_10_ce1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff3_10_ce1 = grp_conv_write_fu_1047_ifm_buff2_10_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff3_10_ce1 = grp_conv_write_fu_1047_ifm_buff1_10_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff3_10_ce1 = grp_conv_write_fu_1047_ifm_buff0_10_ce1.read();
        } else {
            ifm_buff3_10_ce1 = ap_const_logic_0;
        }
    } else {
        ifm_buff3_10_ce1 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff3_10_d0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff3_10_d0 = grp_load_cifm_data_fu_1603_ifm_buff2_10_d0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op296_call_state4.read()))) {
        ifm_buff3_10_d0 = grp_write_row_ifm_fu_1578_ifm_buff0_10_d0.read();
    } else {
        ifm_buff3_10_d0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_ifm_buff3_10_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff3_10_we0 = grp_load_cifm_data_fu_1603_ifm_buff2_10_we0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op296_call_state4.read()))) {
        ifm_buff3_10_we0 = grp_write_row_ifm_fu_1578_ifm_buff0_10_we0.read();
    } else {
        ifm_buff3_10_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff3_11_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff3_11_address0 = grp_load_cifm_data_fu_1603_ifm_buff2_11_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op296_call_state4.read()))) {
        ifm_buff3_11_address0 = grp_write_row_ifm_fu_1578_ifm_buff0_11_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff3_11_address0 = grp_conv_write_fu_1047_ifm_buff2_11_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read()))) {
        ifm_buff3_11_address0 = grp_conv_write_fu_1047_ifm_buff1_11_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read()))) {
        ifm_buff3_11_address0 = grp_conv_write_fu_1047_ifm_buff0_11_address0.read();
    } else {
        ifm_buff3_11_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff3_11_address1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff3_11_address1 = grp_conv_write_fu_1047_ifm_buff2_11_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff3_11_address1 = grp_conv_write_fu_1047_ifm_buff1_11_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff3_11_address1 = grp_conv_write_fu_1047_ifm_buff0_11_address1.read();
        } else {
            ifm_buff3_11_address1 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff3_11_address1 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff3_11_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff3_11_ce0 = grp_load_cifm_data_fu_1603_ifm_buff2_11_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op296_call_state4.read()))) {
        ifm_buff3_11_ce0 = grp_write_row_ifm_fu_1578_ifm_buff0_11_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff3_11_ce0 = grp_conv_write_fu_1047_ifm_buff2_11_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read()))) {
        ifm_buff3_11_ce0 = grp_conv_write_fu_1047_ifm_buff1_11_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read()))) {
        ifm_buff3_11_ce0 = grp_conv_write_fu_1047_ifm_buff0_11_ce0.read();
    } else {
        ifm_buff3_11_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff3_11_ce1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff3_11_ce1 = grp_conv_write_fu_1047_ifm_buff2_11_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff3_11_ce1 = grp_conv_write_fu_1047_ifm_buff1_11_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff3_11_ce1 = grp_conv_write_fu_1047_ifm_buff0_11_ce1.read();
        } else {
            ifm_buff3_11_ce1 = ap_const_logic_0;
        }
    } else {
        ifm_buff3_11_ce1 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff3_11_d0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff3_11_d0 = grp_load_cifm_data_fu_1603_ifm_buff2_11_d0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op296_call_state4.read()))) {
        ifm_buff3_11_d0 = grp_write_row_ifm_fu_1578_ifm_buff0_11_d0.read();
    } else {
        ifm_buff3_11_d0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_ifm_buff3_11_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff3_11_we0 = grp_load_cifm_data_fu_1603_ifm_buff2_11_we0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op296_call_state4.read()))) {
        ifm_buff3_11_we0 = grp_write_row_ifm_fu_1578_ifm_buff0_11_we0.read();
    } else {
        ifm_buff3_11_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff3_12_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff3_12_address0 = grp_load_cifm_data_fu_1603_ifm_buff2_12_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op296_call_state4.read()))) {
        ifm_buff3_12_address0 = grp_write_row_ifm_fu_1578_ifm_buff0_12_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff3_12_address0 = grp_conv_write_fu_1047_ifm_buff2_12_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read()))) {
        ifm_buff3_12_address0 = grp_conv_write_fu_1047_ifm_buff1_12_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read()))) {
        ifm_buff3_12_address0 = grp_conv_write_fu_1047_ifm_buff0_12_address0.read();
    } else {
        ifm_buff3_12_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff3_12_address1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff3_12_address1 = grp_conv_write_fu_1047_ifm_buff2_12_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff3_12_address1 = grp_conv_write_fu_1047_ifm_buff1_12_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff3_12_address1 = grp_conv_write_fu_1047_ifm_buff0_12_address1.read();
        } else {
            ifm_buff3_12_address1 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff3_12_address1 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff3_12_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff3_12_ce0 = grp_load_cifm_data_fu_1603_ifm_buff2_12_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op296_call_state4.read()))) {
        ifm_buff3_12_ce0 = grp_write_row_ifm_fu_1578_ifm_buff0_12_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff3_12_ce0 = grp_conv_write_fu_1047_ifm_buff2_12_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read()))) {
        ifm_buff3_12_ce0 = grp_conv_write_fu_1047_ifm_buff1_12_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read()))) {
        ifm_buff3_12_ce0 = grp_conv_write_fu_1047_ifm_buff0_12_ce0.read();
    } else {
        ifm_buff3_12_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff3_12_ce1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff3_12_ce1 = grp_conv_write_fu_1047_ifm_buff2_12_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff3_12_ce1 = grp_conv_write_fu_1047_ifm_buff1_12_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff3_12_ce1 = grp_conv_write_fu_1047_ifm_buff0_12_ce1.read();
        } else {
            ifm_buff3_12_ce1 = ap_const_logic_0;
        }
    } else {
        ifm_buff3_12_ce1 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff3_12_d0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff3_12_d0 = grp_load_cifm_data_fu_1603_ifm_buff2_12_d0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op296_call_state4.read()))) {
        ifm_buff3_12_d0 = grp_write_row_ifm_fu_1578_ifm_buff0_12_d0.read();
    } else {
        ifm_buff3_12_d0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_ifm_buff3_12_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff3_12_we0 = grp_load_cifm_data_fu_1603_ifm_buff2_12_we0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op296_call_state4.read()))) {
        ifm_buff3_12_we0 = grp_write_row_ifm_fu_1578_ifm_buff0_12_we0.read();
    } else {
        ifm_buff3_12_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff3_13_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff3_13_address0 = grp_load_cifm_data_fu_1603_ifm_buff2_13_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op296_call_state4.read()))) {
        ifm_buff3_13_address0 = grp_write_row_ifm_fu_1578_ifm_buff0_13_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff3_13_address0 = grp_conv_write_fu_1047_ifm_buff2_13_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read()))) {
        ifm_buff3_13_address0 = grp_conv_write_fu_1047_ifm_buff1_13_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read()))) {
        ifm_buff3_13_address0 = grp_conv_write_fu_1047_ifm_buff0_13_address0.read();
    } else {
        ifm_buff3_13_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff3_13_address1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff3_13_address1 = grp_conv_write_fu_1047_ifm_buff2_13_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff3_13_address1 = grp_conv_write_fu_1047_ifm_buff1_13_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff3_13_address1 = grp_conv_write_fu_1047_ifm_buff0_13_address1.read();
        } else {
            ifm_buff3_13_address1 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff3_13_address1 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff3_13_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff3_13_ce0 = grp_load_cifm_data_fu_1603_ifm_buff2_13_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op296_call_state4.read()))) {
        ifm_buff3_13_ce0 = grp_write_row_ifm_fu_1578_ifm_buff0_13_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff3_13_ce0 = grp_conv_write_fu_1047_ifm_buff2_13_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read()))) {
        ifm_buff3_13_ce0 = grp_conv_write_fu_1047_ifm_buff1_13_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read()))) {
        ifm_buff3_13_ce0 = grp_conv_write_fu_1047_ifm_buff0_13_ce0.read();
    } else {
        ifm_buff3_13_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff3_13_ce1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff3_13_ce1 = grp_conv_write_fu_1047_ifm_buff2_13_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff3_13_ce1 = grp_conv_write_fu_1047_ifm_buff1_13_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff3_13_ce1 = grp_conv_write_fu_1047_ifm_buff0_13_ce1.read();
        } else {
            ifm_buff3_13_ce1 = ap_const_logic_0;
        }
    } else {
        ifm_buff3_13_ce1 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff3_13_d0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff3_13_d0 = grp_load_cifm_data_fu_1603_ifm_buff2_13_d0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op296_call_state4.read()))) {
        ifm_buff3_13_d0 = grp_write_row_ifm_fu_1578_ifm_buff0_13_d0.read();
    } else {
        ifm_buff3_13_d0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_ifm_buff3_13_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff3_13_we0 = grp_load_cifm_data_fu_1603_ifm_buff2_13_we0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op296_call_state4.read()))) {
        ifm_buff3_13_we0 = grp_write_row_ifm_fu_1578_ifm_buff0_13_we0.read();
    } else {
        ifm_buff3_13_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff3_14_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff3_14_address0 = grp_load_cifm_data_fu_1603_ifm_buff2_14_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op296_call_state4.read()))) {
        ifm_buff3_14_address0 = grp_write_row_ifm_fu_1578_ifm_buff0_14_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff3_14_address0 = grp_conv_write_fu_1047_ifm_buff2_14_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read()))) {
        ifm_buff3_14_address0 = grp_conv_write_fu_1047_ifm_buff1_14_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read()))) {
        ifm_buff3_14_address0 = grp_conv_write_fu_1047_ifm_buff0_14_address0.read();
    } else {
        ifm_buff3_14_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff3_14_address1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff3_14_address1 = grp_conv_write_fu_1047_ifm_buff2_14_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff3_14_address1 = grp_conv_write_fu_1047_ifm_buff1_14_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff3_14_address1 = grp_conv_write_fu_1047_ifm_buff0_14_address1.read();
        } else {
            ifm_buff3_14_address1 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff3_14_address1 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff3_14_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff3_14_ce0 = grp_load_cifm_data_fu_1603_ifm_buff2_14_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op296_call_state4.read()))) {
        ifm_buff3_14_ce0 = grp_write_row_ifm_fu_1578_ifm_buff0_14_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff3_14_ce0 = grp_conv_write_fu_1047_ifm_buff2_14_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read()))) {
        ifm_buff3_14_ce0 = grp_conv_write_fu_1047_ifm_buff1_14_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read()))) {
        ifm_buff3_14_ce0 = grp_conv_write_fu_1047_ifm_buff0_14_ce0.read();
    } else {
        ifm_buff3_14_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff3_14_ce1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff3_14_ce1 = grp_conv_write_fu_1047_ifm_buff2_14_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff3_14_ce1 = grp_conv_write_fu_1047_ifm_buff1_14_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff3_14_ce1 = grp_conv_write_fu_1047_ifm_buff0_14_ce1.read();
        } else {
            ifm_buff3_14_ce1 = ap_const_logic_0;
        }
    } else {
        ifm_buff3_14_ce1 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff3_14_d0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff3_14_d0 = grp_load_cifm_data_fu_1603_ifm_buff2_14_d0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op296_call_state4.read()))) {
        ifm_buff3_14_d0 = grp_write_row_ifm_fu_1578_ifm_buff0_14_d0.read();
    } else {
        ifm_buff3_14_d0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_ifm_buff3_14_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff3_14_we0 = grp_load_cifm_data_fu_1603_ifm_buff2_14_we0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op296_call_state4.read()))) {
        ifm_buff3_14_we0 = grp_write_row_ifm_fu_1578_ifm_buff0_14_we0.read();
    } else {
        ifm_buff3_14_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff3_15_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff3_15_address0 = grp_load_cifm_data_fu_1603_ifm_buff2_15_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op296_call_state4.read()))) {
        ifm_buff3_15_address0 = grp_write_row_ifm_fu_1578_ifm_buff0_15_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff3_15_address0 = grp_conv_write_fu_1047_ifm_buff2_15_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read()))) {
        ifm_buff3_15_address0 = grp_conv_write_fu_1047_ifm_buff1_15_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read()))) {
        ifm_buff3_15_address0 = grp_conv_write_fu_1047_ifm_buff0_15_address0.read();
    } else {
        ifm_buff3_15_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff3_15_address1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff3_15_address1 = grp_conv_write_fu_1047_ifm_buff2_15_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff3_15_address1 = grp_conv_write_fu_1047_ifm_buff1_15_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff3_15_address1 = grp_conv_write_fu_1047_ifm_buff0_15_address1.read();
        } else {
            ifm_buff3_15_address1 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff3_15_address1 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff3_15_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff3_15_ce0 = grp_load_cifm_data_fu_1603_ifm_buff2_15_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op296_call_state4.read()))) {
        ifm_buff3_15_ce0 = grp_write_row_ifm_fu_1578_ifm_buff0_15_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff3_15_ce0 = grp_conv_write_fu_1047_ifm_buff2_15_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read()))) {
        ifm_buff3_15_ce0 = grp_conv_write_fu_1047_ifm_buff1_15_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read()))) {
        ifm_buff3_15_ce0 = grp_conv_write_fu_1047_ifm_buff0_15_ce0.read();
    } else {
        ifm_buff3_15_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff3_15_ce1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff3_15_ce1 = grp_conv_write_fu_1047_ifm_buff2_15_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff3_15_ce1 = grp_conv_write_fu_1047_ifm_buff1_15_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff3_15_ce1 = grp_conv_write_fu_1047_ifm_buff0_15_ce1.read();
        } else {
            ifm_buff3_15_ce1 = ap_const_logic_0;
        }
    } else {
        ifm_buff3_15_ce1 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff3_15_d0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff3_15_d0 = grp_load_cifm_data_fu_1603_ifm_buff2_15_d0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op296_call_state4.read()))) {
        ifm_buff3_15_d0 = grp_write_row_ifm_fu_1578_ifm_buff0_15_d0.read();
    } else {
        ifm_buff3_15_d0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_ifm_buff3_15_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff3_15_we0 = grp_load_cifm_data_fu_1603_ifm_buff2_15_we0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op296_call_state4.read()))) {
        ifm_buff3_15_we0 = grp_write_row_ifm_fu_1578_ifm_buff0_15_we0.read();
    } else {
        ifm_buff3_15_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff3_1_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff3_1_address0 = grp_load_cifm_data_fu_1603_ifm_buff2_1_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op296_call_state4.read()))) {
        ifm_buff3_1_address0 = grp_write_row_ifm_fu_1578_ifm_buff0_1_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff3_1_address0 = grp_conv_write_fu_1047_ifm_buff2_1_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read()))) {
        ifm_buff3_1_address0 = grp_conv_write_fu_1047_ifm_buff1_1_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read()))) {
        ifm_buff3_1_address0 = grp_conv_write_fu_1047_ifm_buff0_1_address0.read();
    } else {
        ifm_buff3_1_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff3_1_address1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff3_1_address1 = grp_conv_write_fu_1047_ifm_buff2_1_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff3_1_address1 = grp_conv_write_fu_1047_ifm_buff1_1_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff3_1_address1 = grp_conv_write_fu_1047_ifm_buff0_1_address1.read();
        } else {
            ifm_buff3_1_address1 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff3_1_address1 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff3_1_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff3_1_ce0 = grp_load_cifm_data_fu_1603_ifm_buff2_1_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op296_call_state4.read()))) {
        ifm_buff3_1_ce0 = grp_write_row_ifm_fu_1578_ifm_buff0_1_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff3_1_ce0 = grp_conv_write_fu_1047_ifm_buff2_1_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read()))) {
        ifm_buff3_1_ce0 = grp_conv_write_fu_1047_ifm_buff1_1_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read()))) {
        ifm_buff3_1_ce0 = grp_conv_write_fu_1047_ifm_buff0_1_ce0.read();
    } else {
        ifm_buff3_1_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff3_1_ce1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff3_1_ce1 = grp_conv_write_fu_1047_ifm_buff2_1_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff3_1_ce1 = grp_conv_write_fu_1047_ifm_buff1_1_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff3_1_ce1 = grp_conv_write_fu_1047_ifm_buff0_1_ce1.read();
        } else {
            ifm_buff3_1_ce1 = ap_const_logic_0;
        }
    } else {
        ifm_buff3_1_ce1 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff3_1_d0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff3_1_d0 = grp_load_cifm_data_fu_1603_ifm_buff2_1_d0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op296_call_state4.read()))) {
        ifm_buff3_1_d0 = grp_write_row_ifm_fu_1578_ifm_buff0_1_d0.read();
    } else {
        ifm_buff3_1_d0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_ifm_buff3_1_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff3_1_we0 = grp_load_cifm_data_fu_1603_ifm_buff2_1_we0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op296_call_state4.read()))) {
        ifm_buff3_1_we0 = grp_write_row_ifm_fu_1578_ifm_buff0_1_we0.read();
    } else {
        ifm_buff3_1_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff3_2_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff3_2_address0 = grp_load_cifm_data_fu_1603_ifm_buff2_2_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op296_call_state4.read()))) {
        ifm_buff3_2_address0 = grp_write_row_ifm_fu_1578_ifm_buff0_2_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff3_2_address0 = grp_conv_write_fu_1047_ifm_buff2_2_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read()))) {
        ifm_buff3_2_address0 = grp_conv_write_fu_1047_ifm_buff1_2_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read()))) {
        ifm_buff3_2_address0 = grp_conv_write_fu_1047_ifm_buff0_2_address0.read();
    } else {
        ifm_buff3_2_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff3_2_address1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff3_2_address1 = grp_conv_write_fu_1047_ifm_buff2_2_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff3_2_address1 = grp_conv_write_fu_1047_ifm_buff1_2_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff3_2_address1 = grp_conv_write_fu_1047_ifm_buff0_2_address1.read();
        } else {
            ifm_buff3_2_address1 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff3_2_address1 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff3_2_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff3_2_ce0 = grp_load_cifm_data_fu_1603_ifm_buff2_2_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op296_call_state4.read()))) {
        ifm_buff3_2_ce0 = grp_write_row_ifm_fu_1578_ifm_buff0_2_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff3_2_ce0 = grp_conv_write_fu_1047_ifm_buff2_2_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read()))) {
        ifm_buff3_2_ce0 = grp_conv_write_fu_1047_ifm_buff1_2_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read()))) {
        ifm_buff3_2_ce0 = grp_conv_write_fu_1047_ifm_buff0_2_ce0.read();
    } else {
        ifm_buff3_2_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff3_2_ce1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff3_2_ce1 = grp_conv_write_fu_1047_ifm_buff2_2_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff3_2_ce1 = grp_conv_write_fu_1047_ifm_buff1_2_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff3_2_ce1 = grp_conv_write_fu_1047_ifm_buff0_2_ce1.read();
        } else {
            ifm_buff3_2_ce1 = ap_const_logic_0;
        }
    } else {
        ifm_buff3_2_ce1 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff3_2_d0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff3_2_d0 = grp_load_cifm_data_fu_1603_ifm_buff2_2_d0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op296_call_state4.read()))) {
        ifm_buff3_2_d0 = grp_write_row_ifm_fu_1578_ifm_buff0_2_d0.read();
    } else {
        ifm_buff3_2_d0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_ifm_buff3_2_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff3_2_we0 = grp_load_cifm_data_fu_1603_ifm_buff2_2_we0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op296_call_state4.read()))) {
        ifm_buff3_2_we0 = grp_write_row_ifm_fu_1578_ifm_buff0_2_we0.read();
    } else {
        ifm_buff3_2_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff3_3_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff3_3_address0 = grp_load_cifm_data_fu_1603_ifm_buff2_3_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op296_call_state4.read()))) {
        ifm_buff3_3_address0 = grp_write_row_ifm_fu_1578_ifm_buff0_3_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff3_3_address0 = grp_conv_write_fu_1047_ifm_buff2_3_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read()))) {
        ifm_buff3_3_address0 = grp_conv_write_fu_1047_ifm_buff1_3_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read()))) {
        ifm_buff3_3_address0 = grp_conv_write_fu_1047_ifm_buff0_3_address0.read();
    } else {
        ifm_buff3_3_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff3_3_address1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff3_3_address1 = grp_conv_write_fu_1047_ifm_buff2_3_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff3_3_address1 = grp_conv_write_fu_1047_ifm_buff1_3_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff3_3_address1 = grp_conv_write_fu_1047_ifm_buff0_3_address1.read();
        } else {
            ifm_buff3_3_address1 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff3_3_address1 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff3_3_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff3_3_ce0 = grp_load_cifm_data_fu_1603_ifm_buff2_3_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op296_call_state4.read()))) {
        ifm_buff3_3_ce0 = grp_write_row_ifm_fu_1578_ifm_buff0_3_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff3_3_ce0 = grp_conv_write_fu_1047_ifm_buff2_3_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read()))) {
        ifm_buff3_3_ce0 = grp_conv_write_fu_1047_ifm_buff1_3_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read()))) {
        ifm_buff3_3_ce0 = grp_conv_write_fu_1047_ifm_buff0_3_ce0.read();
    } else {
        ifm_buff3_3_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff3_3_ce1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff3_3_ce1 = grp_conv_write_fu_1047_ifm_buff2_3_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff3_3_ce1 = grp_conv_write_fu_1047_ifm_buff1_3_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff3_3_ce1 = grp_conv_write_fu_1047_ifm_buff0_3_ce1.read();
        } else {
            ifm_buff3_3_ce1 = ap_const_logic_0;
        }
    } else {
        ifm_buff3_3_ce1 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff3_3_d0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff3_3_d0 = grp_load_cifm_data_fu_1603_ifm_buff2_3_d0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op296_call_state4.read()))) {
        ifm_buff3_3_d0 = grp_write_row_ifm_fu_1578_ifm_buff0_3_d0.read();
    } else {
        ifm_buff3_3_d0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_ifm_buff3_3_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff3_3_we0 = grp_load_cifm_data_fu_1603_ifm_buff2_3_we0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op296_call_state4.read()))) {
        ifm_buff3_3_we0 = grp_write_row_ifm_fu_1578_ifm_buff0_3_we0.read();
    } else {
        ifm_buff3_3_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff3_4_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff3_4_address0 = grp_load_cifm_data_fu_1603_ifm_buff2_4_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op296_call_state4.read()))) {
        ifm_buff3_4_address0 = grp_write_row_ifm_fu_1578_ifm_buff0_4_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff3_4_address0 = grp_conv_write_fu_1047_ifm_buff2_4_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read()))) {
        ifm_buff3_4_address0 = grp_conv_write_fu_1047_ifm_buff1_4_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read()))) {
        ifm_buff3_4_address0 = grp_conv_write_fu_1047_ifm_buff0_4_address0.read();
    } else {
        ifm_buff3_4_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff3_4_address1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff3_4_address1 = grp_conv_write_fu_1047_ifm_buff2_4_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff3_4_address1 = grp_conv_write_fu_1047_ifm_buff1_4_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff3_4_address1 = grp_conv_write_fu_1047_ifm_buff0_4_address1.read();
        } else {
            ifm_buff3_4_address1 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff3_4_address1 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff3_4_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff3_4_ce0 = grp_load_cifm_data_fu_1603_ifm_buff2_4_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op296_call_state4.read()))) {
        ifm_buff3_4_ce0 = grp_write_row_ifm_fu_1578_ifm_buff0_4_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff3_4_ce0 = grp_conv_write_fu_1047_ifm_buff2_4_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read()))) {
        ifm_buff3_4_ce0 = grp_conv_write_fu_1047_ifm_buff1_4_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read()))) {
        ifm_buff3_4_ce0 = grp_conv_write_fu_1047_ifm_buff0_4_ce0.read();
    } else {
        ifm_buff3_4_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff3_4_ce1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff3_4_ce1 = grp_conv_write_fu_1047_ifm_buff2_4_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff3_4_ce1 = grp_conv_write_fu_1047_ifm_buff1_4_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff3_4_ce1 = grp_conv_write_fu_1047_ifm_buff0_4_ce1.read();
        } else {
            ifm_buff3_4_ce1 = ap_const_logic_0;
        }
    } else {
        ifm_buff3_4_ce1 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff3_4_d0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff3_4_d0 = grp_load_cifm_data_fu_1603_ifm_buff2_4_d0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op296_call_state4.read()))) {
        ifm_buff3_4_d0 = grp_write_row_ifm_fu_1578_ifm_buff0_4_d0.read();
    } else {
        ifm_buff3_4_d0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_ifm_buff3_4_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff3_4_we0 = grp_load_cifm_data_fu_1603_ifm_buff2_4_we0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op296_call_state4.read()))) {
        ifm_buff3_4_we0 = grp_write_row_ifm_fu_1578_ifm_buff0_4_we0.read();
    } else {
        ifm_buff3_4_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff3_5_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff3_5_address0 = grp_load_cifm_data_fu_1603_ifm_buff2_5_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op296_call_state4.read()))) {
        ifm_buff3_5_address0 = grp_write_row_ifm_fu_1578_ifm_buff0_5_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff3_5_address0 = grp_conv_write_fu_1047_ifm_buff2_5_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read()))) {
        ifm_buff3_5_address0 = grp_conv_write_fu_1047_ifm_buff1_5_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read()))) {
        ifm_buff3_5_address0 = grp_conv_write_fu_1047_ifm_buff0_5_address0.read();
    } else {
        ifm_buff3_5_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff3_5_address1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff3_5_address1 = grp_conv_write_fu_1047_ifm_buff2_5_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff3_5_address1 = grp_conv_write_fu_1047_ifm_buff1_5_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff3_5_address1 = grp_conv_write_fu_1047_ifm_buff0_5_address1.read();
        } else {
            ifm_buff3_5_address1 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff3_5_address1 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff3_5_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff3_5_ce0 = grp_load_cifm_data_fu_1603_ifm_buff2_5_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op296_call_state4.read()))) {
        ifm_buff3_5_ce0 = grp_write_row_ifm_fu_1578_ifm_buff0_5_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff3_5_ce0 = grp_conv_write_fu_1047_ifm_buff2_5_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read()))) {
        ifm_buff3_5_ce0 = grp_conv_write_fu_1047_ifm_buff1_5_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read()))) {
        ifm_buff3_5_ce0 = grp_conv_write_fu_1047_ifm_buff0_5_ce0.read();
    } else {
        ifm_buff3_5_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff3_5_ce1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff3_5_ce1 = grp_conv_write_fu_1047_ifm_buff2_5_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff3_5_ce1 = grp_conv_write_fu_1047_ifm_buff1_5_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff3_5_ce1 = grp_conv_write_fu_1047_ifm_buff0_5_ce1.read();
        } else {
            ifm_buff3_5_ce1 = ap_const_logic_0;
        }
    } else {
        ifm_buff3_5_ce1 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff3_5_d0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff3_5_d0 = grp_load_cifm_data_fu_1603_ifm_buff2_5_d0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op296_call_state4.read()))) {
        ifm_buff3_5_d0 = grp_write_row_ifm_fu_1578_ifm_buff0_5_d0.read();
    } else {
        ifm_buff3_5_d0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_ifm_buff3_5_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff3_5_we0 = grp_load_cifm_data_fu_1603_ifm_buff2_5_we0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op296_call_state4.read()))) {
        ifm_buff3_5_we0 = grp_write_row_ifm_fu_1578_ifm_buff0_5_we0.read();
    } else {
        ifm_buff3_5_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff3_6_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff3_6_address0 = grp_load_cifm_data_fu_1603_ifm_buff2_6_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op296_call_state4.read()))) {
        ifm_buff3_6_address0 = grp_write_row_ifm_fu_1578_ifm_buff0_6_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff3_6_address0 = grp_conv_write_fu_1047_ifm_buff2_6_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read()))) {
        ifm_buff3_6_address0 = grp_conv_write_fu_1047_ifm_buff1_6_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read()))) {
        ifm_buff3_6_address0 = grp_conv_write_fu_1047_ifm_buff0_6_address0.read();
    } else {
        ifm_buff3_6_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff3_6_address1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff3_6_address1 = grp_conv_write_fu_1047_ifm_buff2_6_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff3_6_address1 = grp_conv_write_fu_1047_ifm_buff1_6_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff3_6_address1 = grp_conv_write_fu_1047_ifm_buff0_6_address1.read();
        } else {
            ifm_buff3_6_address1 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff3_6_address1 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff3_6_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff3_6_ce0 = grp_load_cifm_data_fu_1603_ifm_buff2_6_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op296_call_state4.read()))) {
        ifm_buff3_6_ce0 = grp_write_row_ifm_fu_1578_ifm_buff0_6_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff3_6_ce0 = grp_conv_write_fu_1047_ifm_buff2_6_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read()))) {
        ifm_buff3_6_ce0 = grp_conv_write_fu_1047_ifm_buff1_6_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read()))) {
        ifm_buff3_6_ce0 = grp_conv_write_fu_1047_ifm_buff0_6_ce0.read();
    } else {
        ifm_buff3_6_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff3_6_ce1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff3_6_ce1 = grp_conv_write_fu_1047_ifm_buff2_6_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff3_6_ce1 = grp_conv_write_fu_1047_ifm_buff1_6_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff3_6_ce1 = grp_conv_write_fu_1047_ifm_buff0_6_ce1.read();
        } else {
            ifm_buff3_6_ce1 = ap_const_logic_0;
        }
    } else {
        ifm_buff3_6_ce1 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff3_6_d0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff3_6_d0 = grp_load_cifm_data_fu_1603_ifm_buff2_6_d0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op296_call_state4.read()))) {
        ifm_buff3_6_d0 = grp_write_row_ifm_fu_1578_ifm_buff0_6_d0.read();
    } else {
        ifm_buff3_6_d0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_ifm_buff3_6_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff3_6_we0 = grp_load_cifm_data_fu_1603_ifm_buff2_6_we0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op296_call_state4.read()))) {
        ifm_buff3_6_we0 = grp_write_row_ifm_fu_1578_ifm_buff0_6_we0.read();
    } else {
        ifm_buff3_6_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff3_7_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff3_7_address0 = grp_load_cifm_data_fu_1603_ifm_buff2_7_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op296_call_state4.read()))) {
        ifm_buff3_7_address0 = grp_write_row_ifm_fu_1578_ifm_buff0_7_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff3_7_address0 = grp_conv_write_fu_1047_ifm_buff2_7_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read()))) {
        ifm_buff3_7_address0 = grp_conv_write_fu_1047_ifm_buff1_7_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read()))) {
        ifm_buff3_7_address0 = grp_conv_write_fu_1047_ifm_buff0_7_address0.read();
    } else {
        ifm_buff3_7_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff3_7_address1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff3_7_address1 = grp_conv_write_fu_1047_ifm_buff2_7_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff3_7_address1 = grp_conv_write_fu_1047_ifm_buff1_7_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff3_7_address1 = grp_conv_write_fu_1047_ifm_buff0_7_address1.read();
        } else {
            ifm_buff3_7_address1 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff3_7_address1 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff3_7_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff3_7_ce0 = grp_load_cifm_data_fu_1603_ifm_buff2_7_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op296_call_state4.read()))) {
        ifm_buff3_7_ce0 = grp_write_row_ifm_fu_1578_ifm_buff0_7_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff3_7_ce0 = grp_conv_write_fu_1047_ifm_buff2_7_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read()))) {
        ifm_buff3_7_ce0 = grp_conv_write_fu_1047_ifm_buff1_7_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read()))) {
        ifm_buff3_7_ce0 = grp_conv_write_fu_1047_ifm_buff0_7_ce0.read();
    } else {
        ifm_buff3_7_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff3_7_ce1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff3_7_ce1 = grp_conv_write_fu_1047_ifm_buff2_7_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff3_7_ce1 = grp_conv_write_fu_1047_ifm_buff1_7_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff3_7_ce1 = grp_conv_write_fu_1047_ifm_buff0_7_ce1.read();
        } else {
            ifm_buff3_7_ce1 = ap_const_logic_0;
        }
    } else {
        ifm_buff3_7_ce1 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff3_7_d0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff3_7_d0 = grp_load_cifm_data_fu_1603_ifm_buff2_7_d0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op296_call_state4.read()))) {
        ifm_buff3_7_d0 = grp_write_row_ifm_fu_1578_ifm_buff0_7_d0.read();
    } else {
        ifm_buff3_7_d0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_ifm_buff3_7_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff3_7_we0 = grp_load_cifm_data_fu_1603_ifm_buff2_7_we0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op296_call_state4.read()))) {
        ifm_buff3_7_we0 = grp_write_row_ifm_fu_1578_ifm_buff0_7_we0.read();
    } else {
        ifm_buff3_7_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff3_8_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff3_8_address0 = grp_load_cifm_data_fu_1603_ifm_buff2_8_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op296_call_state4.read()))) {
        ifm_buff3_8_address0 = grp_write_row_ifm_fu_1578_ifm_buff0_8_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff3_8_address0 = grp_conv_write_fu_1047_ifm_buff2_8_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read()))) {
        ifm_buff3_8_address0 = grp_conv_write_fu_1047_ifm_buff1_8_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read()))) {
        ifm_buff3_8_address0 = grp_conv_write_fu_1047_ifm_buff0_8_address0.read();
    } else {
        ifm_buff3_8_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff3_8_address1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff3_8_address1 = grp_conv_write_fu_1047_ifm_buff2_8_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff3_8_address1 = grp_conv_write_fu_1047_ifm_buff1_8_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff3_8_address1 = grp_conv_write_fu_1047_ifm_buff0_8_address1.read();
        } else {
            ifm_buff3_8_address1 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff3_8_address1 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff3_8_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff3_8_ce0 = grp_load_cifm_data_fu_1603_ifm_buff2_8_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op296_call_state4.read()))) {
        ifm_buff3_8_ce0 = grp_write_row_ifm_fu_1578_ifm_buff0_8_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff3_8_ce0 = grp_conv_write_fu_1047_ifm_buff2_8_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read()))) {
        ifm_buff3_8_ce0 = grp_conv_write_fu_1047_ifm_buff1_8_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read()))) {
        ifm_buff3_8_ce0 = grp_conv_write_fu_1047_ifm_buff0_8_ce0.read();
    } else {
        ifm_buff3_8_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff3_8_ce1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff3_8_ce1 = grp_conv_write_fu_1047_ifm_buff2_8_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff3_8_ce1 = grp_conv_write_fu_1047_ifm_buff1_8_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff3_8_ce1 = grp_conv_write_fu_1047_ifm_buff0_8_ce1.read();
        } else {
            ifm_buff3_8_ce1 = ap_const_logic_0;
        }
    } else {
        ifm_buff3_8_ce1 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff3_8_d0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff3_8_d0 = grp_load_cifm_data_fu_1603_ifm_buff2_8_d0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op296_call_state4.read()))) {
        ifm_buff3_8_d0 = grp_write_row_ifm_fu_1578_ifm_buff0_8_d0.read();
    } else {
        ifm_buff3_8_d0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_ifm_buff3_8_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff3_8_we0 = grp_load_cifm_data_fu_1603_ifm_buff2_8_we0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op296_call_state4.read()))) {
        ifm_buff3_8_we0 = grp_write_row_ifm_fu_1578_ifm_buff0_8_we0.read();
    } else {
        ifm_buff3_8_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff3_9_address0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff3_9_address0 = grp_load_cifm_data_fu_1603_ifm_buff2_9_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op296_call_state4.read()))) {
        ifm_buff3_9_address0 = grp_write_row_ifm_fu_1578_ifm_buff0_9_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff3_9_address0 = grp_conv_write_fu_1047_ifm_buff2_9_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read()))) {
        ifm_buff3_9_address0 = grp_conv_write_fu_1047_ifm_buff1_9_address0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read()))) {
        ifm_buff3_9_address0 = grp_conv_write_fu_1047_ifm_buff0_9_address0.read();
    } else {
        ifm_buff3_9_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff3_9_address1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff3_9_address1 = grp_conv_write_fu_1047_ifm_buff2_9_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff3_9_address1 = grp_conv_write_fu_1047_ifm_buff1_9_address1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff3_9_address1 = grp_conv_write_fu_1047_ifm_buff0_9_address1.read();
        } else {
            ifm_buff3_9_address1 =  (sc_lv<6>) ("XXXXXX");
        }
    } else {
        ifm_buff3_9_address1 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ifm_buff3_9_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff3_9_ce0 = grp_load_cifm_data_fu_1603_ifm_buff2_9_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op296_call_state4.read()))) {
        ifm_buff3_9_ce0 = grp_write_row_ifm_fu_1578_ifm_buff0_9_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()))) {
        ifm_buff3_9_ce0 = grp_conv_write_fu_1047_ifm_buff2_9_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read()))) {
        ifm_buff3_9_ce0 = grp_conv_write_fu_1047_ifm_buff1_9_ce0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read()))) {
        ifm_buff3_9_ce0 = grp_conv_write_fu_1047_ifm_buff0_9_ce0.read();
    } else {
        ifm_buff3_9_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff3_9_ce1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        if (esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) {
            ifm_buff3_9_ce1 = grp_conv_write_fu_1047_ifm_buff2_9_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())) {
            ifm_buff3_9_ce1 = grp_conv_write_fu_1047_ifm_buff1_9_ce1.read();
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) {
            ifm_buff3_9_ce1 = grp_conv_write_fu_1047_ifm_buff0_9_ce1.read();
        } else {
            ifm_buff3_9_ce1 = ap_const_logic_0;
        }
    } else {
        ifm_buff3_9_ce1 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ifm_buff3_9_d0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff3_9_d0 = grp_load_cifm_data_fu_1603_ifm_buff2_9_d0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op296_call_state4.read()))) {
        ifm_buff3_9_d0 = grp_write_row_ifm_fu_1578_ifm_buff0_9_d0.read();
    } else {
        ifm_buff3_9_d0 =  (sc_lv<32>) ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    }
}

void convolution_hw::thread_ifm_buff3_9_we0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        ifm_buff3_9_we0 = grp_load_cifm_data_fu_1603_ifm_buff2_9_we0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op296_call_state4.read()))) {
        ifm_buff3_9_we0 = grp_write_row_ifm_fu_1578_ifm_buff0_9_we0.read();
    } else {
        ifm_buff3_9_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ofm_buff0_0_address0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op298_call_state4.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op310_call_state4.read())))) {
        ofm_buff0_0_address0 = grp_conv_read_fu_1259_ofm_buff0_0_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        ofm_buff0_0_address0 = grp_conv_write_fu_1047_ofm_buff0_0_address0.read();
    } else {
        ofm_buff0_0_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ofm_buff0_0_ce0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op298_call_state4.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op310_call_state4.read())))) {
        ofm_buff0_0_ce0 = grp_conv_read_fu_1259_ofm_buff0_0_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        ofm_buff0_0_ce0 = grp_conv_write_fu_1047_ofm_buff0_0_ce0.read();
    } else {
        ofm_buff0_0_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ofm_buff0_0_we0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        ofm_buff0_0_we0 = grp_conv_write_fu_1047_ofm_buff0_0_we0.read();
    } else {
        ofm_buff0_0_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ofm_buff0_10_address0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op298_call_state4.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op310_call_state4.read())))) {
        ofm_buff0_10_address0 = grp_conv_read_fu_1259_ofm_buff0_10_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        ofm_buff0_10_address0 = grp_conv_write_fu_1047_ofm_buff0_10_address0.read();
    } else {
        ofm_buff0_10_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ofm_buff0_10_ce0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op298_call_state4.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op310_call_state4.read())))) {
        ofm_buff0_10_ce0 = grp_conv_read_fu_1259_ofm_buff0_10_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        ofm_buff0_10_ce0 = grp_conv_write_fu_1047_ofm_buff0_10_ce0.read();
    } else {
        ofm_buff0_10_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ofm_buff0_10_we0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        ofm_buff0_10_we0 = grp_conv_write_fu_1047_ofm_buff0_10_we0.read();
    } else {
        ofm_buff0_10_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ofm_buff0_11_address0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op298_call_state4.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op310_call_state4.read())))) {
        ofm_buff0_11_address0 = grp_conv_read_fu_1259_ofm_buff0_11_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        ofm_buff0_11_address0 = grp_conv_write_fu_1047_ofm_buff0_11_address0.read();
    } else {
        ofm_buff0_11_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ofm_buff0_11_ce0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op298_call_state4.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op310_call_state4.read())))) {
        ofm_buff0_11_ce0 = grp_conv_read_fu_1259_ofm_buff0_11_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        ofm_buff0_11_ce0 = grp_conv_write_fu_1047_ofm_buff0_11_ce0.read();
    } else {
        ofm_buff0_11_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ofm_buff0_11_we0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        ofm_buff0_11_we0 = grp_conv_write_fu_1047_ofm_buff0_11_we0.read();
    } else {
        ofm_buff0_11_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ofm_buff0_12_address0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op298_call_state4.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op310_call_state4.read())))) {
        ofm_buff0_12_address0 = grp_conv_read_fu_1259_ofm_buff0_12_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        ofm_buff0_12_address0 = grp_conv_write_fu_1047_ofm_buff0_12_address0.read();
    } else {
        ofm_buff0_12_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ofm_buff0_12_ce0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op298_call_state4.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op310_call_state4.read())))) {
        ofm_buff0_12_ce0 = grp_conv_read_fu_1259_ofm_buff0_12_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        ofm_buff0_12_ce0 = grp_conv_write_fu_1047_ofm_buff0_12_ce0.read();
    } else {
        ofm_buff0_12_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ofm_buff0_12_we0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        ofm_buff0_12_we0 = grp_conv_write_fu_1047_ofm_buff0_12_we0.read();
    } else {
        ofm_buff0_12_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ofm_buff0_13_address0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op298_call_state4.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op310_call_state4.read())))) {
        ofm_buff0_13_address0 = grp_conv_read_fu_1259_ofm_buff0_13_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        ofm_buff0_13_address0 = grp_conv_write_fu_1047_ofm_buff0_13_address0.read();
    } else {
        ofm_buff0_13_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ofm_buff0_13_ce0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op298_call_state4.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op310_call_state4.read())))) {
        ofm_buff0_13_ce0 = grp_conv_read_fu_1259_ofm_buff0_13_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        ofm_buff0_13_ce0 = grp_conv_write_fu_1047_ofm_buff0_13_ce0.read();
    } else {
        ofm_buff0_13_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ofm_buff0_13_we0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        ofm_buff0_13_we0 = grp_conv_write_fu_1047_ofm_buff0_13_we0.read();
    } else {
        ofm_buff0_13_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ofm_buff0_14_address0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op298_call_state4.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op310_call_state4.read())))) {
        ofm_buff0_14_address0 = grp_conv_read_fu_1259_ofm_buff0_14_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        ofm_buff0_14_address0 = grp_conv_write_fu_1047_ofm_buff0_14_address0.read();
    } else {
        ofm_buff0_14_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ofm_buff0_14_ce0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op298_call_state4.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op310_call_state4.read())))) {
        ofm_buff0_14_ce0 = grp_conv_read_fu_1259_ofm_buff0_14_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        ofm_buff0_14_ce0 = grp_conv_write_fu_1047_ofm_buff0_14_ce0.read();
    } else {
        ofm_buff0_14_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ofm_buff0_14_we0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        ofm_buff0_14_we0 = grp_conv_write_fu_1047_ofm_buff0_14_we0.read();
    } else {
        ofm_buff0_14_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ofm_buff0_15_address0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op298_call_state4.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op310_call_state4.read())))) {
        ofm_buff0_15_address0 = grp_conv_read_fu_1259_ofm_buff0_15_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        ofm_buff0_15_address0 = grp_conv_write_fu_1047_ofm_buff0_15_address0.read();
    } else {
        ofm_buff0_15_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ofm_buff0_15_ce0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op298_call_state4.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op310_call_state4.read())))) {
        ofm_buff0_15_ce0 = grp_conv_read_fu_1259_ofm_buff0_15_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        ofm_buff0_15_ce0 = grp_conv_write_fu_1047_ofm_buff0_15_ce0.read();
    } else {
        ofm_buff0_15_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ofm_buff0_15_we0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        ofm_buff0_15_we0 = grp_conv_write_fu_1047_ofm_buff0_15_we0.read();
    } else {
        ofm_buff0_15_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ofm_buff0_1_address0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op298_call_state4.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op310_call_state4.read())))) {
        ofm_buff0_1_address0 = grp_conv_read_fu_1259_ofm_buff0_1_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        ofm_buff0_1_address0 = grp_conv_write_fu_1047_ofm_buff0_1_address0.read();
    } else {
        ofm_buff0_1_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ofm_buff0_1_ce0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op298_call_state4.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op310_call_state4.read())))) {
        ofm_buff0_1_ce0 = grp_conv_read_fu_1259_ofm_buff0_1_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        ofm_buff0_1_ce0 = grp_conv_write_fu_1047_ofm_buff0_1_ce0.read();
    } else {
        ofm_buff0_1_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ofm_buff0_1_we0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        ofm_buff0_1_we0 = grp_conv_write_fu_1047_ofm_buff0_1_we0.read();
    } else {
        ofm_buff0_1_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ofm_buff0_2_address0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op298_call_state4.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op310_call_state4.read())))) {
        ofm_buff0_2_address0 = grp_conv_read_fu_1259_ofm_buff0_2_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        ofm_buff0_2_address0 = grp_conv_write_fu_1047_ofm_buff0_2_address0.read();
    } else {
        ofm_buff0_2_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ofm_buff0_2_ce0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op298_call_state4.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op310_call_state4.read())))) {
        ofm_buff0_2_ce0 = grp_conv_read_fu_1259_ofm_buff0_2_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        ofm_buff0_2_ce0 = grp_conv_write_fu_1047_ofm_buff0_2_ce0.read();
    } else {
        ofm_buff0_2_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ofm_buff0_2_we0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        ofm_buff0_2_we0 = grp_conv_write_fu_1047_ofm_buff0_2_we0.read();
    } else {
        ofm_buff0_2_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ofm_buff0_3_address0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op298_call_state4.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op310_call_state4.read())))) {
        ofm_buff0_3_address0 = grp_conv_read_fu_1259_ofm_buff0_3_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        ofm_buff0_3_address0 = grp_conv_write_fu_1047_ofm_buff0_3_address0.read();
    } else {
        ofm_buff0_3_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ofm_buff0_3_ce0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op298_call_state4.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op310_call_state4.read())))) {
        ofm_buff0_3_ce0 = grp_conv_read_fu_1259_ofm_buff0_3_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        ofm_buff0_3_ce0 = grp_conv_write_fu_1047_ofm_buff0_3_ce0.read();
    } else {
        ofm_buff0_3_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ofm_buff0_3_we0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        ofm_buff0_3_we0 = grp_conv_write_fu_1047_ofm_buff0_3_we0.read();
    } else {
        ofm_buff0_3_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ofm_buff0_4_address0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op298_call_state4.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op310_call_state4.read())))) {
        ofm_buff0_4_address0 = grp_conv_read_fu_1259_ofm_buff0_4_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        ofm_buff0_4_address0 = grp_conv_write_fu_1047_ofm_buff0_4_address0.read();
    } else {
        ofm_buff0_4_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ofm_buff0_4_ce0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op298_call_state4.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op310_call_state4.read())))) {
        ofm_buff0_4_ce0 = grp_conv_read_fu_1259_ofm_buff0_4_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        ofm_buff0_4_ce0 = grp_conv_write_fu_1047_ofm_buff0_4_ce0.read();
    } else {
        ofm_buff0_4_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ofm_buff0_4_we0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        ofm_buff0_4_we0 = grp_conv_write_fu_1047_ofm_buff0_4_we0.read();
    } else {
        ofm_buff0_4_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ofm_buff0_5_address0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op298_call_state4.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op310_call_state4.read())))) {
        ofm_buff0_5_address0 = grp_conv_read_fu_1259_ofm_buff0_5_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        ofm_buff0_5_address0 = grp_conv_write_fu_1047_ofm_buff0_5_address0.read();
    } else {
        ofm_buff0_5_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ofm_buff0_5_ce0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op298_call_state4.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op310_call_state4.read())))) {
        ofm_buff0_5_ce0 = grp_conv_read_fu_1259_ofm_buff0_5_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        ofm_buff0_5_ce0 = grp_conv_write_fu_1047_ofm_buff0_5_ce0.read();
    } else {
        ofm_buff0_5_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ofm_buff0_5_we0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        ofm_buff0_5_we0 = grp_conv_write_fu_1047_ofm_buff0_5_we0.read();
    } else {
        ofm_buff0_5_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ofm_buff0_6_address0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op298_call_state4.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op310_call_state4.read())))) {
        ofm_buff0_6_address0 = grp_conv_read_fu_1259_ofm_buff0_6_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        ofm_buff0_6_address0 = grp_conv_write_fu_1047_ofm_buff0_6_address0.read();
    } else {
        ofm_buff0_6_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ofm_buff0_6_ce0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op298_call_state4.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op310_call_state4.read())))) {
        ofm_buff0_6_ce0 = grp_conv_read_fu_1259_ofm_buff0_6_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        ofm_buff0_6_ce0 = grp_conv_write_fu_1047_ofm_buff0_6_ce0.read();
    } else {
        ofm_buff0_6_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ofm_buff0_6_we0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        ofm_buff0_6_we0 = grp_conv_write_fu_1047_ofm_buff0_6_we0.read();
    } else {
        ofm_buff0_6_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ofm_buff0_7_address0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op298_call_state4.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op310_call_state4.read())))) {
        ofm_buff0_7_address0 = grp_conv_read_fu_1259_ofm_buff0_7_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        ofm_buff0_7_address0 = grp_conv_write_fu_1047_ofm_buff0_7_address0.read();
    } else {
        ofm_buff0_7_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ofm_buff0_7_ce0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op298_call_state4.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op310_call_state4.read())))) {
        ofm_buff0_7_ce0 = grp_conv_read_fu_1259_ofm_buff0_7_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        ofm_buff0_7_ce0 = grp_conv_write_fu_1047_ofm_buff0_7_ce0.read();
    } else {
        ofm_buff0_7_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ofm_buff0_7_we0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        ofm_buff0_7_we0 = grp_conv_write_fu_1047_ofm_buff0_7_we0.read();
    } else {
        ofm_buff0_7_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ofm_buff0_8_address0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op298_call_state4.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op310_call_state4.read())))) {
        ofm_buff0_8_address0 = grp_conv_read_fu_1259_ofm_buff0_8_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        ofm_buff0_8_address0 = grp_conv_write_fu_1047_ofm_buff0_8_address0.read();
    } else {
        ofm_buff0_8_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ofm_buff0_8_ce0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op298_call_state4.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op310_call_state4.read())))) {
        ofm_buff0_8_ce0 = grp_conv_read_fu_1259_ofm_buff0_8_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        ofm_buff0_8_ce0 = grp_conv_write_fu_1047_ofm_buff0_8_ce0.read();
    } else {
        ofm_buff0_8_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ofm_buff0_8_we0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        ofm_buff0_8_we0 = grp_conv_write_fu_1047_ofm_buff0_8_we0.read();
    } else {
        ofm_buff0_8_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ofm_buff0_9_address0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op298_call_state4.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op310_call_state4.read())))) {
        ofm_buff0_9_address0 = grp_conv_read_fu_1259_ofm_buff0_9_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        ofm_buff0_9_address0 = grp_conv_write_fu_1047_ofm_buff0_9_address0.read();
    } else {
        ofm_buff0_9_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ofm_buff0_9_ce0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op298_call_state4.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op310_call_state4.read())))) {
        ofm_buff0_9_ce0 = grp_conv_read_fu_1259_ofm_buff0_9_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        ofm_buff0_9_ce0 = grp_conv_write_fu_1047_ofm_buff0_9_ce0.read();
    } else {
        ofm_buff0_9_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ofm_buff0_9_we0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op303_call_state4.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())))) {
        ofm_buff0_9_we0 = grp_conv_write_fu_1047_ofm_buff0_9_we0.read();
    } else {
        ofm_buff0_9_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ofm_buff1_0_address0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op304_call_state4.read())) || 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state5.read()))) {
        ofm_buff1_0_address0 = grp_conv_read_fu_1259_ofm_buff0_0_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())))) {
        ofm_buff1_0_address0 = grp_conv_write_fu_1047_ofm_buff0_0_address0.read();
    } else {
        ofm_buff1_0_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ofm_buff1_0_ce0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op304_call_state4.read())) || 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state5.read()))) {
        ofm_buff1_0_ce0 = grp_conv_read_fu_1259_ofm_buff0_0_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())))) {
        ofm_buff1_0_ce0 = grp_conv_write_fu_1047_ofm_buff0_0_ce0.read();
    } else {
        ofm_buff1_0_ce0 = ap_const_logic_0;
    }
}

}

