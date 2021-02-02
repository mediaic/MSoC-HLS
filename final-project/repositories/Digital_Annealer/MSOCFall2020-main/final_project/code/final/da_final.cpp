#include "da.h"
#include "math.h"

static ap_uint<32> lfsr=0;

unsigned int pseudo_random() {
#pragma HLS INLINE
  if (lfsr == 0 )
    lfsr = 123;
  bool b_32 = lfsr.get_bit(32-32);
  bool b_22 = lfsr.get_bit(32-22);
  bool b_2 = lfsr.get_bit(32-2);
  bool b_1 = lfsr.get_bit(32-1);
  bool new_bit = b_32 ^ b_22 ^ b_2 ^ b_1;
  lfsr = lfsr >> 1;
  lfsr.set_bit(31, new_bit);
  return lfsr;
}

void reset(Node nodeArray[citysize], double distance_matrix[citysize][citysize], int index, struct DA* da){
//#pragma HLS ARRAY_PARTITION variable=nodeArray complete
//#pragma HLS ARRAY_PARTITION variable=distance_matrix complete dim=2
//#pragma HLS ARRAY_PARTITION variable=da->_qubit_matrix complete dim=2
//#pragma HLS ARRAY_PARTITION variable=da->_distance_matrix complete dim=2
	for(int i = 0; i < citysize; i++){
//#pragma HLS pipeline
		for(int j = 0; j < citysize; j++){
			da->_distance_matrix[i][j] = distance_matrix[i][j];
			da->_qubit_matrix[i][j] = 0;
		}

		da -> _nodeArray[i]._x = nodeArray[i]._x;
		da -> _nodeArray[i]._y = nodeArray[i]._y;
	}

	double cr = cooling_rate;
	for(int i = 0; i < index; i++){
	    cr = cr * cooling_rate;
	}
    da -> _beta = beta / cr;
    da -> _energy = 10000;
    da->_E_off = 0;
}


 int penalty_funciotn(int x){
#pragma HLS INLINE
     x = x-1;
     return x*x;
 }

