#include "PE.h"
#include "QRD-RLS.h"

#include <iostream>
using namespace std;

#include "../common.h"

void RELU(float_type& x)
{
	if(x<0.0) x = 0.0;
}

void QRD_RLS(const float_type x_train[N_INPUT_NODES],const int t_train,const float_type wmem[N_INPUT_NODES*N_HIDDEN_NODES],const float_type bmem[N_HIDDEN_NODES],const bool BS,float_type beta_mem[N_HIDDEN_NODES*N_OUTPUT_NODES])
{
	float_type H_train[N_HIDDEN_NODES] = {0.0};
	float_type T_train[N_OUTPUT_NODES] = {0.0};
	static float_type R_mem[int(((N_HIDDEN_NODES + 1)*N_HIDDEN_NODES)/2)] = {0.0};
	static float_type u_mem[N_HIDDEN_NODES * N_OUTPUT_NODES] = {0.0};
	float_type ru_in_buf[1+NUM_OF_IC] = {0.0};
	float_type ru_out_buf[1+NUM_OF_IC] = {0.0};
	float_type x_in[1+NUM_OF_IC] = {0.0};
	float_type t_in[1+NUM_OF_IC] = {0.0};
	float_type x_out[1+NUM_OF_IC] = {0.0};
	float_type t_out[1+NUM_OF_IC] = {0.0};

	// Will be released later...
	

}
