
#include "../common.h"
#include "ap_int.h"
//#define CONV_2_SIZE 25

float_type _tanh(float_type x){
#pragma HLS INLINE
	float_type exp2x = expf(2*x)+1;
	return (exp2x-2)/(exp2x);
}

float_type relu(float_type x){
#pragma HLS inline
	float_type c0 = 0.0;
	return x>c0 ? x : c0;
}

// Convolution Layer 1
// Function by Batch_size(1)
// Input_feature_map[1][32x32],  Conv_kernel[1][6][25], Bias[16], Output_feature_map[6][28x28]
void CONVOLUTION_LAYER_1_HW(const float_type input_feature[image_Batch*CONV_1_INPUT_WH*CONV_1_INPUT_WH],
		const float_type weights[6*5*5],
		const float_type bias[6],
		float_type output_feature[image_Batch*6*CONV_1_OUTPUT_WH*CONV_1_OUTPUT_WH], int init
		)
{

	float_type IBRAM[image_Batch][CONV_1_INPUT_WH][CONV_1_INPUT_WH];
	static float_type WBRAM[CONV_1_TYPE][5][5];
	static float_type biasBRAM[CONV_1_TYPE];
	float_type OBRAM[image_Batch][CONV_1_TYPE][CONV_1_OUTPUT_WH*CONV_1_OUTPUT_WH];
//#pragma HLS array_partition variable=WBRAM complete dim=1
//#pragma HLS array_partition variable=biasBRAM complete dim=0
//#pragma HLS array_partition variable=OBRAM complete dim=2

	copy_input_1:
	for(int batch_cnt=0;batch_cnt<image_Batch;batch_cnt++){
		copy_input_2 :
		for(int i=0;i<CONV_1_INPUT_WH;i++){
			copy_input_3 :
			for(int j=0;j<CONV_1_INPUT_WH;j++){
			#pragma HLS PIPELINE II=1
				IBRAM[batch_cnt][i][j] = input_feature[batch_cnt*CONV_1_INPUT_WH*CONV_1_INPUT_WH+i*CONV_1_INPUT_WH + j];
			}
		}
	}

	// load weights & bias at first iteration only
	if(init){
		copy_kernel_1:
		for(int i=0;i<CONV_1_TYPE;i++){
			copy_kernel_2:
			for(int j=0;j<5;j++){
				for(int k=0;k<5;k++){
				#pragma HLS PIPELINE II=1
					WBRAM[i][j][k] = weights[i*CONV_1_SIZE+j*5+k];
				}
			}
		}

		copy_bias:
		for(int i=0;i<CONV_1_TYPE;i++){
	#pragma HLS PIPELINE II=1
			biasBRAM[i] = bias[i];
		}

	}

	//////////////////////////////////////////////////////////////////////
	//						   Convolution								//
	//////////////////////////////////////////////////////////////////////

	BATCH :
	for(int batch_cnt=0; batch_cnt<image_Batch; batch_cnt++) {
		ROW_K:
		for(int row_k=0;row_k<5;row_k++){
			COL_K:
			for(int col_k=0;col_k<5;col_k++){
				ROW :
				for (int row = 0; row < CONV_1_OUTPUT_WH; row++) {
					COL :
					for (int col = 0; col < CONV_1_OUTPUT_WH; col++) {
					#pragma HLS PIPELINE II=1
						float_type input_pixel = IBRAM[batch_cnt][row+row_k][col+col_k];
						float_type mult[6];
						#pragma HLS array_partition variable=mult complete dim=0
						D_OUT:
						for(int co=0;co<6;co++){
						#pragma HLS unroll
							mult[co] = input_pixel*WBRAM[co][row_k][col_k];
							if(row_k==0&&col_k==0)
								OBRAM[batch_cnt][co][row*CONV_1_OUTPUT_WH+col] = mult[co];
							else
								OBRAM[batch_cnt][co][row*CONV_1_OUTPUT_WH+col] += mult[co];
						}
					}
				}
			}
		}
	}

	copy_output:
	for(int i=0;i<image_Batch;i++){
		for(int j=0;j<6;j++){
			for(int k=0;k<CONV_1_OUTPUT_WH*CONV_1_OUTPUT_WH;k++){
#pragma HLS PIPELINE II=1
				output_feature[i*4704+j*784+k]=relu(OBRAM[i][j][k]+biasBRAM[j]);
			}
		}
	}
}

