#ifndef __QRDRLS_H__
#define __QRDRLS_H__

#define N_INPUT_NODES 128
#define N_HIDDEN_NODES 168
#define N_OUTPUT_NODES 26
#define NUM_OF_IC int((N_HIDDEN_NODES + N_OUTPUT_NODES)/2)
#define NUM_OF_IC_BS int(N_HIDDEN_NODES/2)
#define QRD_RLS_NEED_CNT 2*N_HIDDEN_NODES+N_OUTPUT_NODES - 1
#define BS_NEED_CNT 2*N_HIDDEN_NODES - 1

#include "../common.h"

void QRD_RLS(const float_type x_train[N_INPUT_NODES],const int t_train,const float_type wmem[N_INPUT_NODES*N_HIDDEN_NODES],const float_type bmem[N_HIDDEN_NODES],const bool BS,float_type beta_mem[N_HIDDEN_NODES*N_OUTPUT_NODES]);
void QRD_RLS_test(float_type H_train[N_HIDDEN_NODES],float_type T_train[N_OUTPUT_NODES],bool BS,float_type beta_mem[N_HIDDEN_NODES*N_OUTPUT_NODES]);
#endif
