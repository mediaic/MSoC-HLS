
//#include <lenet5/hw_layers/image_pool.h>
#include "../common.h"
#include "ap_int.h"

float_type _tanh(float_type x);
float_type relu(float_type x);

void CONVOLUTION_LAYER_1_HW(const float_type input_feature[image_Batch*CONV_1_INPUT_WH*CONV_1_INPUT_WH],
		const float_type weights[6*5*5],
		const float_type bias[6],
		float_type output_feature[image_Batch*6*CONV_1_OUTPUT_WH*CONV_1_OUTPUT_WH], int init
		);

void CONVOLUTION_LAYER_2_HW(const float_type input_feature[image_Batch*6*14*14],
		const float_type weights[6*16*5*5],
		const float_type bias[CONV_2_TYPE],
		float_type output_feature[image_Batch*16*10*10], int init
		);

void CONVOLUTION_LAYER_3_HW(const float_type input_feature[image_Batch*16*5*5],
		const float_type weights[16*128*5*5],
		const float_type bias[128],
		float_type output_feature[image_Batch*128], int init
		);