// Convolution Layer 2
// Function by Batch_size(1)
// Input_feature_map[6][14x14],  Conv_kernel[16][6][25], Bias[16], Output_feature_map[16][10x10]
void CONVOLUTION_LAYER_2_HW(const float_type input_feature[image_Batch*6*14*14],
		const float_type weights[6*16*5*5],
		const float_type bias[CONV_2_TYPE],
		float_type output_feature[image_Batch*16*10*10], int init
		)
{
	static const int C2_N_PE = 2;

	float_type IBRAM[image_Batch][CONV_1_TYPE][CONV_2_INPUT_WH][CONV_2_INPUT_WH];
	static float_type WBRAM[CONV_2_TYPE][CONV_1_TYPE][CONV_2_WH*CONV_2_WH];
	static float_type biasBRAM[CONV_2_TYPE];
	float_type OBRAM[image_Batch][CONV_2_TYPE][CONV_2_OUTPUT_SIZE];
//#pragma HLS array_partition variable=IBRAM complete dim=2
//#pragma HLS array_partition variable=WBRAM complete dim=2
//#pragma HLS array_partition variable=WBRAM cyclic factor=C2_N_PE dim=1
//#pragma HLS array_partition variable=biasBRAM complete dim=0
//#pragma HLS array_partition variable=OBRAM cyclic factor=C2_N_PE dim=2

	copy_input_1:
	for(int batch=0;batch<image_Batch;batch++){
		copy_input_2:
		for(int j=0;j<CONV_1_TYPE;j++){
			copy_input_3:
			for(int k=0;k<CONV_2_INPUT_WH;k++){
				copy_input_4:
				for(int l=0;l<CONV_2_INPUT_WH;l++){
#pragma HLS pipeline II=1
					IBRAM[batch][j][k][l] = input_feature[batch*CONV_1_TYPE*CONV_2_INPUT_WH*CONV_2_INPUT_WH
													  + j*CONV_2_INPUT_WH*CONV_2_INPUT_WH
													  + k*CONV_2_INPUT_WH
													  +l];
				}
			}
		}
	}

	if(init){
		copy_kernel_1 :
		for (int i = 0; i < CONV_2_TYPE; i++) {
			copy_kernel_2 :
			for(int j=0;j<CONV_1_TYPE;j++){
				copy_kernel_3 :
				for(int k=0;k<25;k++){
					//copy_kernel_4 :
					//for(int l=0;l<CONV_2_WH;l++){
					#pragma HLS pipeline II=1
						WBRAM[i][j][k] = weights[i*CONV_1_TYPE*CONV_2_SIZE
													 + j*CONV_2_SIZE
													 + k];
					//}
				}
			}
		}

		copy_bias:
		for(int i=0;i<CONV_2_TYPE;i++){
		#pragma HLS pipeline II=1
			biasBRAM[i] = bias[i];
		}
	}
	//////////////////////////////////////////////////////////////////////
	//						   Convolution								//
	//////////////////////////////////////////////////////////////////////
	BATCH :
	for (int batch_cnt = 0; batch_cnt < image_Batch; batch_cnt++) {
		ROW_K:
		for(int row_k = 0;row_k<5;row_k++){
			COL_K:
			for(int col_k=0;col_k<5;col_k++){
				ROW :
				for (int row = 0; row < CONV_2_OUTPUT_WH; row++) {
					COL	 :
					for (int col = 0; col < CONV_2_OUTPUT_WH; col++) {

						DEPTH_OUT:
						for(int depth_out = 0; depth_out < CONV_2_TYPE; depth_out++){

//#pragma HLS DEPENDENCE variable=OBRAM inter false
						#pragma HLS unroll factor=C2_N_PE
						#pragma HLS pipeline II=1
							float_type mult[CONV_1_TYPE]; // multiplication
							#pragma HLS array_partition variable=mult complete dim=0
							float_type acc=0;
							DEPTH_IN:
							for (int depth_in = 0; depth_in < CONV_1_TYPE; depth_in++) {
							#pragma HLS unroll
								mult[depth_in] = IBRAM[batch_cnt][depth_in][row+row_k][col+col_k] *
													WBRAM[depth_out][depth_in][row_k*5+col_k];
								/*if(tbl[depth_in*16+depth_out]){
									mult[depth_in] = IBRAM[batch_cnt][depth_in][row+row_k][col+col_k] *
													WBRAM[depth_out][depth_in][row_k*5+col_k];
								}
								else{
									mult[depth_in] = 0;
								}*/
							}
							acc = (mult[0]+mult[1])+(mult[2]+mult[3])+(mult[4]+mult[5]);
							if(col_k==0&&row_k==0)
								OBRAM[batch_cnt][depth_out][row*10 + col] = acc;
							else
								OBRAM[batch_cnt][depth_out][row*10 + col] += acc;
						}
					}
				}
			}
		}
	}

	copy_output:
	for(int i=0;i<image_Batch;i++){
		for(int j=0;j<CONV_2_TYPE;j++){
			int depth_offset = j*100;
			for(int k=0;k<CONV_2_OUTPUT_SIZE;k++){
#pragma HLS pipeline II=1
				output_feature[i*1600+depth_offset+k]=relu(OBRAM[i][j][k]+biasBRAM[j]);
			}
		}
	}
}


