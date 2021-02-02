#include "hls_stream.h"
#include "ap_int.h"
#include "ap_axi_sdata.h"
#include "ap_fixed.h"

#define N 10404

typedef ap_uint<3>          uint3;
typedef ap_uint<7>          uint7;
typedef ap_uint<8>          uint8;
typedef ap_uint<9>          uint9;
typedef ap_uint<11>        uint11;
typedef ap_uint<14>		   uint14;
typedef ap_uint<16>        uint16;
typedef ap_uint<18>        uint18;
typedef ap_uint<18>        uint20;
typedef ap_uint<23>        uint23;
typedef ap_uint<28>        uint28;
typedef ap_uint<32>		   uint32;
typedef ap_int<8>			int8;
typedef ap_fixed<25,10>    coef_type;

typedef struct NewPack1{
	uint8 pixel;
	uint8 row;
	uint9 Col;
	uint7 iter;
}InType;

typedef struct NewPack2{
	uint8 row;
	uint9 Col;
	uint7 iter;
	uint8 dump;
}OutType;

typedef struct NewStream1{
	InType       data;
	ap_uint<(32+7)/8> keep;
	ap_uint<(32+7)/8> strb;
	ap_uint<1>       user;
	ap_uint<1>       last;
	ap_uint<1>      id;
	ap_uint<1>      dest;
}MyAxi1;

typedef struct NewStream2{
	OutType       data;
	ap_uint<(32+7)/8> keep;
	ap_uint<(32+7)/8> strb;
	ap_uint<1>       user;
	ap_uint<1>       last;
	ap_uint<1>      id;
	ap_uint<1>      dest;
}MyAxi2;

typedef ap_axiu<32,1,1,1> value_t;
typedef hls::stream<value_t> stream_t;
typedef hls::stream<MyAxi1> stream1;
typedef hls::stream<MyAxi2> stream2;

void detectFace_wrapper(stream1 *In, stream2* Out, int lastIter, int* Num);

uint3 detectFace(uint8 newPixel, uint9 newPixelCol, uint8 Row, uint3 flag);
ap_fixed<20,14> int_sqrt(ap_fixed<20,14> value);
