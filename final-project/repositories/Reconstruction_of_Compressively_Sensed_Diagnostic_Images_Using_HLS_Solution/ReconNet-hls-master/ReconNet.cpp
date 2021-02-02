#include <hls_video.h>

#include "ap_fixed.h"
#include "weights.h"
#include <iostream>
#include  "hls_video.h"
#include <stdlib.h>
#include "hls_half.h"
typedef half data_type;
using namespace std;

// typedef ap_fixed<16, 4> data_type;
typedef half data_type;
// typedef float data_type;

// #define IMAGE_SIZE 33
// #define IMAGE_CHANNELS 1
// #define VIDEO_COLS 1920
// #define VIDEO_ROWS 1080
#define VIDEO_COLS 256
#define VIDEO_ROWS 256
#define WORD_LEN 32
#define PATCH_SIZES 33
#define PATCH_COLS 8
#define PATCH_ROWS 8
// #define PATCH_SIZES 16
// #define PATCH_COLS 16
// #define PATCH_ROWS 16
// typedef ap_axiu<32,1,1,1> STREAM_IN_TYPE;

class half_axi{
	public:
	data_type data;
	bool last;
	bool user;
};

typedef half_axi STREAM_IN_TYPE;

void check_read(hls::stream<data_type> &in, data_type& out_val){
    // while(true){
    //     if(in.empty() == 0){
            in >> out_val;
    //         break;
    //     }
    // }
}

void show_stream(hls::stream<data_type> &in, int size, int channel){
	for(int x = 0 ; x < size ; x++){
		for(int y = 0 ; y < size ; y++){
			for(int n_channel = 0 ; n_channel < channel ; n_channel++){
				data_type temp;
				check_read(in, temp);
				cout << temp << " ";
			}
			cout << '\n';
		}
	}
	assert(0);
}
void show_weight(data_type a[][11][1][64], int first, int second, int third, int fourth){
	cout<< "come in show_weight function!!!!!!!!"<<endl;
	cout.precision(17);
	for(int i = 0 ; i < first ; i++){
		for(int j = 0 ; j < second ; j++){
			for(int k = 0; k < third; k++){
				for(int l = 0; l < fourth; l++){
					cout<<a[i][j][k][l]<<endl;
				}
			}
			cout << '\n';
		}
	}
	assert(0);
}
void show_bias(data_type a[], int first){
	cout<< "come in show_bias function!!!!!!!!"<<endl;
	// cout.precision(17);
	for(int i = 0 ; i < first ; i++){
		cout<< a[i]<<endl;
	}
	assert(0);
}
data_type relu(data_type a){
    #pragma HLS inline
	return a > (data_type)0 ? a : (data_type)0;
}

