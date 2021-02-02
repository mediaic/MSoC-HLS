#ifndef FRFT_H
#define FRFT_H


#ifndef DATATYPE_H
#include "datatype.h"
#endif

void C_U1(DTYPE* u1_re, DTYPE* u1_im ,COS_SIN_TYPE* cos, COS_SIN_TYPE* sin, IO_DTYPE* data_re_in_i, IO_DTYPE* data_im_in_i,  THETA_TYPE rotation_angle);
void E(DTYPE* e_re, DTYPE* e_im, DTYPE* u1_re, DTYPE* u1_im ,COS_SIN_TYPE* cos, COS_SIN_TYPE* sin);
void U2(IO_DTYPE* data_re_out_o, IO_DTYPE* data_im_out_o, DTYPE* e_re, DTYPE* e_im);
//void frft( DTYPE data_re_out[256], DTYPE data_im_out[256], DTYPE data_re_in[256], DTYPE data_im_in[256],  THETA_TYPE rotation_angle) ;
void frft( IO_DTYPE data_re_out_o[256], IO_DTYPE data_im_out_o[256], IO_DTYPE data_re_in_i[256], IO_DTYPE data_im_in_i[256],  THETA_TYPE rotation_angle) ;

#endif  /* FRFT_H */ 
