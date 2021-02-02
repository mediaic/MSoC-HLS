#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <assert.h>
#include <string.h>
#include <malloc.h>
#include "hls_video.h"
//#include "ap_int.h"
//#include "ap_fixed.h"
//typedef  ap_int<8>  eita_t;
//typedef std::complex<eita_t> cmpxDataIn;
#include <iostream>
#include <cstdlib>
#include <cstring>
#include <sstream>
#include <stdio.h>
//#include "hls_fft.h"
#include "deblur.h"

#include <fstream>
#include <string>
#include <sstream>
// image processing lib
#include <stdio.h>
//#include <opencv2/core/core.hpp>
#include <hls_opencv.h>

#define MAX_WIDTH 128
#define H 128
#define W 128

// function declaration
void D_DISPLAY_real (eita_t data_in[128][128] );
void D_DISPLAY (proxGSDataIn data_in[128][128] );
void readImage(const char* path, eita_t inArr[WIDTH][HEIGHT]);
void write_file(const char* file_name,eita_t out_array[WIDTH][HEIGHT]);
void read_coe(fft_operation denom[128][128],proxGSDataIn xn_input[128][128],const char* file_name_real,const char* file_name_imag,const char* file_name_denominator);
void COMPUTE_PSNR(eita_t blurred_R[HEIGHT][WIDTH],eita_t blurred_G[HEIGHT][WIDTH],eita_t blurred_B[HEIGHT][WIDTH],eita_t data_R[HEIGHT][WIDTH],eita_t data_G[HEIGHT][WIDTH],eita_t data_B[HEIGHT][WIDTH]);
void txt2bmp(const char* txt,const char* bmp);
void COMPUTE_MSE(eita_t data_a[HEIGHT][WIDTH],eita_t data_b[HEIGHT][WIDTH]);
void TEST_2D_FFT();
void TEST_Prox_GS();
int main(){
	//TEST_Prox_GS();
  //TEST_2D_FFT();


	unsigned short int y,x;
	int value;
// Read ground truth image
	value=128;
	printf("%d\n",value);

	eita_t data_G[128][128] ;
	eita_t data_R[128][128] ;
	eita_t data_B[128][128] ;

	eita_t blurred_G[128][128] ;
	eita_t blurred_R[128][128] ;
	eita_t blurred_B[128][128] ;
	//init();
	readImage("C:/Users/leo870823/Desktop/MSOC/2020MSOC_Final/tb_log/R_ground.bmp",data_R);
	readImage("C:/Users/leo870823/Desktop/MSOC/2020MSOC_Final/tb_log/G_ground.bmp",data_G);
	readImage("C:/Users/leo870823/Desktop/MSOC/2020MSOC_Final/tb_log/B_ground.bmp",data_B);

	readImage("C:/Users/leo870823/Desktop/MSOC/2020MSOC_Final/CPUfft-final/R_blurred.bmp",blurred_R);
	readImage("C:/Users/leo870823/Desktop/MSOC/2020MSOC_Final/CPUfft-final/G_blurred.bmp",blurred_G);
	readImage("C:/Users/leo870823/Desktop/MSOC/2020MSOC_Final/CPUfft-final/B_blurred.bmp",blurred_B);



//====== Deblur ISP kernel ======
	// read coefficient(Real,Imaginary,Denominator)
	fft_operation denom_R[128][128],denom_G[128][128],denom_B[128][128];
	proxGSDataIn nominator_R[128][128],nominator_G[128][128],nominator_B[128][128];
	//read_coe(denom_R,nominator_R,"REAL.txt","IMAGINARY.txt","DENOM.txt");
	read_coe(denom_G,nominator_G,"REAL2.txt","IMAGINARY2.txt","DENOM2.txt");
	read_coe(denom_B,nominator_B,"REAL3.txt","IMAGINARY3.txt","DENOM3.txt");


//====== Deblur kernel ======
	printf("==== Before deblurring ====\n");
	COMPUTE_PSNR(blurred_R,blurred_G,blurred_B,data_R,data_G,data_B);	
	printf("====  After deblurring ====\n");
	DEBLUR(blurred_R,blurred_G,blurred_B,nominator_G,denom_G,nominator_B,denom_B);
	//cross_channel_deblur(blurred_B,blurred_R,blurred_G,nominator_B,denom_B);
	COMPUTE_PSNR(blurred_R,blurred_G,blurred_B,data_R,data_G,data_B);
	// output image
	write_file("C:/Users/leo870823/Desktop/MSOC/2020MSOC_Final/tb_log/deblur_R.bmp",blurred_R);
	write_file("C:/Users/leo870823/Desktop/MSOC/2020MSOC_Final/tb_log/deblur_G.bmp",blurred_G);
	write_file("C:/Users/leo870823/Desktop/MSOC/2020MSOC_Final/tb_log/deblur_B.bmp",blurred_B);

}
//===========================
//===== utility function ====
//===========================
void saveImage(const std::string path, cv::InputArray inArr)
{
	double min;
	double max;
	cv::minMaxIdx(inArr, &min, &max);
	cv::Mat adjMap;
	cv::convertScaleAbs(inArr, adjMap, 255 / max);
	cv::imwrite(path,adjMap);
}
void readImage(const char* path, eita_t img[WIDTH][HEIGHT]){
	float tmp=0.0;
	int inArr[WIDTH][HEIGHT];
	bool flag=0;
	// Read input image
	printf("Load image %s \n",path);
	cv::Mat imageSrc(cv::Size(WIDTH,HEIGHT), CV_8UC1, inArr, cv::Mat::AUTO_STEP);
	imageSrc=cv::imread(path, CV_LOAD_IMAGE_GRAYSCALE);
	// Convert to grayscale
	printf("Image Rows:%d Cols:%d\n",imageSrc.rows, imageSrc.cols);
	//if(path == "C:/Users/leo870823/Desktop/MSOC/2020MSOC_Final/tb_log/R_blurred.bmp") flag=1;
	for (int x = 0; x < W; x++)
	{
		for (int y = 0; y < H; y++)
		{	tmp=eita_t(imageSrc.at<unsigned char>(y,x))/255.0;//;
			img[y][x]=tmp;
			//img[y][x]=tmp*tmp+1.0;
			//printf( "%d",int(imageSrc.at<unsigned char>(x,y)) );
			//printf( "After  %f\n",float(img[y][x]) );

		}
		if(flag) printf( "\n" );
	}


}
void write_file(const char* file_name,eita_t out_array[WIDTH][HEIGHT]){

	int value;
	char outImage[WIDTH][HEIGHT];
	cv::Mat imgCvOut(cv::Size(WIDTH,HEIGHT), CV_8UC1, outImage, cv::Mat::AUTO_STEP);
		for (int x = 0; x < W; x++)
		{
			for (int y = 0; y < H; y++)
			{
				outImage[x][y]=char(rint(out_array[x][y]*255.0));
				//outImage[x][y]=char(rint(sqrt(out_array[y][x]-1.0)*255.0));
				//printf( "output file %f :\n",(out_array[y][x]) );
			}

		}
		saveImage(std::string(file_name) ,imgCvOut);
		//printf( "output file %s :\n",file_name );
}
/*
void write_RGB_file(const char* file_name,eita_t R[WIDTH][HEIGHT],eita_t G[WIDTH][HEIGHT],eita_t B[WIDTH][HEIGHT]){

	int value;
	char outImage[WIDTH][HEIGHT];
	cv::Mat imgCvOut(cv::Size(WIDTH,HEIGHT,3), CV_8UC1, outImage, cv::Mat::AUTO_STEP);
		for (int x = 0; x < W; x++)
		{
			for (int y = 0; y < H; y++)
			{
				outImage[y][x][0]=char(R[y][x]*255.0);
				outImage[y][x][1]=char(G[y][x]*255.0);
				outImage[y][x][2]=char(B[y][x]*255.0);
				//printf( "output file %d :\n",int(outImage[x][y]) );
			}

		}
		saveImage(std::string(file_name) ,imgCvOut);
		//printf( "output file %s :\n",file_name );
}
*/
void read_coe(fft_operation denom[128][128],proxGSDataIn xn_input[128][128],const char* file_name_real,const char* file_name_imag,const char* file_name_denominator){

	 float value_for_weight;
	 //static fft_operation denom[128][128];
	 //static proxGSDataIn xn_input[128][128];
	 fft_operation REAL[128][128] ;
	 fft_operation IMAG[128][128] ;
	 FILE *file_REAL = fopen(file_name_real, "r");
	 		if(!file_REAL) printf("ERROR: could not open %s for reading\n",file_name_real);
	 FILE *file_IMAG = fopen(file_name_imag, "r");
	 		if(!file_REAL) printf("ERROR: could not open %s for reading\n",file_name_imag);

	 for (int y = 0; y < H; y++)
	 {
	 	for (int x = 0; x < W; x++)
	 		{
	 			fscanf(file_REAL, "%f ", &value_for_weight);
	 			REAL[y][x] = fft_operation(value_for_weight);
	 			fscanf(file_IMAG, "%f ", &value_for_weight);
	 			IMAG[y][x] = fft_operation(value_for_weight);
	 			xn_input[y][x] = proxGSDataIn( REAL[y][x],IMAG[y][x]); //Nominator
	 		}
	 }
	 fclose(file_REAL);
	 fclose(file_IMAG);


	 FILE *file_DENOM = fopen(file_name_denominator, "r");
	 		if(!file_DENOM) printf("ERROR: could not open %s for reading\n",file_name_denominator);



	 		for (int y = 0; y < H; y++)
	 		{
	 			for (int x = 0; x < W; x++)
	 			{
	 				fscanf(file_DENOM, "%f ", &value_for_weight);
	 				denom[y][x] = fft_operation(value_for_weight);

	 			}
	 		}
	 		fclose(file_DENOM);
}


