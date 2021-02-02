
#include "image_convolution_hw.h"
#include "image_fullyconnected_hw.h"
#include "image_pool_hw.h"
#include "image_elm_infer_hw.h"
#include "../train/QRD-RLS.h"

#include "../common.h"

// Only Conv layers for feature extraction
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
)
{
	
	float_type hconv1[image_Batch*CONV_1_TYPE*CONV_1_OUTPUT_SIZE];
	float_type pool1[image_Batch*CONV_1_TYPE*POOL_1_OUTPUT_SIZE];
	float_type hconv2[image_Batch*CONV_2_TYPE*CONV_2_OUTPUT_SIZE];
	float_type pool2[image_Batch * CONV_2_TYPE * POOL_2_OUTPUT_SIZE];
	
	
	// C1 layer
	CONVOLUTION_LAYER_1_HW(input_layer,Wconv1,bconv1,hconv1,init);
	
	// S1 layer
	MAXPOOL_1_HW(hconv1,pool1);
	
	// C2 layer
	CONVOLUTION_LAYER_2_HW(pool1,Wconv2,bconv2,hconv2,init);
	
	// S2 layer
	MAXPOOL_2_HW(hconv2,pool2);
	
	// C3 layer
	CONVOLUTION_LAYER_3_HW(pool2,Wconv3,bconv3,hconv3,init);
	
}

// Lenet-5 Architecture (only for inference)
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
)
{
	
	float_type hconv1[image_Batch*CONV_1_TYPE*CONV_1_OUTPUT_SIZE];
	float_type pool1[image_Batch*CONV_1_TYPE*POOL_1_OUTPUT_SIZE];
	float_type hconv2[image_Batch*CONV_2_TYPE*CONV_2_OUTPUT_SIZE];
	float_type pool2[image_Batch * CONV_2_TYPE * POOL_2_OUTPUT_SIZE];
	float_type hconv3[image_Batch*CONV_3_TYPE];
	float_type hfc1[image_Batch*OUTPUT_NN_1_SIZE];
	
	// C1 layer
	CONVOLUTION_LAYER_1_HW(input_layer,Wconv1,bconv1,hconv1,init);
	
	// S1 layer
	MAXPOOL_1_HW(hconv1,pool1);
	
	// C2 layer
	CONVOLUTION_LAYER_2_HW(pool1,Wconv2,bconv2,hconv2,init);
	
	// S2 layer
	MAXPOOL_2_HW(hconv2,pool2);
	
	// C3 layer
	CONVOLUTION_LAYER_3_HW(pool2,Wconv3,bconv3,hconv3,init);
	
	// FC1 layer
	FULLY_CONNECTED_LAYER_1_HW(hconv3,Wfc1,bfc1,hfc1,init);

	// FC2 layer
	FULLY_CONNECTED_LAYER_2_HW(hfc1,Wfc2,bfc2,output,init);
	
}

// Lenet5-ELM (only for inference)
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
)
{

	float_type hconv3[image_Batch*CONV_3_TYPE];
	
	// Feature Extractor
	feature_extractor(input_layer,Wconv1,bconv1,Wconv2,bconv2,Wconv3,bconv3,hconv3,init);

	// OS_ELM
	ELM_INFER_HW(hconv3,Welm,belm,beta_elm,output,init);

}

// Lenet5-ELM (two mode: inference/training)
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
)
{

	static float_type beta_mem[BETA_ELM_SIZE];
	if(init==1){
		for(int i=0;i<BETA_ELM_SIZE;i++){
			beta_mem[i] = beta_elm[i];
		}
	}

	static float_type hconv3[image_Batch*CONV_3_TYPE];
	
	// Feature Extractor
	feature_extractor(input_layer,Wconv1,bconv1,Wconv2,bconv2,Wconv3,bconv3,hconv3,init);

	if(stage_train){
		// Train
		QRD_RLS(hconv3,golden_label,Welm,belm,BS,beta_elm);
		if(BS==true){
			for(int i=0;i<BETA_ELM_SIZE;i++){
				beta_mem[i] = beta_elm[i];
			}
		}
	}
	else{
		// OS_ELM
		ELM_INFER_HW(hconv3,Welm,belm,beta_mem,output,init);
	}

}