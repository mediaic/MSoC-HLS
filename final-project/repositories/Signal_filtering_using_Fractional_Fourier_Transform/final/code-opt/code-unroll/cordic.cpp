#include "cordic.h"
// #include <math.h>
//The cordic_phase array holds the angle for the current rotation

void cordic(THETA_TYPE theta, COS_SIN_TYPE &s, COS_SIN_TYPE &c)
{
  // Set the initial vector that we will rotate
  // current_cos = I; current_sin = Q
  COS_SIN_TYPE current_cos = 0.60735;
  COS_SIN_TYPE current_sin = 0.0;

  bool angle_mirror ; 

  if ( theta < -pi_1_2 ) {
      theta = theta + pi ;    
      angle_mirror = 1 ;   
  }else if( theta > pi_1_2 ) {
      theta = theta - pi ; 
      angle_mirror = 1 ; 
  }else{
      angle_mirror = 0 ; 
  }

  // This loop iteratively rotates the initial vector to find the
  // sine and cosine values corresponding to the input theta angle
  AGNLE_ITERTAION:
  for (int j = 0; j < NUM_ITERATIONS; j++) {
      // Multiply previous iteration by 2^(-j).  This is equivalent to
      // a right shift by j on a fixed-point number.

      // const COS_SIN_TYPE cos_sh[] = {current_cos, current_cos>>1, current_cos>>2, current_cos>>3, current_cos>>4, current_cos>>5, current_cos>>6, \
      // current_cos>>7, current_cos>>8, current_cos>>9 } ;  
      // const COS_SIN_TYPE sin_sh[] = {current_sin, current_sin>>1, current_sin>>2, current_sin>>3, current_sin>>4, current_sin>>5, current_sin>>6, \
      // current_sin>>7, current_sin>>8, current_sin>>9 } ;      


      // COS_SIN_TYPE cos_shift = cos_sh[j];
      // COS_SIN_TYPE sin_shift = sin_sh[j];
      COS_SIN_TYPE cos_shift = current_cos >> j;
      COS_SIN_TYPE sin_shift = current_sin >> j;
      //  COS_SIN_TYPE cos_shift = current_cos / pow(2,j) ;
      //  COS_SIN_TYPE sin_shift = current_sin / pow(2,j) ;

    // Determine if we are rotating by a positive or negative angle
    if(theta >= 0) {
        // Perform the rotation
        current_cos = current_cos - sin_shift;
        current_sin = current_sin + cos_shift;

        // Determine the new theta
        theta = theta - cordic_phase[j];
    } else {
        // Perform the rotation
        current_cos = current_cos + sin_shift;
        current_sin = current_sin - cos_shift;

        // Determine the new theta
        theta = theta + cordic_phase[j];
    }
  }

  // Set the final sine and cosine values
  if ( angle_mirror==0 ) {
    s = current_sin ;  c = current_cos ;
  }else{
    s = -current_sin ;  c = -current_cos ;
  }

}