void COMPUTE_PSNR(	
	eita_t blurred_R[HEIGHT][WIDTH],
	eita_t blurred_G[HEIGHT][WIDTH],
	eita_t blurred_B[HEIGHT][WIDTH],
	eita_t data_R[HEIGHT][WIDTH],
	eita_t data_G[HEIGHT][WIDTH],
	eita_t data_B[HEIGHT][WIDTH]
){
	double MSE_R,MSE_G,MSE_B,PSNR_R,PSNR_G,PSNR_B;
	MSE_R=0,MSE_G=0,MSE_B=0,PSNR_R=0,PSNR_G=0,PSNR_B=0 ;
	for (int y = 0; y < H; y++)
	{
		 for (int x = 0; x < W; x++)
		 {
		 	MSE_R = MSE_R + (blurred_R[y][x]- data_R[y][x]) * (blurred_R[y][x]- data_R[y][x]);
		 	MSE_B = MSE_B + (blurred_B[y][x]- data_B[y][x]) * (blurred_B[y][x]- data_B[y][x]);
		 	MSE_G = MSE_G + (blurred_G[y][x]- data_G[y][x]) * (blurred_G[y][x]- data_G[y][x]);
		 }
	}
	MSE_R = MSE_R/H/W ;
	MSE_B = MSE_B/H/W ;
	MSE_G = MSE_G/H/W ;
	if(MSE_R!=0){PSNR_R = 10 * log10(1/MSE_R);}
	if(MSE_B!=0){PSNR_B = 10 * log10(1/MSE_B);}
	if(MSE_G!=0){PSNR_G = 10 * log10(1/MSE_G);}

	printf( "R channel PSNR=%f \n", PSNR_R);
	printf( "B channel PSNR=%f \n", PSNR_B);
	printf( "G channel PSNR=%f \n", PSNR_G);
}

