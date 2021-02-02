#include <iostream>
#include <bitset>
#include <fstream>
#include "comDescriptor.h"
#include <string>
using namespace std;


static const unsigned char lena[HEIGHT][WIDTH] = {
	#include "Gaussian_filter_4.h"
};

static const int FAST[HEIGHT*WIDTH][4] = {
	#include "office_1.h"

};



int main(int argc, char **argv) {


    hls::stream<ap_uint<8> > strmInput;
    hls::stream<ap_uint<80> > FASTInput;
    hls::stream<ap_axiu<32,1,1,1> > strmOutput;
    ap_uint<8> pixel;
    int output_points = 0;
    int cnt = 0;

	ap_uint<80> FAST_in;

    cout << ">> Start test!" << endl;

    for(int i = 0; i < HEIGHT; ++i) {
        for(int j = 0; j < WIDTH; ++j) {
            pixel = lena[i][j];
            strmInput.write(pixel);
        }
    }

    for(int k = 0; k < HEIGHT*WIDTH; ++k){
    	FAST_in.range(79,72) = FAST[k][0];
    	FAST_in.range(71,60) = FAST[k][1];
    	FAST_in.range(59,48) = FAST[k][2];
    	FAST_in.range(47,0) = FAST[k][3];
    	FASTInput.write(FAST_in);
    }


    comDescriptor_accel(strmInput, FASTInput, strmOutput);

    FILE *fp,*fp1;
    string str1;
    fp=fopen("Descriptor_4.dat","w");
    fp1=fopen("Descriptor_4.h","w");
    for(unsigned int j = 0; j < 8192; j++){
    	 if(!strmOutput.empty()) {
    		 ap_axiu<32,1,1,1> tmp;
    		 for(unsigned int i = 0; i < 10; i++)
    	    	{
    				tmp = strmOutput.read();
    				if(i == 0) {
    					str1 = bitset<32>(tmp.data).to_string();
    					printf("%s,",str1.c_str());
    					fprintf(fp,"%u,",int(tmp.data));
    					fprintf(fp1,"{%u,",int(tmp.data));
    				}
    				else if(i > 0 && i < 8) {
    					str1 = bitset<32>(tmp.data).to_string();
    					printf("%s,",str1.c_str());
    					fprintf(fp,"%u,",int(tmp.data));
    					fprintf(fp1,"%u,",int(tmp.data));
    				}
    				else if (i == 8){
    					printf("%u,", int(tmp.data));
    					fprintf(fp,"%u,",int(tmp.data));
    					fprintf(fp1,"%u,",int(tmp.data));
    				}
    				else {
    					printf("%u\n", int(tmp.data));
    					fprintf(fp,"%u,\n", int(tmp.data));
    					fprintf(fp1,"%u},\n", int(tmp.data));
    				}
    			}

    	    	output_points += 1;

    	    }
    	 else {
    		 for(unsigned int i = 0; i < 10; i++){
    			 if(i == 0) {
    			     fprintf(fp,"%u,",0);
    			     fprintf(fp1,"{%u,",0);
    			 }
    			 else if(i > 0 && i < 8) {
    			     fprintf(fp,"%u,",0);
    			     fprintf(fp1,"%u,",0);
    			 }
    			 else if (i == 8){
    			 fprintf(fp,"%u,",0);
    			 fprintf(fp1,"%u,",0);
    			 }
    			 else {
    			     fprintf(fp,"%u,\n", 0);
    			     fprintf(fp1,"%u},\n",0);
    			 }
    		 }
    	 }
    }


    fclose(fp);
    fclose(fp1);
    cout << ">> Test finished!" << endl;
    cout << "Total feature points: " << output_points << endl;
    return 0;
}
