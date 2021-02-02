#include "morph.h"
#include <stdio.h>
#include <stdlib.h>

void image_morph
(
    /* input */  ap_uint<32>  point_src[MAX_LINE_NUM],
    /* input */  float        length_src[MAX_LINE_NUM],
    /* input */  ap_uint<32>  point_tar[MAX_LINE_NUM],
    /* input */  float        length_tar[MAX_LINE_NUM],
    /* input */  ap_uint<32>  point_dst[MAX_LINE_NUM],
    /* input */  float        length_dst[MAX_LINE_NUM],
    /* input */  ap_uint<32>  lines,
    /* input */  ap_uint<32>  mode,
    /* output */ volatile ap_uint<32>* map_Out
)
{   
#pragma HLS INTERFACE s_axilite port=return
#pragma HLS INTERFACE m_axi depth=65536 port=map_Out offset=slave
#pragma HLS INTERFACE s_axilite port=mode
#pragma HLS INTERFACE s_axilite port=lines
#pragma HLS INTERFACE m_axi depth=16 port=point_src offset=slave
#pragma HLS INTERFACE m_axi depth=16 port=length_src offset=slave
#pragma HLS INTERFACE m_axi depth=16 port=point_tar offset=slave
#pragma HLS INTERFACE m_axi depth=16 port=length_tar offset=slave
#pragma HLS INTERFACE m_axi depth=16 port=point_dst offset=slave
#pragma HLS INTERFACE m_axi depth=16 port=length_dst offset=slave
    
    // buffer for src, tar, dst lines
    Line lines_src[MAX_LINE_NUM];
    Line lines_dst[MAX_LINE_NUM];
    Line lines_tar[MAX_LINE_NUM];
    
    // initialize buffers
    if (mode==0){
        // mode 0: update src, tar, dst lines
        for (int i=0; i<lines;i++){
            // src lines
            lines_src[i].P.x_val  = point_src[i](7,0);
            lines_src[i].P.y_val  = point_src[i](15,8);
            lines_src[i].PQ.x_val = point_src[i](23,16) - point_src[i](7,0);
            lines_src[i].PQ.y_val = point_src[i](31,24) - point_src[i](15,8);
            lines_src[i].length   = length_src[i];
            //assert(lines_src[i].length>0);
            // tar lines
            lines_tar[i].P.x_val  = point_tar[i](7,0);
            lines_tar[i].P.y_val  = point_tar[i](15,8);
            lines_tar[i].PQ.x_val = point_tar[i](23,16) - point_tar[i](7,0);
            lines_tar[i].PQ.y_val = point_tar[i](31,24) - point_tar[i](15,8);
            lines_tar[i].length   = length_tar[i];
            //assert(lines_tar[i].length>0);
            // dst lines
            lines_dst[i].P.x_val  = point_dst[i](7,0);
            lines_dst[i].P.y_val  = point_dst[i](15,8);
            lines_dst[i].PQ.x_val = point_dst[i](23,16) - point_dst[i](7,0);
            lines_dst[i].PQ.y_val = point_dst[i](31,24) - point_dst[i](15,8);
            lines_dst[i].length   = length_dst[i];
            //assert(lines_dst[i].length>0);
        }
    }
    else {
        // mode 1: only update tar lines
        for (int i=0; i<lines;i++){
            // tar lines
            lines_tar[i].P.x_val  = point_tar[i](7,0);
            lines_tar[i].P.y_val  = point_tar[i](15,8);
            lines_tar[i].PQ.x_val = point_tar[i](23,16) - point_tar[i](7,0);
            lines_tar[i].PQ.y_val = point_tar[i](31,24) - point_tar[i](15,8);
            lines_tar[i].length   = length_tar[i];
        }
    }


    // Buffer for Beier Neely Algorithm
    Vector current_X;
    Line line_src;
    Line line_dst;
    Line line_tar;
    Vector D_sum_src;
    Weight W_sum_src;
    Vector D_sum_dst;
    Weight W_sum_dst;

    // Wire for update map_out
    ap_uint<32> valTemp;

    // initialization
    D_sum_src.x_val = 0;
    D_sum_src.y_val = 0;
    D_sum_dst.x_val = 0;
    D_sum_dst.y_val = 0;
    W_sum_src = 0;
    W_sum_dst = 0;

LOOPX: for (int x=0; x < IMAGE_HEIGHT; x++){
     LOOPY: for (int y=0; y < IMAGE_WIDTH; y++){
//#pragma HLS UNROLL factor=2
            current_X.x_val = x;
            current_X.y_val = y;
     LOOPK: for(int k=0; k < lines; k++){
#pragma HLS PIPELINE II=1
                line_src = lines_src[k];
                line_dst = lines_dst[k];
                line_tar = lines_tar[k];
                bnmorph(
                    current_X,
                    line_src,  line_dst, line_tar,
                    D_sum_src, W_sum_src,
                    D_sum_dst, W_sum_dst
                );
            }
            // get X_src, X_dst
            Vector X_src_tmp;
            Vector X_dst_tmp;

            if(x==0 && y==0){
            	printf("W_sum_src = %f \n", (double)W_sum_src);
            	printf("W_sum_dst = %f \n", (double)W_sum_dst);
            }

            Weight W_sum_src_div = dw_div_table[(unsigned int)W_sum_src.range(DW_DIV_UBIT,DW_DIV_LBIT)];
            Weight W_sum_dst_div = dw_div_table[(unsigned int)W_sum_dst.range(DW_DIV_UBIT,DW_DIV_LBIT)];

            Scaler D_W_src_x, D_W_src_y, D_W_dst_x, D_W_dst_y;
/*
#pragma HLS RESOURCE variable=D_W_src_x core=DivnS
#pragma HLS RESOURCE variable=D_W_src_y core=DivnS
#pragma HLS RESOURCE variable=D_W_dst_x core=DivnS
#pragma HLS RESOURCE variable=D_W_dst_y core=DivnS
*/
            D_W_src_x = D_sum_src.x_val * W_sum_src_div;
            D_W_src_y = D_sum_src.y_val * W_sum_src_div;
            D_W_dst_x = D_sum_dst.x_val * W_sum_dst_div;
            D_W_dst_y = D_sum_dst.y_val * W_sum_dst_div;

            X_src_tmp.x_val = current_X.x_val + D_W_src_x;
            X_src_tmp.y_val = current_X.y_val + D_W_src_y;
            X_dst_tmp.x_val = current_X.x_val + D_W_dst_x;
            X_dst_tmp.y_val = current_X.y_val + D_W_dst_y;

            if(x==0 && y==0){
                printf("X_src_tmp = (%f, %f) \n", (double)X_src_tmp.x_val, (double)X_src_tmp.y_val);
                printf("X_dst_tmp = (%f, %f) \n", (double)X_dst_tmp.x_val, (double)X_dst_tmp.y_val);
            }


            // X_src x_val check
            if      ( X_src_tmp.x_val < 0)              { valTemp(7,0) =  (0                 ); }
            else if ( X_src_tmp.x_val > IMAGE_WIDTH-1)  { valTemp(7,0) =  (IMAGE_WIDTH-1     ); }
            else                                        { valTemp(7,0) =  (X_src_tmp.x_val(21,14));}
            // X_src y_val check
            if      ( X_src_tmp.y_val < 0)              { valTemp(15,8) =  (0                  );}
            else if ( X_src_tmp.y_val > IMAGE_HEIGHT-1) { valTemp(15,8) =  (IMAGE_HEIGHT-1     );}
            else                                        { valTemp(15,8) =  (X_src_tmp.y_val(21,14));}
            // X_dst x_val check
            if      ( X_dst_tmp.x_val < 0)              { valTemp(23,16) =  (0                  ); }
            else if ( X_dst_tmp.x_val > IMAGE_WIDTH-1)  { valTemp(23,16) =  (IMAGE_WIDTH-1      ); }
            else                                        { valTemp(23,16) =  (X_dst_tmp.x_val(21,14));}
            // X_dst y_val check
            if      ( X_dst_tmp.y_val <  0)             { valTemp(31,24) =  (0                  ); }
            else if ( X_dst_tmp.y_val > IMAGE_HEIGHT-1) { valTemp(31,24) =  (IMAGE_HEIGHT-1     ); }
            else                                        { valTemp(31,24) =  (X_dst_tmp.y_val(21,14));}

            //prepare data for maxi out
            map_Out[x*IMAGE_HEIGHT+y] = valTemp;
            
            

            // reset W, D
            D_sum_src.x_val = 0;
            D_sum_src.y_val = 0;
            D_sum_dst.x_val = 0;
            D_sum_dst.y_val = 0;
            W_sum_src = 0;
            W_sum_dst = 0;
        }
    }
}
