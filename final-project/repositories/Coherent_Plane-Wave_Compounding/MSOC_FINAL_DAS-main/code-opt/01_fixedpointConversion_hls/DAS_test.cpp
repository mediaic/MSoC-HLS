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
  echo_file.open("C:/Users/CHI/Desktop/MSOC/00_Final/02_fixedpointConversion_hls/src_code/echo.txt");
  output_file.open("C:/Users/CHI/Desktop/MSOC/00_Final/02_fixedpointConversion_hls/src_code/out.txt");

  int echo_depth;
  int echo_col;
  int echo_page;
  int block;
  int pw;
  in_t tmp1;

  hls::stream<fp_echo> echo_block("echo_block");
  hls::stream<fp_gray> gray_pic("gray_pic");

  int gray_depth;
  int gray_col;


  printf("test1\n");
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
		    	      echo_block <<  std::stof(str);
		          }
              }
              DAS(echo_block, gray_pic);
          }

	      for (gray_col = 0; gray_col < ch; gray_col++)
	      {
	            for (gray_depth = 0; gray_depth < down_sample; gray_depth++)
	        	{
	          	  out_t temp = gray_pic.read();
	          	  output_file << temp << std::endl;
	        	}
	      }
      }
  }


  echo_file.close();
  output_file.close();

  return 0;
}
