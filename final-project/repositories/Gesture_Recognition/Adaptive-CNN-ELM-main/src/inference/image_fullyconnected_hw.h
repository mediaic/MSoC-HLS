/*
 * image_fullyconnected.h
 *
 *  Created on: 2017. 5. 21.
 *      Author: woobes
 */

#ifndef SRC_LENET5_HW_LAYERS_IMAGE_FULLYCONNECTED_HW_H_
#define SRC_LENET5_HW_LAYERS_IMAGE_FULLYCONNECTED_HW_H_
#include "../common.h"

void FULLY_CONNECTED_LAYER_1_HW(const float_type input_feature[image_Batch*CONV_3_TYPE],const float_type weights[FILTER_NN_1_SIZE],const float_type bias[BIAS_NN_1_SIZE],float_type output_feature[image_Batch*OUTPUT_NN_1_SIZE],int init);
void FULLY_CONNECTED_LAYER_2_HW(const float_type input_feature[image_Batch*OUTPUT_NN_1_SIZE],const float_type weights[FILTER_NN_2_SIZE],const float_type bias[BIAS_NN_2_SIZE],float_type output_feature[image_Batch * OUTPUT_NN_2_SIZE],int init);

#endif /* SRC_LENET5_HW_LAYERS_IMAGE_FULLYCONNECTED_HW_H_ */


