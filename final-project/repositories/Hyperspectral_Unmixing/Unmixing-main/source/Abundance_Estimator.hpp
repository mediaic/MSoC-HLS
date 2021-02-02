#include "ap_fixed.h"
typedef float MATRIX_T;

const int BATCH_IMAGE_H = 8;
const int BATCH_IMAGE_W = 8;
const int BATCH_SIZE    = 1024;
const int VIRTUAL_DIMENSION = 7;

void Abundance_Estimator (
    MATRIX_T    DR_HSI     [  VIRTUAL_DIMENSION][BATCH_IMAGE_H*BATCH_IMAGE_W],
    MATRIX_T    ENDMEMBERS [  VIRTUAL_DIMENSION][        VIRTUAL_DIMENSION+1],
    MATRIX_T    ABUNDANCE  [VIRTUAL_DIMENSION+1][BATCH_IMAGE_H*BATCH_IMAGE_W],
    MATRIX_T    reg_Param = 0.0625
);
