#include "convolution_hw.h"
#include "AESL_pkg.h"

using namespace std;

namespace ap_rtl {

void convolution_hw::thread_ap_clk_no_reset_() {
    if ( ap_rst.read() == ap_const_logic_1) {
        ap_CS_fsm = ap_ST_fsm_state1;
    } else {
        ap_CS_fsm = ap_NS_fsm.read();
    }
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_0, icmp_ln648_reg_1835.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_0, icmp_ln658_reg_1839.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_0, icmp_ln667_reg_1843.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln676_reg_1847.read()) && 
          esl_seteq<1,1,1>(ap_block_state4_on_subcall_done.read(), ap_const_boolean_0)) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_0, icmp_ln648_reg_1835.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_0, icmp_ln658_reg_1839.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln667_reg_1843.read()) && 
          esl_seteq<1,1,1>(ap_block_state4_on_subcall_done.read(), ap_const_boolean_0)) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_0, icmp_ln648_reg_1835.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln658_reg_1839.read()) && 
          esl_seteq<1,1,1>(ap_block_state4_on_subcall_done.read(), ap_const_boolean_0)) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()) && 
          esl_seteq<1,1,1>(ap_block_state4_on_subcall_done.read(), ap_const_boolean_0)))) {
        cifm_counter_8_fu_56 = grp_write_row_ifm_fu_1578_ap_return.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state1.read()) && 
                esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_1))) {
        cifm_counter_8_fu_56 = ap_const_lv32_AE;
    }
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_0, icmp_ln648_reg_1835.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_0, icmp_ln658_reg_1839.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_0, icmp_ln667_reg_1843.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln676_reg_1847.read()) && 
          esl_seteq<1,1,1>(ap_block_state4_on_subcall_done.read(), ap_const_boolean_0)) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_0, icmp_ln648_reg_1835.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_0, icmp_ln658_reg_1839.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln667_reg_1843.read()) && 
          esl_seteq<1,1,1>(ap_block_state4_on_subcall_done.read(), ap_const_boolean_0)) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_0, icmp_ln648_reg_1835.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln658_reg_1839.read()) && 
          esl_seteq<1,1,1>(ap_block_state4_on_subcall_done.read(), ap_const_boolean_0)) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln648_reg_1835.read()) && 
          esl_seteq<1,1,1>(ap_block_state4_on_subcall_done.read(), ap_const_boolean_0)))) {
        cofm_counter_8_fu_60 = grp_conv_read_fu_1259_ap_return.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state1.read()) && 
                esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_1))) {
        cofm_counter_8_fu_60 = ap_const_lv32_0;
    }
    if ( ap_rst.read() == ap_const_logic_1) {
        grp_conv_read_fu_1259_ap_start_reg = ap_const_logic_0;
    } else {
        if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state3.read()) && 
              esl_seteq<1,1,1>(icmp_ln644_fu_1743_p2.read(), ap_const_lv1_0) && 
              esl_seteq<1,1,1>(ap_const_lv1_0, icmp_ln648_fu_1755_p2.read()) && 
              esl_seteq<1,1,1>(ap_const_lv1_0, icmp_ln658_fu_1761_p2.read()) && 
              esl_seteq<1,1,1>(ap_const_lv1_0, icmp_ln667_fu_1767_p2.read()) && 
              esl_seteq<1,1,1>(icmp_ln676_fu_1773_p2.read(), ap_const_lv1_1)) || 
             (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state3.read()) && 
              esl_seteq<1,1,1>(icmp_ln644_fu_1743_p2.read(), ap_const_lv1_0) && 
              esl_seteq<1,1,1>(ap_const_lv1_0, icmp_ln648_fu_1755_p2.read()) && 
              esl_seteq<1,1,1>(ap_const_lv1_0, icmp_ln658_fu_1761_p2.read()) && 
              esl_seteq<1,1,1>(icmp_ln667_fu_1767_p2.read(), ap_const_lv1_1)) || 
             (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state3.read()) && 
              esl_seteq<1,1,1>(icmp_ln644_fu_1743_p2.read(), ap_const_lv1_0) && 
              esl_seteq<1,1,1>(ap_const_lv1_0, icmp_ln648_fu_1755_p2.read()) && 
              esl_seteq<1,1,1>(icmp_ln658_fu_1761_p2.read(), ap_const_lv1_1)) || 
             (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state3.read()) && 
              esl_seteq<1,1,1>(icmp_ln644_fu_1743_p2.read(), ap_const_lv1_0) && 
              esl_seteq<1,1,1>(icmp_ln648_fu_1755_p2.read(), ap_const_lv1_1)) || 
             (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state3.read()) && 
              esl_seteq<1,1,1>(icmp_ln644_fu_1743_p2.read(), ap_const_lv1_1)))) {
            grp_conv_read_fu_1259_ap_start_reg = ap_const_logic_1;
        } else if (esl_seteq<1,1,1>(ap_const_logic_1, grp_conv_read_fu_1259_ap_ready.read())) {
            grp_conv_read_fu_1259_ap_start_reg = ap_const_logic_0;
        }
    }
    if ( ap_rst.read() == ap_const_logic_1) {
        grp_conv_write_fu_1047_ap_start_reg = ap_const_logic_0;
    } else {
        if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state3.read()) && 
              esl_seteq<1,1,1>(icmp_ln644_fu_1743_p2.read(), ap_const_lv1_0) && 
              esl_seteq<1,1,1>(ap_const_lv1_0, icmp_ln648_fu_1755_p2.read()) && 
              esl_seteq<1,1,1>(ap_const_lv1_0, icmp_ln658_fu_1761_p2.read()) && 
              esl_seteq<1,1,1>(ap_const_lv1_0, icmp_ln667_fu_1767_p2.read()) && 
              esl_seteq<1,1,1>(icmp_ln676_fu_1773_p2.read(), ap_const_lv1_1)) || 
             (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state3.read()) && 
              esl_seteq<1,1,1>(icmp_ln644_fu_1743_p2.read(), ap_const_lv1_0) && 
              esl_seteq<1,1,1>(ap_const_lv1_0, icmp_ln648_fu_1755_p2.read()) && 
              esl_seteq<1,1,1>(ap_const_lv1_0, icmp_ln658_fu_1761_p2.read()) && 
              esl_seteq<1,1,1>(icmp_ln667_fu_1767_p2.read(), ap_const_lv1_1)) || 
             (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state3.read()) && 
              esl_seteq<1,1,1>(icmp_ln644_fu_1743_p2.read(), ap_const_lv1_0) && 
              esl_seteq<1,1,1>(ap_const_lv1_0, icmp_ln648_fu_1755_p2.read()) && 
              esl_seteq<1,1,1>(icmp_ln658_fu_1761_p2.read(), ap_const_lv1_1)) || 
             (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state3.read()) && 
              esl_seteq<1,1,1>(icmp_ln644_fu_1743_p2.read(), ap_const_lv1_0) && 
              esl_seteq<1,1,1>(icmp_ln648_fu_1755_p2.read(), ap_const_lv1_1)))) {
            grp_conv_write_fu_1047_ap_start_reg = ap_const_logic_1;
        } else if (esl_seteq<1,1,1>(ap_const_logic_1, grp_conv_write_fu_1047_ap_ready.read())) {
            grp_conv_write_fu_1047_ap_start_reg = ap_const_logic_0;
        }
    }
    if ( ap_rst.read() == ap_const_logic_1) {
        grp_load_cifm_data_fu_1603_ap_start_reg = ap_const_logic_0;
    } else {
        if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state1.read()) && 
             esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_1))) {
            grp_load_cifm_data_fu_1603_ap_start_reg = ap_const_logic_1;
        } else if (esl_seteq<1,1,1>(ap_const_logic_1, grp_load_cifm_data_fu_1603_ap_ready.read())) {
            grp_load_cifm_data_fu_1603_ap_start_reg = ap_const_logic_0;
        }
    }
    if ( ap_rst.read() == ap_const_logic_1) {
        grp_load_filter_buffer_fu_1284_ap_start_reg = ap_const_logic_0;
    } else {
        if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state1.read()) && 
             esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_1))) {
            grp_load_filter_buffer_fu_1284_ap_start_reg = ap_const_logic_1;
        } else if (esl_seteq<1,1,1>(ap_const_logic_1, grp_load_filter_buffer_fu_1284_ap_ready.read())) {
            grp_load_filter_buffer_fu_1284_ap_start_reg = ap_const_logic_0;
        }
    }
    if ( ap_rst.read() == ap_const_logic_1) {
        grp_write_row_ifm_fu_1578_ap_start_reg = ap_const_logic_0;
    } else {
        if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state3.read()) && 
              esl_seteq<1,1,1>(icmp_ln644_fu_1743_p2.read(), ap_const_lv1_0) && 
              esl_seteq<1,1,1>(ap_const_lv1_0, icmp_ln648_fu_1755_p2.read()) && 
              esl_seteq<1,1,1>(ap_const_lv1_0, icmp_ln658_fu_1761_p2.read()) && 
              esl_seteq<1,1,1>(ap_const_lv1_0, icmp_ln667_fu_1767_p2.read()) && 
              esl_seteq<1,1,1>(icmp_ln676_fu_1773_p2.read(), ap_const_lv1_1)) || 
             (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state3.read()) && 
              esl_seteq<1,1,1>(icmp_ln644_fu_1743_p2.read(), ap_const_lv1_0) && 
              esl_seteq<1,1,1>(ap_const_lv1_0, icmp_ln648_fu_1755_p2.read()) && 
              esl_seteq<1,1,1>(ap_const_lv1_0, icmp_ln658_fu_1761_p2.read()) && 
              esl_seteq<1,1,1>(icmp_ln667_fu_1767_p2.read(), ap_const_lv1_1)) || 
             (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state3.read()) && 
              esl_seteq<1,1,1>(icmp_ln644_fu_1743_p2.read(), ap_const_lv1_0) && 
              esl_seteq<1,1,1>(ap_const_lv1_0, icmp_ln648_fu_1755_p2.read()) && 
              esl_seteq<1,1,1>(icmp_ln658_fu_1761_p2.read(), ap_const_lv1_1)) || 
             (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state3.read()) && 
              esl_seteq<1,1,1>(icmp_ln644_fu_1743_p2.read(), ap_const_lv1_0) && 
              esl_seteq<1,1,1>(icmp_ln648_fu_1755_p2.read(), ap_const_lv1_1)))) {
            grp_write_row_ifm_fu_1578_ap_start_reg = ap_const_logic_1;
        } else if (esl_seteq<1,1,1>(ap_const_logic_1, grp_write_row_ifm_fu_1578_ap_ready.read())) {
            grp_write_row_ifm_fu_1578_ap_start_reg = ap_const_logic_0;
        }
    }
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
         esl_seteq<1,1,1>(ap_block_state4_on_subcall_done.read(), ap_const_boolean_0))) {
        rotate_counter_0_reg_1024 = select_ln687_fu_1805_p3.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read()) && 
                esl_seteq<1,1,1>(ap_block_state2_on_subcall_done.read(), ap_const_boolean_0))) {
        rotate_counter_0_reg_1024 = ap_const_lv16_0;
    }
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
         esl_seteq<1,1,1>(ap_block_state4_on_subcall_done.read(), ap_const_boolean_0))) {
        row_0_reg_1036 = row_reg_1830.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read()) && 
                esl_seteq<1,1,1>(ap_block_state2_on_subcall_done.read(), ap_const_boolean_0))) {
        row_0_reg_1036 = ap_const_lv6_0;
    }
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state3.read()) && esl_seteq<1,1,1>(icmp_ln644_fu_1743_p2.read(), ap_const_lv1_0))) {
        icmp_ln648_reg_1835 = icmp_ln648_fu_1755_p2.read();
    }
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state3.read()) && esl_seteq<1,1,1>(icmp_ln644_fu_1743_p2.read(), ap_const_lv1_0) && esl_seteq<1,1,1>(icmp_ln648_fu_1755_p2.read(), ap_const_lv1_1))) {
        icmp_ln652_reg_1856 = icmp_ln652_fu_1786_p2.read();
    }
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state3.read()) && esl_seteq<1,1,1>(icmp_ln644_fu_1743_p2.read(), ap_const_lv1_0) && esl_seteq<1,1,1>(ap_const_lv1_0, icmp_ln648_fu_1755_p2.read()))) {
        icmp_ln658_reg_1839 = icmp_ln658_fu_1761_p2.read();
    }
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state3.read()) && esl_seteq<1,1,1>(icmp_ln644_fu_1743_p2.read(), ap_const_lv1_0) && esl_seteq<1,1,1>(ap_const_lv1_0, icmp_ln648_fu_1755_p2.read()) && esl_seteq<1,1,1>(ap_const_lv1_0, icmp_ln658_fu_1761_p2.read()))) {
        icmp_ln667_reg_1843 = icmp_ln667_fu_1767_p2.read();
    }
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state3.read()) && esl_seteq<1,1,1>(icmp_ln644_fu_1743_p2.read(), ap_const_lv1_0) && esl_seteq<1,1,1>(ap_const_lv1_0, icmp_ln648_fu_1755_p2.read()) && esl_seteq<1,1,1>(ap_const_lv1_0, icmp_ln658_fu_1761_p2.read()) && esl_seteq<1,1,1>(ap_const_lv1_0, icmp_ln667_fu_1767_p2.read()))) {
        icmp_ln676_reg_1847 = icmp_ln676_fu_1773_p2.read();
    }
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state3.read()) && esl_seteq<1,1,1>(icmp_ln644_fu_1743_p2.read(), ap_const_lv1_0) && esl_seteq<1,1,1>(ap_const_lv1_0, icmp_ln648_fu_1755_p2.read()) && esl_seteq<1,1,1>(ap_const_lv1_0, icmp_ln658_fu_1761_p2.read()) && esl_seteq<1,1,1>(ap_const_lv1_0, icmp_ln667_fu_1767_p2.read()) && esl_seteq<1,1,1>(icmp_ln676_fu_1773_p2.read(), ap_const_lv1_1))) {
        icmp_ln678_reg_1851 = icmp_ln678_fu_1779_p2.read();
    }
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state3.read()) && 
  esl_seteq<1,1,1>(icmp_ln644_fu_1743_p2.read(), ap_const_lv1_0) && 
  esl_seteq<1,1,1>(ap_const_lv1_0, icmp_ln648_fu_1755_p2.read()) && 
  esl_seteq<1,1,1>(ap_const_lv1_0, icmp_ln658_fu_1761_p2.read()) && 
  esl_seteq<1,1,1>(ap_const_lv1_0, icmp_ln667_fu_1767_p2.read()) && 
  esl_seteq<1,1,1>(icmp_ln676_fu_1773_p2.read(), ap_const_lv1_1)) || (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state3.read()) && 
  esl_seteq<1,1,1>(icmp_ln644_fu_1743_p2.read(), ap_const_lv1_0) && 
  esl_seteq<1,1,1>(ap_const_lv1_0, icmp_ln648_fu_1755_p2.read()) && 
  esl_seteq<1,1,1>(ap_const_lv1_0, icmp_ln658_fu_1761_p2.read()) && 
  esl_seteq<1,1,1>(icmp_ln667_fu_1767_p2.read(), ap_const_lv1_1)) || (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state3.read()) && 
  esl_seteq<1,1,1>(icmp_ln644_fu_1743_p2.read(), ap_const_lv1_0) && 
  esl_seteq<1,1,1>(ap_const_lv1_0, icmp_ln648_fu_1755_p2.read()) && 
  esl_seteq<1,1,1>(icmp_ln658_fu_1761_p2.read(), ap_const_lv1_1)) || (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state3.read()) && 
  esl_seteq<1,1,1>(icmp_ln644_fu_1743_p2.read(), ap_const_lv1_0) && 
  esl_seteq<1,1,1>(icmp_ln648_fu_1755_p2.read(), ap_const_lv1_1)))) {
        reg_1723 = cifm_counter_8_fu_56.read();
    }
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state3.read()) && 
  esl_seteq<1,1,1>(icmp_ln644_fu_1743_p2.read(), ap_const_lv1_0) && 
  esl_seteq<1,1,1>(ap_const_lv1_0, icmp_ln648_fu_1755_p2.read()) && 
  esl_seteq<1,1,1>(ap_const_lv1_0, icmp_ln658_fu_1761_p2.read()) && 
  esl_seteq<1,1,1>(ap_const_lv1_0, icmp_ln667_fu_1767_p2.read()) && 
  esl_seteq<1,1,1>(icmp_ln676_fu_1773_p2.read(), ap_const_lv1_1)) || (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state3.read()) && 
  esl_seteq<1,1,1>(icmp_ln644_fu_1743_p2.read(), ap_const_lv1_0) && 
  esl_seteq<1,1,1>(ap_const_lv1_0, icmp_ln648_fu_1755_p2.read()) && 
  esl_seteq<1,1,1>(ap_const_lv1_0, icmp_ln658_fu_1761_p2.read()) && 
  esl_seteq<1,1,1>(icmp_ln667_fu_1767_p2.read(), ap_const_lv1_1)) || (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state3.read()) && 
  esl_seteq<1,1,1>(icmp_ln644_fu_1743_p2.read(), ap_const_lv1_0) && 
  esl_seteq<1,1,1>(ap_const_lv1_0, icmp_ln648_fu_1755_p2.read()) && 
  esl_seteq<1,1,1>(icmp_ln658_fu_1761_p2.read(), ap_const_lv1_1)) || (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state3.read()) && 
  esl_seteq<1,1,1>(icmp_ln644_fu_1743_p2.read(), ap_const_lv1_0) && 
  esl_seteq<1,1,1>(icmp_ln648_fu_1755_p2.read(), ap_const_lv1_1)) || (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state3.read()) && 
  esl_seteq<1,1,1>(icmp_ln644_fu_1743_p2.read(), ap_const_lv1_1)))) {
        reg_1728 = cofm_counter_8_fu_60.read();
    }
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state3.read())) {
        row_reg_1830 = row_fu_1749_p2.read();
    }
}

