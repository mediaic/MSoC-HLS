// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.2 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __dnn_hw_fmul_32ns_Hfu__HH__
#define __dnn_hw_fmul_32ns_Hfu__HH__
#include "ACMP_fmul.h"
#include <systemc>

template<
    int ID,
    int NUM_STAGE,
    int din0_WIDTH,
    int din1_WIDTH,
    int dout_WIDTH>
SC_MODULE(dnn_hw_fmul_32ns_Hfu) {
    sc_core::sc_in_clk clk;
    sc_core::sc_in<sc_dt::sc_logic> reset;
    sc_core::sc_in<sc_dt::sc_logic> ce;
    sc_core::sc_in< sc_dt::sc_lv<din0_WIDTH> >   din0;
    sc_core::sc_in< sc_dt::sc_lv<din1_WIDTH> >   din1;
    sc_core::sc_out< sc_dt::sc_lv<dout_WIDTH> >   dout;



    ACMP_fmul<ID, 4, din0_WIDTH, din1_WIDTH, dout_WIDTH> ACMP_fmul_U;

    SC_CTOR(dnn_hw_fmul_32ns_Hfu):  ACMP_fmul_U ("ACMP_fmul_U") {
        ACMP_fmul_U.clk(clk);
        ACMP_fmul_U.reset(reset);
        ACMP_fmul_U.ce(ce);
        ACMP_fmul_U.din0(din0);
        ACMP_fmul_U.din1(din1);
        ACMP_fmul_U.dout(dout);

    }

};

#endif //
