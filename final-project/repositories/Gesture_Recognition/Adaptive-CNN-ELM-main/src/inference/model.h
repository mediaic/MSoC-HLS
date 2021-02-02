
#include "../common.h"

void feature_extractor(
	const float_type input_layer[image_Batch*CONV_1_INPUT_WH*CONV_1_INPUT_WH],
	const float_type Wconv1[CONV_1_TYPE*CONV_1_SIZE],
	const float_type bconv1[CONV_1_TYPE],
	const float_type Wconv2[CONV_2_TYPE*CONV_1_TYPE*CONV_2_SIZE],
	const float_type bconv2[CONV_2_TYPE],
	const float_type Wconv3[CONV_3_TYPE*CONV_2_TYPE*CONV_3_SIZE],
	const float_type bconv3[CONV_3_TYPE],
	float_type hconv3[image_Batch*CONV_3_TYPE],
	int init
);


void pure_lenet5(
	const float_type input_layer[image_Batch*CONV_1_INPUT_WH*CONV_1_INPUT_WH],
	const float_type Wconv1[CONV_1_TYPE*CONV_1_SIZE],
	const float_type bconv1[CONV_1_TYPE],
	const float_type Wconv2[CONV_2_TYPE*CONV_1_TYPE*CONV_2_SIZE],
	const float_type bconv2[CONV_2_TYPE],
	const float_type Wconv3[CONV_3_TYPE*CONV_2_TYPE*CONV_3_SIZE],
	const float_type bconv3[CONV_3_TYPE],
	const float_type Wfc1[FILTER_NN_1_SIZE],
	const float_type bfc1[BIAS_NN_1_SIZE],
	const float_type Wfc2[FILTER_NN_2_SIZE],
	const float_type bfc2[BIAS_NN_2_SIZE],
	float_type output[image_Batch * OUTPUT_NN_2_SIZE],
	int init
);

void lenet5_elm(
	const float_type input_layer[image_Batch*CONV_1_INPUT_WH*CONV_1_INPUT_WH],
	const float_type Wconv1[CONV_1_TYPE*CONV_1_SIZE],
	const float_type bconv1[CONV_1_TYPE],
	const float_type Wconv2[CONV_2_TYPE*CONV_1_TYPE*CONV_2_SIZE],
	const float_type bconv2[CONV_2_TYPE],
	const float_type Wconv3[CONV_3_TYPE*CONV_2_TYPE*CONV_3_SIZE],
	const float_type bconv3[CONV_3_TYPE],
	const float_type Welm[FILTER_ELM_SIZE], 
	const float_type belm[BIAS_ELM_SIZE], 
	const float_type beta_elm[BETA_ELM_SIZE], 
	float_type output[image_Batch * OUTPUT_NN_2_SIZE],
	int init
);

void proposed_model(
	const float_type input_layer[image_Batch*CONV_1_INPUT_WH*CONV_1_INPUT_WH],
	const float_type Wconv1[CONV_1_TYPE*CONV_1_SIZE],
	const float_type bconv1[CONV_1_TYPE],
	const float_type Wconv2[CONV_2_TYPE*CONV_1_TYPE*CONV_2_SIZE],
	const float_type bconv2[CONV_2_TYPE],
	const float_type Wconv3[CONV_3_TYPE*CONV_2_TYPE*CONV_3_SIZE],
	const float_type bconv3[CONV_3_TYPE],
	const float_type Welm[FILTER_ELM_SIZE], 
	const float_type belm[BIAS_ELM_SIZE], 
	float_type beta_elm[BETA_ELM_SIZE],
	float_type output[image_Batch * OUTPUT_NN_2_SIZE],
	const int golden_label,
	const bool stage_train,
	const bool BS,
	int init
);