void convolution_hw::thread_ap_NS_fsm() {
    switch (ap_CS_fsm.read().to_uint64()) {
        case 1 : 
            if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state1.read()) && esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_1))) {
                ap_NS_fsm = ap_ST_fsm_state2;
            } else {
                ap_NS_fsm = ap_ST_fsm_state1;
            }
            break;
        case 2 : 
            if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read()) && esl_seteq<1,1,1>(ap_block_state2_on_subcall_done.read(), ap_const_boolean_0))) {
                ap_NS_fsm = ap_ST_fsm_state3;
            } else {
                ap_NS_fsm = ap_ST_fsm_state2;
            }
            break;
        case 4 : 
            if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state3.read()) && esl_seteq<1,1,1>(icmp_ln644_fu_1743_p2.read(), ap_const_lv1_0))) {
                ap_NS_fsm = ap_ST_fsm_state4;
            } else {
                ap_NS_fsm = ap_ST_fsm_state5;
            }
            break;
        case 8 : 
            if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && esl_seteq<1,1,1>(ap_block_state4_on_subcall_done.read(), ap_const_boolean_0))) {
                ap_NS_fsm = ap_ST_fsm_state3;
            } else {
                ap_NS_fsm = ap_ST_fsm_state4;
            }
            break;
        case 16 : 
            if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state5.read()) && esl_seteq<1,1,1>(grp_conv_read_fu_1259_ap_done.read(), ap_const_logic_1))) {
                ap_NS_fsm = ap_ST_fsm_state1;
            } else {
                ap_NS_fsm = ap_ST_fsm_state5;
            }
            break;
        default : 
            ap_NS_fsm =  (sc_lv<5>) ("XXXXX");
            break;
    }
}

}