// template <int a>
 void calculate_energy(struct DA* da)
 {
//#pragma HLS ARRAY_PARTITION variable=da->_qubit_matrix complete dim=2
//#pragma HLS ARRAY_PARTITION variable=da->_distance_matrix complete dim=2
     //i order
     //k city
     double H = 0, HA = 0, HB = 0, HC=0;
     //HA,HC
     for(int k = 0; k < citysize; k++){
         int Bi = 0, Ci = 0;
//#pragma HLS pipeline
         for(int i = 0; i < citysize; i++){
             if(da -> _qubit_matrix[i][k]){
                 Ci ++;
                 if(i < citysize - 1){
                     for(int l = 0; l < citysize; l++){
                         HA += da -> _distance_matrix[k][l] * da -> _qubit_matrix[i+1][l];
                     }
                 }
                 else{ //last city to first city
                     for(int l = 0; l < citysize; l++){
                         HA += da -> _distance_matrix[k][l] * da -> _qubit_matrix[0][l];
                     }
                 }

             }
             if(da -> _qubit_matrix[k][i]) Bi++;
         }
         HB += penalty_funciotn(Bi);
         HC += penalty_funciotn(Ci);
     }
     H = HA + _A*(HB + HC);
//     return H;
     da->_energy = H;
 }


 void calculate_distance(Node nodeArray[citysize], double distance_matrix[citysize][citysize])
 {
#pragma HLS INLINE
     for(int i = 0; i < citysize; i++){
//#pragma HLS pipeline
         for(int j = 0; j < citysize; j++){
        	 double xi = nodeArray[i]._x;
        	 double yi = nodeArray[i]._y;
        	 double xj = nodeArray[j]._x;
        	 double yj = nodeArray[j]._y;
             distance_matrix[i][j] = sqrt((xi-xj)*(xi-xj) + (yi-yj)*(yi-yj));
         }
     }
 }

 double calculate_delta_energy(struct DA* da, int i, int j)
 {
#pragma HLS INLINE
     double H = 0, HA = 0 , HB = 0, HC = 0;
     int sgn;
     int Bi = 0, Ci = 0;
     sgn = (da -> _qubit_matrix[i][j])?-1:1; //sign
     for(int l = 0; l < citysize; l++){
//#pragma HLS pipeline
    	 if(i-1 >= 0 && i-1 < citysize)
    		 HA += da -> _distance_matrix[j][l] * da -> _qubit_matrix[i-1][l];
    	 if(i+1 >= 0 && i+1 < citysize)
    	     		 HA += da -> _distance_matrix[j][l] * da -> _qubit_matrix[i+1][l];

         if(da -> _qubit_matrix[i][l]){
             Bi ++;
         }
         if(da -> _qubit_matrix[l][j]){
             Ci ++;
         }
     }
     HB = penalty_funciotn(Bi+sgn) - penalty_funciotn(Bi);
     HC = penalty_funciotn(Ci+sgn) - penalty_funciotn(Ci);
     H = sgn * HA + _A*(HB + HC);
     return H;
 }


 bool ADB(struct DA* da, double delta_energy)
 {
#pragma HLS INLINE
     delta_energy = delta_energy - da -> _E_off; // add or minus ?
     //an ramdom number[0,1)
     double random0to1 = (double) (pseudo_random()%100) / 100;
     double probabilty = exp(-delta_energy/ da -> _beta);
     double acceptance_probability;
     if(probabilty < 1) acceptance_probability = probabilty;
     else acceptance_probability = 1;
     if(acceptance_probability >= random0to1) return 1; //mean accept
     else return 0;
     // return delta_energy < 0;
 }
 bool random_choose_flip(bool candidate[citysize][citysize], int* flipx, int* flipy){
#pragma HLS INLINE
     int candidatecount = 0;
     for(int i = 0; i < citysize; i++){
         for(int j = 0; j < citysize; j++){
             if(candidate[i][j]) candidatecount++;
         }
     }
     if(candidatecount == 0) return false; //no cadicate;
     int ramdom_candidate = pseudo_random() % candidatecount;
     candidatecount = 0;
     for(int i = 0; i < citysize; i++){
         for(int j = 0; j < citysize; j++){
             if(candidate[i][j]){
                 if(candidatecount++ == ramdom_candidate){
                     *flipx = i;
                     *flipy = j;
                     return true;
                 }
             }
         }
     }
     return false;
 }

 //parallel
 // template <int a>
  bool execute_replica(struct DA* da){

     bool flipResult = 0;
     int flipx, flipy;
     bool candidate[citysize][citysize];

#pragma HLS ARRAY_PARTITION variable=candidate complete dim=2
//#pragma HLS ARRAY_PARTITION variable=da->_qubit_matrix complete dim=2
//#pragma HLS ARRAY_PARTITION variable=da->_distance_matrix complete dim=2

     da -> _E_off = 0;
     for(int i=0;i<5 && !flipResult; i++)
     {
#pragma HLS loop_tripcount min=1 max=5 avg=2
         //cout << "Candidate: " << endl;
#pragma HLS pipeline
         for(int i = 0; i < citysize; i++){

//#pragma HLS unroll factor=citysize
             for(int j = 0; j < citysize; j++){
                 double delta_energy = calculate_delta_energy(da, i, j);//many candidate
                 candidate[i][j] = ADB(da, delta_energy);
             }
         }
         //choose one to flip;
         flipResult = random_choose_flip(candidate, &flipx, &flipy);
         da -> _E_off += _E_off_increment;
         if(da ->_E_off > 100000) {
             return false;
         }
     }
     da ->  _qubit_matrix[flipx][flipy] = !da ->  _qubit_matrix[flipx][flipy];
     return true;
 }



 bool replica_exchange_ADB(double beta1, double beta2, double energy1, double energy2)
 {
#pragma HLS INLINE
     double delta_beta = beta1 - beta2;
     double delta_energy = energy1 - energy2;
     //an ramdom number[0,1)
     double random0to1 = (double) (pseudo_random()%100) / 100;
     double probabilty = exp(delta_beta*delta_energy);
     double acceptance_probability;
     if(probabilty < 1) acceptance_probability = probabilty;
     else acceptance_probability = 1;
     if(acceptance_probability >= random0to1) return 1; //mean accept
     else return 0;
 }

 void replica_exchange(struct DA* da1, struct DA* da2){
	 double temp_energy = 0;
     bool temp_qubit_matrix[citysize][citysize];

//#pragma HLS ARRAY_PARTITION variable=da1->_qubit_matrix complete dim=2
//#pragma HLS ARRAY_PARTITION variable=da2->_qubit_matrix complete dim=2

     bool exchange = replica_exchange_ADB(da1->_beta, da2->_beta, da1->_energy, da2->_energy);
     if(exchange){
         for(int i = 0; i < citysize; i++){
//#pragma HLS pipeline
             for(int j = 0; j < citysize; j++){
                 temp_qubit_matrix[i][j] = da1->_qubit_matrix[i][j];
                 da1->_qubit_matrix[i][j] = da2->_qubit_matrix[i][j];
                 da2->_qubit_matrix[i][j] = temp_qubit_matrix[i][j];
             }
         }
         temp_energy = da1->_energy;
         da1->_energy = da2->_energy;
         da2->_energy = temp_energy;
     }
 }


void DigitalAnnealer(Node nodeArray[citysize], bool best_qubit_matrix[citysize][citysize], double *best_energy)
{
	DA replica[replicaNum];
//	DA replica0;
//	DA replica1;
//	DA replica2;
//	DA replica3;
//	DA replica4;

	double distance_matrix[citysize][citysize];

#pragma HLS ARRAY_PARTITION variable=replica complete
#pragma HLS ARRAY_PARTITION variable=nodeArray complete
#pragma HLS ARRAY_PARTITION variable=distance_matrix complete dim=2
#pragma HLS ARRAY_PARTITION variable=best_qubit_matrix complete dim=2

	calculate_distance(nodeArray, distance_matrix);
	for (int i=0; i<replicaNum; i++)
	{
		reset(nodeArray, distance_matrix, i, &replica[i]);
	}

	*best_energy = 10000;
	DA_L1:for(int iter = 0; iter < iteration; iter++){
		DA_L2:for(int i = 0; i < replicaNum; i++){
#pragma HLS unroll
#pragma HLS pipeline
			execute_replica(&replica[i]);
			calculate_energy(&replica[i]);
		}//finish one iteration

		//replica exchange
		DA_L3:for(int i = 0; i < replicaNum; i++){
			if(i < replicaNum-1 )
				replica_exchange(&replica[i], &replica[i+1]);
		}

	    //find the best for all setting(each iteration find ones)
		DA_L4:for(int i = 0; i < replicaNum; i++){
			if (replica[i]._energy < *best_energy)
			{
				*best_energy = replica[i]._energy;
				for(int i = 0; i < citysize; i++){
					for(int j = 0; j < citysize; j++){
						best_qubit_matrix[i][j] = replica[i]._qubit_matrix[i][j];
				    }
				}
			}
		}
	 }
}
