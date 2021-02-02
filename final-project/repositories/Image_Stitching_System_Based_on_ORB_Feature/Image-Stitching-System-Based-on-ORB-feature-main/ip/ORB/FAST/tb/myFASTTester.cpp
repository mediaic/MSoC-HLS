#include <iostream>
#include <bitset>
#include <fstream>
#include "myFAST.h"
using namespace std;


static const unsigned char lena[HEIGHT][WIDTH] = {
	#include "office_1.h"
};



int main(int argc, char **argv) {
    hls::stream<ap_axiu<8,1,1,1> > strmInput;
    hls::stream<ap_uint<80> > strmOutput;
    ap_axiu<8,1,1,1> pixel;
    pixel.data = 0;
	pixel.keep = 1;
	pixel.strb = 0;
	pixel.user = 0;
	pixel.last = 0;
	pixel.id = 0;
	pixel.dest = 0;

    cout << ">> Start test!" << endl;

    for(int i = 0; i < HEIGHT; ++i) {
        for(int j = 0; j < WIDTH; ++j) {
            pixel.data = lena[i][j];
            pixel.last = (i==HEIGHT-1) & (j==WIDTH-1);
            strmInput.write(pixel);
        }
    }


    fast_accel(strmInput, strmOutput);
    FILE *fp, *fp1;
    fp=fopen("office_1.h","w");
    fp1=fopen("office_1.dat","w");
    int output_points=0;
    int cnt = 0;

    for(int k = 0; k < HEIGHT*WIDTH; ++k) {
    	ap_uint<80> tmp;
		tmp = strmOutput.read();

		 unsigned char flag = tmp.range(79, 72);

		if(flag == 255) {
			cnt++;
			fprintf(fp1, "%d,%d\n", int(tmp.range(59,48)),int(tmp.range(71,60)));
		}
		output_points += 1;
		printf("X:%4d ,Y:%4d, Moment:%15d\n", int(tmp.range(59,48)),int(tmp.range(71,60)), int(tmp.range(47,0)));

    }

    fclose(fp);
    cout << ">> Test finished!" << endl;
    cout << "Total feature points: " << cnt << endl;
    cout << "Total points: " << output_points << endl;
    return 0;
}
