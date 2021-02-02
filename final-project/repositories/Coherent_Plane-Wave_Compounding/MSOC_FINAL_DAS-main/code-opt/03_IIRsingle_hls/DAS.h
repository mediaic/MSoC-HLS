#include<math.h>
#include <hls_stream.h>
#include <ap_fixed.h>
#include <ap_axi_sdata.h>

typedef struct complex_float {
	float real;
	float imag;
} cfloat_t;

#define Nangle     25 //25
#define num_block  8 //8
#define Datalength 4096
#define ch_amount  32
#define down_sample 512
#define ch 16
#define dd         0.0000154
#define fnr        1.75
#define aper_size  0.0189
#define con_dis_sample 32468

typedef float in_t;
typedef int out_t;
typedef ap_axis<32,1,1,1> axi_echo;
typedef ap_axiu<32,1,1,1> axi_gray;
typedef ap_fixed<12,12> fp_echo;
typedef ap_fixed<9,9> fp_gray;
typedef ap_fixed<18,12> fp_IQ_acc;

const char angle_pos_neg[] = { 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
const float array_ele_coordinate_valid[] = {0.0048, 0.0051, 0.0054, 0.0057, 0.0060, 0.0063, 0.0066, 0.0069, 0.0072, 0.0075, 0.0078, 0.0081, 0.0084, 0.0087, 0.0090, 0.0093, 0.0096, 0.0099, 0.0102, 0.0105, 0.0108, 0.0111, 0.0114, 0.0117, 0.0120, 0.0123, 0.0126, 0.0129, 0.0132, 0.0135, 0.0138, 0.0141};
const float cos_coff[] = {1, 0.990600585937500, 0.992095947265625,	0.993469238281250, 0.994720458984375, 0.995819091796875, 0.996795654296875, 0.997650146484375, 0.998382568359375, 0.998962402343750, 0.999420166015625, 0.999725341796875, 0.999938964843750, 0.999938964843750, 0.999725341796875, 0.999420166015625, 0.998962402343750, 0.998382568359375, 0.997650146484375, 0.996795654296875, 0.995819091796875, 0.994720458984375, 0.993469238281250, 0.992095947265625, 0.990600585937500};
const float sin_coff[] = {0, -0.136786253477028, -0.125481597930223, -0.114100274271681, -0.102621676452465, -0.0913473393857043, -0.0799901467361129, -0.0685141242351174, -0.0568528556550848, -0.0455424933836933, -0.0340489612367333, -0.0234358906193355, -0.0110483748673595, 0.0110483748673595, 0.0234358906193355, 0.0340489612367333, 0.0455424933836933, 0.0568528556550848, 0.0685141242351174, 0.0799901467361129, 0.0913473393857043, 0.102621676452465, 0.114100274271681, 0.125481597930223, 0.136786253477028};

#define POWER(x) x*x
#define ABS(x) (x > 0) ? x : (-x)

void DAS(hls::stream<axi_echo>* echo_block, hls::stream<axi_gray>* gray_pic, int pw);
