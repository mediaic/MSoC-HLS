#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "read_file.h"
#include "frft.h"

const int N_DATA = 1;
const int FRFT_PT = 256;

THETA_TYPE input_angle[N_DATA][1];
IO_DTYPE input_data[N_DATA][FRFT_PT*2];
IO_DTYPE ref_result[N_DATA][FRFT_PT*2];

int main(void)
{
    IO_DTYPE input_f_real[FRFT_PT], input_f_imag[FRFT_PT];
    IO_DTYPE output_f_real[FRFT_PT], output_f_imag[FRFT_PT];
    IO_DTYPE ref_result_real[FRFT_PT], ref_result_imag[FRFT_PT];
    THETA_TYPE input_rad;
    double err_acc;


    //read files
	// read_file<N_DATA, 1, THETA_TYPE>("./test_data/input_angle.txt", input_angle);
    // read_file<N_DATA, FRFT_PT*2, DTYPE>("./test_data/input_data.txt", input_data);
    // read_file<N_DATA, FRFT_PT*2, DTYPE>("./test_data/ref_result.txt", ref_result);
    read_file<N_DATA, 1, THETA_TYPE>("input_angle.txt", input_angle);
    read_file<N_DATA, FRFT_PT*2, IO_DTYPE>("input_data.txt", input_data);
    read_file<N_DATA, FRFT_PT*2, IO_DTYPE>("ref_result.txt", ref_result);
    
    // printf("tb = %f\n", double(input_data[0][0] ) ) ; 
    // printf("tb = %f\n", double(input_data[0][1] ) ) ; 
    // printf("tb = %f\n", double(input_data[1][0] ) ) ; 

    for(int i = 0; i < N_DATA; i++)
    {
        input_rad = input_angle[i][0] ;
        for(int j = 0; j < FRFT_PT; j++)
        {
            input_f_real[j] = input_data[i][j*2];
            input_f_imag[j] = input_data[i][j*2+1];
            ref_result_real[j] = ref_result[i][j*2];
            ref_result_imag[j] = ref_result[i][j*2+1];
        }

        // Test Design
        frft(output_f_real, output_f_imag, input_f_real, input_f_imag, input_rad);

        // Check
        err_acc = 0;
        for(int j = 0; j < FRFT_PT; j++)
        {
            err_acc += (double)(ref_result_real[j] - output_f_real[j]) * (double)(ref_result_real[j] - output_f_real[j]);
            err_acc += (double)(ref_result_imag[j] - output_f_imag[j]) * (double)(ref_result_imag[j] - output_f_imag[j]);
            printf("golden_re = %f, output_re = %f\n", double(ref_result_real[j]), double(output_f_real[j]) ) ; 
        }

        printf("Test Data %d, Error = %f\n", i, sqrt(err_acc/FRFT_PT) );

    }
    return 0;
}