#include "hls_linear_algebra.h"
#include "Abundance_Estimator.hpp"
#include "newton.hpp"
#include <iostream>
#include <fstream>
#include <string>

int main (void) {
    // input file
    std::ifstream endmember_file;
    std::ifstream hsi_file;
    std::ifstream golden_file;
    std::ofstream output_file;
    endmember_file.open("C:/Users/user/Desktop/BSS/Abundance_Estimator/src/endmembers.txt");
    hsi_file.open("C:/Users/user/Desktop/BSS/Abundance_Estimator/src/hsi.txt");
    golden_file.open("C:/Users/user/Desktop/BSS/Abundance_Estimator/src/golden.txt");
    output_file.open("C:/Users/user/Desktop/BSS/Abundance_Estimator/src/output.txt");
    // Variables
    float MSE;
    std::string str;
    MATRIX_T endmembers_i [  VIRTUAL_DIMENSION][        VIRTUAL_DIMENSION+1];
    MATRIX_T hsi_batch_i  [  VIRTUAL_DIMENSION][BATCH_IMAGE_H*BATCH_IMAGE_W];
    MATRIX_T abundance_i  [VIRTUAL_DIMENSION+1][BATCH_IMAGE_H*BATCH_IMAGE_W];
    float temp_mtx [VIRTUAL_DIMENSION+1][BATCH_IMAGE_H*BATCH_IMAGE_W];
    // Simulation
    std::cout << "Start Simulation!" << std::endl;
    std::cout << "Start read endmembers from file..." << std::endl;
    if (endmember_file.is_open()) {
        for (int i = 0; i < VIRTUAL_DIMENSION; i++) {
            for (int j = 0; j < VIRTUAL_DIMENSION+1; j++) {
                std::getline(endmember_file, str);
                endmembers_i [i][j] = std::stof(str);
            }
        }
    }
    std::cout << "Endmembers read successfully..." << std::endl;

    std::cout << "Start read HSI from file..." << std::endl;
    if (hsi_file.is_open()) {
        for (int batch = 0; batch < BATCH_SIZE; batch++) {
            for (int i = 0; i < VIRTUAL_DIMENSION; i++) {
                for (int j = 0; j < BATCH_IMAGE_H*BATCH_IMAGE_W; j++) {
                    std::getline(hsi_file, str);
                    hsi_batch_i [i][j] = std::stof(str);
                }
            }
            std::cout << "Start Abundance Estimation of batch : " << batch << std::endl;
            Abundance_Estimator (
                hsi_batch_i,
                endmembers_i,
                abundance_i,
				0.0625
            );

            for (int i = 0; i < VIRTUAL_DIMENSION+1; i++) {
                for (int j = 0; j < BATCH_IMAGE_H*BATCH_IMAGE_W; j++) {
                	temp_mtx [i][j] = abundance_i [i][j];
                }
            }

            std::cout << "Abundance of this batch..." << std::endl;
            hls::print_matrix <
                VIRTUAL_DIMENSION+1,
                BATCH_IMAGE_H*BATCH_IMAGE_W,
                float,
                hls::NoTranspose
            >
            (
                temp_mtx,
                "   "
            );

            for (int i = 0; i < VIRTUAL_DIMENSION+1; i++) {
                for (int j = 0; j < BATCH_IMAGE_H*BATCH_IMAGE_W; j++) {
                    std::getline(golden_file, str);
                    MSE = MSE + (std::stof(str) - temp_mtx [i][j])*(std::stof(str) - temp_mtx [i][j]);
                    output_file << abundance_i [i][j] << std::endl;
                }
            }
        }
    }
    std::cout << "Simulation Done!" << std::endl;
    std::cout << "Your MSE is : " << MSE/(256*256*8);
    endmember_file.close();
    hsi_file.close();
    golden_file.close();
    output_file.close();
    return 0;
}
