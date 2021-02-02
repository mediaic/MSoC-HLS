#include "feature_matching.h"
#include <iostream>
using namespace std;



int Similarity(ap_uint<256> match_1, ap_uint<256> match_2)
{
	int hamming_distance = 0;

	ap_uint<256> count_1 = match_1 xor match_2;
	while(count_1){
#pragma HLS UNROLL
			hamming_distance += count_1 & 1;
			count_1 >>= 1;
	}

	return hamming_distance;
}


void feature_matching(hls::stream<ap_axiu<32,1,1,1> > &srcStream1,hls::stream<ap_axiu<32,1,1,1> > &srcStream2,
		hls::stream<ap_axiu<32,1,1,1> > &matching_out)
{
#pragma HLS INTERFACE ap_ctrl_none port=return
#pragma HLS INTERFACE axis register both port=matching_out
#pragma HLS INTERFACE axis register both port=srcStream2
#pragma HLS INTERFACE axis register both port=srcStream1
	ap_uint<320> match_1[1000];
	ap_uint<320> match_2[1000];
	ap_uint<10> match_point[500][4];
	ap_uint<8> cnt = 0;
	bool flag1 = 0;
	bool flag2 = 0;
	ap_uint<10> match_border1, match_border2;
	ap_uint<320> Pack1, Pack2;
	ap_axiu<32,1,1,1> Segment1, Segment2;


	for(unsigned int i = 0; i < 1000; ++i){
		for (unsigned int n = 0; n < 10; ++n){
#pragma HLS UNROLL
			Segment1 = srcStream1.read();
			Segment2 = srcStream2.read();
			Pack1.range((n<<5)+31,n<<5) = Segment1.data;
			Pack2.range((n<<5)+31,n<<5) = Segment2.data;
		}
		match_1[i] = Pack1;
		match_2[i] = Pack2;
		if(match_1[i].range(31,0) == 0 && !flag1)  {
			match_border1 = i;
			flag1= 1;
		}
		if(match_2[i].range(31,0) == 0 && !flag2)  {
			match_border2 = i;
			flag2 = 1;
		}
	}


	for(unsigned int j = 0; j < match_border1; ++j){
#pragma HLS UNROLL
		ap_uint<14> close_1st = 10000;
		ap_uint<14> close_2nd = 10000;
		ap_uint<10> mpx, mpy;

		for(unsigned int k = 0; k < match_border2; ++k){
#pragma HLS UNROLL
			int d = Similarity(match_1[j].range(255,0),match_2[k].range(255,0));
			if(d < close_2nd) close_2nd = d;
			if(d < close_1st) {
				close_2nd = close_1st;
				close_1st = d;
				mpx = match_2[k].range(287,256);
				mpy = match_2[k].range(319,288);
			}
		}
		if(close_2nd == 0){
			match_point[cnt][0] = match_1[j].range(287,256);
			match_point[cnt][1] = match_1[j].range(319,288);
			match_point[cnt][2] = mpx;
			match_point[cnt][3] = mpy;
			cnt++;
		}
		else if((close_1st<<1) < close_2nd){
			match_point[cnt][0] = match_1[j].range(287,256);
			match_point[cnt][1] = match_1[j].range(319,288);
			match_point[cnt][2] = mpx;
			match_point[cnt][3] = mpy;
			cnt++;
		}
	}


	for(unsigned int l = 0; l < cnt; ++l){
#pragma HLS UNROLL
		for(unsigned char m = 0; m < 2; ++m){
#pragma HLS UNROLL
			ap_axiu<32,1,1,1> outVal;
			ap_uint<16> mx, my;
			mx = match_point[l][m<<1];
			my = match_point[l][(m<<1) + 1];
			outVal.data.range(31,16) = mx;
			outVal.data.range(15,0) = my;
			outVal.keep = 0xf;
			if(l == cnt - 1) outVal.last = 1;
			else outVal.last = 0;

			matching_out.write(outVal);
		}
	}


}