template<int INPUT_SIZE, int INPUT_CHANNELS, int KERNEL_SIZE, int FILTERS, int STRIDE>
void conv_layer(hls::stream<data_type> &out, hls::stream<data_type> &in,
		data_type weight[KERNEL_SIZE][KERNEL_SIZE][INPUT_CHANNELS][FILTERS],
		data_type bias[FILTERS]) {
	int i, j, k, filter;
	data_type sum, placeholder;
	int row_offset, col_offset, channel_offset;
	hls::LineBuffer<INPUT_SIZE * (KERNEL_SIZE -1) + KERNEL_SIZE , INPUT_CHANNELS, data_type> conv_buff;
	// hls::LineBuffer<INPUT_SIZE * INPUT_CHANNELS * (KERNEL_SIZE -1) + KERNEL_SIZE * INPUT_CHANNELS, 1, data_type> conv_buff;

	// for(i = 0 ; i < INPUT_SIZE * INPUT_CHANNELS * (KERNEL_SIZE -1) + KERNEL_SIZE * INPUT_CHANNELS; i++) {
    //     check_read(in, placeholder);
    //     conv_buff.shift_up(0);
    //     conv_buff.insert_top(placeholder, 0);
	// }
	for(i = 0 ; i < INPUT_SIZE * (KERNEL_SIZE -1) + KERNEL_SIZE ; i++) {
		for(int p = 0 ; p < INPUT_CHANNELS ;  p++){
			check_read(in, placeholder);
			conv_buff.shift_up(p);
			conv_buff.insert_top(placeholder, p);
		}
	}

	for (i = 0 ; i < (INPUT_SIZE - KERNEL_SIZE + 1); i += STRIDE)
		for (j = 0 ; j < (INPUT_SIZE - KERNEL_SIZE + 1); j += STRIDE){
			for (filter = 0 ; filter < FILTERS ; filter++) {
				sum = 0;
				for (row_offset = 0 ; row_offset < KERNEL_SIZE; row_offset++)
					for (col_offset = 0 ; col_offset < KERNEL_SIZE; col_offset++)
						for (channel_offset = 0 ; channel_offset < INPUT_CHANNELS ; channel_offset++) {
							#pragma HLS pipeline II=1
							int t1, t2;
							static data_type val1, val2;
							// t1 = row_offset * INPUT_SIZE * INPUT_CHANNELS;
							// t2 = col_offset * INPUT_CHANNELS;
							// val1 = conv_buff.getval(t1 + t2 + channel_offset, 0);
							t1 = row_offset * INPUT_SIZE;
							t2 = col_offset;
							val1 = conv_buff.getval(t1 + t2, channel_offset);
							val2 = weight[row_offset][col_offset][channel_offset][filter];
							sum += val1 * val2;
                            // cout << "(" << row_offset << "," << col_offset << "," << channel_offset << "," << filter << ") >> (" << val1 << "," << val2 << ")" << endl;
						}
                // cout << sum << endl;
				out << relu(sum + bias[filter]);
                // assert(0);
			}


			if ((j + STRIDE < (INPUT_SIZE - KERNEL_SIZE + 1))) {
				for (int p = 0 ; p < INPUT_CHANNELS ; p++){
					check_read(in, placeholder);
					// conv_buff.shift_up(0);
					// conv_buff.insert_top(placeholder, 0);
					conv_buff.shift_up(p);
					conv_buff.insert_top(placeholder, p);
				}
			} 
			else if ((i + STRIDE < (INPUT_SIZE - KERNEL_SIZE + 1)) && (j + STRIDE >= (INPUT_SIZE - KERNEL_SIZE + 1))){
				// for (int p = 0 ; p < KERNEL_SIZE * INPUT_CHANNELS ; p++){
				// 	check_read(in, placeholder);
				// 	conv_buff.shift_up(0);
				// 	conv_buff.insert_top(placeholder, 0);
				// }
				for (int k = 0 ; k < KERNEL_SIZE ; k++){
					for (int p = 0 ; p < INPUT_CHANNELS ; p++){
						check_read(in, placeholder);
						conv_buff.shift_up(p);
						conv_buff.insert_top(placeholder, p);
					}
				}
			}
		}
	cout << "CONV DONE" << endl;
}

template<int PAD_SIZE, int CHANNELS, int PATCH_SIZE>
void pad_layer(hls::stream<data_type> &out, hls::stream<data_type> &in){
	for(int x = -PAD_SIZE ; x < PATCH_SIZE+PAD_SIZE ; x++){
		for(int y = -PAD_SIZE ; y < PATCH_SIZE+PAD_SIZE ; y++){
			for(int n_channel = 0 ; n_channel < CHANNELS ; n_channel++){
				data_type temp;
				if(x < 0 || x >= PATCH_SIZE || y < 0 || y >= PATCH_SIZE)
					temp = (data_type)0;
				else
					check_read(in, temp);
				out << temp;
			}
		}
	}
	cout << "PAD DONE" << endl;
}


