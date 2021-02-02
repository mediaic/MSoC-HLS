
#include <string>
#include <vector>
#include <cmath>
#include <queue>
#include <stack>

#define read_len  150
#define haplotype_len 300

void pairhmm(
    int haplotype[haplotype_len], int read[read_len], int read_BQ[read_len],
    float bias_score,
    float m2m, float i2m, float m2i, float i2i,
    float BQ0_match, float BQ0_mismatch, 
    float BQ1_match, float BQ1_mismatch, 
    float BQ2_match, float BQ2_mismatch, 
    float BQ3_match, float BQ3_mismatch,
	float* final_score) {


    // Define the matrix
    float align_scores[read_len][haplotype_len]  = {0};
    float insert_scores[read_len][haplotype_len] = {0};
    float delete_scores[read_len][haplotype_len] = {0};
    
    // Initialization
    for (int j = 0; j < haplotype_len + 1; ++j) {
        align_scores [0][j] = -pow(2, 15);
        insert_scores[0][j] = -pow(2, 15);
        delete_scores[0][j] = bias_score;
    }
    for (int i = 1; i < read_len + 1; ++i) {
        align_scores [i][0] = -pow(2, 15);
        insert_scores[i][0] = -pow(2, 15);
        delete_scores[i][0] = -pow(2, 15);
    }


    float scores[haplotype_len] = {0};

    float weight = 0;
    float temp_align_score = 0;
    float temp_insert_score = 0;
    float temp_delete_score = 0;
    *final_score = -pow(2, 15);

    // From left to right; From top to bottom
    for (int i=0; i<read_len; ++i) {
        for (int j=0; j<haplotype_len; ++j) {

            // align scores operation
            char read_base = read[i];
            char haplotype_base = haplotype[j];
            if (read_BQ[i]== 0) {
                if (read_base == haplotype_base)
                    weight = BQ0_match;
                else
                    weight = BQ0_mismatch;
            } else if (read_BQ[i]== 1) {
                if (read_base == haplotype_base)
                    weight = BQ1_match;
                else
                    weight = BQ1_mismatch;
            } else if (read_BQ[i]== 2) {
                if (read_base == haplotype_base)
                    weight = BQ2_match;
                else
                    weight = BQ2_mismatch;
            } else if (read_BQ[i]== 3) {
                if (read_base == haplotype_base)
                    weight = BQ3_match;
                else
                    weight = BQ3_mismatch;
            } 

            temp_align_score  = align_scores[i][j]  * weight * m2m;
            temp_insert_score = insert_scores[i][j] * weight * i2m;
            temp_delete_score = delete_scores[i][j] * weight * i2m;

            // Add all possible paths
            align_scores[i+1][j+1] = temp_align_score + temp_insert_score + temp_delete_score;
            
            // insert scores operation
            temp_align_score  = align_scores[i][j+1]  * m2i;
            temp_insert_score = insert_scores[i][j+1] * i2i;

            insert_scores[i+1][j+1] = temp_align_score + temp_insert_score;

            
            // delete scores operation
            temp_align_score  = align_scores[i+1][j]  * m2i;
            temp_delete_score = delete_scores[i+1][j] * i2i;

            delete_scores[i+1][j+1] = temp_align_score + temp_delete_score;

            // scores operation
            // Last Row, Choose the maximum scores
            if (i == read_len-1) {
                temp_align_score  = align_scores[i+1][j+1];
                temp_insert_score = insert_scores[i+1][j+1];
                temp_delete_score = delete_scores[i+1][j+1];

                // Max score in the cell
                if (temp_align_score >= temp_insert_score) 
                    scores[j] = temp_align_score;
                else 
                    scores[j] = temp_insert_score;

                if (temp_delete_score >= scores[j]) scores[j] = temp_delete_score;

                // Max score in the row
                if (scores[j] > *final_score)   *final_score = scores[j];
            }
        }
    } 
    // end of dynamic programming

    return;
}
