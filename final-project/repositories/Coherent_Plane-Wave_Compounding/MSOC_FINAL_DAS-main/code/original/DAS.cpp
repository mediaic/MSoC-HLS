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

void IIR(cfloat_t signal[Datalength] ,cfloat_t IIR_buffer_line[Datalength])
{
	const float a1[] = {1, 1.74642545895625, -0.820532246091997};
	const float a2[] = {1, 1.49404376234649, -0.567942558232872};
	const float b1[] = {1, -1.55971254233345, 1};
	const float b2[] = {1, -0.324370246269386, 1};
	const float scalevalue[] = {0.168314554151745, 0.0441021029388226, 1};

	int sig_len;
	float delay_1_1_real_r = 0, delay_1_2_real_r = 0, delay_2_1_real_r = 0, delay_2_2_real_r = 0;
	float delay_1_1_real_w, delay_1_2_real_w, delay_2_1_real_w, delay_2_2_real_w;
	float delay_1_1_imag_r = 0, delay_1_2_imag_r = 0, delay_2_1_imag_r = 0, delay_2_2_imag_r = 0;
	float delay_1_1_imag_w, delay_1_2_imag_w, delay_2_1_imag_w, delay_2_2_imag_w;

	for (sig_len = 0; sig_len < Datalength; sig_len++)
	{
		delay_1_1_real_w = a1[2]*delay_1_2_real_r + a1[1]*delay_1_1_real_r + signal[sig_len].real*scalevalue[0];
		delay_1_2_real_w = delay_1_1_real_r;
		delay_2_1_real_w = scalevalue[1]*(delay_1_1_real_w*b1[0] + delay_1_1_real_r*b1[1] + delay_1_2_real_r*b1[2]) + delay_2_1_real_r*a2[1] + delay_2_2_real_r*a2[2];
		delay_2_2_real_w = delay_2_1_real_r;
		IIR_buffer_line[sig_len].real = scalevalue[2]*(delay_2_1_real_w*b2[0] + delay_2_1_real_r*b2[1] + delay_2_2_real_r*b2[2]);

		delay_1_1_real_r = delay_1_1_real_w;
		delay_1_2_real_r = delay_1_2_real_w;
		delay_2_1_real_r = delay_2_1_real_w;
		delay_2_2_real_r = delay_2_2_real_w;


		delay_1_1_imag_w = a1[2]*delay_1_2_imag_r + a1[1]*delay_1_1_imag_r + signal[sig_len].imag*scalevalue[0];
		delay_1_2_imag_w = delay_1_1_imag_r;
		delay_2_1_imag_w = scalevalue[1]*(delay_1_1_imag_w*b1[0] + delay_1_1_imag_r*b1[1] + delay_1_2_imag_r*b1[2]) + delay_2_1_imag_r*a2[1] + delay_2_2_imag_r*a2[2];
		delay_2_2_imag_w = delay_2_1_imag_r;
		IIR_buffer_line[sig_len].imag = scalevalue[2]*(delay_2_1_imag_w*b2[0] + delay_2_1_imag_r*b2[1] + delay_2_2_imag_r*b2[2]);

		delay_1_1_imag_r = delay_1_1_imag_w;
		delay_1_2_imag_r = delay_1_2_imag_w;
		delay_2_1_imag_r = delay_2_1_imag_w;
		delay_2_2_imag_r = delay_2_2_imag_w;
	}

}



