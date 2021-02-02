//
// Copyright (C) 2013 University of Kaiserslautern
// Microelectronic Systems Design Research Group
//
// Christian Brugger (brugger@eit.uni-kl.de)
// 20. August 2013
//
// Using: Xilinx Vivado HLS 2013.2
//

#ifndef __HESTON_KERNEL_SL_HLS_HPP__
#define __HESTON_KERNEL_SL_HLS_HPP__

#include <hls_stream.h>
#include <ap_int.h>


#include <stdint.h>

#define BLOCK_SIZE 512

#define calc_t float

template<int D,int U,int TI,int TD>
  struct my_str{
	calc_t       data;
    ap_uint<(D+7)/8> keep;
    ap_uint<(D+7)/8> strb;
    ap_uint<U>       user;
    ap_uint<1>       last;
    ap_uint<TI>      id;
    ap_uint<TD>      dest;
  };

typedef my_str<32,1,1,1> value_t;
typedef hls::stream<value_t> strm_t;

void heston_kernel_crippled(
		// call option
		calc_t log_spot_price,
		calc_t reversion_rate_TIMES_step_size,
		calc_t long_term_avg_vola,
		calc_t vol_of_vol_TIMES_sqrt_step_size,
		calc_t double_riskless_rate, // = 2 * riskless_rate
		calc_t vola_0,
//		calc_t correlation,
//		calc_t time_to_maturity,
	    // both knockout
		calc_t log_lower_barrier_value,
		calc_t log_upper_barrier_value,
		// simulation params
		uint32_t step_cnt,
		calc_t step_size, // = time_to_maturity / step_cnt
		calc_t half_step_size, // = step_size / 2
		calc_t sqrt_step_size, // = sqrt(step_size)
		calc_t barrier_correction_factor, // = BARRIER_HIT_CORRECTION * sqrt_step_size
		uint32_t path_cnt,

		hls::stream<calc_t> &gaussian_rn1,
		hls::stream<calc_t> &gaussian_rn2,
		strm_t* prices);

#endif
