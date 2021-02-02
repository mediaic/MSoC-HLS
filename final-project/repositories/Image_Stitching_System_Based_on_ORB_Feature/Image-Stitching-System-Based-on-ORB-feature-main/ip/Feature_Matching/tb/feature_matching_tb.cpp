#include <iostream>
#include <bitset>
#include <fstream>
#include "feature_matching.h"
using namespace std;

static const int Descriptor_1[1000][10] = {
	#include "Descriptor.h"
};

static const int Descriptor_2[1000][10] = {
	#include "Descriptor_1.h"
};

static const int Descriptor_3[1000][10] = {
	#include "Descriptor_2.h"
};

static const unsigned int Descriptor_4[1000][10] = {
	#include "Descriptor_4.h"
};

static const unsigned int Descriptor_5[1000][10] = {
	#include "Descriptor_5.h"
};

static const unsigned int Descriptor_6[1000][10] = {
	#include "Descriptor_6.h"
};
int main(){


	ap_uint<10> in1 = 553;
	ap_uint<10> in2 = 772;
	ap_uint<10> in3 = 572;
	hls::stream<ap_axiu<32,1,1,1> > strmInput1, strmInput2;
	hls::stream<ap_axiu<32,1,1,1> > strmOutput;
	int cnt = 0;
	ap_axiu<32,1,1,1> des_1, des_2, match;
	ap_uint<16> match_matrix[4];

	des_1.data = 0;
	des_1.keep = 1;
	des_1.strb = 0;
	des_1.user = 0;
	des_1.last = 0;
	des_1.id = 0;
	des_1.dest = 0;

	des_2.data = 0;
	des_2.keep = 1;
	des_2.strb = 0;
	des_2.user = 0;
	des_2.last = 0;
	des_2.id = 0;
	des_2.dest = 0;



	cout << ">> Start test!" << endl;


	for(int i = 0; i < 1000; ++i) {
	        for(int j = 0; j < 10; ++j) {
//	        	if(i < in1) des_1.data = Descriptor_1[i][j];
//	        	else des_1.data = 0;
//
//	        	if(i < in2) des_2.data = Descriptor_2[i][j];
//	        	else des_2.data = 0;
	        	des_1.data = Descriptor_2[i][j];
	        	des_2.data = Descriptor_3[i][j];
	            strmInput1.write(des_1);
	            strmInput2.write(des_2);
	        }
	    }

	feature_matching(strmInput1, strmInput2, strmOutput);

//	for(int l = 0; l < 10; l++){
	while(!strmOutput.empty()) {
		for(int k = 0; k < 2; k++){
			match = strmOutput.read();
			match_matrix[k<<1] = match.data.range(31,16);
			match_matrix[(k<<1) + 1] = match.data.range(15,0);
		}
		cout<<"X1: " << match_matrix[0] << " Y1: " << match_matrix[1] << " X2: " << match_matrix[2] << " Y2: " << match_matrix[3] <<endl;
		cnt++;
	}
	cout << ">> Test finished!" << endl;
	cout << "Total match points: " << cnt << endl;

	return 0;

}
