#include "coef_test.h"

void detectFace_wrapper(stream1 *In, stream2* Out, int lastIter, int* Num){

	MyAxi1 temp;
	MyAxi2 temp1;
	InType Data;
	OutType loc, init;
	int cnt = 0;
	uint3 res = 0, flag = 0;

	init.Col = 0; init.dump = 0; init.iter = 0; init.row = 0;
	temp1.data = init;
	temp1.dest = 0;
	temp1.strb = 0;
	temp1.user = 0;
	temp1.keep = 0xF;
	temp1.id = 0;
	temp1.last = 0;

	static OutType Tmp[128];
	while(1){
	//for(int iter=0; iter<N; iter++){
		temp = In->read();
		Data = temp.data;
		res = detectFace(Data.pixel,Data.Col, Data.row, res);
		if(res==3){
			if(flag<2)
				flag++;
			else{
				loc.Col = (Data.Col-23)*ratio[Data.iter-1];
				loc.iter = 24*ratio[Data.iter-1];
				loc.row = (Data.row-23)*ratio[Data.iter-1];
				Tmp[cnt] = loc;
				cnt ++;
			}
		}
		else
			flag = 0;
		if(temp.last&&Data.iter==lastIter){
		//if(temp.last){
			*Num = cnt;
			break;
		}
	}
	for(int idx=0; idx<cnt; idx++){
		temp1.data = Tmp[idx];
		if(idx==cnt-1)
			temp1.last = 1;
		Out->write(temp1);
	}
	cnt = 0;
	return;
}

