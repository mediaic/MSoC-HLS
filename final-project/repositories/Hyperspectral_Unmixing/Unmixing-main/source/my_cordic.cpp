#include "my_cordic.hpp"
void m_cordic (
    HSI_TYPE &x_r,
    HSI_TYPE &y_r,
    THETA_TYPE dir [12]
)
{
    HSI_TYPE a_x [12];
        #pragma HLS array_partition variable=a_x complete dim=1
    HSI_TYPE a_y [12];
        #pragma HLS array_partition variable=a_y complete dim=1
    if ((x_r > 0 && y_r < 0) || (y_r > 0 && x_r < 0)) {
        dir [0] = 1;
        a_x [0] = x_r - (y_r >> (0));
        a_y [0] = y_r + (x_r >> (0));
    }
    else {
        dir [0] = 0;
        a_x [0] = x_r + (y_r >> (0));
        a_y [0] = y_r - (x_r >> (0));        
    }
    for (int i = 1; i < NUM_ITERATION; i++) {
        #pragma HLS dependence variable=a_x inter false
        #pragma HLS dependence variable=a_y inter false
        #pragma HLS dependence variable=dir inter false
        #pragma HLS pipeline II=1
        if ((a_x [i-1] > 0 && a_y [i-1] < 0) || (a_y [i-1] > 0 && a_x [i-1] < 0)) {
            dir [i] = 1;
            a_x [i] = a_x [i-1] - (a_y [i-1] >> (i));
            a_y [i] = a_y [i-1] + (a_x [i-1] >> (i));
        }
        else {
            dir [i] = 0;
            a_x [i] = a_x [i-1] + (a_y [i-1] >> (i));
            a_y [i] = a_y [i-1] - (a_x [i-1] >> (i));        
        }
    }
    x_r = a_x [11] * scaling_factor;
    y_r = a_y [11] * scaling_factor;
}

void s_cordic (
    THETA_TYPE dir [12],
    HSI_TYPE &x_r,
    HSI_TYPE &y_r
)
{
    HSI_TYPE a_x [12];
        #pragma HLS array_partition variable=a_x complete dim=1
    HSI_TYPE a_y [12];
        #pragma HLS array_partition variable=a_y complete dim=1
    if (dir [0]) {
        a_x [0] = x_r - (y_r >> (0));
        a_y [0] = y_r + (x_r >> (0));
    }
    else {
        a_x [0] = x_r + (y_r >> (0));
        a_y [0] = y_r - (x_r >> (0));        
    }
    for (int i = 1; i < NUM_ITERATION; i++) {
        #pragma HLS dependence variable=a_x inter false
        #pragma HLS dependence variable=a_y inter false
        #pragma HLS pipeline II=1
        if (dir [i]) {
            a_x [i] = a_x [i-1] - (a_y [i-1] >> (i));
            a_y [i] = a_y [i-1] + (a_x [i-1] >> (i));
        }
        else {
            a_x [i] = a_x [i-1] + (a_y [i-1] >> (i));
            a_y [i] = a_y [i-1] - (a_x [i-1] >> (i));        
        }
    }
    x_r = a_x [11] * scaling_factor;
    y_r = a_y [11] * scaling_factor;
}