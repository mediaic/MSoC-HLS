/*
 * main.cpp
 *
 *  Created on: 2017. 4. 11.
 *      Author: woobes
 */

#include "src/common.h"
#include "src/lenet5.h"
#include <sys/types.h>

#include <unistd.h>
#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <numeric>

using namespace std;

int main(int argc, char *argv[]){

	// Calc execution time
	clock_t start_point, end_point, c1_start,c1_stop, c2_start,c2_stop,c3_start,c3_stop;
	vector<clock_t> v_c1,v_c2,v_c3;
	start_point = clock();

	cout<<"------------------------------------------------------------------\n"
		<<"                   LeNet-ELM HW accelerator test\n"
		<<"                         version 1.0.0\n"
		<<"                            HW Mode\n"
		<<"Original source : Acclerationg Lenet-5 (Base Version) for Default,\n"
		<<"implemented by Constant Park, HYU, ESoCLab[Version 1.0]\n"
		<<"Partial HW implementated by CW Lee & JH Woo\n"
		<<"Modified by CW Chen\n"
		<<"batch : "<<image_Batch<<" test img num : "<<image_test<<" train img num : "<<image_train<<"\n"
		<<"------------------------------------------------------------------"<<endl;
		
	///////////////////////////////// Load Parameter /////////////////////////////////////////

	float_type* MNIST_IMG_retrain;
	int* MNIST_LABEL_retrain;
	float_type* MNIST_IMG;
	int* MNIST_LABEL;

	MNIST_IMG_retrain = (float_type*) malloc(image_train*MNIST_PAD_SIZE*sizeof(float_type)); // MNIST ReTrain IMG
	MNIST_LABEL_retrain = (int*) malloc(image_train*sizeof(int)); // MNIST ReTrain LABEL
	MNIST_IMG = (float_type*) malloc(image_test*MNIST_PAD_SIZE*sizeof(float_type)); // MNIST TEST IMG
	MNIST_LABEL = (int*) malloc(image_test*sizeof(int)); // MNIST TEST LABEL
	if(!MNIST_IMG_retrain || !MNIST_LABEL_retrain || !MNIST_IMG || !MNIST_LABEL){
		cout<< "Memory allocation error(0)"<<endl;
		exit(1);
	}

	// Read training MNIST data & label
	load_model("../../../../MNIST_DATA/images_train.mdl", MNIST_IMG_retrain, image_train*MNIST_PAD_SIZE);
	load_model_int("../../../../MNIST_DATA/labels_train.mdl", MNIST_LABEL_retrain, image_train);

	// Read testing MNIST data & label
	load_model("../../../../MNIST_DATA/images_test.mdl", MNIST_IMG, image_test*MNIST_PAD_SIZE);
	load_model_int("../../../../MNIST_DATA/labels_test.mdl", MNIST_LABEL, image_test);

	// Feature Extractor (Partial Lenet)
	float_type* Wconv1= (float_type*) malloc(CONV_1_TYPE*CONV_1_SIZE*sizeof(float_type));
	float_type* bconv1=(float_type*) malloc(CONV_1_TYPE*sizeof(float_type));
	float_type* Wconv2=(float_type*) malloc(CONV_2_TYPE*CONV_1_TYPE*CONV_2_SIZE*sizeof(float_type));
	float_type* bconv2=(float_type*) malloc(CONV_2_TYPE*sizeof(float_type));
	float_type* Wconv3=(float_type*) malloc(CONV_3_TYPE*CONV_2_TYPE*CONV_3_SIZE*sizeof(float_type));
	float_type* bconv3=(float_type*) malloc(CONV_3_TYPE*sizeof(float_type));
	// ELM 
	float_type* Welm = (float_type*) malloc(FILTER_ELM_SIZE*sizeof(float_type));
	float_type* belm = (float_type*) malloc(BIAS_ELM_SIZE*sizeof(float_type));
	float_type* beta_elm = (float_type*) malloc(BETA_ELM_SIZE*sizeof(float_type));

	if(!Wconv1||!Wconv2||!Wconv3||!bconv1||!bconv2||!bconv3||!Welm||!belm||!beta_elm){
		cout<<"mem alloc error(1)"<<endl;
		exit(1);
	}
	
	cout<<"Load models"<<endl;
	// Feature Extractor (Partial Lenet)
	load_model("../../../../Param/Wconv1.mdl",Wconv1,CONV_1_TYPE*CONV_1_SIZE);
	load_model("../../../../Param/Wconv2.mdl",Wconv2,CONV_2_TYPE*CONV_1_TYPE*CONV_2_SIZE);
	load_model("../../../../Param/Wconv3.mdl",Wconv3,CONV_3_TYPE*CONV_2_TYPE*CONV_3_SIZE);
	load_model("../../../../Param/bconv1.mdl",bconv1,CONV_1_TYPE);
	load_model("../../../../Param/bconv2.mdl",bconv2,CONV_2_TYPE);
	load_model("../../../../Param/bconv3.mdl",bconv3,CONV_3_TYPE);
	// ELM 
	load_model("../../../../Param/Welm.mdl",Welm,FILTER_ELM_SIZE);
	load_model("../../../../Param/belm.mdl",belm,BIAS_ELM_SIZE);
	load_model("../../../../Param/beta_elm.mdl",beta_elm,BETA_ELM_SIZE);
	cout<<"model loaded"<<endl<<"------------------------------------------------------------------"<<endl;

	///////////////////////////////// Memory allocation /////////////////////////////////////////
	float_type* input_layer	= (float_type*) malloc(image_Batch *INPUT_WH * INPUT_WH*sizeof(float_type));
	float_type* hconv1 		= (float_type*) malloc(image_Batch * CONV_1_TYPE * CONV_1_OUTPUT_SIZE*sizeof(float_type));
	float_type* hconv1_sw 	= (float_type*) malloc(image_Batch * CONV_1_TYPE * CONV_1_OUTPUT_SIZE*sizeof(float_type));
	float_type* pool1 		= (float_type*) malloc(image_Batch * CONV_1_TYPE * POOL_1_OUTPUT_SIZE*sizeof(float_type));
	float_type* hconv2 		= (float_type*) malloc(image_Batch * CONV_2_TYPE * CONV_2_OUTPUT_SIZE*sizeof(float_type));
	float_type* pool2 		= (float_type*) malloc(image_Batch * CONV_2_TYPE * POOL_2_OUTPUT_SIZE*sizeof(float_type));
	float_type* hconv3 		= (float_type*) malloc(image_Batch * CONV_3_TYPE*sizeof(float_type));
	float_type* hfc1 		= (float_type*) malloc(image_Batch * OUTPUT_NN_1_SIZE*sizeof(float_type));
	float_type* output 		= (float_type*) malloc(image_Batch * OUTPUT_NN_2_SIZE*sizeof(float_type));
	if(!input_layer || !hconv1 || !pool1 || !hconv2 || !pool2 || !hconv3 || !hfc1 || !output){
		cout<<"Memory allocation error(2)"<<endl;
		exit(1);
	}

	///////////////////////////////// Run Simulation /////////////////////////////////////////

	// Train/Test Number
	int train_num = image_train/image_Batch;
	int test_num = image_test/image_Batch;
	
	int golden_label;
	bool stage_train;
	bool BS;
	int init=1;

	// =================== Phase 1: HW test start ===================
	vector<double> test_result_hw;
	double test_accuracy_hw;

	cout<<"HW test start"<<endl;
	c1_start=clock();
	for(int i=0;i<test_num;i++,init&=0){
		for(int batch=0;batch<image_Batch*INPUT_WH*INPUT_WH;batch++)
			input_layer[batch] = MNIST_IMG[i*MNIST_PAD_SIZE + batch];

		golden_label = 0;
		stage_train = 0;
		BS = 0;

		proposed_model(input_layer,Wconv1,bconv1,Wconv2,bconv2,Wconv3,bconv3,Welm,belm,beta_elm,output,golden_label,stage_train,BS,init);

		test_result_hw.push_back(equal(MNIST_LABEL[i],argmax(output)));

	}

	// accuracy estimation
	test_accuracy_hw = 1.0*accumulate(test_result_hw.begin(),test_result_hw.end(),0.0);

	cout<<"accuracy : "<<test_accuracy_hw<<"/"<<test_result_hw.size()<<" ("<<(test_accuracy_hw/test_result_hw.size())*100.0<<"%) "<<endl;
	cout<<"HW test completed"<<endl<<"------------------------------------------------------------------"<<endl;
	c1_stop=clock();
	v_c1.push_back(c1_stop-c1_start);

	// =================== Phase 2: HW train start ===================
	init=1;
	
	cout<<"HW train start"<<endl;
	c2_start=clock();
	// QRD mode (BS=0)
	for(int i=0;i<train_num;i++,init&=0){
		for(int batch=0;batch<image_Batch*INPUT_WH*INPUT_WH;batch++)
			input_layer[batch] = MNIST_IMG_retrain[i*MNIST_PAD_SIZE + batch];

		golden_label = MNIST_LABEL_retrain[i];
		stage_train = 1;
		BS = 0;

		proposed_model(input_layer,Wconv1,bconv1,Wconv2,bconv2,Wconv3,bconv3,Welm,belm,beta_elm,output,golden_label,stage_train,BS,init);
	}

	// BS mode (BS=1)
	golden_label = 0;
	stage_train = 1;
	BS = 1;
	proposed_model(input_layer,Wconv1,bconv1,Wconv2,bconv2,Wconv3,bconv3,Welm,belm,beta_elm,output,golden_label,stage_train,BS,init);

	cout<<"HW train completed"<<endl<<"------------------------------------------------------------------"<<endl;
	c2_stop=clock();
	v_c2.push_back(c2_stop-c2_start);

	// =================== Phase 3: HW re-test start ===================
	vector<double> retest_result_hw;
	double retest_accuracy_hw;
	init=1;

	cout<<"HW re-test start"<<endl;
	c3_start=clock();
	for(int i=0;i<test_num;i++,init&=0){
		for(int batch=0;batch<image_Batch*INPUT_WH*INPUT_WH;batch++)
			input_layer[batch] = MNIST_IMG[i*MNIST_PAD_SIZE + batch];
		
		golden_label = 0;
		stage_train = 0;
		BS = 0;

		proposed_model(input_layer,Wconv1,bconv1,Wconv2,bconv2,Wconv3,bconv3,Welm,belm,beta_elm,output,golden_label,stage_train,BS,init);

		retest_result_hw.push_back(equal(MNIST_LABEL[i],argmax(output)));

	}

	// accuracy estimation
	retest_accuracy_hw = 1.0*accumulate(retest_result_hw.begin(),retest_result_hw.end(),0.0);

	cout<<"accuracy : "<<retest_accuracy_hw<<"/"<<retest_result_hw.size()<<" ("<<(retest_accuracy_hw/retest_result_hw.size())*100.0<<"%) "<<endl;
	cout<<"HW re-test completed"<<endl<<"------------------------------------------------------------------"<<endl;
	c3_stop=clock();
	v_c3.push_back(c3_stop-c3_start);

	///////////////////////////////// Free Memory /////////////////////////////////////////
	free(input_layer);
	free(hconv1);
	free(hconv1_sw);
	free(hconv2);
	free(hconv3);
	free(pool1);
	free(pool2);
	free(hfc1);
	free(output);
	free(Wconv1);
	free(Wconv2);
	free(Wconv3);
	free(bconv1);
	free(bconv2);
	free(bconv3);
	free(Welm);
	free(belm);
	free(beta_elm);
	free(MNIST_IMG);
	free(MNIST_LABEL);

	end_point = clock();
	
	///////////////////////////////// Print Execution Time/////////////////////////////////////////
	double c1_exetime,c2_exetime,c3_exetime;
	c1_exetime = (double)accumulate(v_c1.begin(),v_c1.end(),0.0)/(CLOCKS_PER_SEC);
	c2_exetime = (double)accumulate(v_c2.begin(),v_c2.end(),0.0)/(CLOCKS_PER_SEC);
	c3_exetime = (double)accumulate(v_c3.begin(),v_c3.end(),0.0)/(CLOCKS_PER_SEC);

	cout<<"Total execution time : "
	<<(double)(end_point-start_point)/CLOCKS_PER_SEC<< " seconds\n"
	<<"Test time : "<<c1_exetime<<" seconds\n"
	<<"Train time : "<<c2_exetime<<" seconds\n"
	<<"Re-test time : "<<c3_exetime<<" seconds\n";

	return 0;

}

