#include "MVHT.hpp"
void MVHT (
    HSI_TYPE HSI_MTX [4096][8],
    int vtx_idx [8]
)
{
	const int virtual_dim = 7;
	THETA_TYPE dir [12];            // master_output direction vector
        #pragma HLS array_partition variable=dir complete dim=1 // add this!!!
    HSI_TYPE HSI_MTX_i [4096][8];  // stored hsi pattern;
        #pragma HLS array_partition variable=HSI_MTX   complete dim=2
        #pragma HLS array_partition variable=HSI_MTX_i complete dim=2 //Need This!!!
    HSI_TYPE temp_buf [8];
    ap_fixed <32, 12> tmp_max;
    ap_fixed <32, 12> inner_prod;
    int cur_idx;
    int u_cnt;
    // Input Loop
    Input_loop: for (int i = 0; i < 4096; i++) {
        #pragma HLS pipeline II=1
        for (int j = 0; j < 8; j++) {
            #pragma HLS pipeline II=1
            HSI_MTX_i [i][j] = HSI_MTX [i][j];
        }
    }
    // Find First VTX
    tmp_max = 0;
    First_VTX_loop: for (int i = 0; i < 4096; i++) {
        #pragma HLS pipeline II=1
        inner_prod = 0;
        for (int j = 0; j < virtual_dim; j++) {
            #pragma HLS pipeline II=1
            inner_prod = inner_prod + HSI_MTX_i [i][j] * HSI_MTX_i [i][j];
        }
        if (inner_prod >= tmp_max) {
            tmp_max = inner_prod;
            vtx_idx [0] = i;
        }
    }
    // Subtract
    cur_idx = vtx_idx [0];
    Subtract_loop: for (int i = 0; i < 8; i++){
        #pragma HLS pipeline II=1
        temp_buf [i] = HSI_MTX_i [cur_idx][i];
    }
    for (int i = 0; i < 4096; i++) {
        #pragma HLS pipeline II=1
        for (int j = 0; j < 8; j++) {
            #pragma HLS pipeline II=1
            HSI_MTX_i [i][j] = HSI_MTX [i][j] - temp_buf [j];
        }
    }
    // Find Second VTX
    tmp_max = 0;
    Second_VTX_loop: for (int i = 0; i < 4096; i++) {
        #pragma HLS pipeline II=1
        inner_prod = 0;
        for (int j = 0; j < virtual_dim; j++) {
            #pragma HLS pipeline II=1
            inner_prod = inner_prod + HSI_MTX_i [i][j] * HSI_MTX_i [i][j];
        }
        if (inner_prod >= tmp_max) {
            tmp_max = inner_prod;
            vtx_idx [1] = i;
        }
    }

    // Simplex Growing
    u_cnt = 0;
    Simplex_Growing_loop: for (int num_vtx = 1; num_vtx < virtual_dim; num_vtx++) {
        // Reload cur_vtx
        cur_idx = vtx_idx [num_vtx];
        for (int i = 0; i < 8; i++){
            #pragma HLS pipeline II = 1
            temp_buf [i] = HSI_MTX_i [cur_idx][i];
        }
        // Householder Transform
        for (int d_cnt = virtual_dim - 2; d_cnt >= u_cnt; d_cnt--) {
            m_cordic (
                temp_buf [d_cnt],
                temp_buf [d_cnt+1],
                dir
            );
            for (int i = 0; i < 4096; i++){
                #pragma HLS pipeline II=1
                s_cordic (
                    dir,
                    HSI_MTX_i [i][d_cnt],
                    HSI_MTX_i [i][d_cnt+1]
                );
            }
        }
        u_cnt += 1;
        tmp_max = 0;
        for (int i = 0; i < 4096; i++) {
            #pragma HLS pipeline II=1
            for (int j = 0; j < virtual_dim; j++) {
                #pragma HLS pipeline II=1
                if (j < u_cnt) {
                    inner_prod = 0;
                } 
                else
                {
                    inner_prod = inner_prod + HSI_MTX_i [i][j] * HSI_MTX_i [i][j];
                }
            }
            if (inner_prod >= tmp_max) {
                tmp_max = inner_prod;
                vtx_idx [num_vtx+1] = i;
            }
        }
    }
}
