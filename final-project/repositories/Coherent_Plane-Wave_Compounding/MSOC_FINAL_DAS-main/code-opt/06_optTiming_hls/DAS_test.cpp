#include <stdio.h>
#include <stdlib.h>
#include "DAS.h"
#include <iostream>
#include <fstream>
#include <string>

int main () {

  std::ifstream echo_file;
  std::ofstream output_file;
  std::string str;
  echo_file.open("C:/Users/CHI/Desktop/MSOC/00_Final/07_optTiming_hls/src_code/echo_int16.txt");
  output_file.open("C:/Users/CHI/Desktop/MSOC/00_Final/07_optTiming_hls/src_code/out.txt");

  int echo_depth;
  int echo_col;
  int echo_page;
  int block;
  int pw;



  hls::stream<axi_echo> echo_block;
  hls::stream<axi_gray> gray_pic;

  axi_echo d_in;
  axi_gray d_out;


  int gray_depth;
  int gray_col;

  d_in.data = 0;
  d_in.keep = 0xF;
  d_in.strb = 0;
  d_in.user = 0;
  d_in.last = 0;
  d_in.id = 0;
  d_in.dest = 0;




  if (echo_file.is_open())
  {
      for(block = 0; block < num_block; block++)
      {
	      for (pw = 0; pw < Nangle; pw++)
	      {
	          for(echo_col = 0; echo_col < ch_amount; echo_col++)
	          {
		          for(echo_depth = 0; echo_depth < Datalength; echo_depth++)
		          {
		    	      std::getline(echo_file, str);
		    	      d_in.data =  std::stof(str);
		    	      if((echo_col == ch_amount - 1) && (echo_depth == Datalength - 1)) d_in.last = 1;
		    	      echo_block.write(d_in);
		          }
              }
	          DAS(&echo_block, &gray_pic, pw);
	          d_in.last = 0;
          }

	      for (gray_col = 0; gray_col < ch; gray_col++)
	      {
	          for (gray_depth = 32; gray_depth < down_sample; gray_depth++)
	          {
	      	      d_out = gray_pic.read();
	      	      output_file << d_out.data << std::endl;
	      	      if (d_out.last)
	      	      {
	      	          printf("last = 1 %d, %d \n", gray_col, gray_depth);
	      			  break;
	      	      }
	      	   }
	      }
      }
  }



  echo_file.close();
  output_file.close();


  return 0;
}
