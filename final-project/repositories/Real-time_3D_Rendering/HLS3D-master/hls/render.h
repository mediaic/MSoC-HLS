#ifndef __RENDER_H__
#define __RENDER_H__

#include <stdint.h>
#include <ap_int.h>
#include <ap_axi_sdata.h>
#include <hls_stream.h>
#include <hls_math.h>
#include <hls_half.h>

typedef ap_axiu<64, 1, 1, 1> value_t;
typedef hls::stream<value_t> stream_t;

void apuint64_1_to_half_2 (const ap_uint<64>& a, half& b, half& c);
void float_2_to_apuint64_1 (float a, float b, ap_uint<64>& c);
void apuint64_1_to_float_2 (const ap_uint<64>& a, float& b, float& c);
void apuint64_1_to_uint8_8 (const ap_uint<64>& a,
                            uint8_t& b, uint8_t& c,
                            uint8_t& d, uint8_t& e,
                            uint8_t& f, uint8_t& g,
                            uint8_t& h, uint8_t& i);
void uint8_8_to_apuint64_1 (const uint8_t& a, const uint8_t& b,
                            const uint8_t& c, const uint8_t& d,
                            const uint8_t& e, const uint8_t& f,
                            const uint8_t& g, const uint8_t& h,
                            ap_uint<64>& i);

float triangle_area (half v0[3], half v1[3], half v2[3]);
void matrix_mul_vector (bool mode, half m[3][4], half scale, half v[3], half result[3]);
half vector_dot_vector (half u[3], half v[3]);
void cam_project (half cv[3], float scale[3], float offset[3], half fv[3], int fvi[3]);
half hmax (half a, half b);
half hmin (half a, half b);
int imax (int a, int b);
int imin (int a, int b);

void render (
    stream_t* stream_input,
    stream_t* stream_output,
    int mode,
    int num_faces,
    float transform[3][4],
    float obj_scale,
    int texture_id,
    float lnorm[3],
    float cam_scale[3],
    float cam_offset[3],
    int frameh[2]
);

void geometric_transform (
    stream_t* stream_input,
    stream_t* stream_output,
    int num_faces,
    float transform[3][4],
    float obj_scale
);

#define BUF_H 60
void rasterization (
    stream_t* stream_input,
    stream_t* stream_output,
    int mode,  // 0: reset, 1: texture, 2: mesh in, 3: frame out
    int texture_id,
    int num_faces,
    float lnorm[3],
    float cam_scale[3],
    float cam_offset[3],
    int fh[2]  // frame height range
);

typedef union {
    uint32_t i;
    float f;
} union_uint32_float_t;

#endif
