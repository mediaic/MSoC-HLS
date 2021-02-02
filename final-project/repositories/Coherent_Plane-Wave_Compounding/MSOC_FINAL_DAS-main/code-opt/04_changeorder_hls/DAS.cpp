/************************************  Header Section  *********************************************
 --
 -- NAME       : PYNQ z1
 -- Data       : sep, 2018

 -- Filename   : sobel_hls.cpp
 -- Description: Sobel Filter HLS Synthesis Code
 --
*********************************** End Header Section  *********************************************/


#include<stdio.h>
#include"DAS.h"

void IIR_pipe(fp_IQ_acc signal_real, fp_IQ_acc signal_imag ,fp_IQ_acc* IIR_buffer_real, fp_IQ_acc* IIR_buffer_imag, int x_pos)
{
#pragma HLS PIPELINE
	const ap_fixed<18,1> a1[] = {1, 1.74642545895625, -0.820532246091997};
	const ap_fixed<18,1> a2[] = {1, 1.49404376234649, -0.567942558232872};
	const ap_fixed<18,1> b1[] = {1, -1.55971254233345, 1};
	const ap_fixed<18,1> b2[] = {1, -0.324370246269386, 1};
	const ap_fixed<18,1> scalevalue[] = {0.168314554151745, 0.0441021029388226, 1};

	static fp_IQ_acc delay_1_1_real_r = 0;
	static fp_IQ_acc delay_1_2_real_r = 0;
	static fp_IQ_acc delay_2_1_real_r = 0;
	static fp_IQ_acc delay_2_2_real_r = 0;
	fp_IQ_acc delay_1_1_real_w, delay_1_2_real_w, delay_2_1_real_w, delay_2_2_real_w;
	static fp_IQ_acc delay_1_1_imag_r = 0;
	static fp_IQ_acc delay_1_2_imag_r = 0;
	static fp_IQ_acc delay_2_1_imag_r = 0;
	static fp_IQ_acc delay_2_2_imag_r = 0;
	fp_IQ_acc delay_1_1_imag_w, delay_1_2_imag_w, delay_2_1_imag_w, delay_2_2_imag_w;

	static int x_pos_record = 0;

	if (x_pos_record != x_pos) {
		delay_1_1_real_r = 0, delay_1_2_real_r = 0, delay_2_1_real_r = 0, delay_2_2_real_r = 0;
		delay_1_1_imag_r = 0, delay_1_2_imag_r = 0, delay_2_1_imag_r = 0, delay_2_2_imag_r = 0;
	}
	x_pos_record = x_pos;

		delay_1_1_real_w = a1[2]*delay_1_2_real_r + a1[1]*delay_1_1_real_r + signal_real*scalevalue[0];
		delay_1_2_real_w = delay_1_1_real_r;
		delay_2_1_real_w = scalevalue[1]*(delay_1_1_real_w*b1[0] + delay_1_1_real_r*b1[1] + delay_1_2_real_r*b1[2]) + delay_2_1_real_r*a2[1] + delay_2_2_real_r*a2[2];
		delay_2_2_real_w = delay_2_1_real_r;
		*IIR_buffer_real = scalevalue[2]*(delay_2_1_real_w*b2[0] + delay_2_1_real_r*b2[1] + delay_2_2_real_r*b2[2]);
		delay_1_1_real_r = delay_1_1_real_w;
		delay_1_2_real_r = delay_1_2_real_w;
		delay_2_1_real_r = delay_2_1_real_w;
		delay_2_2_real_r = delay_2_2_real_w;


		delay_1_1_imag_w = a1[2]*delay_1_2_imag_r + a1[1]*delay_1_1_imag_r + signal_imag*scalevalue[0];
		delay_1_2_imag_w = delay_1_1_imag_r;
		delay_2_1_imag_w = scalevalue[1]*(delay_1_1_imag_w*b1[0] + delay_1_1_imag_r*b1[1] + delay_1_2_imag_r*b1[2]) + delay_2_1_imag_r*a2[1] + delay_2_2_imag_r*a2[2];
		delay_2_2_imag_w = delay_2_1_imag_r;
		*IIR_buffer_imag = scalevalue[2]*(delay_2_1_imag_w*b2[0] + delay_2_1_imag_r*b2[1] + delay_2_2_imag_r*b2[2]);

		delay_1_1_imag_r = delay_1_1_imag_w;
		delay_1_2_imag_r = delay_1_2_imag_w;
		delay_2_1_imag_r = delay_2_1_imag_w;
		delay_2_2_imag_r = delay_2_2_imag_w;

}

