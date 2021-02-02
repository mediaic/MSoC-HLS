#include "convolution_hw.h"
#include "AESL_pkg.h"

using namespace std;

namespace ap_rtl {

void convolution_hw::thread_ofm_buff1_0_we0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())))) {
        ofm_buff1_0_we0 = grp_conv_write_fu_1047_ofm_buff0_0_we0.read();
    } else {
        ofm_buff1_0_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ofm_buff1_10_address0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op304_call_state4.read())) || 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state5.read()))) {
        ofm_buff1_10_address0 = grp_conv_read_fu_1259_ofm_buff0_10_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())))) {
        ofm_buff1_10_address0 = grp_conv_write_fu_1047_ofm_buff0_10_address0.read();
    } else {
        ofm_buff1_10_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ofm_buff1_10_ce0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op304_call_state4.read())) || 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state5.read()))) {
        ofm_buff1_10_ce0 = grp_conv_read_fu_1259_ofm_buff0_10_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())))) {
        ofm_buff1_10_ce0 = grp_conv_write_fu_1047_ofm_buff0_10_ce0.read();
    } else {
        ofm_buff1_10_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ofm_buff1_10_we0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())))) {
        ofm_buff1_10_we0 = grp_conv_write_fu_1047_ofm_buff0_10_we0.read();
    } else {
        ofm_buff1_10_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ofm_buff1_11_address0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op304_call_state4.read())) || 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state5.read()))) {
        ofm_buff1_11_address0 = grp_conv_read_fu_1259_ofm_buff0_11_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())))) {
        ofm_buff1_11_address0 = grp_conv_write_fu_1047_ofm_buff0_11_address0.read();
    } else {
        ofm_buff1_11_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ofm_buff1_11_ce0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op304_call_state4.read())) || 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state5.read()))) {
        ofm_buff1_11_ce0 = grp_conv_read_fu_1259_ofm_buff0_11_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())))) {
        ofm_buff1_11_ce0 = grp_conv_write_fu_1047_ofm_buff0_11_ce0.read();
    } else {
        ofm_buff1_11_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ofm_buff1_11_we0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())))) {
        ofm_buff1_11_we0 = grp_conv_write_fu_1047_ofm_buff0_11_we0.read();
    } else {
        ofm_buff1_11_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ofm_buff1_12_address0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op304_call_state4.read())) || 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state5.read()))) {
        ofm_buff1_12_address0 = grp_conv_read_fu_1259_ofm_buff0_12_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())))) {
        ofm_buff1_12_address0 = grp_conv_write_fu_1047_ofm_buff0_12_address0.read();
    } else {
        ofm_buff1_12_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ofm_buff1_12_ce0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op304_call_state4.read())) || 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state5.read()))) {
        ofm_buff1_12_ce0 = grp_conv_read_fu_1259_ofm_buff0_12_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())))) {
        ofm_buff1_12_ce0 = grp_conv_write_fu_1047_ofm_buff0_12_ce0.read();
    } else {
        ofm_buff1_12_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ofm_buff1_12_we0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())))) {
        ofm_buff1_12_we0 = grp_conv_write_fu_1047_ofm_buff0_12_we0.read();
    } else {
        ofm_buff1_12_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ofm_buff1_13_address0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op304_call_state4.read())) || 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state5.read()))) {
        ofm_buff1_13_address0 = grp_conv_read_fu_1259_ofm_buff0_13_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())))) {
        ofm_buff1_13_address0 = grp_conv_write_fu_1047_ofm_buff0_13_address0.read();
    } else {
        ofm_buff1_13_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ofm_buff1_13_ce0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op304_call_state4.read())) || 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state5.read()))) {
        ofm_buff1_13_ce0 = grp_conv_read_fu_1259_ofm_buff0_13_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())))) {
        ofm_buff1_13_ce0 = grp_conv_write_fu_1047_ofm_buff0_13_ce0.read();
    } else {
        ofm_buff1_13_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ofm_buff1_13_we0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())))) {
        ofm_buff1_13_we0 = grp_conv_write_fu_1047_ofm_buff0_13_we0.read();
    } else {
        ofm_buff1_13_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ofm_buff1_14_address0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op304_call_state4.read())) || 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state5.read()))) {
        ofm_buff1_14_address0 = grp_conv_read_fu_1259_ofm_buff0_14_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())))) {
        ofm_buff1_14_address0 = grp_conv_write_fu_1047_ofm_buff0_14_address0.read();
    } else {
        ofm_buff1_14_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ofm_buff1_14_ce0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op304_call_state4.read())) || 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state5.read()))) {
        ofm_buff1_14_ce0 = grp_conv_read_fu_1259_ofm_buff0_14_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())))) {
        ofm_buff1_14_ce0 = grp_conv_write_fu_1047_ofm_buff0_14_ce0.read();
    } else {
        ofm_buff1_14_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ofm_buff1_14_we0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())))) {
        ofm_buff1_14_we0 = grp_conv_write_fu_1047_ofm_buff0_14_we0.read();
    } else {
        ofm_buff1_14_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ofm_buff1_15_address0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op304_call_state4.read())) || 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state5.read()))) {
        ofm_buff1_15_address0 = grp_conv_read_fu_1259_ofm_buff0_15_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())))) {
        ofm_buff1_15_address0 = grp_conv_write_fu_1047_ofm_buff0_15_address0.read();
    } else {
        ofm_buff1_15_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ofm_buff1_15_ce0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op304_call_state4.read())) || 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state5.read()))) {
        ofm_buff1_15_ce0 = grp_conv_read_fu_1259_ofm_buff0_15_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())))) {
        ofm_buff1_15_ce0 = grp_conv_write_fu_1047_ofm_buff0_15_ce0.read();
    } else {
        ofm_buff1_15_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ofm_buff1_15_we0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())))) {
        ofm_buff1_15_we0 = grp_conv_write_fu_1047_ofm_buff0_15_we0.read();
    } else {
        ofm_buff1_15_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ofm_buff1_1_address0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op304_call_state4.read())) || 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state5.read()))) {
        ofm_buff1_1_address0 = grp_conv_read_fu_1259_ofm_buff0_1_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())))) {
        ofm_buff1_1_address0 = grp_conv_write_fu_1047_ofm_buff0_1_address0.read();
    } else {
        ofm_buff1_1_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ofm_buff1_1_ce0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op304_call_state4.read())) || 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state5.read()))) {
        ofm_buff1_1_ce0 = grp_conv_read_fu_1259_ofm_buff0_1_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())))) {
        ofm_buff1_1_ce0 = grp_conv_write_fu_1047_ofm_buff0_1_ce0.read();
    } else {
        ofm_buff1_1_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ofm_buff1_1_we0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())))) {
        ofm_buff1_1_we0 = grp_conv_write_fu_1047_ofm_buff0_1_we0.read();
    } else {
        ofm_buff1_1_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ofm_buff1_2_address0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op304_call_state4.read())) || 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state5.read()))) {
        ofm_buff1_2_address0 = grp_conv_read_fu_1259_ofm_buff0_2_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())))) {
        ofm_buff1_2_address0 = grp_conv_write_fu_1047_ofm_buff0_2_address0.read();
    } else {
        ofm_buff1_2_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ofm_buff1_2_ce0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op304_call_state4.read())) || 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state5.read()))) {
        ofm_buff1_2_ce0 = grp_conv_read_fu_1259_ofm_buff0_2_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())))) {
        ofm_buff1_2_ce0 = grp_conv_write_fu_1047_ofm_buff0_2_ce0.read();
    } else {
        ofm_buff1_2_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ofm_buff1_2_we0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())))) {
        ofm_buff1_2_we0 = grp_conv_write_fu_1047_ofm_buff0_2_we0.read();
    } else {
        ofm_buff1_2_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ofm_buff1_3_address0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op304_call_state4.read())) || 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state5.read()))) {
        ofm_buff1_3_address0 = grp_conv_read_fu_1259_ofm_buff0_3_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())))) {
        ofm_buff1_3_address0 = grp_conv_write_fu_1047_ofm_buff0_3_address0.read();
    } else {
        ofm_buff1_3_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ofm_buff1_3_ce0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op304_call_state4.read())) || 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state5.read()))) {
        ofm_buff1_3_ce0 = grp_conv_read_fu_1259_ofm_buff0_3_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())))) {
        ofm_buff1_3_ce0 = grp_conv_write_fu_1047_ofm_buff0_3_ce0.read();
    } else {
        ofm_buff1_3_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ofm_buff1_3_we0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())))) {
        ofm_buff1_3_we0 = grp_conv_write_fu_1047_ofm_buff0_3_we0.read();
    } else {
        ofm_buff1_3_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ofm_buff1_4_address0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op304_call_state4.read())) || 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state5.read()))) {
        ofm_buff1_4_address0 = grp_conv_read_fu_1259_ofm_buff0_4_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())))) {
        ofm_buff1_4_address0 = grp_conv_write_fu_1047_ofm_buff0_4_address0.read();
    } else {
        ofm_buff1_4_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ofm_buff1_4_ce0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op304_call_state4.read())) || 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state5.read()))) {
        ofm_buff1_4_ce0 = grp_conv_read_fu_1259_ofm_buff0_4_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())))) {
        ofm_buff1_4_ce0 = grp_conv_write_fu_1047_ofm_buff0_4_ce0.read();
    } else {
        ofm_buff1_4_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ofm_buff1_4_we0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())))) {
        ofm_buff1_4_we0 = grp_conv_write_fu_1047_ofm_buff0_4_we0.read();
    } else {
        ofm_buff1_4_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ofm_buff1_5_address0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op304_call_state4.read())) || 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state5.read()))) {
        ofm_buff1_5_address0 = grp_conv_read_fu_1259_ofm_buff0_5_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())))) {
        ofm_buff1_5_address0 = grp_conv_write_fu_1047_ofm_buff0_5_address0.read();
    } else {
        ofm_buff1_5_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ofm_buff1_5_ce0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op304_call_state4.read())) || 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state5.read()))) {
        ofm_buff1_5_ce0 = grp_conv_read_fu_1259_ofm_buff0_5_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())))) {
        ofm_buff1_5_ce0 = grp_conv_write_fu_1047_ofm_buff0_5_ce0.read();
    } else {
        ofm_buff1_5_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ofm_buff1_5_we0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())))) {
        ofm_buff1_5_we0 = grp_conv_write_fu_1047_ofm_buff0_5_we0.read();
    } else {
        ofm_buff1_5_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ofm_buff1_6_address0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op304_call_state4.read())) || 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state5.read()))) {
        ofm_buff1_6_address0 = grp_conv_read_fu_1259_ofm_buff0_6_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())))) {
        ofm_buff1_6_address0 = grp_conv_write_fu_1047_ofm_buff0_6_address0.read();
    } else {
        ofm_buff1_6_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ofm_buff1_6_ce0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op304_call_state4.read())) || 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state5.read()))) {
        ofm_buff1_6_ce0 = grp_conv_read_fu_1259_ofm_buff0_6_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())))) {
        ofm_buff1_6_ce0 = grp_conv_write_fu_1047_ofm_buff0_6_ce0.read();
    } else {
        ofm_buff1_6_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ofm_buff1_6_we0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())))) {
        ofm_buff1_6_we0 = grp_conv_write_fu_1047_ofm_buff0_6_we0.read();
    } else {
        ofm_buff1_6_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ofm_buff1_7_address0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op304_call_state4.read())) || 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state5.read()))) {
        ofm_buff1_7_address0 = grp_conv_read_fu_1259_ofm_buff0_7_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())))) {
        ofm_buff1_7_address0 = grp_conv_write_fu_1047_ofm_buff0_7_address0.read();
    } else {
        ofm_buff1_7_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ofm_buff1_7_ce0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op304_call_state4.read())) || 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state5.read()))) {
        ofm_buff1_7_ce0 = grp_conv_read_fu_1259_ofm_buff0_7_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())))) {
        ofm_buff1_7_ce0 = grp_conv_write_fu_1047_ofm_buff0_7_ce0.read();
    } else {
        ofm_buff1_7_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ofm_buff1_7_we0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())))) {
        ofm_buff1_7_we0 = grp_conv_write_fu_1047_ofm_buff0_7_we0.read();
    } else {
        ofm_buff1_7_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ofm_buff1_8_address0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op304_call_state4.read())) || 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state5.read()))) {
        ofm_buff1_8_address0 = grp_conv_read_fu_1259_ofm_buff0_8_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())))) {
        ofm_buff1_8_address0 = grp_conv_write_fu_1047_ofm_buff0_8_address0.read();
    } else {
        ofm_buff1_8_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ofm_buff1_8_ce0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op304_call_state4.read())) || 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state5.read()))) {
        ofm_buff1_8_ce0 = grp_conv_read_fu_1259_ofm_buff0_8_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())))) {
        ofm_buff1_8_ce0 = grp_conv_write_fu_1047_ofm_buff0_8_ce0.read();
    } else {
        ofm_buff1_8_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ofm_buff1_8_we0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())))) {
        ofm_buff1_8_we0 = grp_conv_write_fu_1047_ofm_buff0_8_we0.read();
    } else {
        ofm_buff1_8_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ofm_buff1_9_address0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op304_call_state4.read())) || 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state5.read()))) {
        ofm_buff1_9_address0 = grp_conv_read_fu_1259_ofm_buff0_9_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())))) {
        ofm_buff1_9_address0 = grp_conv_write_fu_1047_ofm_buff0_9_address0.read();
    } else {
        ofm_buff1_9_address0 =  (sc_lv<6>) ("XXXXXX");
    }
}

