/*
 * classify_lib.h
 *
 *  Created on: 2017. 5. 22.
 *      Author: woobes
 */

#ifndef SRC_LENET5_CLASSIFY_LIB_H_
#define SRC_LENET5_CLASSIFY_LIB_H_

#include "common.h"

int argmax(float_type* arr, int size=26*image_Batch) {
	int max_arg = 0;
	float_type max = -1000.0;
	for (int i = 0; i < size; i++) {
		if (arr[i] > max) {
			max_arg = i;
			max = arr[i];
		}
	}
	return max_arg;
}

double equal(int a, int b) {
	return (a == b) ? 1.0 : 0.0;
}

#endif /* SRC_LENET5_CLASSIFY_LIB_H_ */
