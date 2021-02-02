//=========================================================================
// cordic.cpp
//=========================================================================
// @brief: A CORDIC implementation of sine and cosine functions.
/* @desc:
 * 1. The code uses radians when measuring angles. 
 * 2. Each angle in iteration is stored in a predefined look-up table
 * 3. The fixed point version of CORDIC does not need DSP48 since all 
 *    MUL/DIV have been eliminated with the use of shift and look-up
 *    tables. 
 * 4. The float_typeing point version of CORDIC was adopted from the demo
 *    program of Parallel Programming of FPGA, Chapter 3
*/

#include "my_cordic.h"
#include <math.h>
#include <iostream>

#include "../common.h"

//-----------------------------------
// cordic function
//-----------------------------------

void cordic(mode_type mode, mode_type operation, cos_sin_type in_x, cos_sin_type in_y, theta_type in_z, cos_sin_type& out_x, cos_sin_type& out_y, theta_type& out_z)
{
    index_type step;

#ifdef float_typeYPE // fixed-point design

    // Starting coordinates are stored in a look-up table to eliminate
    // the MUL/DIV operations at the end of the CORDIC computation
    cos_sin_type curr_cos = cordic_reciprocal_cuml_scaling[20];
    cos_sin_type curr_sin = 0.0;

FIXED_STEP_LOOP:
    for ( step = 0; step < 20; step++ ) 
    {
      // Determine whether we need a positive or negative angle 
      sigma_type sigma = (theta < 0) ? -1 : 1;

      // Store the original x-coordinate
      cos_sin_type tmp_cos = curr_cos;

      // Finish rotation with only addition, subtraction, and shifting.
      // 2**(-i) is implemented with division and explicit shifting, 
      // which ensures Vivado HLS synthesizes this behavior with shift
      // registers rather than DSP48.
      curr_cos = curr_cos - (curr_sin * sigma) / (1ULL << step);
      curr_sin = curr_sin + (tmp_cos * sigma) / (1ULL << step) ;

      // Compute the difference between target and current angle 
      theta = theta - sigma * cordic_ctab[step];
    }

    // Setup results
    s = curr_sin; c = curr_cos;

#else // float_typeing point design
    // operation=0 linear / operation=1 circular
    // mode=0 vector rotation / mode=1 angle accumulation
    
    // initialization
    cos_sin_type curr_x = in_x;
    cos_sin_type curr_y = in_y;
    cos_sin_type curr_z = in_z;

    cos_sin_type next_x = 0.0;
    cos_sin_type next_y = 0.0;
    cos_sin_type next_z = 0.0;

    // The iterative shift factor, beginning at 1.0
    cos_sin_type factor = 1.0; 

    mu_type mu = 0;


float_type_STEP_LOOP:
    for ( step = 0; step < NUM_ITER; step++ ) 
    {
      // Determine whether we need a positive or negative angle
      if (mode == 0)
        mu = (curr_z < 0) ? -1 : 1;
      else
        mu = (curr_x*curr_y < 0) ? 1 : -1;


      next_x = curr_x - operation * mu * factor * curr_y;
      next_y = mu * factor * curr_x + curr_y;

      if (operation == 1)
        next_z = curr_z - mu * cordic_ctab[step];
      else
        next_z = curr_z - mu * factor;

      // Computing the Tan of the next angle with the shift operation
      //std::cout<< "factor value: "<< factor; //check
      factor = factor / (double)(1ULL << 1); //2^-i

      curr_x = next_x;
      curr_y = next_y;
      curr_z = next_z;

    }

    // Setup results
    if (operation == 1){
      out_x = curr_x * cordic_reciprocal_cuml_scaling[NUM_ITER-1];
      out_y = curr_y * cordic_reciprocal_cuml_scaling[NUM_ITER-1];
      
    }
    else{
      out_x = curr_x;
      out_y = curr_y;
    }
    out_z = curr_z;

#endif

}
