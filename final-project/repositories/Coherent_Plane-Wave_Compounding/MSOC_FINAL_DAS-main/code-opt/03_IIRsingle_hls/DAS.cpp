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
/*
void IIR(fp_IQ_acc signal_real[Datalength], fp_IQ_acc signal_imag[Datalength] ,fp_IQ_acc IIR_buffer_line_real[Datalength], fp_IQ_acc IIR_buffer_line_imag[Datalength])
{


	const ap_fixed<18,1> a1[] = {1, 1.74642545895625, -0.820532246091997};
	const ap_fixed<18,1> a2[] = {1, 1.49404376234649, -0.567942558232872};
	const ap_fixed<18,1> b1[] = {1, -1.55971254233345, 1};
	const ap_fixed<18,1> b2[] = {1, -0.324370246269386, 1};
	const ap_fixed<18,1> scalevalue[] = {0.168314554151745, 0.0441021029388226, 1};

	int sig_len;
	fp_IQ_acc delay_1_1_real_r = 0, delay_1_2_real_r = 0, delay_2_1_real_r = 0, delay_2_2_real_r = 0;
	fp_IQ_acc delay_1_1_real_w, delay_1_2_real_w, delay_2_1_real_w, delay_2_2_real_w;
	fp_IQ_acc delay_1_1_imag_r = 0, delay_1_2_imag_r = 0, delay_2_1_imag_r = 0, delay_2_2_imag_r = 0;
	fp_IQ_acc delay_1_1_imag_w, delay_1_2_imag_w, delay_2_1_imag_w, delay_2_2_imag_w;

	for (sig_len = 0; sig_len < Datalength; sig_len++)
	{
		delay_1_1_real_w = a1[2]*delay_1_2_real_r + a1[1]*delay_1_1_real_r + signal_real[sig_len]*scalevalue[0];
		delay_1_2_real_w = delay_1_1_real_r;
		delay_2_1_real_w = scalevalue[1]*(delay_1_1_real_w*b1[0] + delay_1_1_real_r*b1[1] + delay_1_2_real_r*b1[2]) + delay_2_1_real_r*a2[1] + delay_2_2_real_r*a2[2];
		delay_2_2_real_w = delay_2_1_real_r;
		IIR_buffer_line_real[sig_len] = scalevalue[2]*(delay_2_1_real_w*b2[0] + delay_2_1_real_r*b2[1] + delay_2_2_real_r*b2[2]);

		delay_1_1_real_r = delay_1_1_real_w;
		delay_1_2_real_r = delay_1_2_real_w;
		delay_2_1_real_r = delay_2_1_real_w;
		delay_2_2_real_r = delay_2_2_real_w;


		delay_1_1_imag_w = a1[2]*delay_1_2_imag_r + a1[1]*delay_1_1_imag_r + signal_imag[sig_len]*scalevalue[0];
		delay_1_2_imag_w = delay_1_1_imag_r;
		delay_2_1_imag_w = scalevalue[1]*(delay_1_1_imag_w*b1[0] + delay_1_1_imag_r*b1[1] + delay_1_2_imag_r*b1[2]) + delay_2_1_imag_r*a2[1] + delay_2_2_imag_r*a2[2];
		delay_2_2_imag_w = delay_2_1_imag_r;
		IIR_buffer_line_imag[sig_len] = scalevalue[2]*(delay_2_1_imag_w*b2[0] + delay_2_1_imag_r*b2[1] + delay_2_2_imag_r*b2[2]);

		delay_1_1_imag_r = delay_1_1_imag_w;
		delay_1_2_imag_r = delay_1_2_imag_w;
		delay_2_1_imag_r = delay_2_1_imag_w;
		delay_2_2_imag_r = delay_2_2_imag_w;
	}

}
*/
void IIR_pipe(fp_IQ_acc signal_real, fp_IQ_acc signal_imag ,fp_IQ_acc* IIR_buffer_real, fp_IQ_acc* IIR_buffer_imag, int x_pos)
{

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

void DAS(hls::stream<axi_echo>* echo_block, hls::stream<axi_gray>* gray_pic, int pw)
{
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
	int rx_ch;

	float x_mm;
	float ang_aper;
	float tx_dis_x_sample;
	float tx_dis_z_sample;
	float rx_dis_x_sample[ch_amount];
	float rx_dis_z_sample;
	float extended_apod_func_x[ch_amount];
	float z_sample;
	float tx_sample;
	float rx_sample[ch_amount];
	float delay_sample[ch_amount];
	float snapshot[ch_amount];
	float snapshot_sum;

	fp_IQ_acc buffer_real;
	fp_IQ_acc buffer_imag;

	fp_IQ_acc IIR_buffer_real;
    fp_IQ_acc IIR_buffer_imag;

	fp_echo echo_block_buffer[Datalength][ch_amount];
	static fp_gray gray_pic_buffer[down_sample][ch];

	float newton_sqrt_out;

	int gray_depth;
	int gray_col;
	int count_col;

	//interface
	axi_echo d_in;
	axi_gray d_out;

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

	for (gray_col = 0; gray_col < ch_amount; gray_col++)
    {
        for (gray_depth = 0; gray_depth < Datalength; gray_depth++)
		{
        	d_in = echo_block->read();
        	echo_block_buffer[gray_depth][gray_col] = d_in.data;
        	if (d_in.last) break;
		}
	}

	for (x_pos = 1; x_pos <= 16; x_pos++)
			    {
			        ap_fixed<18,1> c_0_0003 = 0.0003;
			        ap_fixed<18,1> c_0_0045 = 0.0045;

			        x_mm = c_0_0045 + c_0_0003*(x_pos+8);

			    	if (angle_pos_neg[pw] == 1)
			    	{
			    		ang_aper = aper_size;
			    	}
			    	else
			    	{
			    		ang_aper = 0;
			    	}

			    	tx_dis_x_sample = (x_mm - ang_aper)*sin_coff[pw]*con_dis_sample;

			    	Loop1: for (rx_ch = 0; rx_ch < ch_amount; rx_ch++)
			    	{
	#pragma HLS PIPELINE
			    		rx_dis_x_sample[rx_ch] = POWER((array_ele_coordinate_valid[rx_ch]-x_mm)*con_dis_sample);

			    		ap_fixed<18,5> c_19_4805 = 19.4805;
			    		extended_apod_func_x[rx_ch] = (rx_ch - (x_pos+7))*c_19_4805;
			    	}

			    	int IIR_count = 0;
			    	for (depth = 0; depth < Datalength; depth++)
			    	{

			    		snapshot_sum = 0;

			    		ap_fixed<2,1> c_0_5 = 0.5;
			    		z_sample = depth*c_0_5;

			    		tx_dis_z_sample = z_sample*cos_coff[pw];
			    		rx_dis_z_sample = POWER(z_sample);
			    		tx_sample = tx_dis_z_sample + tx_dis_x_sample;

			    		Loop2: for (rx_ch = 0; rx_ch < ch_amount; rx_ch++)
			    		{
	                    #pragma HLS UNROLL
			    			rx_sample[rx_ch] = sqrt(rx_dis_z_sample + rx_dis_x_sample[rx_ch]);


			    			delay_sample[rx_ch] = (tx_sample + rx_sample[rx_ch]);
			    			snapshot[rx_ch] = echo_block_buffer[int(delay_sample[rx_ch])][rx_ch];

			    		    if (delay_sample[rx_ch] > (Datalength-1))
			    			{
			    			    delay_sample[rx_ch] = (Datalength-1);
			    			}

			    		    snapshot[rx_ch] = echo_block_buffer[int(delay_sample[rx_ch])][rx_ch];
			    		    if (ABS(extended_apod_func_x[rx_ch]) > z_sample*0.57143)
			    		    {
			    		        snapshot[rx_ch] = 0;
			    		    }

			    		    snapshot_sum = snapshot_sum + snapshot[rx_ch];
			    		}

			    		buffer_real = snapshot_sum*demod_coeff[depth%7].real;
			    	    buffer_imag = snapshot_sum*demod_coeff[depth%7].imag;
			    	    IIR_pipe(buffer_real, buffer_imag, &IIR_buffer_real, &IIR_buffer_imag, x_pos);

			    	    int block_x_pos = x_pos-1;
			    	    if (IIR_count == 7){

			    	    	fp_IQ_acc IQ_acc_real = IQ_acc_block_real[depth/8][block_x_pos];
			    	    	fp_IQ_acc IIR_real =  IIR_buffer_real;
			    	    	fp_IQ_acc IQ_acc_imag = IQ_acc_block_imag[depth/8][block_x_pos];
			    	    	fp_IQ_acc IIR_imag =  IIR_buffer_imag;
			    	        IQ_acc_block_real[depth/8][block_x_pos] = IQ_acc_real + IIR_real;
			    	    	IQ_acc_block_imag[depth/8][block_x_pos] = IQ_acc_imag + IIR_imag;

			    	    	IIR_count = 0;
			    	    }
			    	    IIR_count = IIR_count + 1;

			    	}

			    }


	        if (pw == Nangle-1)
	        {
		        Loop7: for (gray_col = 0; gray_col < ch; gray_col++)
		        {
		            for (gray_depth = 0; gray_depth < down_sample; gray_depth++)
		            {
		            	float gray_real = POWER(IQ_acc_block_real[gray_depth][gray_col]);
		            	float gray_imag = POWER(IQ_acc_block_imag[gray_depth][gray_col]);

		                gray_pic_buffer[gray_depth][gray_col] = int(round(log(int(gray_real + gray_imag + 1))*8.6996));


		            }
		        }

		        for (gray_col = 0; gray_col < ch; gray_col++)
		        {
		            for (gray_depth = 0; gray_depth < down_sample; gray_depth++)
		            {
		            	d_out.data = gray_pic_buffer[gray_depth][gray_col];
					    if((gray_col >= ch - 1) && (gray_depth >= down_sample - 1)) d_out.last = 1;
		            	gray_pic->write(d_out);
		            }
		        }

	        }

}





