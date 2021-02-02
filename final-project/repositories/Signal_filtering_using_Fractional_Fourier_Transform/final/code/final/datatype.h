#ifndef DATATYPE_H
#define DATATYPE_H

#include "ap_fixed.h"

typedef ap_fixed<32,14> IO_DTYPE;
typedef ap_fixed<18,4> THETA_TYPE;
typedef ap_fixed<24,6> DTYPE;
typedef ap_fixed<10,2> COS_SIN_TYPE;


// typedef float IO_DTYPE;
// typedef float THETA_TYPE;
// typedef float DTYPE;
// typedef ap_fixed<10,2>  COS_SIN_TYPE;


static const THETA_TYPE pi   = 3.141593 ; 
static const THETA_TYPE pi_2   = 6.283185 ; 
static const THETA_TYPE pi_1_2 = 1.57096 ; 

#endif /* DATATYPE_H */