// Convolution Layer 3 (FC)
// Function by Batch_size(10)
// Input_feature_map[16][5x5],  Conv_kernel[128][16][5x5], Bias[128], Output_feature_map[128][1x1]
void CONVOLUTION_LAYER_3_HW(const float_type input_feature[image_Batch*16*5*5],
		const float_type weights[16*128*5*5],
		const float_type bias[128],
		float_type output_feature[image_Batch*128], int init
		)
{
	
	float_type IBRAM[image_Batch][CONV_2_TYPE][CONV_3_INPUT_WH][CONV_3_INPUT_WH];
	static float_type WBRAM[CONV_3_TYPE][CONV_2_TYPE][CONV_3_WH*CONV_3_WH];
//#pragma HLS array_partition variable=IBRAM complete dim=2
//#pragma HLS array_partition variable=WBRAM complete dim=2


	static float_type biasBRAM[CONV_3_TYPE];
	float_type OBRAM[image_Batch][CONV_3_TYPE];

	copy_input_1:
	for(int batch=0; batch<image_Batch; batch++){
		copy_input_2:
		for(int i=0; i<CONV_2_TYPE; i++){
			copy_input_3:
			for(int j=0;j<CONV_3_INPUT_WH;j++){
				for(int k=0;k<CONV_3_INPUT_WH;k++){
#pragma HLS pipeline
					IBRAM[batch][i][j][k] = input_feature[batch*CONV_2_TYPE*CONV_3_INPUT_SIZE + i*CONV_3_INPUT_SIZE + j*CONV_3_INPUT_WH+k];
				}

			}
		}
	}
	if(init){
		copy_kernel_1:
		for(int i=0;i<CONV_3_TYPE;i++){
			for(int j=0;j<CONV_2_TYPE; j++){
				for(int k=0;k<25; k++){
					//for(int l=0;l<CONV_3_WH;l++){
					#pragma HLS pipeline
						WBRAM[i][j][k] = weights[i*CONV_2_TYPE*CONV_3_SIZE + j*25 + k];
					//}
				}
			}
		}

		copy_bias:
		for(int i=0;i<128; i++){
		#pragma HLS pipeline II=1
			biasBRAM[i] = bias[i];
		}
	}
	BATCH:
	for (int batch_cnt = 0; batch_cnt<image_Batch; batch_cnt++) {
		ROW_K:
		for(int row_k=0;row_k<5;row_k++){
			for(int col_k=0;col_k<5;col_k++){
				D_OUT:
				for(int co=0;co<128;co++){
				#pragma HLS pipeline II=1
					float_type mult[16];
					#pragma HLS array_partition variable=mult complete dim=0
					float_type acc[4];
					#pragma HLS array_partition variable=acc complete dim=0
					float_type result=0;
						D_IN:
					for(int ci=0;ci<16;ci++){
					#pragma HLS unroll
						mult[ci] = IBRAM[batch_cnt][ci][row_k][col_k]*WBRAM[co][ci][row_k*5+col_k];
					}
					for(int i=0,ii=0;i<4;i++,ii+=4){
					#pragma HLS unroll
						acc[i] = (mult[ii]+mult[ii+1])+(mult[ii+2]+mult[ii+3]);
					}
					result = (acc[0]+acc[1])+(acc[2]+acc[3]);
					if(col_k==0&&row_k==0)
						OBRAM[batch_cnt][co]=result;
					else
						OBRAM[batch_cnt][co]+=result;
				}
			}
		}
	}

	for(int i=0;i<image_Batch;i++){
		for(int j=0;j<128;j++)
#pragma HLS pipeline II=1
		output_feature[i*128+j] = (OBRAM[i][j]+biasBRAM[j]);
	}
}

