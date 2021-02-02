#ifndef __PE_H__
#define __PE_H__

#include "my_cordic.h"

#include "../common.h"

void boundary_cell(cos_sin_type x_in,cos_sin_type r_in, mode_type QRD, cos_sin_type& r_out, theta_type& sita_out);
void internal_cell(cos_sin_type x_in, cos_sin_type y_in, theta_type z_in, mode_type QRD, cos_sin_type& x_out, cos_sin_type& y_out, theta_type& z_out);
#endif
