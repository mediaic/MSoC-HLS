/*
 * image_pool_sw.h
 *
 *  Created on: 2017. 5. 21.
 *      Author: woobes
 */

#ifndef SRC_LENET5_HW_LAYERS_IMAGE_POOL_HW_H_
#define SRC_LENET5_HW_LAYERS_IMAGE_POOL_HW_H_
#include "../common.h"

void MAXPOOL_1_HW(float_type* src, float_type* dst);
void MAXPOOL_2_HW(float_type* src, float_type* dst);

#endif /* SRC_LENET5_HW_LAYERS_IMAGE_POOL_HW_H_ */
