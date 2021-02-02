#include "morph.h"
#include <stdio.h>
#include <stdlib.h>

int main() {
    printf("Starting Image Mprphing testbench\n");

    /* input */  ap_uint<32>  point_src[LINE_NUM];
    /* input */  float        length_src[LINE_NUM];
    /* input */  ap_uint<32>  point_tar[LINE_NUM];
    /* input */  float        length_tar[LINE_NUM];
    /* input */  ap_uint<32>  point_dst[LINE_NUM];
    /* input */  float        length_dst[LINE_NUM];
    /* input */  ap_uint<32>  lines;
    /* input */  ap_uint<32>  mode;
    /* output */ ap_uint<32>  map_Out[IMAGE_SIZE];

    ap_uint<8> line_table_src[12] = {77,132,110,145,184,115,150,143,115,176,151,178};
    ap_uint<8> line_table_tar[12] = {0,0,0,0,0,0,0,0,0,0,0,0};
    ap_uint<8> line_table_dst[12] = {77,112,120,107,196,89,154,101,119,154,161,146};
    
    lines = 3;
    mode = 0;
    for (int i=0;i<12;i++){
    	line_table_tar[i] = ((line_table_src[i])+(line_table_dst[i])) /2;
        printf("%d, %d, %d\n", (unsigned int)line_table_src[i], (unsigned int)line_table_dst[i], (unsigned int)line_table_tar[i]);
    }

    printf("%f\n", line_table_src[0]);
    // initialize the line info
    for (int i=0; i < lines; i++){
        // source 
        point_src[i](7,0)   = line_table_src[4*i+0];
        point_src[i](15,8)  = line_table_src[4*i+1];
        point_src[i](23,16) = line_table_src[4*i+2];
        point_src[i](31,24) = line_table_src[4*i+3]; 
        length_src[i]   = sqrt(float((line_table_src[4*i+0]-line_table_src[4*i+2])*(line_table_src[4*i+0]-line_table_src[4*i+2])) + float((line_table_src[4*i+1]-line_table_src[4*i+3])*(line_table_src[4*i+1]-line_table_src[4*i+3])));

        // target
        point_tar[i](7,0)   = line_table_tar[4*i+0];
        point_tar[i](15,8)  = line_table_tar[4*i+1];
        point_tar[i](23,16) = line_table_tar[4*i+2];
        point_tar[i](31,24) = line_table_tar[4*i+3]; 
        length_tar[i]   = sqrt(float((line_table_tar[4*i+0]-line_table_tar[4*i+2])*(line_table_tar[4*i+0]-line_table_tar[4*i+2])) + float((line_table_tar[4*i+1]-line_table_tar[4*i+3])*(line_table_tar[4*i+1]-line_table_tar[4*i+3])));
        // destination
        point_dst[i](7,0)   = line_table_dst[4*i+0];
        point_dst[i](15,8)  = line_table_dst[4*i+1];
        point_dst[i](23,16) = line_table_dst[4*i+2];
        point_dst[i](31,24) = line_table_dst[4*i+3]; 
        length_dst[i]   = sqrt(float((line_table_dst[4*i+0]-line_table_dst[4*i+2])*(line_table_dst[4*i+0]-line_table_dst[4*i+2])) + float((line_table_dst[4*i+1]-line_table_dst[4*i+3])*(line_table_dst[4*i+1]-line_table_dst[4*i+3])));
    }

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
    ap_uint<32> output[IMAGE_SIZE];
    for(int i = 0; i < IMAGE_SIZE; i++){
        output[i] = map_Out[i];
        fprintf(output_file_src, "%d, %d\n", (unsigned int)output[i](7,0) , (unsigned int)output[i](15,8));
        fprintf(output_file_dst, "%d, %d\n", (unsigned int)output[i](23,16) , (unsigned int)output[i](31,24));
    }
    fclose(output_file_src);
    fclose(output_file_dst);
    

    printf ("\n***************Comparing against output data*************** \n\n");
    printf("Ending Image Mprphing testbench\n");
}
