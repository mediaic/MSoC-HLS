/*
 * load_param.h
 *
 *  Created on: 2021. 1. 20.
 *      Author: CW Chen
 */
 
#ifndef SRC_LENET5_LOAD_PARAM_H_
#define SRC_LENET5_LOAD_PARAM_H_

#include <iostream>
#include <fstream>
#include <string>
#include "common.h"

using namespace std;

// load weights & biases
void load_model(string filename, float_type* weight, int size) {

	ifstream file(filename.c_str(), ios::in);
	if (file.is_open()) {
		for (int i = 0; i < size; i++) {
			float_type temp = 0.0;
			file >> temp;
			weight[i] = temp;
		}
	}else{
		cout<<"Loading model is failed : "<<filename<<endl;
	}
}

// labels
void load_model_int(string filename, int* weight, int size) {

	ifstream file(filename.c_str(), ios::in);
	if (file.is_open()) {
		for (int i = 0; i < size; i++) {
			int temp = 0.0;
			file >> temp;
			weight[i] = temp;
		}
	}else{
		cout<<"Loading model is failed : "<<filename<<endl;
	}
}

#endif /* SRC_LENET5_LOAD_PARAM_H_ */