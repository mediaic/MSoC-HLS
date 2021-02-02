// 67d7842dbbe25473c3c32b93c0da8047785f30d78e8a024de1b57352245f9689
/*******************************************************************************
Vendor: Xilinx 
Associated Filename: fft_top.cpp
Purpose: Xilinx FFT IP-XACT IP in Vivado HLS
Revision History: September 26, 2013 - initial release
                                                
*******************************************************************************
#-  (c) Copyright 2011-2019 Xilinx, Inc. All rights reserved.
#-
#-  This file contains confidential and proprietary information
#-  of Xilinx, Inc. and is protected under U.S. and
#-  international copyright and other intellectual property
#-  laws.
#-
#-  DISCLAIMER
#-  This disclaimer is not a license and does not grant any
#-  rights to the materials distributed herewith. Except as
#-  otherwise provided in a valid license issued to you by
#-  Xilinx, and to the maximum extent permitted by applicable
#-  law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
#-  WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
#-  AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
#-  BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
#-  INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
#-  (2) Xilinx shall not be liable (whether in contract or tort,
#-  including negligence, or under any other theory of
#-  liability) for any loss or damage of any kind or nature
#-  related to, arising under or in connection with these
#-  materials, including for any direct, or any indirect,
#-  special, incidental, or consequential loss or damage
#-  (including loss of data, profits, goodwill, or any type of
#-  loss or damage suffered as a result of any action brought
#-  by a third party) even if such damage or loss was
#-  reasonably foreseeable or Xilinx had been advised of the
#-  possibility of the same.
#-
#-  CRITICAL APPLICATIONS
#-  Xilinx products are not designed or intended to be fail-
#-  safe, or for use in any application requiring fail-safe
#-  performance, such as life-support or safety devices or
#-  systems, Class III medical devices, nuclear facilities,
#-  applications related to the deployment of airbags, or any
#-  other applications that could lead to death, personal
#-  injury, or severe property or environmental damage
#-  (individually and collectively, "Critical
#-  Applications"). Customer assumes the sole risk and
#-  liability of any use of Xilinx products in Critical
#-  Applications, subject only to applicable laws and
#-  regulations governing limitations on product liability.
#-
#-  THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
#-  PART OF THIS FILE AT ALL TIMES. 
#- ************************************************************************


This file contains confidential and proprietary information of Xilinx, Inc. and 
is protected under U.S. and international copyright and other intellectual 
property laws.

DISCLAIMER
This disclaimer is not a license and does not grant any rights to the materials 
distributed herewith. Except as otherwise provided in a valid license issued to 
you by Xilinx, and to the maximum extent permitted by applicable law: 
(1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND WITH ALL FAULTS, AND XILINX 
HEREBY DISCLAIMS ALL WARRANTIES AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, 
INCLUDING BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-INFRINGEMENT, OR 
FITNESS FOR ANY PARTICULAR PURPOSE; and (2) Xilinx shall not be liable (whether 
in contract or tort, including negligence, or under any other theory of 
liability) for any loss or damage of any kind or nature related to, arising under 
or in connection with these materials, including for any direct, or any indirect, 
special, incidental, or consequential loss or damage (including loss of data, 
profits, goodwill, or any type of loss or damage suffered as a result of any 
action brought by a third party) even if such damage or loss was reasonably 
foreseeable or Xilinx had been advised of the possibility of the same.

CRITICAL APPLICATIONS
Xilinx products are not designed or intended to be fail-safe, or for use in any 
application requiring fail-safe performance, such as life-support or safety 
devices or systems, Class III medical devices, nuclear facilities, applications 
related to the deployment of airbags, or any other applications that could lead 
to death, personal injury, or severe property or environmental damage 
(individually and collectively, "Critical Applications"). Customer assumes the 
sole risk and liability of any use of Xilinx products in Critical Applications, 
subject only to applicable laws and regulations governing limitations on product 
liability. 

THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS PART OF THIS FILE AT 
ALL TIMES.

*******************************************************************************/

