#include "render.h"

float triangle_area (half v0[3], half v1[3], half v2[3]) {
    #pragma HLS inline
    #pragma HLS pipeline
    return (float)(v1[0]-v0[0])*(float)(v2[1]-v0[1])
           -(float)(v1[1]-v0[1])*(float)(v2[0]-v0[0]);
}

void matrix_mul_vector (bool mode, half m[3][4], half scale, half v[3], half result[3]) {
    #pragma HLS inline
    #pragma HLS pipeline
    for (int i = 0; i < 3; i++) {
        half sum = 0;
        for (int j = 0; j < 3; j++) {
            sum += m[i][j] * v[j] * scale;
        }

        if (mode) {  // rotation only
            result[i] = sum;
        } else {
            result[i] = sum + m[i][3];
        }
    }
}

half vector_dot_vector (half u[3], half v[3]) {
    #pragma HLS inline
    #pragma HLS pipeline
    half sum = 0;
    for (int i = 0; i < 3; i++) {
        sum += u[i] * v[i];
    }
    return sum;
}

void cam_project (half cv[3], float scale[3], float offset[3], half fv[3], int fvi[3]) {
    #pragma HLS inline
    #pragma HLS pipeline
    fv[0] = cv[0] * ((half) scale[0]) / (-cv[2]) + ((half) offset[0]);
    fv[1] = cv[1] * ((half) scale[1]) / cv[2] + ((half) offset[1]);
    fv[2] = cv[2] * ((half) scale[2]) + ((half) offset[2]);

    fvi[0] = round(fv[0]);
    fvi[1] = round(fv[1]);
    fvi[2] = round(fv[2]);
}

half hmax (half a, half b) {
    #pragma HLS inline
    #pragma HLS pipeline
    return (a > b) ? a : b;
}

half hmin (half a, half b) {
    #pragma HLS inline
    #pragma HLS pipeline
    return (a < b) ? a : b;
}

int imax (int a, int b) {
    #pragma HLS inline
    #pragma HLS pipeline
    return (a > b) ? a : b;
}

int imin (int a, int b) {
    #pragma HLS inline
    #pragma HLS pipeline
    return (a < b) ? a : b;
}