template<int W, int IMAGE_ROWS, int IMAGE_COLS, int T, int PATCH_SIZE>
void myAXIvideo2Mat(hls::stream<STREAM_IN_TYPE >& AXI_video_strm,
                 hls::stream<data_type> img_in_stream_ary[8])
{
    STREAM_IN_TYPE axi;
    data_type pix;
//     bool sof = 0;
//  loop_wait_for_start: while (!sof) {
// #pragma HLS pipeline II=1
// #pragma HLS loop_tripcount avg=0 max=0
//         AXI_video_strm >> axi;
//         sof = axi.user.to_int();
//     }
	for (HLS_SIZE_T i = 0; i < PATCH_SIZE*PATCH_COLS; i++) {
        bool eol = 0;
		for (HLS_SIZE_T j = 0; j < PATCH_SIZE*PATCH_ROWS; j++) {
			#pragma HLS loop_flatten off
			#pragma HLS pipeline II=1
            // if (sof || eol) {
            //     sof = 0;
            //     eol = axi.last.to_int();
            // } 
            // else {
                // If we didn't reach EOL, then read the next pixel
                // AXI_video_strm >> axi;
                // eol = axi.last.to_int();
                // bool user = axi.user.to_int();
                // if(user) {
                // }
            // }
			if(i >= IMAGE_ROWS || j >= IMAGE_COLS)
				pix = 0;
			else{
				AXI_video_strm >> axi;
				pix = axi.data;
				// hls::AXIGetBitFields(axi, 0, 8, pix);
			}
			int img_num = j/PATCH_SIZE;
			data_type out_pix = pix;
			// out_pix = out_pix / 255;
			out_pix = out_pix / 255;
			// cout << pix << endl;
			// cout << out_pix << endl;
			// assert(0);
            int test = pix;
            img_in_stream_ary[img_num] << out_pix;
        }
//    loop_wait_for_eol: while (!eol) {
//#pragma HLS pipeline II=1
//#pragma HLS loop_tripcount avg=0 max=0
//            // Keep reading until we get to EOL
//            AXI_video_strm >> axi;
//            eol = axi.last.to_int();
//        }
    }
	// assert(0);
}

template<int W, int IMAGE_ROWS, int IMAGE_COLS, int T, int PATCH_SIZE>
void myMat2AXIvideo(hls::stream<STREAM_IN_TYPE >& AXI_video_strm,
				 hls::stream<data_type> img_out_stream_ary[8])
{
    STREAM_IN_TYPE axi;
    bool sof = 1;
	for (HLS_SIZE_T i = 0; i < PATCH_SIZE*PATCH_COLS; i++) {
    	for (HLS_SIZE_T j = 0; j < PATCH_SIZE*PATCH_ROWS; j++) {
			#pragma HLS loop_flatten off
			#pragma HLS pipeline II=1
            if (sof) {
                axi.user = 1;
                sof = 0;
            } else {
                axi.user = 0;
            }
            if (j == (IMAGE_COLS-1) && i == (IMAGE_ROWS-1)) {
                axi.last = 1;
            } else {
                axi.last = 0;
            }
			int img_num = j/PATCH_SIZE;
			data_type in_pix;
            img_out_stream_ary[img_num] >> in_pix;
            // cout << in_pix << endl;
				
			if(i < IMAGE_ROWS && j < IMAGE_COLS){
				// unsigned char pix = in_pix * 255;
				data_type pix = in_pix * 255;
				axi.data = pix;
                // for(int k = 0 ; k < 3 ; k++)
				//     hls::AXISetBitFields(axi, k*8, 8, pix);
				// axi.keep = -1;
				AXI_video_strm << axi;
			}
        }
        // assert(0);
    }
}

// void select_stream_in(hls::stream<data_type> img_in_stream_ary[PATCH_COLS], hls::stream<data_type> img_in_stream){
	// data_type pix;
            // for(int i = 0 ; i < 33*33 ; i++){
            //         img_in_stream_ary[n_stream] >> pix;
            //         // cout << pix << endl;
            //         img_in_stream << pix;
            // }
    