#include "fft_top.h"
#include "ap_fixed.h"
#include "hls_fft.h"
/*
// configurable params
const char FFT_INPUT_WIDTH                     = 24;
const char FFT_OUTPUT_WIDTH                    = FFT_INPUT_WIDTH;
const char FFT_CONFIG_WIDTH                    = 24;
const char FFT_NFFT_MAX                        = 14;
const int  FFT_LENGTH                          = 1 << FFT_NFFT_MAX;


#include <complex>
using namespace std;

struct config1 : hls::ip_fft::params_t {
    static const unsigned ordering_opt = hls::ip_fft::natural_order;
    static const unsigned config_width = FFT_CONFIG_WIDTH;
};

typedef hls::ip_fft::config_t<config1> config_t;
typedef hls::ip_fft::status_t<config1> status_t;

typedef ap_fixed<FFT_INPUT_WIDTH,1> data_in_t;
typedef ap_fixed<FFT_OUTPUT_WIDTH,FFT_OUTPUT_WIDTH-FFT_INPUT_WIDTH+1> data_out_t;
typedef std::complex<data_in_t> cmpxDataIn;
typedef std::complex<data_out_t> cmpxDataOut;
*/

void dummy_proc_fe(
    bool direction,
    config_t* config,
    cmpxDataIn in[FFT_LENGTH],
    cmpxDataIn out[FFT_LENGTH]);

void dummy_proc_be(
    status_t* status_in,
    bool* ovflo,
    cmpxDataOut in[FFT_LENGTH],
    cmpxDataOut out[FFT_LENGTH]);

void fft_top(
    bool direction,
    cmpxDataIn in[FFT_LENGTH],
    cmpxDataOut out[FFT_LENGTH],
    bool* ovflo);
//*******************************************************************************/
void dummy_proc_fe(
    bool direction,
    config_t* config, 
    cmpxDataIn in[FFT_LENGTH], 
    cmpxDataIn out[FFT_LENGTH])
{
    int i; 
    config->setDir(direction);
    //config->setSch(0x2AB);
    for (i=0; i< FFT_LENGTH; i++)
        out[i] = in[i];
}

void dummy_proc_be(
    status_t* status_in, 
    bool* ovflo,
    cmpxDataOut in[FFT_LENGTH], 
    cmpxDataOut out[FFT_LENGTH])
{
    int i; 
    for (i=0; i< FFT_LENGTH; i++)
        out[i] = in[i];
    //*ovflo = status_in->getOvflo() & 0x1;
}


void fft_top(
    bool direction,
    complex<data_in_t> in[FFT_LENGTH],
    complex<data_out_t> out[FFT_LENGTH],
    bool* ovflo)
{
#pragma HLS interface ap_hs port=direction
//#pragma HLS interface ap_fifo depth=1 port=ovflo
//#pragma HLS interface ap_fifo depth=FFT_LENGTH port=in,out
#pragma HLS data_pack variable=in
#pragma HLS data_pack variable=out
#pragma HLS dataflow
    complex<data_in_t> xn[FFT_LENGTH];
    complex<data_out_t> xk[FFT_LENGTH];
    config_t fft_config;
    status_t fft_status;
   
    dummy_proc_fe(direction, &fft_config, in, xn);
    //printf("[DEBUG] End of dummy_proc_fe \n");
    // FFT IP
    hls::fft<config1>(xn, xk, &fft_status, &fft_config);
    //printf("[DEBUG] End of fft \n");
    dummy_proc_be(&fft_status, ovflo, xk, out);
    //printf("[DEBUG] End of dummy_proc_be \n");
}


void fft_top_2D(
    bool direction,
    cmpxDataIn in[FFT_LENGTH][FFT_LENGTH],
    cmpxDataOut out[FFT_LENGTH][FFT_LENGTH],
    bool* fft_ovflo_all)
{
	complex<data_in_t> buffer_in[FFT_LENGTH],buffer_out[FFT_LENGTH];
	bool  fft_ovflo = false;
	// fft for row by row
	for_row : for(int i=0;i<FFT_LENGTH;i++){
		for_column_in : for(int j=0;j<FFT_LENGTH;j++){
			buffer_in[j]=in[i][j];
		}
		fft_top(direction,buffer_in,buffer_out,&fft_ovflo);

		*fft_ovflo_all |= fft_ovflo;
		for_column_out : for(int k=0;k<FFT_LENGTH;k++){
			out[i][k]=buffer_out[k];
		}

	}

	// fft for col by col
	for_column : for(int j=0;j<FFT_LENGTH;j++){
		for_row_in : for(int i=0;i<FFT_LENGTH;i++){
			buffer_in[i]=out[i][j];
		}
		fft_top(direction,buffer_in,buffer_out,&fft_ovflo);
		*fft_ovflo_all |= fft_ovflo;
		for_row_out : for(int i=0;i<FFT_LENGTH;i++){
			out[i][j]=buffer_out[i];
		}
	}
}