uint3 detectFace(uint8 newPixel, uint9 newPixelCol, uint8 Row, uint3 flag) {
#pragma HLS INLINE off
	static uint16 lineBuffer[24][320] = {0};
#pragma HLS ARRAY_PARTITION variable=lineBuffer block factor=24 dim=1
	static uint16 colBuffer[24] = {0};
	static uint18 II[24][24] = {0};
#pragma HLS ARRAY_PARTITION variable=II complete dim=2

	static uint23 lineBuffer2[24][320] = {0};
#pragma HLS ARRAY_PARTITION variable=lineBuffer2 block factor=24 dim=1
	static uint28 sq_buf[24] = {0};
#pragma HLS ARRAY_PARTITION variable=sq_buf complete dim=1


	//##### creating Integral Image
	//#################################################################
	// generate colSum
	uint16 oldestValue = 0;
	if(Row<24)
		oldestValue = 0;
	else
		oldestValue = lineBuffer[0][newPixelCol];

	// loop through all rows but last (from top to bottom aka from old to new)
	int row;

	Loop_Buffer: for(row = 0; row < 23; row++){
#pragma HLS unroll factor=23
		// all rows content are based on the row below them (one higher index), except the last row
		lineBuffer[row][newPixelCol] = lineBuffer[row + 1][newPixelCol] - oldestValue; // row = 0 is the oldest data
		colBuffer[row] = lineBuffer[row][newPixelCol];
		// more elegant if condition, can only be used if loop goes through 24
		//lineBuffer[row][newPixelCol] = (row==23) ? (lineBuffer[row][newPixelCol] - oldestValue) +newPixel : lineBuffer[row + 1][newPixelCol] - oldestValue;
	}
	// Last rows content is based on new pixel data and its own content
	// The BRAM with highest row-col-indexes holds the freshest data
	if(Row==0)
		lineBuffer[row][newPixelCol] = newPixel;
	else
		lineBuffer[row][newPixelCol] = (lineBuffer[row][newPixelCol] - oldestValue) + newPixel;

	colBuffer[row] = lineBuffer[row][newPixelCol];

	// generate resulting ii-frame from just updated colBuffer
	uint18 oldestInRow = 0;
	Loop_iiRow: for(row = 0; row < 24; row++){
#pragma HLS UNROLL factor=24
		// saving oldest value in this row (col = 0) so we can subtract it from all the other values
		oldestInRow = II[row][0];
		int col;
		Loop_iiCol: for(col=0; col<23; col++){
#pragma HLS UNROLL factor=24
			// Each value (ii[index]) is calculated by subtracting the oldest value from the next younger value (ii[index+1])
			II[row][col] = II[row][col+1] - oldestInRow;
		}
		// The new last value (ii[24*row + 23]) is calculated by adding the old last value to a fresh value and subtracting the oldest value from the sum
		II[row][col] = II[row][col] + colBuffer[row] - oldestInRow;
	}

	uint23 OldestValue;
	if(Row<24)
		OldestValue = 0;
	else
		OldestValue = lineBuffer2[0][newPixelCol];

	int row1;
	Loop_Buffer2: for(row1=0; row1<23; row1++){
#pragma HLS unroll factor=23
		lineBuffer2[row1][newPixelCol] = lineBuffer2[row1 + 1][newPixelCol] - OldestValue;
	}
	if(Row==0)
		lineBuffer2[row1][newPixelCol] = newPixel*newPixel;
	else
		lineBuffer2[row1][newPixelCol] = (lineBuffer2[row1][newPixelCol] - OldestValue) + newPixel*newPixel;

	int col;
	uint28 Oldest;
	Oldest = sq_buf[0];
	Loop_iibuf:for(col=0;col<23;col++){
#pragma HLS UNROLL factor=24
		sq_buf[col] = sq_buf[col+1]-Oldest;
	}
	sq_buf[23] = sq_buf[23]+lineBuffer2[row1][newPixelCol]-Oldest;
	//###########################################################################################
	if(Row<23||newPixelCol<23)
		return 0;
	else if(flag<2){
		return flag+1;
	}
	else{
		uint3 res;
		ap_fixed<20,14> stddev2;
		ap_fixed<20,14> stddev;
		ap_fixed<18,9> SUM;
		ap_fixed<28,18> SUM2;
		/* float Mean = (float)II[23][23]/576;
		float Mean2 = Mean*Mean;
		float SqMean = (float)sq_buf[23]/576;
		float Stddev2 = SqMean-Mean2;
		stddev2 = (ap_fixed<20,14>)Stddev2; */
		SUM = (II[23][23]/576);
		SUM2 = SUM*SUM;
		stddev2 = (ap_fixed<20,14>)((sq_buf[23]/576)-SUM2);
		stddev = int_sqrt(stddev2);

		coef_type stageTmp = 0.0;
		coef_type stagetmp[10] = {0.0};
		coef_type stageSum = 0.0;

		// stage 1

		uint18 A1,B1,C1,D1;
		uint18 A2,B2,C2,D2;
		uint18 A3,B3,C3,D3;
		uint18 A4,B4,C4,D4;
		uint18 A5,B5,C5,D5;
		uint18 A6,B6,C6,D6;
		uint18 A7,B7,C7,D7;
		uint18 A8,B8,C8,D8;
		uint18 A9,B9,C9,D9;
		uint18 A10,B10,C10,D10;
		uint18 A11,B11,C11,D11;
		uint18 A12,B12,C12,D12;
		uint18 A13,B13,C13,D13;
		uint18 A14,B14,C14,D14;
		uint18 A15,B15,C15,D15;
		uint18 A16,B16,C16,D16;
		uint18 A17,B17,C17,D17;
		uint18 A18,B18,C18,D18;

		ap_int<19> sumA1 , sumB1 ;
		ap_int<19> sumA2 , sumB2 ;
		ap_int<19> sumA3 , sumB3 ;
		ap_int<19> sumA4 , sumB4 ;
		ap_int<19> sumA5 , sumB5 ;
		ap_int<19> sumA6 , sumB6 ;
		ap_int<19> sumA7 , sumB7 ;
		ap_int<19> sumA8 , sumB8 ;
		ap_int<19> sumA9 , sumB9 ;
		ap_int<19> sumA10, sumB10;
		ap_int<19> sumA11, sumB11;
		ap_int<19> sumA12, sumB12;
		ap_int<19> sumA13, sumB13;
		ap_int<19> sumA14, sumB14;
		ap_int<19> sumA15, sumB15;
		ap_int<19> sumA16, sumB16;
		ap_int<19> sumA17, sumB17;
		ap_int<19> sumA18, sumB18;

		ap_fixed<25,15> sum[9];

		A1  = II[3][5]  ;	B1  = II[3][17]	  ;	  C1  = II[12][5]  ; D1  = II[12][17];
		A2  = II[6][5]  ;	B2  = II[6][17]   ;   C2  = II[9][5]   ; D2  = II[9][17] ;
		A3  = II[3][5]  ;	B3  = II[3][17]   ;   C3  = II[10][5]  ; D3  = II[10][17];
		A4  = II[3][9]  ;	B4  = II[3][13]   ;   C4  = II[10][9]  ; D4  = II[10][13];
		A5  = II[8][2]  ;	B5  = II[8][20]   ;   C5  = II[17][2]  ; D5  = II[17][20];
		A6  = II[11][2] ;	B6  = II[11][20]  ;   C6  = II[14][2]  ; D6  = II[14][20];
		A7  = II[17][7] ;	B7  = II[17][16]  ;   C7  = II[23][7]  ; D7  = II[23][16];
		A8  = II[19][7] ;	B8  = II[19][16]  ;   C8  = II[21][7]  ; D8  = II[21][16];
		A9  = II[4][2]  ;	B9  = II[4][6]    ;   C9  = II[23][2]  ; D9  = II[23][6] ;
		A10 = II[4][4]  ;	B10 = II[4][6]    ;   C10 = II[23][4]  ; D10 = II[23][6] ;
		A11 = II[4][5]  ;	B11 = II[4][17]   ;   C11 = II[20][5]  ; D11 = II[20][17];
		A12 = II[12][5] ;	B12 = II[12][17]  ;   C12 = II[20][5]  ; D12 = II[20][17];
		A13 = II[7][4]  ;	B13 = II[7][16]   ;   C13 = II[13][4]  ; D13 = II[13][16];
		A14 = II[10][4] ;	B14 = II[10][16]  ;   C14 = II[13][4]  ; D14 = II[13][16];
		A15 = II[13][10];	B15 = II[13][14]  ;   C15 = II[23][10] ; D15 = II[23][14];
		A16 = II[18][10];	B16 = II[18][14]  ;   C16 = II[23][10] ; D16 = II[23][14];
		A17 = 0         ;	B17 = 0           ;   C17 = II[5][3]   ; D17 = II[5][10] ;
		A18 = II[2][3]  ;	B18 = II[2][10]   ;   C18 = II[5][3]   ; D18 = II[5][10] ;


		sumA1 = D1 -C1 ; sumB1  = A1 -B1 ;
		sumA2 = D2 -C2 ; sumB2  = A2 -B2 ;
		sumA3 = D3 -C3 ; sumB3  = A3 -B3 ;
		sumA4 = D4 -C4 ; sumB4  = A4 -B4 ;
		sumA5 = D5 -C5 ; sumB5  = A5 -B5 ;
		sumA6 = D6 -C6 ; sumB6  = A6 -B6 ;
		sumA7 = D7 -C7 ; sumB7  = A7 -B7 ;
		sumA8 = D8 -C8 ; sumB8  = A8 -B8 ;
		sumA9 = D9 -C9 ; sumB9  = A9 -B9 ;
		sumA10= D10-C10; sumB10 = A10-B10;
		sumA11= D11-C11; sumB11 = A11-B11;
		sumA12= D12-C12; sumB12 = A12-B12;
		sumA13= D13-C13; sumB13 = A13-B13;
		sumA14= D14-C14; sumB14 = A14-B14;
		sumA15= D15-C15; sumB15 = A15-B15;
		sumA16= D16-C16; sumB16 = A16-B16;
		sumA17= D17-C17; sumB17 = A17-B17;
		sumA18= D18-C18; sumB18 = A18-B18;

		sum[0] = (ap_fixed<25,17>)(((sumA2 + sumB2 ) * 3)- (sumA1 + sumB1 ))/400;
		sum[1] = (ap_fixed<25,17>)(((sumA4 + sumB4 ) * 3)- (sumA3 + sumB3 ))/400;
		sum[2] = (ap_fixed<25,17>)(((sumA6 + sumB6 ) * 3)- (sumA5 + sumB5 ))/400;
		sum[3] = (ap_fixed<25,17>)(((sumA8 + sumB8 ) * 3)- (sumA7 + sumB7 ))/400;
		sum[4] = (ap_fixed<25,17>)(((sumA10+ sumB10) * 2)- (sumA9 + sumB9 ))/400;
		sum[5] = (ap_fixed<25,17>)(((sumA12+ sumB12) * 2)- (sumA11+ sumB11))/400;
		sum[6] = (ap_fixed<25,17>)(((sumA14+ sumB14) * 2)- (sumA13+ sumB13))/400;
		sum[7] = (ap_fixed<25,17>)(((sumA16+ sumB16) * 2)- (sumA15+ sumB15))/400;
		sum[8] = (ap_fixed<25,17>)(((sumA18+ sumB18) * 2)- (sumA17+ sumB17))/400;

		add_loop: for(int i=0; i<9; i++){
	#pragma HLS UNROLL factor=9
			if(sum[i]<(NodeThresh[i]*stddev))
				stageTmp+=lvl[i];
			else
				stageTmp+=rvl[i];
		}
		if(stageTmp<stageThresh[0])
			res = 0;
		else
			res = 1;

		uint3 res2;

		ap_fixed<25,15> sum_2[16];
		coef_type stageTmp2 = 0.0;

		uint18 A1_0, B1_0, C1_0, D1_0;
		uint18 A1_1, B1_1, C1_1, D1_1;
		uint18 A2_0, B2_0, C2_0, D2_0;
		uint18 A2_1, B2_1, C2_1, D2_1;
		uint18 A3_0, B3_0, C3_0, D3_0;
		uint18 A3_1, B3_1, C3_1, D3_1;
		uint18 A4_0, B4_0, C4_0, D4_0;
		uint18 A4_1, B4_1, C4_1, D4_1;
		uint18 A5_0, B5_0, C5_0, D5_0;
		uint18 A5_1, B5_1, C5_1, D5_1;
		uint18 A6_0, B6_0, C6_0, D6_0;
		uint18 A6_1, B6_1, C6_1, D6_1;
		uint18 A7_0, B7_0, C7_0, D7_0;
		uint18 A7_1, B7_1, C7_1, D7_1;
		uint18 A8_0, B8_0, C8_0, D8_0;
		uint18 A8_1, B8_1, C8_1, D8_1;
		uint18 A9_0, B9_0, C9_0, D9_0;
		uint18 A9_1, B9_1, C9_1, D9_1;
		uint18 A10_0, B10_0, C10_0, D10_0;
		uint18 A10_1, B10_1, C10_1, D10_1;
		uint18 A11_0, B11_0, C11_0, D11_0;
		uint18 A11_1, B11_1, C11_1, D11_1;
		uint18 A12_0, B12_0, C12_0, D12_0;
		uint18 A12_1, B12_1, C12_1, D12_1;
		uint18 A13_0, B13_0, C13_0, D13_0;
		uint18 A13_1, B13_1, C13_1, D13_1;
		uint18 A14_0, B14_0, C14_0, D14_0;
		uint18 A14_1, B14_1, C14_1, D14_1;
		uint18 A15_0, B15_0, C15_0, D15_0;
		uint18 A15_1, B15_1, C15_1, D15_1;
		uint18 A16_0, B16_0, C16_0, D16_0;
		uint18 A16_1, B16_1, C16_1, D16_1;

		ap_int<19> sumA1_0, sumB1_0;
		ap_int<19> sumA1_1, sumB1_1;
		ap_int<19> sumA2_0, sumB2_0;
		ap_int<19> sumA2_1, sumB2_1;
		ap_int<19> sumA3_0, sumB3_0;
		ap_int<19> sumA3_1, sumB3_1;
		ap_int<19> sumA4_0, sumB4_0;
		ap_int<19> sumA4_1, sumB4_1;
		ap_int<19> sumA5_0, sumB5_0;
		ap_int<19> sumA5_1, sumB5_1;
		ap_int<19> sumA6_0, sumB6_0;
		ap_int<19> sumA6_1, sumB6_1;
		ap_int<19> sumA7_0, sumB7_0;
		ap_int<19> sumA7_1, sumB7_1;
		ap_int<19> sumA8_0, sumB8_0;
		ap_int<19> sumA8_1, sumB8_1;
		ap_int<19> sumA9_0, sumB9_0;
		ap_int<19> sumA9_1, sumB9_1;
		ap_int<19> sumA10_0, sumB10_0;
		ap_int<19> sumA10_1, sumB10_1;
		ap_int<19> sumA11_0, sumB11_0;
		ap_int<19> sumA11_1, sumB11_1;
		ap_int<19> sumA12_0, sumB12_0;
		ap_int<19> sumA12_1, sumB12_1;
		ap_int<19> sumA13_0, sumB13_0;
		ap_int<19> sumA13_1, sumB13_1;
		ap_int<19> sumA14_0, sumB14_0;
		ap_int<19> sumA14_1, sumB14_1;
		ap_int<19> sumA15_0, sumB15_0;
		ap_int<19> sumA15_1, sumB15_1;
		ap_int<19> sumA16_0, sumB16_0;
		ap_int<19> sumA16_1, sumB16_1;

		A1_0=II[5][5];		B1_0=II[5][17];		C1_0=II[11][5];		D1_0=II[11][17];
		A1_1=II[7][5];		B1_1=II[7][17];		C1_1=II[9][5];		D1_1=II[9][17];
		A2_0=II[3][5];		B2_0=II[3][17];		C2_0=II[10][5];		D2_0=II[10][17];
		A2_1=II[3][9];		B2_1=II[3][13];		C2_1=II[10][9];		D2_1=II[10][13];
		A3_0=II[7][0];		B3_0=II[7][19];		C3_0=II[19][0];		D3_0=II[19][19];
		A3_1=II[11][0];		B3_1=II[11][19];	C3_1=II[15][0];		D3_1=II[15][19];
		A4_0=0;				B4_0=II[1][23];		C4_0=0;				D4_0=II[4][23];
		A4_1=II[1][7];		B4_1=II[1][15];		C4_1=II[4][7];		D4_1=II[4][15];
		A5_0=II[8][8];		B5_0=II[8][14];		C5_0=II[23][8];		D5_0=II[23][14];
		A5_1=II[13][8];		B5_1=II[13][14];	C5_1=II[18][8];		D5_1=II[18][14];
		A6_0=II[5][4];		B6_0=II[5][18];		C6_0=II[15][4];		D6_0=II[15][18];
		A6_1=II[10][4];		B6_1=II[10][18];	C6_1=II[15][4];		D6_1=II[15][18];
		A7_0=0;				B7_0=0;				C7_0=II[8][4];		D7_0=II[8][18];
		A7_1=II[2][4];		B7_1=II[2][18];		C7_1=II[5][4];		D7_1=II[5][18];
		A8_0=II[10][12];	B8_0=II[10][21];	C8_0=II[16][12];	D8_0=II[16][21];
		A8_1=II[10][15];	B8_1=II[10][18];	C8_1=II[16][15];	D8_1=II[16][18];
		A9_0=II[4][6];		B9_0=II[4][12];		C9_0=II[14][6];		D9_0=II[14][12];
		A9_1=II[4][8];		B9_1=II[4][10];		C9_1=II[14][8];		D9_1=II[14][10];
		A10_0=II[7][9];		B10_0=II[7][15];	C10_0=II[17][9];	D10_0=II[17][15];
		A10_1=II[7][11];	B10_1=II[7][13];	C10_1=II[17][11];	D10_1=II[17][13];
		A11_0=II[4][1];		B11_0=II[4][5];		C11_0=II[13][1];	D11_0=II[13][5];
		A11_1=II[4][3];		B11_1=II[4][5];		C11_1=II[13][3];	D11_1=II[13][5];
		A12_0=0;			B12_0=0;			C12_0=II[10][17];	D12_0=II[10][23];
		A12_1=0;			B12_1=0;			C12_1=II[10][19];	D12_1=II[10][21];
		A13_0=0;			B13_0=II[5][23];	C13_0=0;			D13_0=II[18][23];
		A13_1=II[5][7];		B13_1=II[5][15];	C13_1=II[18][7];	D13_1=II[18][15];
		A14_0=II[5][8];		B14_0=II[5][14];	C14_0=II[14][8];	D14_0=II[14][14];
		A14_1=II[5][10];	B14_1=II[5][12];	C14_1=II[14][10];	D14_1=II[14][12];
		A15_0=II[17][6];	B15_0=II[17][16];	C15_0=II[23][6];	D15_0=II[23][16];
		A15_1=II[19][6];	B15_1=II[19][16];	C15_1=II[21][6];	D15_1=II[21][16];
		A16_0=II[6][4];		B16_0=II[6][18];	C16_0=II[18][4];	D16_0=II[18][18];
		A16_1=II[12][4];	B16_1=II[12][18];	C16_1=II[18][4];	D16_1=II[18][18];

		sumA1_0=D1_0-C1_0;	sumB1_0=A1_0-B1_0;
		sumA1_1=D1_1-C1_1;	sumB1_1=A1_1-B1_1;
		sumA2_0=D2_0-C2_0;	sumB2_0=A2_0-B2_0;
		sumA2_1=D2_1-C2_1;	sumB2_1=A2_1-B2_1;
		sumA3_0=D3_0-C3_0;	sumB3_0=A3_0-B3_0;
		sumA3_1=D3_1-C3_1;	sumB3_1=A3_1-B3_1;
		sumA4_0=D4_0-C4_0;	sumB4_0=A4_0-B4_0;
		sumA4_1=D4_1-C4_1;	sumB4_1=A4_1-B4_1;
		sumA5_0=D5_0-C5_0;	sumB5_0=A5_0-B5_0;
		sumA5_1=D5_1-C5_1;	sumB5_1=A5_1-B5_1;
		sumA6_0=D6_0-C6_0;	sumB6_0=A6_0-B6_0;
		sumA6_1=D6_1-C6_1;	sumB6_1=A6_1-B6_1;
		sumA7_0=D7_0-C7_0;	sumB7_0=A7_0-B7_0;
		sumA7_1=D7_1-C7_1;	sumB7_1=A7_1-B7_1;
		sumA8_0=D8_0-C8_0;	sumB8_0=A8_0-B8_0;
		sumA8_1=D8_1-C8_1;	sumB8_1=A8_1-B8_1;
		sumA9_0=D9_0-C9_0;	sumB9_0=A9_0-B9_0;
		sumA9_1=D9_1-C9_1;	sumB9_1=A9_1-B9_1;
		sumA10_0=D10_0-C10_0;	sumB10_0=A10_0-B10_0;
		sumA10_1=D10_1-C10_1;	sumB10_1=A10_1-B10_1;
		sumA11_0=D11_0-C11_0;	sumB11_0=A11_0-B11_0;
		sumA11_1=D11_1-C11_1;	sumB11_1=A11_1-B11_1;
		sumA12_0=D12_0-C12_0;	sumB12_0=A12_0-B12_0;
		sumA12_1=D12_1-C12_1;	sumB12_1=A12_1-B12_1;
		sumA13_0=D13_0-C13_0;	sumB13_0=A13_0-B13_0;
		sumA13_1=D13_1-C13_1;	sumB13_1=A13_1-B13_1;
		sumA14_0=D14_0-C14_0;	sumB14_0=A14_0-B14_0;
		sumA14_1=D14_1-C14_1;	sumB14_1=A14_1-B14_1;
		sumA15_0=D15_0-C15_0;	sumB15_0=A15_0-B15_0;
		sumA15_1=D15_1-C15_1;	sumB15_1=A15_1-B15_1;
		sumA16_0=D16_0-C16_0;	sumB16_0=A16_0-B16_0;
		sumA16_1=D16_1-C16_1;	sumB16_1=A16_1-B16_1;

		sum_2[0] = (ap_fixed<25,17>)(((sumA1_1+sumB1_1) * 3)	-(sumA1_0+sumB1_0)	)/400;
		sum_2[1] = (ap_fixed<25,17>)(((sumA2_1+sumB2_1) * 3)	-(sumA2_0+sumB2_0)	)/400;
		sum_2[2] = (ap_fixed<25,17>)(((sumA3_1+sumB3_1) * 3)	-(sumA3_0+sumB3_0)	)/400;
		sum_2[3] = (ap_fixed<25,17>)(((sumA4_1+sumB4_1) * 3)	-(sumA4_0+sumB4_0)	)/400;
		sum_2[4] = (ap_fixed<25,17>)(((sumA5_1+sumB5_1) * 3)	-(sumA5_0+sumB5_0)	)/400;
		sum_2[5] = (ap_fixed<25,17>)(((sumA6_1+sumB6_1) * 2)	-(sumA6_0+sumB6_0)	)/400;
		sum_2[6] = (ap_fixed<25,17>)(((sumA7_1+sumB7_1) * 3)	-(sumA7_0+sumB7_0)	)/400;
		sum_2[7] = (ap_fixed<25,17>)(((sumA8_1+sumB8_1) * 3)	-(sumA8_0+sumB8_0)	)/400;
		sum_2[8] = (ap_fixed<25,17>)(((sumA9_1+sumB9_1) * 3)	-(sumA9_0+sumB9_0)	)/400;
		sum_2[9] = (ap_fixed<25,17>)(((sumA10_1+sumB10_1) * 3)	-(sumA10_0+sumB10_0)	)/400;
		sum_2[10] = (ap_fixed<25,17>)(((sumA11_1+sumB11_1) * 2)	-(sumA11_0+sumB11_0)	)/400;
		sum_2[11] = (ap_fixed<25,17>)(((sumA12_1+sumB12_1) * 3)	-(sumA12_0+sumB12_0)	)/400;
		sum_2[12] = (ap_fixed<25,17>)(((sumA13_1+sumB13_1) * 3)	-(sumA13_0+sumB13_0)	)/400;
		sum_2[13] = (ap_fixed<25,17>)(((sumA14_1+sumB14_1) * 3)	-(sumA14_0+sumB14_0)	)/400;
		sum_2[14] = (ap_fixed<25,17>)(((sumA15_1+sumB15_1) * 3)	-(sumA15_0+sumB15_0)	)/400;
		sum_2[15] = (ap_fixed<25,17>)(((sumA16_1+sumB16_1) * 2)	-(sumA16_0+sumB16_0)	)/400;

		add_loop2: for(int i=0; i<16; i++){
		#pragma HLS UNROLL factor=16
			if(sum_2[i]<(NodeThresh2[i]*stddev))
				stageTmp2+=lvl2[i];
			else
				stageTmp2+=rvl2[i];
		}
		if(stageTmp2<stageThresh[1])
			res2 = 0;
		else
			res2 = 1;

		int res3;

		ap_fixed<25,15> sum_3[27];
		coef_type stageTmp3 = 0.0;

		uint18 A3_1_0, B3_1_0, C3_1_0, D3_1_0;
		uint18 A3_1_1, B3_1_1, C3_1_1, D3_1_1;
		uint18 A3_2_0, B3_2_0, C3_2_0, D3_2_0;
		uint18 A3_2_1, B3_2_1, C3_2_1, D3_2_1;
		uint18 A3_3_0, B3_3_0, C3_3_0, D3_3_0;
		uint18 A3_3_1, B3_3_1, C3_3_1, D3_3_1;
		uint18 A3_4_0, B3_4_0, C3_4_0, D3_4_0;
		uint18 A3_4_1, B3_4_1, C3_4_1, D3_4_1;
		uint18 A3_5_0, B3_5_0, C3_5_0, D3_5_0;
		uint18 A3_5_1, B3_5_1, C3_5_1, D3_5_1;
		uint18 A3_6_0, B3_6_0, C3_6_0, D3_6_0;
		uint18 A3_6_1, B3_6_1, C3_6_1, D3_6_1;
		uint18 A3_7_0, B3_7_0, C3_7_0, D3_7_0;
		uint18 A3_7_1, B3_7_1, C3_7_1, D3_7_1;
		uint18 A3_8_0, B3_8_0, C3_8_0, D3_8_0;
		uint18 A3_8_1, B3_8_1, C3_8_1, D3_8_1;
		uint18 A3_9_0, B3_9_0, C3_9_0, D3_9_0;
		uint18 A3_9_1, B3_9_1, C3_9_1, D3_9_1;
		uint18 A3_10_0, B3_10_0, C3_10_0, D3_10_0;
		uint18 A3_10_1, B3_10_1, C3_10_1, D3_10_1;
		uint18 A3_11_0, B3_11_0, C3_11_0, D3_11_0;
		uint18 A3_11_1, B3_11_1, C3_11_1, D3_11_1;
		uint18 A3_11_2, B3_11_2, C3_11_2, D3_11_2;
		uint18 A3_12_0, B3_12_0, C3_12_0, D3_12_0;
		uint18 A3_12_1, B3_12_1, C3_12_1, D3_12_1;
		uint18 A3_13_0, B3_13_0, C3_13_0, D3_13_0;
		uint18 A3_13_1, B3_13_1, C3_13_1, D3_13_1;
		uint18 A3_14_0, B3_14_0, C3_14_0, D3_14_0;
		uint18 A3_14_1, B3_14_1, C3_14_1, D3_14_1;
		uint18 A3_15_0, B3_15_0, C3_15_0, D3_15_0;
		uint18 A3_15_1, B3_15_1, C3_15_1, D3_15_1;
		uint18 A3_16_0, B3_16_0, C3_16_0, D3_16_0;
		uint18 A3_16_1, B3_16_1, C3_16_1, D3_16_1;
		uint18 A3_17_0, B3_17_0, C3_17_0, D3_17_0;
		uint18 A3_17_1, B3_17_1, C3_17_1, D3_17_1;
		uint18 A3_18_0, B3_18_0, C3_18_0, D3_18_0;
		uint18 A3_18_1, B3_18_1, C3_18_1, D3_18_1;
		uint18 A3_19_0, B3_19_0, C3_19_0, D3_19_0;
		uint18 A3_19_1, B3_19_1, C3_19_1, D3_19_1;
		uint18 A3_20_0, B3_20_0, C3_20_0, D3_20_0;
		uint18 A3_20_1, B3_20_1, C3_20_1, D3_20_1;
		uint18 A3_21_0, B3_21_0, C3_21_0, D3_21_0;
		uint18 A3_21_1, B3_21_1, C3_21_1, D3_21_1;
		uint18 A3_22_0, B3_22_0, C3_22_0, D3_22_0;
		uint18 A3_22_1, B3_22_1, C3_22_1, D3_22_1;
		uint18 A3_23_0, B3_23_0, C3_23_0, D3_23_0;
		uint18 A3_23_1, B3_23_1, C3_23_1, D3_23_1;
		uint18 A3_24_0, B3_24_0, C3_24_0, D3_24_0;
		uint18 A3_24_1, B3_24_1, C3_24_1, D3_24_1;
		uint18 A3_24_2, B3_24_2, C3_24_2, D3_24_2;
		uint18 A3_25_0, B3_25_0, C3_25_0, D3_25_0;
		uint18 A3_25_1, B3_25_1, C3_25_1, D3_25_1;
		uint18 A3_26_0, B3_26_0, C3_26_0, D3_26_0;
		uint18 A3_26_1, B3_26_1, C3_26_1, D3_26_1;
		uint18 A3_27_0, B3_27_0, C3_27_0, D3_27_0;
		uint18 A3_27_1, B3_27_1, C3_27_1, D3_27_1;

		ap_int<19> sumA3_1_0, sumB3_1_0;
		ap_int<19> sumA3_1_1, sumB3_1_1;
		ap_int<19> sumA3_2_0, sumB3_2_0;
		ap_int<19> sumA3_2_1, sumB3_2_1;
		ap_int<19> sumA3_3_0, sumB3_3_0;
		ap_int<19> sumA3_3_1, sumB3_3_1;
		ap_int<19> sumA3_4_0, sumB3_4_0;
		ap_int<19> sumA3_4_1, sumB3_4_1;
		ap_int<19> sumA3_5_0, sumB3_5_0;
		ap_int<19> sumA3_5_1, sumB3_5_1;
		ap_int<19> sumA3_6_0, sumB3_6_0;
		ap_int<19> sumA3_6_1, sumB3_6_1;
		ap_int<19> sumA3_7_0, sumB3_7_0;
		ap_int<19> sumA3_7_1, sumB3_7_1;
		ap_int<19> sumA3_8_0, sumB3_8_0;
		ap_int<19> sumA3_8_1, sumB3_8_1;
		ap_int<19> sumA3_9_0, sumB3_9_0;
		ap_int<19> sumA3_9_1, sumB3_9_1;
		ap_int<19> sumA3_10_0, sumB3_10_0;
		ap_int<19> sumA3_10_1, sumB3_10_1;
		ap_int<19> sumA3_11_0, sumB3_11_0;
		ap_int<19> sumA3_11_1, sumB3_11_1;
		ap_int<19> sumA3_11_2, sumB3_11_2;
		ap_int<19> sumA3_12_0, sumB3_12_0;
		ap_int<19> sumA3_12_1, sumB3_12_1;
		ap_int<19> sumA3_13_0, sumB3_13_0;
		ap_int<19> sumA3_13_1, sumB3_13_1;
		ap_int<19> sumA3_14_0, sumB3_14_0;
		ap_int<19> sumA3_14_1, sumB3_14_1;
		ap_int<19> sumA3_15_0, sumB3_15_0;
		ap_int<19> sumA3_15_1, sumB3_15_1;
		ap_int<19> sumA3_16_0, sumB3_16_0;
		ap_int<19> sumA3_16_1, sumB3_16_1;
		ap_int<19> sumA3_17_0, sumB3_17_0;
		ap_int<19> sumA3_17_1, sumB3_17_1;
		ap_int<19> sumA3_18_0, sumB3_18_0;
		ap_int<19> sumA3_18_1, sumB3_18_1;
		ap_int<19> sumA3_19_0, sumB3_19_0;
		ap_int<19> sumA3_19_1, sumB3_19_1;
		ap_int<19> sumA3_20_0, sumB3_20_0;
		ap_int<19> sumA3_20_1, sumB3_20_1;
		ap_int<19> sumA3_21_0, sumB3_21_0;
		ap_int<19> sumA3_21_1, sumB3_21_1;
		ap_int<19> sumA3_22_0, sumB3_22_0;
		ap_int<19> sumA3_22_1, sumB3_22_1;
		ap_int<19> sumA3_23_0, sumB3_23_0;
		ap_int<19> sumA3_23_1, sumB3_23_1;
		ap_int<19> sumA3_24_0, sumB3_24_0;
		ap_int<19> sumA3_24_1, sumB3_24_1;
		ap_int<19> sumA3_24_2, sumB3_24_2;
		ap_int<19> sumA3_25_0, sumB3_25_0;
		ap_int<19> sumA3_25_1, sumB3_25_1;
		ap_int<19> sumA3_26_0, sumB3_26_0;
		ap_int<19> sumA3_26_1, sumB3_26_1;
		ap_int<19> sumA3_27_0, sumB3_27_0;
		ap_int<19> sumA3_27_1, sumB3_27_1;

		A3_1_0=0;				B3_1_0=II[2][23];		C3_1_0=0;				D3_1_0=II[5][23];
		A3_1_1=II[2][7];		B3_1_1=II[2][15];		C3_1_1=II[5][7];		D3_1_1=II[5][15];
		A3_2_0=II[7][4];		B3_2_0=II[7][19];		C3_2_0=II[13][4];		D3_2_0=II[13][19];
		A3_2_1=II[10][4];		B3_2_1=II[10][19];		C3_2_1=II[13][4];		D3_2_1=II[13][19];
		A3_3_0=II[5][8];		B3_3_0=II[5][13];		C3_3_0=II[19][8];		D3_3_0=II[19][13];
		A3_3_1=II[12][8];		B3_3_1=II[12][13];		C3_3_1=II[19][8];		D3_3_1=II[19][13];
		A3_4_0=II[4][8];		B3_4_0=II[4][14];		C3_4_0=II[14][8];		D3_4_0=II[14][14];
		A3_4_1=II[4][10];		B3_4_1=II[4][12];		C3_4_1=II[14][10];		D3_4_1=II[14][12];
		A3_5_0=II[5][5];		B3_5_0=II[5][8];		C3_5_0=II[17][5];		D3_5_0=II[17][8];
		A3_5_1=II[11][5];		B3_5_1=II[11][8];		C3_5_1=II[17][5];		D3_5_1=II[17][8];
		A3_6_0=II[20][2];		B3_6_0=II[20][20];		C3_6_0=II[23][2];		D3_6_0=II[23][20];
		A3_6_1=II[20][8];		B3_6_1=II[20][14];		C3_6_1=II[23][8];		D3_6_1=II[23][14];
		A3_7_0=II[5][4];		B3_7_0=II[5][17];		C3_7_0=II[11][4];		D3_7_0=II[11][17];
		A3_7_1=II[7][4];		B3_7_1=II[7][17];		C3_7_1=II[9][4];		D3_7_1=II[9][17];
		A3_8_0=II[0][17];		B3_8_0=II[0][23];		C3_8_0=II[15][17];		D3_8_0=II[15][23];
		A3_8_1=II[0][17];		B3_8_1=II[0][20];		C3_8_1=II[15][17];		D3_8_1=II[15][20];
		A3_9_0=II[0][0];		B3_9_0=II[0][6];		C3_9_0=II[15][0];		D3_9_0=II[15][6];
		A3_9_1=II[0][3];		B3_9_1=II[0][6];		C3_9_1=II[15][3];		D3_9_1=II[15][6];
		A3_10_0=0;				B3_10_0=II[7][23];		C3_10_0=0;				D3_10_0=II[22][23];
		A3_10_1=II[7][7];		B3_10_1=II[7][15];		C3_10_1=II[22][7];		D3_10_1=II[22][15];
		A3_11_0=II[5][4];		B3_11_0=II[5][18];		C3_11_0=II[17][4];		D3_11_0=II[17][18];
		A3_11_1=II[5][4];		B3_11_1=II[5][11];		C3_11_1=II[11][4];		D3_11_1=II[11][11];
		A3_11_2=II[11][11];		B3_11_2=II[11][18];		C3_11_2=II[17][11];		D3_11_2=II[17][18];
		A3_12_0=II[11][1];		B3_12_0=II[11][22];		C3_12_0=II[23][1];		D3_12_0=II[23][22];
		A3_12_1=II[15][1];		B3_12_1=II[15][22];		C3_12_1=II[19][1];		D3_12_1=II[19][22];
		A3_13_0=II[0][7];		B3_13_0=II[0][11];		C3_13_0=II[10][7];		D3_13_0=II[10][11];
		A3_13_1=II[0][9];		B3_13_1=II[0][11];		C3_13_1=II[10][9];		D3_13_1=II[10][11];
		A3_14_0=II[12][1];		B3_14_0=II[12][21];		C3_14_0=II[22][1];		D3_14_0=II[22][21];
		A3_14_1=II[12][1];		B3_14_1=II[12][11];		C3_14_1=II[22][1];		D3_14_1=II[22][11];
		A3_15_0=0;				B3_15_0=II[0][5];		C3_15_0=0;				D3_15_0=II[13][5];
		A3_15_1=II[0][1];		B3_15_1=II[0][3];		C3_15_1=II[13][1];		D3_15_1=II[13][3];
		A3_16_0=II[1][19];		B3_16_0=II[1][23];		C3_16_0=II[14][19];		D3_16_0=II[14][23];
		A3_16_1=II[1][19];		B3_16_1=II[1][21];		C3_16_1=II[14][19];		D3_16_1=II[14][21];
		A3_17_0=0;				B3_17_0=II[4][21];		C3_17_0=0;				D3_17_0=II[23][21];
		A3_17_1=II[4][10];		B3_17_1=II[4][21];		C3_17_1=II[23][10];		D3_17_1=II[23][21];
		A3_18_0=II[3][17];		B3_18_0=II[3][23];		C3_18_0=II[12][17];		D3_18_0=II[12][23];
		A3_18_1=II[3][19];		B3_18_1=II[3][21];		C3_18_1=II[12][19];		D3_18_1=II[12][21];
		A3_19_0=0;				B3_19_0=II[2][5];		C3_19_0=0;				D3_19_0=II[13][5];
		A3_19_1=II[2][1];		B3_19_1=II[2][3];		C3_19_1=II[13][1];		D3_19_1=II[13][3];
		A3_20_0=II[0][11];		B3_20_0=II[0][15];		C3_20_0=II[9][11];		D3_20_0=II[9][15];
		A3_20_1=II[0][11];		B3_20_1=II[0][13];		C3_20_1=II[9][11];		D3_20_1=II[9][13];
		A3_21_0=0;				B3_21_0=II[5][18];		C3_21_0=0;				D3_21_0=II[8][18];
		A3_21_1=0;				B3_21_1=II[6][18];		C3_21_1=0;				D3_21_1=II[7][18];
		A3_22_0=II[0][11];		B3_22_0=II[0][15];		C3_22_0=II[9][11];		D3_22_0=II[9][15];
		A3_22_1=II[0][11];		B3_22_1=II[0][13];		C3_22_1=II[9][11];		D3_22_1=II[9][13];
		A3_23_0=II[0][7];		B3_23_0=II[0][11];		C3_23_0=II[9][7];		D3_23_0=II[9][11];
		A3_23_1=II[0][9];		B3_23_1=II[0][11];		C3_23_1=II[9][9];		D3_23_1=II[9][11];
		A3_24_0=II[4][4];		B3_24_0=II[4][18];		C3_24_0=II[18][4];		D3_24_0=II[18][18];
		A3_24_1=II[4][11];		B3_24_1=II[4][18];		C3_24_1=II[11][11];		D3_24_1=II[11][18];
		A3_24_2=II[11][4];		B3_24_2=II[11][11];		C3_24_2=II[18][4];		D3_24_2=II[18][11];
		A3_25_0=II[9][0];		B3_25_0=II[9][18];		C3_25_0=II[11][0];		D3_25_0=II[11][18];
		A3_25_1=II[10][0];		B3_25_1=II[10][18];		C3_25_1=II[11][0];		D3_25_1=II[11][18];
		A3_26_0=II[12][16];		B3_26_0=II[12][20];		C3_26_0=II[23][16];		D3_26_0=II[23][20];
		A3_26_1=II[12][16];		B3_26_1=II[12][18];		C3_26_1=II[23][16];		D3_26_1=II[23][18];
		A3_27_0=0;				B3_27_0=II[3][5];		C3_27_0=0;				D3_27_0=II[12][5];
		A3_27_1=0;				B3_27_1=II[6][5];		C3_27_1=0;				D3_27_1=II[9][5];

		sumA3_1_0=D3_1_0-C3_1_0;	sumB3_1_0=A3_1_0-B3_1_0;
		sumA3_1_1=D3_1_1-C3_1_1;	sumB3_1_1=A3_1_1-B3_1_1;
		sumA3_2_0=D3_2_0-C3_2_0;	sumB3_2_0=A3_2_0-B3_2_0;
		sumA3_2_1=D3_2_1-C3_2_1;	sumB3_2_1=A3_2_1-B3_2_1;
		sumA3_3_0=D3_3_0-C3_3_0;	sumB3_3_0=A3_3_0-B3_3_0;
		sumA3_3_1=D3_3_1-C3_3_1;	sumB3_3_1=A3_3_1-B3_3_1;
		sumA3_4_0=D3_4_0-C3_4_0;	sumB3_4_0=A3_4_0-B3_4_0;
		sumA3_4_1=D3_4_1-C3_4_1;	sumB3_4_1=A3_4_1-B3_4_1;
		sumA3_5_0=D3_5_0-C3_5_0;	sumB3_5_0=A3_5_0-B3_5_0;
		sumA3_5_1=D3_5_1-C3_5_1;	sumB3_5_1=A3_5_1-B3_5_1;
		sumA3_6_0=D3_6_0-C3_6_0;	sumB3_6_0=A3_6_0-B3_6_0;
		sumA3_6_1=D3_6_1-C3_6_1;	sumB3_6_1=A3_6_1-B3_6_1;
		sumA3_7_0=D3_7_0-C3_7_0;	sumB3_7_0=A3_7_0-B3_7_0;
		sumA3_7_1=D3_7_1-C3_7_1;	sumB3_7_1=A3_7_1-B3_7_1;
		sumA3_8_0=D3_8_0-C3_8_0;	sumB3_8_0=A3_8_0-B3_8_0;
		sumA3_8_1=D3_8_1-C3_8_1;	sumB3_8_1=A3_8_1-B3_8_1;
		sumA3_9_0=D3_9_0-C3_9_0;	sumB3_9_0=A3_9_0-B3_9_0;
		sumA3_9_1=D3_9_1-C3_9_1;	sumB3_9_1=A3_9_1-B3_9_1;
		sumA3_10_0=D3_10_0-C3_10_0;	sumB3_10_0=A3_10_0-B3_10_0;
		sumA3_10_1=D3_10_1-C3_10_1;	sumB3_10_1=A3_10_1-B3_10_1;
		sumA3_11_0=D3_11_0-C3_11_0;	sumB3_11_0=A3_11_0-B3_11_0;
		sumA3_11_1=D3_11_1-C3_11_1;	sumB3_11_1=A3_11_1-B3_11_1;
		sumA3_11_2=D3_11_2-C3_11_2;	sumB3_11_2=A3_11_2-B3_11_2;
		sumA3_12_0=D3_12_0-C3_12_0;	sumB3_12_0=A3_12_0-B3_12_0;
		sumA3_12_1=D3_12_1-C3_12_1;	sumB3_12_1=A3_12_1-B3_12_1;
		sumA3_13_0=D3_13_0-C3_13_0;	sumB3_13_0=A3_13_0-B3_13_0;
		sumA3_13_1=D3_13_1-C3_13_1;	sumB3_13_1=A3_13_1-B3_13_1;
		sumA3_14_0=D3_14_0-C3_14_0;	sumB3_14_0=A3_14_0-B3_14_0;
		sumA3_14_1=D3_14_1-C3_14_1;	sumB3_14_1=A3_14_1-B3_14_1;
		sumA3_15_0=D3_15_0-C3_15_0;	sumB3_15_0=A3_15_0-B3_15_0;
		sumA3_15_1=D3_15_1-C3_15_1;	sumB3_15_1=A3_15_1-B3_15_1;
		sumA3_16_0=D3_16_0-C3_16_0;	sumB3_16_0=A3_16_0-B3_16_0;
		sumA3_16_1=D3_16_1-C3_16_1;	sumB3_16_1=A3_16_1-B3_16_1;
		sumA3_17_0=D3_17_0-C3_17_0;	sumB3_17_0=A3_17_0-B3_17_0;
		sumA3_17_1=D3_17_1-C3_17_1;	sumB3_17_1=A3_17_1-B3_17_1;
		sumA3_18_0=D3_18_0-C3_18_0;	sumB3_18_0=A3_18_0-B3_18_0;
		sumA3_18_1=D3_18_1-C3_18_1;	sumB3_18_1=A3_18_1-B3_18_1;
		sumA3_19_0=D3_19_0-C3_19_0;	sumB3_19_0=A3_19_0-B3_19_0;
		sumA3_19_1=D3_19_1-C3_19_1;	sumB3_19_1=A3_19_1-B3_19_1;
		sumA3_20_0=D3_20_0-C3_20_0;	sumB3_20_0=A3_20_0-B3_20_0;
		sumA3_20_1=D3_20_1-C3_20_1;	sumB3_20_1=A3_20_1-B3_20_1;
		sumA3_21_0=D3_21_0-C3_21_0;	sumB3_21_0=A3_21_0-B3_21_0;
		sumA3_21_1=D3_21_1-C3_21_1;	sumB3_21_1=A3_21_1-B3_21_1;
		sumA3_22_0=D3_22_0-C3_22_0;	sumB3_22_0=A3_22_0-B3_22_0;
		sumA3_22_1=D3_22_1-C3_22_1;	sumB3_22_1=A3_22_1-B3_22_1;
		sumA3_23_0=D3_23_0-C3_23_0;	sumB3_23_0=A3_23_0-B3_23_0;
		sumA3_23_1=D3_23_1-C3_23_1;	sumB3_23_1=A3_23_1-B3_23_1;
		sumA3_24_0=D3_24_0-C3_24_0;	sumB3_24_0=A3_24_0-B3_24_0;
		sumA3_24_1=D3_24_1-C3_24_1;	sumB3_24_1=A3_24_1-B3_24_1;
		sumA3_24_2=D3_24_2-C3_24_2;	sumB3_24_2=A3_24_2-B3_24_2;
		sumA3_25_0=D3_25_0-C3_25_0;	sumB3_25_0=A3_25_0-B3_25_0;
		sumA3_25_1=D3_25_1-C3_25_1;	sumB3_25_1=A3_25_1-B3_25_1;
		sumA3_26_0=D3_26_0-C3_26_0;	sumB3_26_0=A3_26_0-B3_26_0;
		sumA3_26_1=D3_26_1-C3_26_1;	sumB3_26_1=A3_26_1-B3_26_1;
		sumA3_27_0=D3_27_0-C3_27_0;	sumB3_27_0=A3_27_0-B3_27_0;
		sumA3_27_1=D3_27_1-C3_27_1;	sumB3_27_1=A3_27_1-B3_27_1;

		sum_3[0] = (ap_fixed<25,17>)(((sumA3_1_1+sumB3_1_1) * 3)	-(sumA3_1_0+sumB3_1_0)	)/400;
		sum_3[1] = (ap_fixed<25,17>)(((sumA3_2_1+sumB3_2_1) * 2)	-(sumA3_2_0+sumB3_2_0)	)/400;
		sum_3[2] = (ap_fixed<25,17>)(((sumA3_3_1+sumB3_3_1) * 2)	-(sumA3_3_0+sumB3_3_0)	)/400;
		sum_3[3] = (ap_fixed<25,17>)(((sumA3_4_1+sumB3_4_1) * 3)	-(sumA3_4_0+sumB3_4_0)	)/400;
		sum_3[4] = (ap_fixed<25,17>)(((sumA3_5_1+sumB3_5_1) * 2)	-(sumA3_5_0+sumB3_5_0)	)/400;
		sum_3[5] = (ap_fixed<25,17>)(((sumA3_6_1+sumB3_6_1) * 3)	-(sumA3_6_0+sumB3_6_0)	)/400;
		sum_3[6] = (ap_fixed<25,17>)(((sumA3_7_1+sumB3_7_1) * 3)	-(sumA3_7_0+sumB3_7_0)	)/400;
		sum_3[7] = (ap_fixed<25,17>)(((sumA3_8_1+sumB3_8_1) * 2)	-(sumA3_8_0+sumB3_8_0)	)/400;
		sum_3[8] = (ap_fixed<25,17>)(((sumA3_9_1+sumB3_9_1) * 2)	-(sumA3_9_0+sumB3_9_0)	)/400;
		sum_3[9] = (ap_fixed<25,17>)(((sumA3_10_1+sumB3_10_1) * 3)	-(sumA3_10_0+sumB3_10_0)	)/400;
		sum_3[10] = (ap_fixed<25,17>)(((sumA3_11_2+sumB3_11_2) * 2)	+((sumA3_11_1+sumB3_11_1) * 2)	-(sumA3_11_0+sumB3_11_0)	)/400;
		sum_3[11] = (ap_fixed<25,17>)(((sumA3_12_1+sumB3_12_1) * 3)	-(sumA3_12_0+sumB3_12_0)	)/400;
		sum_3[12] = (ap_fixed<25,17>)(((sumA3_13_1+sumB3_13_1) * 2)	-(sumA3_13_0+sumB3_13_0)	)/400;
		sum_3[13] = (ap_fixed<25,17>)(((sumA3_14_1+sumB3_14_1) * 2)	-(sumA3_14_0+sumB3_14_0)	)/400;
		sum_3[14] = (ap_fixed<25,17>)(((sumA3_15_1+sumB3_15_1) * 3)	-(sumA3_15_0+sumB3_15_0)	)/400;
		sum_3[15] = (ap_fixed<25,17>)(((sumA3_16_1+sumB3_16_1) * 2)	-(sumA3_16_0+sumB3_16_0)	)/400;
		sum_3[16] = (ap_fixed<25,17>)(((sumA3_17_1+sumB3_17_1) * 2)	-(sumA3_17_0+sumB3_17_0)	)/400;
		sum_3[17] = (ap_fixed<25,17>)(((sumA3_18_1+sumB3_18_1) * 3)	-(sumA3_18_0+sumB3_18_0)	)/400;
		sum_3[18] = (ap_fixed<25,17>)(((sumA3_19_1+sumB3_19_1) * 3)	-(sumA3_19_0+sumB3_19_0)	)/400;
		sum_3[19] = (ap_fixed<25,17>)(((sumA3_20_1+sumB3_20_1) * 2)	-(sumA3_20_0+sumB3_20_0)	)/400;
		sum_3[20] = (ap_fixed<25,17>)(((sumA3_21_1+sumB3_21_1) * 3)	-(sumA3_21_0+sumB3_21_0)	)/400;
		sum_3[21] = (ap_fixed<25,17>)(((sumA3_22_1+sumB3_22_1) * 2)	-(sumA3_22_0+sumB3_22_0)	)/400;
		sum_3[22] = (ap_fixed<25,17>)(((sumA3_23_1+sumB3_23_1) * 2)	-(sumA3_23_0+sumB3_23_0)	)/400;
		sum_3[23] = (ap_fixed<25,17>)(((sumA3_24_2+sumB3_24_2) * 2)	+((sumA3_24_1+sumB3_24_1) * 2)	-(sumA3_24_0+sumB3_24_0)	)/400;
		sum_3[24] = (ap_fixed<25,17>)(((sumA3_25_1+sumB3_25_1) * 2)	-(sumA3_25_0+sumB3_25_0)	)/400;
		sum_3[25] = (ap_fixed<25,17>)(((sumA3_26_1+sumB3_26_1) * 2)	-(sumA3_26_0+sumB3_26_0)	)/400;
		sum_3[26] = (ap_fixed<25,17>)(((sumA3_27_1+sumB3_27_1) * 3)	-(sumA3_27_0+sumB3_27_0)	)/400;

		add_loop3: for(int i=0; i<27; i++){
		#pragma HLS UNROLL factor=27
			if(sum_3[i]<(NodeThresh3[i]*stddev))
				stageTmp3+=lvl3[i];
			else
				stageTmp3+=rvl3[i];
		}
		if(stageTmp3<stageThresh[2])
			res3 = 0;
		else
			res3 = 1;

		if(res==0||res2==0||res3==0)
			return 0;

		// Other Stages
		int stageIdx;
		int totalNode3 = 156;
		int totalNode = 52;
		Loop_Stages: for(stageIdx = 3;stageIdx < 13; stageIdx++){
			ap_fixed<15,5> StageThresh = stageThresh[stageIdx];
			int nodeNum = stageOrga[stageIdx];

			coef_type StageTmp = 0.0;
			int rectUsed = 0;

			int nodeIdx;
			Loop_Nodes: for(nodeIdx = 0; nodeIdx<nodeNum; nodeIdx++){
				ap_int<20> SUMM = 0;
				ap_fixed<25,13> SUMD;
				int rectIdx;
				uint8 feat = Feat[totalNode+nodeIdx];
				Loop_Rects: for(rectIdx = 0; rectIdx < 3; rectIdx++){
					uint8 x,y,W,H;
					int8 weight;
					ap_int<18> sumA, sumB;
					ap_int<18> A,B,C,D;
					if(feat==2&&rectIdx==2)
						break;
					else {
						x = RECT[totalNode3+nodeIdx*3+rectIdx][0];
						y = RECT[totalNode3+nodeIdx*3+rectIdx][1];
						W = RECT[totalNode3+nodeIdx*3+rectIdx][2];
						H = RECT[totalNode3+nodeIdx*3+rectIdx][3];
						weight = RECT[totalNode3+nodeIdx*3+rectIdx][4];

						switch(y+H-1){
						case 0:
							D = 0;
							break;
						case 1:
							D = II[1][x+W-1];
							break;
						case 2:
							D = II[2][x+W-1];
							break;
						case 3:
							D = II[3][x+W-1];
							break;
						case 4:
							D = II[4][x+W-1];
							break;
						case 5:
							D = II[5][x+W-1];
							break;
						case 6:
							D = II[6][x+W-1];
							break;
						case 7:
							D = II[7][x+W-1];
							break;
						case 8:
							D = II[8][x+W-1];
							break;
						case 9:
							D = II[9][x+W-1];
							break;
						case 10:
							D = II[10][x+W-1];
							break;
						case 11:
							D = II[11][x+W-1];
							break;
						case 12:
							D = II[12][x+W-1];
							break;
						case 13:
							D = II[13][x+W-1];
							break;
						case 14:
							D = II[14][x+W-1];
							break;
						case 15:
							D = II[15][x+W-1];
							break;
						case 16:
							D = II[16][x+W-1];
							break;
						case 17:
							D = II[17][x+W-1];
							break;
						case 18:
							D = II[18][x+W-1];
							break;
						case 19:
							D = II[19][x+W-1];
							break;
						case 20:
							D = II[20][x+W-1];
							break;
						case 21:
							D = II[21][x+W-1];
							break;
						case 22:
							D = II[22][x+W-1];
							break;
						case 23:
							D = II[23][x+W-1];
							break;
						default:
							D = 0;
							break;
						}

						switch(y){
						case 0:
							B = 0;
							break;
						case 1:
							B = II[0][x+W-1];
							break;
						case 2:
							B = II[1][x+W-1];
							break;
						case 3:
							B = II[2][x+W-1];
							break;
						case 4:
							B = II[3][x+W-1];
							break;
						case 5:
							B = II[4][x+W-1];
							break;
						case 6:
							B = II[5][x+W-1];
							break;
						case 7:
							B = II[6][x+W-1];
							break;
						case 8:
							B = II[7][x+W-1];
							break;
						case 9:
							B = II[8][x+W-1];
							break;
						case 10:
							B = II[9][x+W-1];
							break;
						case 11:
							B = II[10][x+W-1];
							break;
						case 12:
							B = II[11][x+W-1];
							break;
						case 13:
							B = II[12][x+W-1];
							break;
						case 14:
							B = II[13][x+W-1];
							break;
						case 15:
							B = II[14][x+W-1];
							break;
						case 16:
							B = II[15][x+W-1];
							break;
						case 17:
							B = II[16][x+W-1];
							break;
						case 18:
							B = II[17][x+W-1];
							break;
						case 19:
							B = II[18][x+W-1];
							break;
						case 20:
							B = II[19][x+W-1];
							break;
						case 21:
							B = II[20][x+W-1];
							break;
						case 22:
							B = II[21][x+W-1];
							break;
						case 23:
							B = II[22][x+W-1];
							break;
						default:
							B = 0;
							break;
						}

						switch(x){
						case 0:
							C = 0;
							break;
						case 1:
							C = II[y+H-1][0];
							break;
						case 2:
							C = II[y+H-1][1];
							break;
						case 3:
							C = II[y+H-1][2];
							break;
						case 4:
							C = II[y+H-1][3];
							break;
						case 5:
							C = II[y+H-1][4];
							break;
						case 6:
							C = II[y+H-1][5];
							break;
						case 7:
							C = II[y+H-1][6];
							break;
						case 8:
							C = II[y+H-1][7];
							break;
						case 9:
							C = II[y+H-1][8];
							break;
						case 10:
							C = II[y+H-1][9];
							break;
						case 11:
							C = II[y+H-1][10];
							break;
						case 12:
							C = II[y+H-1][11];
							break;
						case 13:
							C = II[y+H-1][12];
							break;
						case 14:
							C = II[y+H-1][13];
							break;
						case 15:
							C = II[y+H-1][14];
							break;
						case 16:
							C = II[y+H-1][15];
							break;
						case 17:
							C = II[y+H-1][16];
							break;
						case 18:
							C = II[y+H-1][17];
							break;
						case 19:
							C = II[y+H-1][18];
							break;
						case 20:
							C = II[y+H-1][19];
							break;
						case 21:
							C = II[y+H-1][20];
							break;
						case 22:
							C = II[y+H-1][21];
							break;
						case 23:
							C = II[y+H-1][22];
							break;
						default:
							C = 0;
							break;
						}
						if(y==0)
							A=0;
						else{
							switch(x){
							case 0:
								A = 0;
								break;
							case 1:
								A = II[y-1][0];
								break;
							case 2:
								A = II[y-1][1];
								break;
							case 3:
								A = II[y-1][2];
								break;
							case 4:
								A = II[y-1][3];
								break;
							case 5:
								A = II[y-1][4];
								break;
							case 6:
								A = II[y-1][5];
								break;
							case 7:
								A = II[y-1][6];
								break;
							case 8:
								A = II[y-1][7];
								break;
							case 9:
								A = II[y-1][8];
								break;
							case 10:
								A = II[y-1][9];
								break;
							case 11:
								A = II[y-1][10];
								break;
							case 12:
								A = II[y-1][11];
								break;
							case 13:
								A = II[y-1][12];
								break;
							case 14:
								A = II[y-1][13];
								break;
							case 15:
								A = II[y-1][14];
								break;
							case 16:
								A = II[y-1][15];
								break;
							case 17:
								A = II[y-1][16];
								break;
							case 18:
								A = II[y-1][17];
								break;
							case 19:
								A = II[y-1][18];
								break;
							case 20:
								A = II[y-1][19];
								break;
							case 21:
								A = II[y-1][20];
								break;
							case 22:
								A = II[y-1][21];
								break;
							case 23:
								A = II[y-1][22];
								break;
							default:
								A = 0;
								break;
							}
						}
						sumB = A-B;
						sumA = D-C;
						SUMM += ((sumA+sumB)*weight);
					}
				}
				SUMD = (ap_fixed<25,18>)SUMM/400;
				if(SUMD<(NodeThreshAll[totalNode+nodeIdx]*stddev))
					StageTmp+=LVLall[totalNode+nodeIdx];
				else
					StageTmp+=RVLall[totalNode+nodeIdx];
				// if(Row==57&&newPixelCol==84&&stageIdx==1)
					// printf("Node %d value: %f StageTmp: %f, Thresh: %f\n",nodeIdx,(float)SUMD,(float)StageTmp, (float)(NodeThreshAll[totalNode+nodeIdx]*stddev));
			}
			// printf("Stage %d result = %f\n",(int)(stageIdx+1),(float)StageTmp);
			if(StageTmp<StageThresh){
				if(stageIdx<10)
					return 0;
				else
					return 2;
			}
			totalNode += nodeNum;
			totalNode3 += nodeNum*3;
		}
		return 3;
	}
}

ap_fixed<20,14> int_sqrt(ap_fixed<20,14> value)
{
	uint14 Tmp = value;
	ap_fixed<20,14> res;
	res = value>>1;
	res = (res+2)>>1;
	if(Tmp>16){
		res = (res+4)>>1;
		if(Tmp>64){
			res = (res+8)>>1;
			if(Tmp>256){
				res = (res+16)>>1;
				if(Tmp>1024){
					res = (res+32)>>1;
					if(Tmp>4096){
						res = (res+64)>>1;
						//return res;
					}
					else{
						res = (res+32)>>1;
						//return res;
					}
				}
				else{
					res = (res+16)>>1;
					//return res;
				}
			}
			else{
				res = (res+8)>>1;
				//return res;
			}
		}
		else{
			res = (res+4)>>1;
			//return res;
		}
	}
	else{
		res = (res+2)>>1;
		//return res;
	}
	return res;

}
