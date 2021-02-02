
#include <iostream>
#include <string>
#include <vector>
#include <cmath>
#include <queue>
#include <stack>

using namespace std;

#define read_len  150
#define haplotype_len 300

int main(int argc, char *argv[])
{
	int i, j;
	int pass = 1;

	cout << ">> Start test!" << endl;

    // Test data 
    int haplotype[haplotype_len]  = {0};
    int read[read_len] = {0};
    int read_BQ[read_len] = {0};

    // Parameter
    float bias_score = 0.0;
    float m2m = 0.9998;
    float i2m = 0.9;
    float m2i = 0.0001;
    float i2i = 0.1;
    float BQ0_match = 0.6;
    float BQ0_mismatch = 0.1333333;
    float BQ1_match = 0.96;
    float BQ1_mismatch = 0.0133333;
    float BQ2_match = 0.996;
    float BQ2_mismatch = 0.0013333;
    float BQ3_match = 0.9996;
    float BQ3_mismatch = 0.0001333;
    
    // Result
    float highest_score

    for(i = 0; i < 10; i++) {
		cout << "------------------------" << endl;
        for(int j = 0; j < haplotype_len; j++) {
            haplotype[i] = (i%4);
            if (i < read_len){
                read[i] = (i%4);
                read_BQ[i] = (i%4);
            }
	    }
		pairhmm(haplotype, read, read_BQ, bias_score, m2m, i2m, m2i, i2i, BQ0_match, BQ0_mismatch, BQ1_match, BQ1_mismatch, BQ2_match, BQ2_mismatch, BQ3_match, BQ3_mismatch, &highest_score);

		cout << "Result " << i << " = " << highest_score << endl;
        cout << "------------------------" << endl;
	}


	
	return 0;
}
