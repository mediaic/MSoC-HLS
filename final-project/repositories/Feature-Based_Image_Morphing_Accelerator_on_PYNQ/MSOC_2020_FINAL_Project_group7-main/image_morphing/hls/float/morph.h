#ifndef H_MORPH_DEFINES_H
#define H_MORPH_DEFINES_H

#include "ap_int.h"
#include "ap_fixed.h"
#include <ap_axi_sdata.h>
#include <hls_stream.h>

// input image size
const static int IMAGE_WIDTH  = 256;
const static int IMAGE_HEIGHT = 256;
const static int IMAGE_SIZE   = 65536;

// PIXEL = log2(256)
const static int PXIEL_WIDTH = 8;

// number of line
const static int LINE_NUM = 8;

// Line segment 
// fixed point or integer ???
typedef ap_axiu<32,1,1,1> value_t;
typedef hls::stream<value_t> stream_t;
typedef float  Length;
typedef float  Scaler;
typedef float  Weight;

struct Vector {
    float x_val;
    float y_val;
};

struct Line {
    Vector P;
    Vector PQ;
    float length; 
};


void bnmorph(
    /* input */ Vector X,
    /* input */ Line line_src,
    /* input */ Line line_dst,
    /* input */ Line line_mid,
    /* output */ Vector *D_sum_src,
    /* output */ Weight *W_sum_src,
    /* output */ Vector *D_sum_dst,
    /* output */ Weight *W_sum_dst
);

void image_morph
(   
    /* input */  ap_uint<32>  point_src[LINE_NUM],
    /* input */  float        length_src[LINE_NUM],
    /* input */  ap_uint<32>  point_tar[LINE_NUM],
    /* input */  float        length_tar[LINE_NUM],
    /* input */  ap_uint<32>  point_dst[LINE_NUM],
    /* input */  float        length_dst[LINE_NUM],
    /* input */  ap_uint<32>  lines,
    /* input */  ap_uint<32>  mode,
    /* output */ volatile ap_uint<32>* map_Out
);

void calculate_u(
    Vector XP,
    Vector PQ,
    Length PQ_length,
    Scaler *out 

);

void calculate_v(
    Vector XP,
    Vector PQ_perp,
    Length PQ_length,
    Scaler *out
);

void calculate_X(
    /* input */ Line line_in,
    /* input */ Scaler u,
    /* input */ Scaler v,
    /* output */ Vector *out
);

void calculate_dist(
    /* input */ Vector a,
    /* output */ Length *dist
);



#endif //H_MORPH_DEFINES_H
