/*
 * image_pool_sw.h
 *
 *  Created on: 2017. 5. 21.
 *      Author: woobes
 */

#ifndef SRC_LENET5_HW_LAYERS_IMAGE_POOL_HW_H_
#define SRC_LENET5_HW_LAYERS_IMAGE_POOL_HW_H_
#include "../common.h"

void MAXPOOL_1_HW(float_type* src, float_type* dst){
	for(int batch=0;batch<image_Batch;batch++){
		for(int depth=0;depth<POOL_1_TYPE;depth++){
			for(int row=0;row<POOL_1_OUTPUT_WH;row++){
				for(int col=0;col<POOL_1_OUTPUT_WH;col++){
					float_type max=-FLT_MAX;
					for(int row_w=0;row_w<2;row_w++){
						for(int col_w=0;col_w<2;col_w++){
							if(src[batch*POOL_1_TYPE*POOL_1_INPUT_SIZE + depth*POOL_1_INPUT_SIZE +
								(2*row+row_w)*POOL_1_INPUT_WH + col*2+col_w]>max){
								max = src[batch*POOL_1_TYPE*POOL_1_INPUT_SIZE + depth*POOL_1_INPUT_SIZE +
											(2*row+row_w)*POOL_1_INPUT_WH + col*2+col_w];
							}
						}
					}
					dst[batch*POOL_1_TYPE*POOL_1_OUTPUT_SIZE + depth*POOL_1_OUTPUT_SIZE + row*POOL_1_OUTPUT_WH + col] = max;
				}
			}
		}
	}
}
void MAXPOOL_2_HW(float_type* src, float_type* dst){
	for(int batch=0;batch<image_Batch;batch++){
		for(int depth=0;depth<POOL_2_TYPE;depth++){
			for(int row=0;row<POOL_2_OUTPUT_WH;row++){
				for(int col=0;col<POOL_2_OUTPUT_WH;col++){
					float_type max=-FLT_MAX;
					for(int row_w=0;row_w<2;row_w++){
						for(int col_w=0;col_w<2;col_w++){
							if(src[batch*POOL_2_TYPE*POOL_2_INPUT_SIZE + depth*POOL_2_INPUT_SIZE +
								(2*row+row_w)*POOL_2_INPUT_WH + col*2+col_w]>max){
								max = src[batch*POOL_2_TYPE*POOL_2_INPUT_SIZE + depth*POOL_2_INPUT_SIZE +
											(2*row+row_w)*POOL_2_INPUT_WH + col*2+col_w];
							}
						}
					}
					dst[batch*POOL_2_TYPE*POOL_2_OUTPUT_SIZE + depth*POOL_2_OUTPUT_SIZE + row*POOL_2_OUTPUT_WH + col] = max;
				}
			}
		}
	}
}
#endif /* SRC_LENET5_HW_LAYERS_IMAGE_POOL_HW_H_ */