void DAS(hls::stream<in_t> &echo_block, hls::stream<out_t> &gray_pic, int pw, int block)
{
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

    static cfloat_t IQ_acc_block[down_sample][ch] = {0};

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
	cfloat_t buffer_line[Datalength];
	cfloat_t IIR_buffer_line[Datalength];

	in_t echo_block_buffer[Datalength][ch_amount];
	static out_t gray_pic_buffer[down_sample][ch];

	int gray_depth;
	int gray_col;
	int count_col;

	for (gray_col = 0; gray_col < ch_amount; gray_col++)
    {
        for (gray_depth = 0; gray_depth < Datalength; gray_depth++)
		{
        	echo_block_buffer[gray_depth][gray_col] = echo_block.read();
		}
	}

	for (x_pos = 1; x_pos <= 16; x_pos++)
		    {
		    	x_mm = 0.0045 + 0.0003*(x_pos+8);

		    	if (angle_pos_neg[pw] == 1)
		    	{
		    		ang_aper = aper_size;
		    	}
		    	else
		    	{
		    		ang_aper = 0;
		    	}

		    	tx_dis_x_sample = (x_mm - ang_aper)*con_dis_sample*sin_coff[pw];

		    	Loop1: for (rx_ch = 0; rx_ch < ch_amount; rx_ch++)
		    	{
		    		rx_dis_x_sample[rx_ch] = POWER((array_ele_coordinate_valid[rx_ch]-x_mm)*con_dis_sample);
		    		extended_apod_func_x[rx_ch] = (rx_ch - (x_pos+7))*19.4805;
		    	}

		    	for (depth = 0; depth < Datalength; depth++)
		    	{

		    		snapshot_sum = 0;

		    		z_sample = depth/2;
		    		tx_dis_z_sample = z_sample*cos_coff[pw];
		    		rx_dis_z_sample = POWER(z_sample);
		    		tx_sample = tx_dis_z_sample + tx_dis_x_sample;

		    		//rx_sample_cal(rx_ch, rx_sample, rx_dis_x_sample, rx_dis_z_sample);

		    		Loop2: for (rx_ch = 0; rx_ch < ch_amount; rx_ch++)
		    		{
		    			rx_sample[rx_ch] = sqrt(rx_dis_z_sample + rx_dis_x_sample[rx_ch]);
		    		}

		    		Loop3: for (rx_ch = 0; rx_ch < ch_amount; rx_ch++)
		    	    {
		    			delay_sample[rx_ch] = round(tx_sample + rx_sample[rx_ch]);
		    			if (delay_sample[rx_ch] > (Datalength-1))
		    			{
		    				delay_sample[rx_ch] = (Datalength-1);
		    			}
		    	    }

		    		Loop4: for (rx_ch = 0; rx_ch < ch_amount; rx_ch++)
		    		{
		    			//snapshot[rx_ch] = echo_block_buffer[depth][int(delay_sample[rx_ch])];
		    			snapshot[rx_ch] = echo_block_buffer[int(delay_sample[rx_ch])][rx_ch];
		    		}

		    		Loop5: for (rx_ch = 0; rx_ch < ch_amount; rx_ch++)
		    	    {
		    			if (abs(extended_apod_func_x[rx_ch]) > z_sample/fnr)
		    			{
		    				snapshot[rx_ch] = 0;
		    			}
		    	    }

		    		for (rx_ch = 0; rx_ch < ch_amount; rx_ch++)
		    		{
		    			snapshot_sum = snapshot_sum + snapshot[rx_ch];
		    		}

		    		buffer_line[depth].real = snapshot_sum*demod_coeff[depth%7].real;
		    		buffer_line[depth].imag = snapshot_sum*demod_coeff[depth%7].imag;

		    	}

		    	IIR(buffer_line, IIR_buffer_line);
		        Loop6: for (gray_depth = 0; gray_depth < down_sample; gray_depth++)
		        {
		            IQ_acc_block[gray_depth][block*16+(x_pos-1)].real = IQ_acc_block[gray_depth][block*16+(x_pos-1)].real + IIR_buffer_line[gray_depth*(Datalength/down_sample)].real;
		    		IQ_acc_block[gray_depth][block*16+(x_pos-1)].imag = IQ_acc_block[gray_depth][block*16+(x_pos-1)].imag + IIR_buffer_line[gray_depth*(Datalength/down_sample)].imag;
		        }

		    }

        if (block == 7 && pw == (Nangle-1))
	    //if (block == 7 )
        {
	        Loop7: for (gray_col = 0; gray_col < ch; gray_col++)
	        {
	            for (gray_depth = 0; gray_depth < down_sample; gray_depth++)
	            {
	            	gray_pic_buffer[gray_depth][gray_col] = int(round(log(POWER(IQ_acc_block[gray_depth][gray_col].real) + POWER(IQ_acc_block[gray_depth][gray_col].imag) + 1)*8.6996));
	            	//test
	            	//ray_pic_buffer[gray_depth][gray_col] = down_sample*gray_col+gray_depth;

	            }
	        }

	        for (gray_col = 0; gray_col < ch; gray_col++)
	        {
	            for (gray_depth = 0; gray_depth < down_sample; gray_depth++)
	            {
	            	gray_pic << gray_pic_buffer[gray_depth][gray_col];
	            }
	        }

        }


}






