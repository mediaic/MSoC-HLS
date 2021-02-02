#include "proximal.h"
#include "divergent.h"
//const int  FFT_SCALE =1<<17 ;
const float FFT_SCALE = 1.0  ;
const float PIXEL     = 1.0;//ldexpf(1.0, 14);
void ProxGS(
    eita_t      x_io[HEIGHT][WIDTH], //input or output port
	proxGSDataIn coe_a[HEIGHT][WIDTH],
	fft_operation coe_b[HEIGHT][WIDTH]
    )
{
	//====== Data member ======
	bool  fft_ovflo,ifft_ovflo;
    cmpxDataIn tmp[HEIGHT][WIDTH],fft_result[HEIGHT][WIDTH];
    //cmpxDataIn MAD[HEIGHT][WIDTH];
    fft_operation input_data_re, input_data_im,scale_const;

    //====== Interface ======
	//#pragma HLS interface ap_fifo  port=fft_ovflo,ifft_ovflo
    //#pragma HLS interface ap_fifo  port=tmp,fft_result,ifft_result,MAD
    //=======================
    //  eita_t to cmpxDataIn
    P2S(x_io,tmp);
    // FFT
    fft_top_2D(1,tmp,fft_result,&fft_ovflo);
    //adder & divider
    for_y : for (int y = 0; y < HEIGHT; y++)
    {
        for_x : for (int x = 0; x < WIDTH; x++)
        {	//printf("FFT real %f \n",float(fft_result[y][x].real()));
            //printf("FFT imag %f \n",float(fft_result[y][x].imag()));
            //printf("Coe_a %f \n",float(coe_a[y][x].real()));

            	input_data_re=(PIXEL*fft_result[y][x].real()+coe_a[y][x].real()*float(2.0*TAU*LR))/(float(2.0*TAU*LR)*coe_b[y][x]+1.0);
            	input_data_im=(PIXEL*fft_result[y][x].imag()+coe_a[y][x].imag()*float(2.0*TAU*LR))/(float(2.0*TAU*LR)*coe_b[y][x]+1.0);
                //printf("FFT result %f \n",float(fft_result[y][x].real()));
                //printf("FFT result %f \n",float(fft_result[y][x].imag()));
            #pragma HLS PIPELINE
            	fft_result[y][x]= cmpxDataIn(data_in_t(input_data_re/FFT_SCALE),data_in_t(input_data_im/FFT_SCALE));


        }
    }
    // inverse FFT

    fft_top_2D(0,fft_result,tmp,&ifft_ovflo);
    FFT_scale(1.0/128.0,tmp,tmp);
    // cmpxDataIn to eita_t
    S2P(tmp,x_io);
}

void P2S(eita_t data_in[HEIGHT][WIDTH],cmpxDataIn data_out[HEIGHT][WIDTH]){ //0~1
	for_y : for (int y = 0; y < HEIGHT; y++)
    {
        for_x : for (int x = 0; x < WIDTH; x++)
        {
            #pragma HLS PIPELINE
        	    data_out[y][x]=cmpxDataIn( data_in_t(data_in[y][x]/float(PIXEL)),0); //input image type casting to FFT domain .to_int()
        	//printf("(%d,%d) Before FFT in %f \n",x,y,float(data_out[y][x].real()));
        }
    }
}



void S2P(cmpxDataIn data_in[HEIGHT][WIDTH],eita_t data_out[HEIGHT][WIDTH]){
    for_y : for (int y = 0; y < HEIGHT; y++)
    {
        for_x : for (int x = 0; x < WIDTH; x++)
        {
            //printf("IFFT out real %f \n",float(FFT_SCALE*data_in[y][x].real()/FFT_LENGTH));
            //printf("IFFT out imag %f \n",float(FFT_SCALE*data_in[y][x].imag()/FFT_LENGTH));
            #pragma HLS PIPELINE
        	data_out[y][x]=eita_t((FFT_SCALE*data_in[y][x].real()/FFT_LENGTH)); //float(data_in[y][x].real())*255.0
        	//data_out[y][x]=eita_t(rint(FFT_SCALE*data_in[y][x].real()/FFT_LENGTH)); //float(data_in[y][x].real())*255.0
        	//printf("IFFT out %f \n",int(data_out[y][x]));
        }
    }

}

void FFT_scale(float scale,cmpxDataIn data_in[HEIGHT][WIDTH],cmpxDataIn data_out[HEIGHT][WIDTH]){
    for_y : for (int y = 0; y < HEIGHT; y++)
    {
        for_x : for (int x = 0; x < WIDTH; x++)
        {    
            data_out[y][x]=cmpxDataIn( scale*data_in[y][x].real(),scale*data_in[y][x].imag());
        }
    }
}
