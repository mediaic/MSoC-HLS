/*
 * image_fullyconnected.h
 *
 *  Created on: 2017. 5. 21.
 *      Author: woobes
 */

#ifndef SRC_LENET5_HW_LAYERS_IMAGE_FULLYCONNECTED_HW_H_
#define SRC_LENET5_HW_LAYERS_IMAGE_FULLYCONNECTED_HW_H_
#include "../common.h"

void FULLY_CONNECTED_LAYER_1_HW(
		const float_type input_feature[image_Batch*CONV_3_TYPE], 
		const float_type weights[FILTER_NN_1_SIZE], 
		const float_type bias[BIAS_NN_1_SIZE],
		float_type output_feature[image_Batch*OUTPUT_NN_1_SIZE],
		int init
	)
{
	float_type IBRAM[image_Batch][CONV_3_TYPE];
	static float_type WBRAM[FILTER_NN_1_SIZE];
	static float_type biasBRAM[BIAS_NN_1_SIZE];
	float_type OBRAM[image_Batch*OUTPUT_NN_1_SIZE];
//#pragma HLS array_partition variable=WBRAM complete dim=1
//#pragma HLS array_partition variable=biasBRAM complete dim=0
//#pragma HLS array_partition variable=OBRAM complete dim=2

	copy_input_1:
	for(int batch_cnt=0;batch_cnt<image_Batch;batch_cnt++){
		copy_input_2 :
		for(int i=0;i<CONV_3_TYPE;i++){
		#pragma HLS PIPELINE II=1
			IBRAM[batch_cnt][i] = input_feature[batch_cnt*CONV_3_TYPE+i];
		}
	}
	
	if(init){
		copy_kernel_1:
		for(int i=0;i<FILTER_NN_1_SIZE;i++){
		#pragma HLS PIPELINE II=1
			WBRAM[i] = weights[i];
		}

		copy_bias:
		for(int i=0;i<BIAS_NN_1_SIZE;i++){
	#pragma HLS PIPELINE II=1
			biasBRAM[i] = bias[i];
		}
	}
	
	for (int batch = 0; batch < image_Batch; batch++) {
		for (int i = 0; i < OUTPUT_NN_1_SIZE; i++) {
			float_type temp = 0;
			for (int j = 0; j < INPUT_NN_1_SIZE; j++) {
				float_type in_val = IBRAM[batch][j];
				float_type w_val = WBRAM[i*INPUT_NN_1_SIZE+j];
				temp += in_val*w_val;
			}
			OBRAM[batch*OUTPUT_NN_1_SIZE + i] = (temp + biasBRAM[i]);
		}
	}
	
	for (int batch = 0; batch < image_Batch; batch++) {
		for (int i = 0; i < OUTPUT_NN_1_SIZE; i++) {
			output_feature[batch*OUTPUT_NN_1_SIZE+i] = OBRAM[batch*OUTPUT_NN_1_SIZE + i];
		}
	}

}


void FULLY_CONNECTED_LAYER_2_HW(
		const float_type input_feature[image_Batch*OUTPUT_NN_1_SIZE],
		const float_type weights[FILTER_NN_2_SIZE],
		const float_type bias[BIAS_NN_2_SIZE],
		float_type output_feature[image_Batch*OUTPUT_NN_2_SIZE],
		int init
	)
{
	float_type IBRAM[image_Batch][OUTPUT_NN_1_SIZE];
	static float_type WBRAM[FILTER_NN_2_SIZE];
	static float_type biasBRAM[BIAS_NN_2_SIZE];
	float_type OBRAM[image_Batch*OUTPUT_NN_2_SIZE];
//#pragma HLS array_partition variable=WBRAM complete dim=1
//#pragma HLS array_partition variable=biasBRAM complete dim=0
//#pragma HLS array_partition variable=OBRAM complete dim=2

	copy_input_1:
	for(int batch_cnt=0;batch_cnt<image_Batch;batch_cnt++){
		copy_input_2 :
		for(int i=0;i<OUTPUT_NN_1_SIZE;i++){
		#pragma HLS PIPELINE II=1
			IBRAM[batch_cnt][i] = input_feature[batch_cnt*OUTPUT_NN_1_SIZE+i];
		}
	}

	if(init){
		copy_kernel_1:
		for(int i=0;i<FILTER_NN_2_SIZE;i++){
		#pragma HLS PIPELINE II=1
			WBRAM[i] = weights[i];
		}

		copy_bias:
		for(int i=0;i<BIAS_NN_2_SIZE;i++){
		#pragma HLS PIPELINE II=1
			biasBRAM[i] = bias[i];
		}
	}

	for (int batch = 0; batch < image_Batch; batch++) {
		for (int i = 0; i < OUTPUT_NN_2_SIZE; i++) {
			float_type temp = 0;
			for (int j = 0; j < INPUT_NN_2_SIZE; j++) {
				float_type in_val = IBRAM[batch][j];
				float_type w_val = WBRAM[i*INPUT_NN_2_SIZE+j];
				temp += in_val*w_val;
			}
			OBRAM[batch*OUTPUT_NN_2_SIZE + i] = (temp + biasBRAM[i]);
		}
	}

	for (int batch = 0; batch < image_Batch; batch++) {
		for (int i = 0; i < OUTPUT_NN_2_SIZE; i++) {
			output_feature[batch*OUTPUT_NN_2_SIZE+i] = OBRAM[batch*OUTPUT_NN_2_SIZE + i];
		}
	}
}

#endif /* SRC_LENET5_HW_LAYERS_IMAGE_FULLYCONNECTED_HW_H_ */
