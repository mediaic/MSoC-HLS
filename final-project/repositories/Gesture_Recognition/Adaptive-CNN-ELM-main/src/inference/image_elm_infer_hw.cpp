
#ifndef SRC_LENET5_SW_LAYERS_IMAGE_ELM_INFERENCE_HW_H_
#define SRC_LENET5_SW_LAYERS_IMAGE_ELM_INFERENCE_HW_H_

#include "../common.h"
#include "image_convolution_hw.h"

#include <iostream>
using namespace std;

void ELM_INFER_HW(
		const float_type input_feature[image_Batch*CONV_3_TYPE], 
		const float_type weights[FILTER_ELM_SIZE], 
		const float_type bias[BIAS_ELM_SIZE], 
		const float_type beta[BETA_ELM_SIZE], 
		float_type output_feature[image_Batch*OUTPUT_ELM_SIZE],
		int init
	)
{
	float_type IBRAM[image_Batch][CONV_3_TYPE];
	static float_type WBRAM[FILTER_ELM_SIZE];
	static float_type biasBRAM[BIAS_ELM_SIZE];
	static float_type betaBRAM[BETA_ELM_SIZE];
	float_type OBRAM[image_Batch*OUTPUT_ELM_SIZE];
//#pragma HLS array_partition variable=WBRAM complete dim=1
//#pragma HLS array_partition variable=biasBRAM complete dim=0
//#pragma HLS array_partition variable=betaBRAM complete dim=0
//#pragma HLS array_partition variable=OBRAM complete dim=2
	
	static float_type H[image_Batch][HIDDEN_ELM_SIZE];
	
	copy_input_1:
	for(int batch_cnt=0;batch_cnt<image_Batch;batch_cnt++){
		copy_input_2 :
		for(int i=0;i<CONV_3_TYPE;i++){
		#pragma HLS PIPELINE II=1
			IBRAM[batch_cnt][i] = input_feature[batch_cnt*CONV_3_TYPE+i];
		}
	}
	
	for (int batch = 0; batch < image_Batch; batch++) {
		// First Layer (Random layer, alpha)
		for (int i = 0; i < HIDDEN_ELM_SIZE; i++) {
			float_type temp = 0;
			for (int j = 0; j < INPUT_ELM_SIZE; j++) {
				float_type in_val = IBRAM[batch][j];
				float_type w_val = weights[i*INPUT_ELM_SIZE+j];
				temp += in_val*w_val;
			}
			H[batch][i] = relu(temp + bias[i]);
		}
		// Second Layer (Trained layer, beta)
		for (int i = 0; i < OUTPUT_ELM_SIZE; i++) {
			float_type temp = 0;
			for (int j = 0; j < HIDDEN_ELM_SIZE; j++) {
				float_type in_val = H[batch][j];
				float_type w_val = beta[i*HIDDEN_ELM_SIZE+j];
				//float_type w_val = beta[j*OUTPUT_ELM_SIZE+i];
				temp += in_val*w_val;
			}
			output_feature[batch*OUTPUT_ELM_SIZE+i] = (temp);
		}
	}
}

#endif /* SRC_LENET5_SW_LAYERS_IMAGE_ELM_INFERENCE_HW_H_ */
