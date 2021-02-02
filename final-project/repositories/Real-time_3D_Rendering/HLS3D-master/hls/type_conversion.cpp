#include "render.h"

#include <iostream>
using namespace std;

void apuint64_1_to_half_2(const ap_uint<64>& a, half& b, half& c) {
    #pragma HLS inline
    union_uint32_float_t u1, u2;
    u1.i = a.range(31,  0);
    u2.i = a.range(63, 32);
    b = u1.f;
    c = u2.f;
}

void float_2_to_apuint64_1(float a, float b, ap_uint<64>& c) {
    #pragma HLS inline
    union_uint32_float_t u1, u2;
    u1.f = a;
    u2.f = b;
    c.range(31,  0) = u1.i;
    c.range(63, 32) = u2.i;
}

void apuint64_1_to_float_2(const ap_uint<64>& a, float& b, float& c) {
    #pragma HLS inline
    union_uint32_float_t u1, u2;
    u1.i = a.range(31,  0);
    u2.i = a.range(63, 32);
    b = u1.f;
    c = u2.f;
}

void apuint64_1_to_uint8_8(const ap_uint<64>& a,
                           uint8_t& b, uint8_t& c,
                           uint8_t& d, uint8_t& e,
                           uint8_t& f, uint8_t& g,
                           uint8_t& h, uint8_t& i) {
    #pragma HLS inline
    b = a.range( 7,  0);
    c = a.range(15,  8);
    d = a.range(23, 16);
    e = a.range(31, 24);
    f = a.range(39, 32);
    g = a.range(47, 40);
    h = a.range(55, 48);
    i = a.range(63, 56);
}

void uint8_8_to_apuint64_1(const uint8_t& a, const uint8_t& b,
                           const uint8_t& c, const uint8_t& d,
                           const uint8_t& e, const uint8_t& f,
                           const uint8_t& g, const uint8_t& h,
                           ap_uint<64>& i) {
    #pragma HLS inline
    i.range( 7,  0) = a;
    i.range(15,  8) = b;
    i.range(23, 16) = c;
    i.range(31, 24) = d;
    i.range(39, 32) = e;
    i.range(47, 40) = f;
    i.range(55, 48) = g;
    i.range(63, 56) = h;
}