void calculateX(int pw, int x_pos, float* tx_dis_x_sample,  float* rx_dis_x_sample, float* extended_apod_func_x)
{
	ap_fixed<18,1> x_mm;
	ap_fixed<18,1> ang_aper;
	float tx_dis_x_sample_temp;
	int rx_ch;

	const char angle_pos_neg[] = { 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
	const ap_fixed<18,1> array_ele_coordinate_valid[] = {0.0048, 0.0051, 0.0054, 0.0057, 0.0060, 0.0063,
			                                    0.0066, 0.0069, 0.0072, 0.0075, 0.0078, 0.0081,
												0.0084, 0.0087, 0.0090, 0.0093, 0.0096, 0.0099,
												0.0102, 0.0105, 0.0108, 0.0111, 0.0114, 0.0117,
												0.0120, 0.0123, 0.0126, 0.0129, 0.0132, 0.0135,
												0.0138, 0.0141};
	const ap_fixed<18,1> sin_coff[] = {0, -0.136786253477028, -0.125481597930223, -0.114100274271681, -0.102621676452465, -0.0913473393857043,
			                     -0.0799901467361129, -0.0685141242351174, -0.0568528556550848, -0.0455424933836933, -0.0340489612367333,
								 -0.0234358906193355, -0.0110483748673595, 0.0110483748673595, 0.0234358906193355, 0.0340489612367333,
								 0.0455424933836933, 0.0568528556550848, 0.0685141242351174, 0.0799901467361129, 0.0913473393857043,
								 0.102621676452465, 0.114100274271681, 0.125481597930223, 0.136786253477028};
	const int con_dis_sample = 32468;
	const ap_fixed<18,1> aper_size = 0.0189;

	const ap_fixed<18,1> c_0_0003 = 0.0003;
	const ap_fixed<18,1> c_0_0045 = 0.0045;
	const ap_fixed<18,5> c_19_4805 = 19.4805;


	x_mm = c_0_0045 + c_0_0003*(x_pos+8);
	if (angle_pos_neg[pw] == 1)
	{
		ang_aper = aper_size;
	}
	else
	{
		ang_aper = 0;
	}

	tx_dis_x_sample_temp = (x_mm - ang_aper)*sin_coff[pw];
	*tx_dis_x_sample = tx_dis_x_sample_temp*con_dis_sample;

	for (rx_ch = 0; rx_ch < ch_amount; rx_ch++)
	{
		rx_dis_x_sample[rx_ch] = POWER((array_ele_coordinate_valid[rx_ch]-x_mm)*con_dis_sample);
		extended_apod_func_x[rx_ch] = (rx_ch - (x_pos+7))*c_19_4805;
	}


}
void calculateZ(int pw, int depth, float* tx_dis_z_sample,  float* rx_dis_z_sample, float* z_th)
{
	ap_fixed<2,1> c_0_5 = 0.5;
	float z_sample;
	const float cos_coff[] = {1, 0.990600585937500, 0.992095947265625,	0.993469238281250, 0.994720458984375, 0.995819091796875,
			                  0.996795654296875, 0.997650146484375, 0.998382568359375, 0.998962402343750, 0.999420166015625,
							  0.999725341796875, 0.999938964843750, 0.999938964843750, 0.999725341796875, 0.999420166015625,
							  0.998962402343750, 0.998382568359375, 0.997650146484375, 0.996795654296875, 0.995819091796875,
							  0.994720458984375, 0.993469238281250, 0.992095947265625, 0.990600585937500};
	const float c_0_57143 = 0.57143;

	z_sample = depth*c_0_5;
	*tx_dis_z_sample = z_sample*cos_coff[pw];
	*rx_dis_z_sample = POWER(z_sample);
	*z_th = z_sample*c_0_57143;
}

void calculateSnapShotSum(float tx_sample, fp_echo echo_block_buffer[Datalength_core][ch_amount], float* rx_dis_x_sample, float* rx_dis_z_sample,
		                  float z_th, float* extended_apod_func_x, float* snapshot_sum)
{
	float snapshot[ch_amount];
    int rx_ch;
    float rx_sample[ch_amount];
    float delay_sample[ch_amount];

	for (rx_ch = 0; rx_ch < ch_amount; rx_ch++)
	{
	//#pragma HLS PIPELINE

		rx_sample[rx_ch] = sqrt(*rx_dis_z_sample + rx_dis_x_sample[rx_ch]);
		delay_sample[rx_ch] = (tx_sample + rx_sample[rx_ch]);

		if (delay_sample[rx_ch] > (Datalength_core-1))
		{
			delay_sample[rx_ch] = (Datalength_core-1);
		}

		snapshot[rx_ch] = echo_block_buffer[int(delay_sample[rx_ch])][rx_ch];
		/*
		if (ABS(extended_apod_func_x[rx_ch]) > z_th)
		{
			snapshot[rx_ch] = 0;
		}
        */
		*snapshot_sum = *snapshot_sum + snapshot[rx_ch];
	}
}


void DAS(hls::stream<axi_echo>* echo_block, hls::stream<axi_gray>* gray_pic, int pw)
{
#pragma HLS INLINE
#pragma HLS INTERFACE s_axilite port=pw
#pragma HLS INTERFACE axis register both port=gray_pic
#pragma HLS INTERFACE axis register both port=echo_block
#pragma HLS INTERFACE s_axilite port=return
	cfloat_t demod_coeff[7]; //define in main
	demod_coeff[0].real = 1;
	demod_coeff[0].imag = 0;
	demod_coeff[1].real = 0.623489801858734;
    demod_coeff[1].imag = -0.781831482468030;
    demod_coeff[2].real = -0.222520933956314;
    demod_coeff[2].imag = -0.974927912181824;
    demod_coeff[3].real = -0.900968867902419;
    demod_coeff[3].imag = -0.433883739117558;
    demod_coeff[4].real = -0.900968867902419;
    demod_coeff[4].imag = 0.433883739117558;
    demod_coeff[5].real = -0.222520933956315;
    demod_coeff[5].imag = 0.974927912181824;
    demod_coeff[6].real = 0.623489801858733;
    demod_coeff[6].imag = 0.781831482468030;

    static fp_IQ_acc IQ_acc_block_real[down_sample][ch] = {0};
    static fp_IQ_acc IQ_acc_block_imag[down_sample][ch] = {0};

    int x_pos;
    int depth;
    int depth_temp;

	float x_mm;
	float ang_aper;
	float tx_dis_x_sample;
	float tx_dis_z_sample;
	float rx_dis_x_sample[ch_amount];
	float rx_dis_z_sample;
	float extended_apod_func_x[ch_amount];
	float z_sample;
	float tx_sample;
	float snapshot_sum;
	int IIR_count;
	float z_th;

	fp_IQ_acc buffer_real;
	fp_IQ_acc buffer_imag;

	fp_IQ_acc IIR_buffer_real;
    fp_IQ_acc IIR_buffer_imag;

	fp_echo echo_block_buffer[Datalength_core][ch_amount];
	fp_echo echo_temp;

	static fp_gray gray_pic_buffer[down_sample-32][ch];

	float newton_sqrt_out;

	fp_IQ_acc IQ_acc_real;
	fp_IQ_acc IIR_real;
    fp_IQ_acc IQ_acc_imag;
    fp_IQ_acc IIR_imag;

	int gray_depth;
	int gray_col;
	int count_col;
	int block_x_pos;

	//interface
	axi_echo d_in;
	axi_gray d_out;

	float gray_real;
	float gray_imag;
	int depth_cnt;
	int block_cnt_addr;


	d_out.data = 0;
	d_out.keep = 0xF;
	d_out.strb = 0;
	d_out.user = 0;
	d_out.last = 0;
	d_out.id = 0;
	d_out.dest = 0;

	if (pw == 0)
	{

	    for (gray_col = 0; gray_col < ch; gray_col++)
	    {
	        for (gray_depth = 0; gray_depth < down_sample; gray_depth++)
	        {
	           	    IQ_acc_block_real[gray_depth][gray_col] = 0;
	           	    IQ_acc_block_imag[gray_depth][gray_col] = 0;
	        }
	    }

	}
	//read input
	for (gray_col = 0; gray_col < ch_amount; gray_col++)
    {
        for (gray_depth = 0; gray_depth < Datalength; gray_depth++)
		{
        	d_in = echo_block->read();
        	if (gray_depth<(Datalength_core))
        		echo_block_buffer[gray_depth][gray_col] = d_in.data;
        	else
        		echo_temp = d_in.data;
        	if (d_in.last) break;
		}
	}

	//processing
	for (x_pos = 1; x_pos <= 16; x_pos++)
	{
		calculateX(pw, x_pos, &tx_dis_x_sample, rx_dis_x_sample, extended_apod_func_x);

		IIR_count = 0;
		depth_cnt = 0;
		block_cnt_addr = 0;
		for (depth = 256; depth < Datalength_core; depth++)
		{
        #pragma HLS PIPELINE
			snapshot_sum = 0;

			calculateZ(pw, depth, &tx_dis_z_sample,  &rx_dis_z_sample, &z_th);
			tx_sample = tx_dis_z_sample + tx_dis_x_sample;

			calculateSnapShotSum(tx_sample, echo_block_buffer, rx_dis_x_sample, &rx_dis_z_sample,
					             z_th, extended_apod_func_x, &snapshot_sum);


			buffer_real = snapshot_sum*demod_coeff[depth_cnt].real;
			buffer_imag = snapshot_sum*demod_coeff[depth_cnt].imag;
			IIR_pipe(buffer_real, buffer_imag, &IIR_buffer_real, &IIR_buffer_imag, x_pos);

			block_x_pos = x_pos-1;
			if (IIR_count == 7){
                #pragma HLS PIPELINE
			    IQ_acc_real = IQ_acc_block_real[block_cnt_addr][block_x_pos];
			    IIR_real =  IIR_buffer_real;
			    IQ_acc_imag = IQ_acc_block_imag[block_cnt_addr][block_x_pos];
			    IIR_imag =  IIR_buffer_imag;
			    IQ_acc_block_real[block_cnt_addr][block_x_pos] = IQ_acc_real + IIR_real;
			    IQ_acc_block_imag[block_cnt_addr][block_x_pos] = IQ_acc_imag + IIR_imag;
			    block_cnt_addr = block_cnt_addr + 1;
			    IIR_count = 0;
			}

			IIR_count = IIR_count + 1;

			if (depth_cnt == 6){
				depth_cnt = 0;
			}
			else {
				depth_cnt = depth_cnt + 1;
			}
		}

	}


	if (pw == Nangle-1)
	{
		for (gray_col = 0; gray_col < ch; gray_col++)
		{
		    for (gray_depth = 32; gray_depth < down_sample; gray_depth++)
		    {
		        gray_real = POWER(IQ_acc_block_real[gray_depth][gray_col]);
		        gray_imag = POWER(IQ_acc_block_imag[gray_depth][gray_col]);
		        gray_pic_buffer[gray_depth][gray_col] = int(round(log(int(gray_real + gray_imag + 1))*8.6996));

		    }
		}

		for (gray_col = 0; gray_col < ch; gray_col++)
		{
		    for (gray_depth = 32; gray_depth < down_sample; gray_depth++)
		    {
		        d_out.data = gray_pic_buffer[gray_depth][gray_col];
			    if((gray_col >= ch - 1) && (gray_depth >= (down_sample - 1))) d_out.last = 1;
		        gray_pic->write(d_out);
		    }
		}

	}

}