void txt2bmp(const char* txt,const char* bmp){
	int value;
	FILE *file_noise_B = fopen(txt, "r");
		if(!file_noise_B) printf("ERROR: could not open %s for reading\n","noise_B.txt");
		else printf("Open success %s \n",txt);
		eita_t blurred_B[128][128];

		for (int y = 0; y < H; y++)
		{
			for (int x = 0; x < W; x++)
			{
				fscanf(file_noise_B, "%d ", &value);
				blurred_B[y][x] = eita_t(value);
			}
		}
		fclose(file_noise_B);
		write_file(bmp,blurred_B);
}

/*
		eita_t data_G[128][128] ;
		eita_t data_R[128][128] ;
		eita_t data_B[128][128] ;

		eita_t blurred_G[128][128] ;
		eita_t blurred_R[128][128] ;
		eita_t blurred_B[128][128] ;

		readImage("C:/Users/leo870823/Desktop/MSOC/2020MSOC_Final/tb_log/R_ground.bmp",data_R);
		readImage("C:/Users/leo870823/Desktop/MSOC/2020MSOC_Final/tb_log/G_ground.bmp",data_G);
		readImage("C:/Users/leo870823/Desktop/MSOC/2020MSOC_Final/tb_log/B_ground.bmp",data_B);

		readImage("C:/Users/leo870823/Desktop/MSOC/2020MSOC_Final/tb_log/R_blurred.bmp",blurred_R);
		readImage("C:/Users/leo870823/Desktop/MSOC/2020MSOC_Final/tb_log/G_blurred.bmp",blurred_G);
		readImage("C:/Users/leo870823/Desktop/MSOC/2020MSOC_Final/tb_log/B_blurred.bmp",blurred_B);
 * */

 //txt2bmp("C:/Users/leo870823/Desktop/MSOC/2020MSOC_Final/tb_files/ground_truth_R.txt","C:/Users/leo870823/Desktop/MSOC/2020MSOC_Final/tb_log/R_ground.bmp");

