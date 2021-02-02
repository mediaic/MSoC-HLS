
#ifndef SRC_LENET5_SW_LAYERS_IMAGE_ELM_INFERENCE_HW_H_
#define SRC_LENET5_SW_LAYERS_IMAGE_ELM_INFERENCE_HW_H_

void ELM_INFER_HW(const float_type input_feature[image_Batch*CONV_3_TYPE], const float_type weights[FILTER_ELM_SIZE], const float_type bias[BIAS_ELM_SIZE], const float_type beta[BETA_ELM_SIZE], float_type output_feature[image_Batch*OUTPUT_ELM_SIZE],int init);

#endif /* SRC_LENET5_SW_LAYERS_IMAGE_ELM_INFERENCE_HW_H_ */