#ifndef FRFT_H
#define FRFT_H


#ifndef DATATYPE_H
#include "datatype.h"
#endif

//void frft( DTYPE data_re_out[256], DTYPE data_im_out[256], DTYPE data_re_in[256], DTYPE data_im_in[256],  THETA_TYPE rotation_angle) ;
void frft( IO_DTYPE data_re_out_o[256], IO_DTYPE data_im_out_o[256], IO_DTYPE data_re_in_i[256], IO_DTYPE data_im_in_i[256],  THETA_TYPE rotation_angle) ;

#endif  /* FRFT_H */ 