// }

// void select_stream_out(hls::stream<data_type> img_out_stream_ary[PATCH_COLS], hls::stream<data_type> img_out_stream){
	// data_type pix;
            // for(int i = 0 ; i < 33*33 ; i++){
            //         img_out_stream >> pix;
            //         // cout << pix << endl;
            //         img_out_stream_ary[n_stream] << pix;
            // }
    
// }

void ReconNet_patch(hls::stream<data_type> img_in_stream_ary[PATCH_COLS], hls::stream<data_type> img_out_stream_ary[PATCH_COLS]){
	data_type pix;

	hls::stream<data_type> conv1_out;
	hls::stream<data_type> conv2_out;
	hls::stream<data_type> conv3_out;
	hls::stream<data_type> conv4_out;
	hls::stream<data_type> conv5_out;
    hls::stream<data_type> img_pad_out;
	hls::stream<data_type> conv2_pad_out;
	hls::stream<data_type> conv3_pad_out;
	hls::stream<data_type> conv5_pad_out;

    #pragma HLS STREAM variable=conv1_out depth=40
    #pragma HLS STREAM variable=conv2_out depth=40
    #pragma HLS STREAM variable=conv3_out depth=40
    #pragma HLS STREAM variable=conv4_out depth=40
    #pragma HLS STREAM variable=conv5_out depth=40
    #pragma HLS STREAM variable=img_pad_out depth=40
	#pragma HLS STREAM variable=conv2_pad_out depth=40
	#pragma HLS STREAM variable=conv3_pad_out depth=40
	#pragma HLS STREAM variable=conv5_pad_out depth=40

	// hls::stream<data_type> img_in_stream;
	// hls::stream<data_type> img_out_stream;
    for(int n_stream_row = 0 ; n_stream_row < PATCH_ROWS ; n_stream_row++){
	    for(int n_stream = 0 ; n_stream < PATCH_COLS ; n_stream++){
            // for(int i = 0 ; i < 33*33 ; i++){
            //         img_in_stream_ary[n_stream] >> pix;
            //         // cout << pix << endl;
            //         img_in_stream << pix;
            // }
        // }
    // }
            // show_stream(img_in_stream,33, 1);
	        // assert(0);
            // #pragma dataflow
			// template<int INPUT_SIZE, int INPUT_CHANNELS, int KERNEL_SIZE, int FILTERS, int STRIDE>
            pad_layer<5,1,PATCH_SIZES>(img_pad_out, img_in_stream_ary[n_stream]);
            conv_layer<PATCH_SIZES+10, 1, 11, 64, 1>(conv1_out, img_pad_out, kernel1_weight, kernel1_bias);
            // show_stream(conv1_out,33, 64);

            conv_layer<PATCH_SIZES, 64, 1, 32, 1>(conv2_out, conv1_out, kernel2_weight, kernel2_bias);
            pad_layer<3,32,PATCH_SIZES>(conv2_pad_out, conv2_out);
            conv_layer<PATCH_SIZES+6, 32, 7, 1, 1>(conv3_out, conv2_pad_out, kernel3_weight, kernel3_bias);
            pad_layer<5,1,PATCH_SIZES>(conv3_pad_out, conv3_out);
            conv_layer<PATCH_SIZES+10, 1, 11, 64, 1>(conv4_out, conv3_pad_out, kernel4_weight, kernel4_bias);
            conv_layer<PATCH_SIZES, 64, 1, 32, 1>(conv5_out, conv4_out, kernel5_weight, kernel5_bias);
            pad_layer<3,32,PATCH_SIZES>(conv5_pad_out, conv5_out);
            conv_layer<PATCH_SIZES+6, 32, 7, 1, 1>(img_out_stream_ary[n_stream], conv5_pad_out, kernel6_weight, kernel6_bias);
            // show_stream(img_out_stream,33, 1);
            // assert(0);

    // for(int n_stream_row = 0 ; n_stream_row < 8 ; n_stream_row++){
        // for(int n_stream = 0 ; n_stream < 8 ; n_stream++){
            // for(int i = 0 ; i < 33*33 ; i++){
            //         img_out_stream_ary[n_stream] >> pix;
            //         cout << pix << endl;
            //         // img_out_stream_ary[n_stream] << pix;
            // }
            // assert(0);
            cout << "PATCH (" << n_stream_row << "," << n_stream << ") DONE\n";
        }
    }

}