void convolution_hw::thread_ofm_buff1_9_ce0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op304_call_state4.read())) || 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state5.read()))) {
        ofm_buff1_9_ce0 = grp_conv_read_fu_1259_ofm_buff0_9_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                 esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())))) {
        ofm_buff1_9_ce0 = grp_conv_write_fu_1047_ofm_buff0_9_ce0.read();
    } else {
        ofm_buff1_9_ce0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_ofm_buff1_9_we0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op297_call_state4.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_boolean_1, ap_predicate_op309_call_state4.read())))) {
        ofm_buff1_9_we0 = grp_conv_write_fu_1047_ofm_buff0_9_we0.read();
    } else {
        ofm_buff1_9_we0 = ap_const_logic_0;
    }
}

void convolution_hw::thread_rotate_counter_fu_1793_p2() {
    rotate_counter_fu_1793_p2 = (!rotate_counter_0_reg_1024.read().is_01() || !ap_const_lv16_1.is_01())? sc_lv<16>(): (sc_biguint<16>(rotate_counter_0_reg_1024.read()) + sc_biguint<16>(ap_const_lv16_1));
}

void convolution_hw::thread_row_fu_1749_p2() {
    row_fu_1749_p2 = (!row_0_reg_1036.read().is_01() || !ap_const_lv6_1.is_01())? sc_lv<6>(): (sc_biguint<6>(row_0_reg_1036.read()) + sc_biguint<6>(ap_const_lv6_1));
}

void convolution_hw::thread_select_ln687_fu_1805_p3() {
    select_ln687_fu_1805_p3 = (!icmp_ln687_fu_1799_p2.read()[0].is_01())? sc_lv<16>(): ((icmp_ln687_fu_1799_p2.read()[0].to_bool())? ap_const_lv16_0: rotate_counter_fu_1793_p2.read());
}

void convolution_hw::thread_tran_wgt_TREADY() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        tran_wgt_TREADY = grp_load_filter_buffer_fu_1284_wgt_TREADY.read();
    } else {
        tran_wgt_TREADY = ap_const_logic_0;
    }
}

}