void TEST_2D_FFT(){
	const float sc_fft = ldexpf(1.0, 6);
	eita_t data_in[HEIGHT][WIDTH],data_ground[HEIGHT][WIDTH];
	cmpxDataIn data_in_complex[HEIGHT][WIDTH], data_out_complex[HEIGHT][WIDTH];
	bool  fft_ovflo,ifft_ovflo;
	readImage("C:/Users/leo870823/Desktop/MSOC/2020MSOC_Final/tb_log/R_ground.bmp",data_in);
	readImage("C:/Users/leo870823/Desktop/MSOC/2020MSOC_Final/tb_log/R_ground.bmp",data_ground);
	P2S(data_in,data_in_complex); //0~1
	//D_DISPLAY(data_in_complex);
	fft_top_2D(1,data_in_complex,data_out_complex,&fft_ovflo);
	//FFT_scale(1/sc_fft,data_out_complex,data_in_complex);

	fft_top_2D(0,data_out_complex,data_in_complex,&ifft_ovflo);
	
	//FFT_scale(1.0/64.0,data_in_complex,data_in_complex);
	//D_DISPLAY (data_in_complex);
	FFT_scale(1.0/128.0,data_in_complex,data_in_complex);
	//D_DISPLAY (data_in_complex);
	//FFT_scale(sc_fft,data_out_complex,data_in_complex);
	S2P(data_in_complex,data_in);

	write_file("C:/Users/leo870823/Desktop/MSOC/2020MSOC_Final/tb_log/After_FFT.bmp",data_in);
	COMPUTE_MSE(data_in,data_ground);
}

void TEST_Prox_GS(){
	const float sc_fft = ldexpf(1.0, 6);
	eita_t data_in[HEIGHT][WIDTH],data_ground[HEIGHT][WIDTH];
	fft_operation coe_b[HEIGHT][WIDTH];

	cmpxDataIn data_in_complex[HEIGHT][WIDTH], data_out_complex[HEIGHT][WIDTH],coe_a[HEIGHT][WIDTH];
	//coe_a={cmpxDataIn(0,0)};
	//for(int x=0;x<H;x++){for(int y=0;y<W;y++){coe_b[x][y]=0;coe_a[x][y]=cmpxDataIn(0,0);}}
	read_coe(coe_b,coe_a,"REAL3.txt","IMAGINARY3.txt","DENOM3.txt");
	bool  fft_ovflo,ifft_ovflo;
	readImage("C:/Users/leo870823/Desktop/MSOC/2020MSOC_Final/CPUfft-final/B_blurred.bmp",data_in);
	readImage("C:/Users/leo870823/Desktop/MSOC/2020MSOC_Final/tb_log/B_ground.bmp",data_ground);
	for(int x=0;x<100;x++)
	{
		ProxGS(data_in,coe_a,coe_b);
		//D_DISPLAY_real (data_in);
		//D_DISPLAY (coe_a);
		COMPUTE_MSE(data_in,data_ground);
	}
	write_file("C:/Users/leo870823/Desktop/MSOC/2020MSOC_Final/tb_log/After_FFT.bmp",data_in);
}
void COMPUTE_MSE(eita_t data_a[HEIGHT][WIDTH],eita_t data_b[HEIGHT][WIDTH]){
	double MSE=0.0;
		for (int y = 0; y < H; y++)
		{
			for (int x = 0; x < W; x++)
			{
				MSE=MSE+(data_a[y][x]-data_b[y][x])*(data_a[y][x]-data_b[y][x]);
			}
		}
	MSE=MSE/H/W;
	printf("MSE error %f\n",MSE);
}

void D_DISPLAY (proxGSDataIn data_in[128][128] ) {
	for (int y = 0; y < H; y++)
	{
		for (int x = 0; x < W; x++)
		{
            printf("%f ",float(data_in[y][x].real()));
		}
		 printf("\n");
	}
}

void D_DISPLAY_real (eita_t data_in[128][128] ) {
	for (int y = 0; y < H; y++)
	{
		for (int x = 0; x < W; x++)
		{
            printf("%f ",float(data_in[y][x]));
		}
		 printf("\n");
	}
}
