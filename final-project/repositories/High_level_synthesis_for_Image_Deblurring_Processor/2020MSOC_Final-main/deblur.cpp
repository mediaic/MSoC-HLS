#include "deblur.h"
void gather_result(eita_t data_out[HEIGHT][WIDTH])
{   //data_in copy to data_out
for_y : for (int y = 0; y < HEIGHT; y++)
  {
    for_x : for (int x = 0; x < WIDTH; x++)
    {
    	if(data_out[y][x]<0.0) data_out[y][x]=0.0;
    }
  }
}
void array_display(int k,cmpxDataIn data_out[HEIGHT][WIDTH])
{   //data_in copy to data_out
for_y : for (int y = 0; y < HEIGHT; y++)
  {
    for_x : for (int x = 0; x < WIDTH; x++)
    {
    //printf("(x,y)=(%d,%d)\n",x,y);
    printf("%d th array_dispaly %f \n",k,float(data_out[y][x].real()));
    printf("%d th array_dispaly %f \n",k,float(data_out[y][x].imag()));
    }
  }
}


void array_display_int(eita_t data_out[HEIGHT][WIDTH])
{   //data_in copy to data_out
for_y : for (int y = 0; y < HEIGHT; y++)
  {
    for_x : for (int x = 0; x < WIDTH; x++)
    {
    //printf("(x,y)=(%d,%d)\n",x,y);
    //printf("%d th array_dispaly %f \n",x,float(data_out[x][y]));
    }
  }
}

void array_copy(eita_t data_in[HEIGHT][WIDTH],
		 	 	eita_t data_out[HEIGHT][WIDTH]) 
{   //data_in copy to data_out
for_y : for (int y = 0; y < HEIGHT; y++)
  {
    for_x : for (int x = 0; x < WIDTH; x++)
    {
    #pragma HLS PIPELINE 
    data_out[y][x] =  data_in[y][x] ;
    //printf("(x,y)=(%d,%d)\n",x,y);
    //printf("array_copy %d for reading\n",int(data_out[y][x]));
    }
  }
}

void array_initialize(eita_t y_1[HEIGHT][WIDTH],
                      eita_t y_2[HEIGHT][WIDTH],
                      eita_t y_3[HEIGHT][WIDTH],
                      eita_t y_4[HEIGHT][WIDTH],
                      eita_t y_5[HEIGHT][WIDTH],
                      eita_t y_6[HEIGHT][WIDTH],
                      eita_t y_7[HEIGHT][WIDTH],
                      eita_t img[HEIGHT][WIDTH])
                      //eita_t y_8[HEIGHT][WIDTH],
                      //eita_t y_9[HEIGHT][WIDTH])
{
    for_y : for (int y = 0; y < HEIGHT; y++)
        {
            for_x : for (int x = 0; x < WIDTH; x++)
            {
                #pragma HLS PIPELINE  
                y_1[y][x] =  img[y][x] ;
                #pragma HLS PIPELINE  
                y_2[y][x] =  img[y][x] ;
                #pragma HLS PIPELINE  
                y_3[y][x] =  img[y][x] ;
                #pragma HLS PIPELINE  
                y_4[y][x] =  img[y][x] ;
                #pragma HLS PIPELINE  
                y_5[y][x] =  img[y][x] ;
                #pragma HLS PIPELINE  
                y_6[y][x] =  img[y][x] ;
                #pragma HLS PIPELINE  
                y_7[y][x] =  img[y][x] ;
                /*
                #pragma HLS PIPELINE  
                y_8[y][x] =  0 ;
                #pragma HLS PIPELINE  
                y_9[y][x] =  0 ;
                */
            }
        }
}




void cross_channel_deblur(eita_t x[HEIGHT][WIDTH],
		 	 	          eita_t adjChImg[HEIGHT][WIDTH],
						  proxGSDataIn coe_a[HEIGHT][WIDTH], //For ProxGS(FFT result)
						  fft_operation coe_b[HEIGHT][WIDTH]) //For ProxGS(FFT result)
{   //printf("[DEBUG] cross channel prior\n");
    eita_t x_bar[HEIGHT][WIDTH],x_old[HEIGHT][WIDTH];//,x[HEIGHT][WIDTH];
    eita_t y_1[HEIGHT][WIDTH],y_2[HEIGHT][WIDTH],y_3[HEIGHT][WIDTH],y_4[HEIGHT][WIDTH],y_5[HEIGHT][WIDTH],y_6[HEIGHT][WIDTH],y_7[HEIGHT][WIDTH],y_8[HEIGHT][WIDTH],y_9[HEIGHT][WIDTH];
    
    array_copy(x,x_bar);//  x_bar = img
    //array_copy(Img,x);    //  x     = img
    array_initialize(y_1,y_2,y_3,y_4,y_5,y_6,y_7,adjChImg);//,y_8,y_9);//  y_0   =Kx(ProxFs),initialize y_0(set flag=1 )

    for_iteration: for(int k=0;k<ITERATION;k++) {

        array_copy(x,x_old);//x_old=x;
        my_filter_v1(x,x_bar,adjChImg,y_1,y_2,y_3,y_4,y_5,y_6,y_7);//,y_8,y_9); // ProxFS &&
        ProxGS(x,coe_a,coe_b);
        Relax(x,x_old,x_bar);
        
    }
    gather_result(x);
    //array_copy(x,Img);
    //array_display_int(x);

}

void DEBLUR(eita_t refImg_R[HEIGHT][WIDTH],
		        eita_t adjChImg_G[HEIGHT][WIDTH],
            eita_t adjChImg_B[HEIGHT][WIDTH],

			proxGSDataIn nominator_G[HEIGHT][WIDTH], //For ProxGS(FFT result)
			fft_operation denominator_G[HEIGHT][WIDTH], //For ProxGS(FFT result)

			proxGSDataIn nominator_B[HEIGHT][WIDTH], //For ProxGS(FFT result)
			fft_operation denominator_B[HEIGHT][WIDTH]) //For ProxGS(FFT result)
{   //cross_channel_deblur(  refImg_R,refImg_R,nominator_G,denominator_G);
    cross_channel_deblur(adjChImg_G,refImg_R,nominator_G,denominator_G);
    cross_channel_deblur(adjChImg_B,refImg_R,nominator_B,denominator_B);
}