void ReconNet(hls::stream<STREAM_IN_TYPE>& AXI_video_stream_in,
            hls::stream<STREAM_IN_TYPE >& AXI_video_stream_out
         ){
// void ReconNet(hls::stream<data_type> &img_in_stream,
//             hls::stream<data_type> &img_out_stream
//          ){
// 	#pragma HLS INTERFACE axis port = img_out_stream
	// #pragma HLS INTERFACE axis port = img_in_stream 
    #pragma HLS INTERFACE axis port=AXI_video_stream_in bundle=VIDEO_IN
    #pragma HLS INTERFACE axis port=AXI_video_stream_out bundle=VIDEO_OUT
	#pragma HLS INTERFACE s_axilite port=return bundle=CONTROL

    #pragma dataflow
	
    hls::stream<data_type> img_in_stream_ary[PATCH_COLS];
	hls::stream<data_type> img_out_stream_ary[PATCH_COLS];
    
    #pragma HLS STREAM variable=img_in_stream_ary[0] depth=40
    #pragma HLS STREAM variable=img_in_stream_ary[1] depth=40
    #pragma HLS STREAM variable=img_in_stream_ary[2] depth=40
    #pragma HLS STREAM variable=img_in_stream_ary[3] depth=40
    #pragma HLS STREAM variable=img_in_stream_ary[4] depth=40
    #pragma HLS STREAM variable=img_in_stream_ary[5] depth=40
    #pragma HLS STREAM variable=img_in_stream_ary[6] depth=40
    #pragma HLS STREAM variable=img_in_stream_ary[7] depth=40
    #pragma HLS STREAM variable=img_out_stream_ary[0] depth=40
    #pragma HLS STREAM variable=img_out_stream_ary[1] depth=40
    #pragma HLS STREAM variable=img_out_stream_ary[2] depth=40
    #pragma HLS STREAM variable=img_out_stream_ary[3] depth=40
    #pragma HLS STREAM variable=img_out_stream_ary[4] depth=40
    #pragma HLS STREAM variable=img_out_stream_ary[5] depth=40
    #pragma HLS STREAM variable=img_out_stream_ary[6] depth=40
    #pragma HLS STREAM variable=img_out_stream_ary[7] depth=40

    // Start image streaming
	// template<int INPUT_SIZE, int INPUT_CHANNELS, int KERNEL_SIZE, int FILTERS, int STRIDE>
	// hls::Mat<33, 33, HLS_8UC1> img_test;
	myAXIvideo2Mat<WORD_LEN,VIDEO_ROWS,VIDEO_COLS,HLS_8UC1,PATCH_SIZES>(AXI_video_stream_in, img_in_stream_ary);

    ReconNet_patch(img_in_stream_ary, img_out_stream_ary);
	// int tp;
	// for(int n_pixel = 0 ; n_pixel < 34; n_pixel++){
	// 	img_in_stream[0] >> pix;
	// 	for(int i = 0 ; i < 3 ; i++){
	// 		// tp = pixel.val[i];
	// 		cout << pix << ", ";
	// 	}
	// 	cout << '\n';
	// }
	
	myMat2AXIvideo<WORD_LEN,VIDEO_ROWS,VIDEO_COLS,HLS_8UC1,PATCH_SIZES>(AXI_video_stream_out, img_out_stream_ary);
}
