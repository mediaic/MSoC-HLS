#include "ap_fixed.h"
typedef bool THETA_TYPE;
typedef ap_fixed <16, 6> HSI_TYPE;
const int NUM_ITERATION = 12;
const HSI_TYPE scaling_factor = 0.60725;

// MASTER
void m_cordic (
    HSI_TYPE &x_r,
    HSI_TYPE &y_r,
    THETA_TYPE dir [12]
);

// SLAVE
void s_cordic (
    THETA_TYPE dir [12],
    HSI_TYPE &x_r,
    HSI_TYPE &y_r
);