#include "fft_top.h"
#include "ap_int.h"
#include "ap_fixed.h"
typedef  float  eita_t; //ap_uint<8>

typedef  float fft_operation; //ap_fixed<24,16>
typedef std::complex<fft_operation> proxGSDataIn;
//#define SIZE 1<<14
#define HEIGHT 128
#define WIDTH 128
void P2S(eita_t data_in[HEIGHT][WIDTH],cmpxDataIn data_out[HEIGHT][WIDTH]);
void S2P(cmpxDataIn data_in[HEIGHT][WIDTH],eita_t data_out[HEIGHT][WIDTH]);
void ProxGS(eita_t x_io[HEIGHT][WIDTH],proxGSDataIn coe_a[HEIGHT][WIDTH],fft_operation coe_b[HEIGHT][WIDTH]);
void FFT_scale(float scale,cmpxDataIn data_in[HEIGHT][WIDTH],cmpxDataIn data_out[HEIGHT][WIDTH]);
