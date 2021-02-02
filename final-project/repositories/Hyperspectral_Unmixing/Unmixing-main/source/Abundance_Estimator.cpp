#include "Abundance_Estimator.hpp"

void Abundance_Estimator (
    MATRIX_T    DR_HSI     [  VIRTUAL_DIMENSION][BATCH_IMAGE_H*BATCH_IMAGE_W],
    MATRIX_T    ENDMEMBERS [  VIRTUAL_DIMENSION][        VIRTUAL_DIMENSION+1],
    MATRIX_T    ABUNDANCE  [VIRTUAL_DIMENSION+1][BATCH_IMAGE_H*BATCH_IMAGE_W],
    MATRIX_T    reg_Param
)
{
    MATRIX_T DR_HSI_i     [  VIRTUAL_DIMENSION][BATCH_IMAGE_H*BATCH_IMAGE_W];
        #pragma HLS_ARRAY_PARTITION variable=DR_HSI_i     complete dim=0
    MATRIX_T ENDMEMBERS_i [  VIRTUAL_DIMENSION][        VIRTUAL_DIMENSION+1];
        #pragma HLS_ARRAY_PARTITION variable=ENDMEMBERS_i complete dim=0    
    MATRIX_T ABUNDANCE_i  [VIRTUAL_DIMENSION+1][BATCH_IMAGE_H*BATCH_IMAGE_W];
        #pragma HLS_ARRAY_PARTITION variable=ABUNDANCE_i  complete dim=0    
    MATRIX_T GRAMIAN      [VIRTUAL_DIMENSION+1][        VIRTUAL_DIMENSION+1];
        #pragma HLS_ARRAY_PARTITION variable=GRAMIAN      complete dim=0
    MATRIX_T PROJ_MTX     [VIRTUAL_DIMENSION+1][BATCH_IMAGE_H*BATCH_IMAGE_W];
        #pragma HLS_ARRAY_PARTITION variable=PROJ_MTX     complete dim=0
    MATRIX_T INVERSE      [VIRTUAL_DIMENSION+1][BATCH_IMAGE_H*BATCH_IMAGE_W];
        #pragma HLS_ARRAY_PARTITION variable=INVERSE      complete dim=0
    MATRIX_T sum_of_rows;
    MATRIX_T g_buf;
    MATRIX_T p_buf;
    MATRIX_T div_buf;
    MATRIX_T mult_gramian_1;
    MATRIX_T mult_gramian_2;
    MATRIX_T mult_update_1;
    MATRIX_T mult_update_2;
    MATRIX_T mult_proj_1;
    MATRIX_T mult_proj_2;
    MATRIX_T mult_cal_1;
    MATRIX_T mult_cal_2;
    MATRIX_T mult_temp;
    MATRIX_T div_cal_3;
    MATRIX_T div_val;
    int maxIter = 256;
    // Gramian Matrix Calculation Step
	Endmembers_input_loop : for (int i = 0; i < VIRTUAL_DIMENSION; i++) {
		Endmembers_input_inner_loop : for (int j = 0; j < VIRTUAL_DIMENSION+1; j++) {
			ENDMEMBERS_i [i][j] = ENDMEMBERS [i][j];
		}
	}
    
    for (int i = 0; i < VIRTUAL_DIMENSION+1; i++) {
        for (int j = 0; j < VIRTUAL_DIMENSION+1; j++){
            GRAMIAN [i][j] = 0;
            for (int k = 0; k < VIRTUAL_DIMENSION; k++) {
                #pragma HLS PIPELINE II=1
                #pragma HLS UNROLL
                mult_gramian_1 = ENDMEMBERS_i [k][i];
                mult_gramian_2 = ENDMEMBERS_i [k][j];
                g_buf = mult_gramian_1 * mult_gramian_2;
                GRAMIAN [i][j] = GRAMIAN [i][j] + g_buf;
            }
        }
    }

    #pragma HLS loop_merge

    // Projection of DR_HSI Step
    DR_HSI_input_loop : for (int i = 0; i < VIRTUAL_DIMENSION; i++) {
        DR_HSI_input_inner_loop : for (int j = 0; j < BATCH_IMAGE_H*BATCH_IMAGE_W; j++) {
            DR_HSI_i [i][j] = DR_HSI [i][j];
        }
    }

    for (int i = 0; i < VIRTUAL_DIMENSION+1; i++) {
        for (int j = 0; j < BATCH_IMAGE_H*BATCH_IMAGE_W; j++){
            PROJ_MTX [i][j] = 0;
            for (int k = 0; k < VIRTUAL_DIMENSION; k++) {
                #pragma HLS PIPELINE II=1
                #pragma HLS UNROLL
                mult_proj_1 = ENDMEMBERS_i [k][i];
                mult_proj_2 = DR_HSI_i     [k][j];
                p_buf  = mult_proj_1 * mult_proj_2;
                PROJ_MTX [i][j] = PROJ_MTX [i][j] + p_buf;
            }
        }
    }

    // Abundance Estimation Step
    Initiation_loop : for (int i = 0; i < VIRTUAL_DIMENSION + 1; i++) {
        Initiation_inner_loop : for (int j = 0; j < BATCH_IMAGE_H*BATCH_IMAGE_W; j++) {
            ABUNDANCE_i [i][j] = 0.125;
        }
    }
    Iteration_loop : for (int iter = 0; iter < maxIter; iter++) {
        for (int i = 0; i < VIRTUAL_DIMENSION+1; i++) {
            #pragma HLS PIPELINE II=1
            for (int j = 0; j < BATCH_IMAGE_H*BATCH_IMAGE_W; j++){
                #pragma HLS PIPELINE II=1
                INVERSE [i][j] = 0;
                for (int k = 0; k < VIRTUAL_DIMENSION+1; k++) {
                    #pragma HLS PIPELINE II=1
                    #pragma HLS dependence variable=mult_update_1 inter false
                    #pragma HLS dependence variable=mult_update_2 inter false
                    #pragma HLS dependence variable=div_buf inter false
                    #pragma HLS dependence variable=INVERSE inter false
                    mult_update_1 = GRAMIAN     [k][i];
                    mult_update_2 = ABUNDANCE_i [k][j];
                    div_buf = mult_update_1 * mult_update_2;
                    INVERSE [i][j] = INVERSE [i][j] + div_buf;
                }
            }
        }
        Update_loop : for (int i = 0; i < VIRTUAL_DIMENSION + 1; i++) {
            Update_inner_loop : for (int j = 0; j < BATCH_IMAGE_H*BATCH_IMAGE_W; j++) {
                #pragma HLS PIPELINE II=1
                mult_cal_1 = ABUNDANCE_i [i][j];
                mult_cal_2 = PROJ_MTX    [i][j];
                div_cal_3  = INVERSE [i][j] + reg_Param;
                div_val    = 1/div_cal_3;
                mult_temp  = mult_cal_1 * mult_cal_2;
            	ABUNDANCE_i [i][j] = div_val * mult_temp;
            }
        }
    }
    // Normalization Step
    Normalization_loop : for (int j = 0; j < BATCH_IMAGE_H*BATCH_IMAGE_W; j++) {
        sum_of_rows = 0;
        Sum_over_row_loop : for (int i = 0; i < VIRTUAL_DIMENSION + 1; i++) {
            sum_of_rows = sum_of_rows + ABUNDANCE_i [i][j];
        }
        Normalization_inner_loop : for (int i = 0; i < VIRTUAL_DIMENSION + 1; i++) {
            #pragma HLS PIPELINE II=1
            ABUNDANCE_i [i][j] = ABUNDANCE_i [i][j]/sum_of_rows;
        }
    }
    // Output Step
    Output_loop : for (int i = 0; i < VIRTUAL_DIMENSION + 1; i++) {
        Output_inner_loop : for (int j = 0; j < BATCH_IMAGE_H*BATCH_IMAGE_W; j++) {
            ABUNDANCE [i][j] = ABUNDANCE_i [i][j];
        }
    }    
}
