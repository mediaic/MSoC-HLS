#ifndef _FEATURE_MATCHING_H_
#define _FEATURE_MATCHING_H_
#include "hls_stream.h"

#include "ap_int.h"
#include "hls_math.h"
#include "ap_fixed.h"
#include "ap_axi_sdata.h"


void feature_matching(hls::stream<ap_axiu<32,1,1,1> > &srcStream1,hls::stream<ap_axiu<32,1,1,1> > &srcStream2,
		hls::stream<ap_axiu<32,1,1,1> > &matching_out);

#endif
