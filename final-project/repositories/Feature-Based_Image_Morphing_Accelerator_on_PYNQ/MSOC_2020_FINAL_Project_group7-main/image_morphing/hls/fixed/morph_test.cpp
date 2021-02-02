#include "morph.h"
#include <stdio.h>
#include <stdlib.h>

int main() {
    printf("Starting Image Morphing testbench\n");

    /* input */  ap_uint<32>  point_src [MAX_LINE_NUM];
    /* input */  float        length_src[MAX_LINE_NUM];
    /* input */  ap_uint<32>  point_tar [MAX_LINE_NUM];
    /* input */  float        length_tar[MAX_LINE_NUM];
    /* input */  ap_uint<32>  point_dst [MAX_LINE_NUM];
    /* input */  float        length_dst[MAX_LINE_NUM];
    /* input */  ap_uint<32>  lines;
    /* input */  ap_uint<32>  mode;
    /* output */ ap_uint<32>  map_Out[IMAGE_SIZE];

    float line_table_src[12] = {77,132,109,144,184,116,149,143,115,176,151,177};
    float line_table_tar[12] = {58,102.5,70.5,177.5,195.5,65,208,152.5,92,117,167,106};
    float line_table_dst[12] = {77,112,120,107,196,89,154,101,119,154,161,146};

    
    for (int i=0;i<12;i++){
    	line_table_tar[i] = (line_table_src[i])*0.4 + (line_table_dst[i])*0.6;
    }

    // initialize the info
    lines = 3;
    mode = 0;

    // initialize the line info
    for (int i=0; i < lines; i++){
        // source 
        point_src[i](7,0)   = ap_uint<8>(line_table_src[4*i+0]);
        point_src[i](15,8)  = ap_uint<8>(line_table_src[4*i+1]);
        point_src[i](23,16) = ap_uint<8>(line_table_src[4*i+2]);
        point_src[i](31,24) = ap_uint<8>(line_table_src[4*i+3]); 
        length_src[i]   = sqrt(float((line_table_src[4*i+0]-line_table_src[4*i+2])*(line_table_src[4*i+0]-line_table_src[4*i+2])) + float((line_table_src[4*i+1]-line_table_src[4*i+3])*(line_table_src[4*i+1]-line_table_src[4*i+3])));

        // target
        point_tar[i](7,0)   = ap_uint<8>(line_table_tar[4*i+0]);
        point_tar[i](15,8)  = ap_uint<8>(line_table_tar[4*i+1]);
        point_tar[i](23,16) = ap_uint<8>(line_table_tar[4*i+2]);
        point_tar[i](31,24) = ap_uint<8>(line_table_tar[4*i+3]); 
        length_tar[i]   = sqrt(float((line_table_tar[4*i+0]-line_table_tar[4*i+2])*(line_table_tar[4*i+0]-line_table_tar[4*i+2])) + float((line_table_tar[4*i+1]-line_table_tar[4*i+3])*(line_table_tar[4*i+1]-line_table_tar[4*i+3])));
        // destination
        point_dst[i](7,0)   = ap_uint<8>(line_table_dst[4*i+0]);
        point_dst[i](15,8)  = ap_uint<8>(line_table_dst[4*i+1]);
        point_dst[i](23,16) = ap_uint<8>(line_table_dst[4*i+2]);
        point_dst[i](31,24) = ap_uint<8>(line_table_dst[4*i+3]); 
        length_dst[i]   = sqrt(float((line_table_dst[4*i+0]-line_table_dst[4*i+2])*(line_table_dst[4*i+0]-line_table_dst[4*i+2])) + float((line_table_dst[4*i+1]-line_table_dst[4*i+3])*(line_table_dst[4*i+1]-line_table_dst[4*i+3])));
    }
    // Weight a = lines_src[0].length.range(23,0);
    // std::cout.write(reinterpret_cast<const char*>(&a), sizeof a);

    // image morphing 
    image_morph(
        point_src,
        length_src,
        point_tar,
        length_tar,
        point_dst,
        length_dst,
        lines,
        mode,
        map_Out
    );

    // write X_src, X_dst
    
    FILE *output_file_src;
    FILE *output_file_dst;
    output_file_src = fopen("morphing_out_src.txt", "w");
    output_file_dst = fopen("morphing_out_dst.txt", "w");
    for(int i = 0; i < IMAGE_SIZE; i++){
        fprintf(output_file_src, "%d, %d\n", (unsigned int)map_Out[i](7,0) , (unsigned int)map_Out[i](15,8));
        fprintf(output_file_dst, "%d, %d\n", (unsigned int)map_Out[i](23,16) , (unsigned int)map_Out[i](31,24));
    }
    fclose(output_file_src);
    fclose(output_file_dst);

    printf ("\n***************Comparing against output data*************** \n\n");

    FILE *output_file;
    FILE *golden_file;
    int output_x, golden_x, output_y, golden_y, err = 0;
    int err_x, err_y, err_large = 0;
    int err_hist[30] = {0};
    output_file = fopen("morphing_src_out.txt", "r");
    golden_file = fopen("morphing_src_golden.txt", "r");
    while (!feof(output_file)){
    	// printf ("%d ", i);
        fscanf(output_file, "%d, %d", &output_x, &output_y);
        fscanf(golden_file, "%d, %d", &golden_x, &golden_y);
        if(output_x!=golden_x || output_y!=golden_y){
        	err = err + 1;
        	err_x = abs(output_x-golden_x);
        	err_y = abs(output_y-golden_y);
        	if(err_x!=0){
        		err_hist[err_x] += 1;
        		if(err_x>=30){
        			err_large +=1 ;
        		}
        	}
        	if(err_y!=0){
        		err_hist[err_y] += 1;
        		if(err_y>=30){
        		    err_large +=1 ;
        		}
        	}
        }
    }
    for(int i = 0; i < 30; i++){
    	std::cout << "err_hist[" << i << "] = " << err_hist[i] << std::endl;
    }
    std::cout << "err_large = " << err_large << std::endl;

    fclose(output_file);
    fclose(golden_file);

    if(err){
    	std::cout << ">> Total Error: " << err << std::endl;
    }
    else{
      	std::cout << ">> Test passed!" << std::endl;
    }

    /*
    char output[10], golden[10];
    for(int i = 0; i < IMAGE_SIZE; i++){
    	fgets(output , 10 , output_file);
    	fgets(golden , 10 , golen_file);
    	// std::cout << output << golden << std::endl;
    	if(strcmp(output,golden)){
    		err = err + 1;
    	}
    }
    */

    /*
    if (system("fc morphing_src_out.txt D:\\MSoC\\Final\\source\\float\\morphing_src_golden.txt")) {
        std::cout << ">> src test failed!" << std::endl;
        return 1;
    }

    if (system("fc morphing_dst_out.txt D:\\MSoC\\Final\\source\\float\\morphing_dst_golden.txt")) {
        std::cout << ">> dst test failed!" << std::endl;
        return 1;
    }

    std::cout << ">> Test passed!" << std::endl;
    std::cout << "------------------------" << std::endl;
    */

    printf("Ending Image Morphing testbench\n");

    // ==================================================
    // =            TEST FOR CORDIC SQRT                =
    // ==================================================
    // ap_fixed<24,18> a, b, mag;
    // a = 30;
    // b = 40;
    // cordic_sqrt(a,b,&mag);
    // printf("magnitude of (%10d, %10d): %10d", int(a),int(b), int(mag));


}
