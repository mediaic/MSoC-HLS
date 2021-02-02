#include "da.h"
#include "math.h"

static ap_uint<32> lfsr=0;

unsigned int pseudo_random() {
//#pragma HLS INLINE off
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

void reset(struct DA* da, Node nodeArray[citysize]){
    //for da
    da -> _beta = 0;
    da -> _best_energy = 10000;
    da->_E_off = 0;
	for(int i = 0; i < citysize; i++){
		for(int j = 0; j < citysize; j++){
			da->_distance_matrix[i][j] = 0;
			da->_current_qubit_matrix[i][j] = 0;
			da->_best_qubit_matrix[i][j] = 0;
		}
	}

    for(int i = 0; i < citysize; i++){
        da -> _nodeArray[i]._x = nodeArray[i]._x;
        da -> _nodeArray[i]._y = nodeArray[i]._y;
    }
    //for each replica
    double cr = cooling_rate;
    for(int i = 0; i < replicaNum; i++){
    	da->_replicaArray[i]._energy = 0;
    	da -> _replicaArray[i]._beta = beta / cr;
    	cr = cr * cooling_rate;
    	for(int j = 0; j < citysize; j++){
            for(int k=0; k < citysize; k++){
                da ->_replicaArray[i]._qubit_matrix[j][k] = 0;//all replica set to zero
            }
        }
    }
}


 int penalty_funciotn(int x){
     x = x-1;
     return x*x;
 }

 double calculate_energy(struct DA* da)
 {
     //i order
     //k city
     double H = 0, HA = 0, HB = 0, HC=0;
     //HA,HC
     for(int k = 0; k < citysize; k++){
         int Bi = 0, Ci = 0;
         for(int i = 0; i < citysize; i++){
             if(da -> _current_qubit_matrix[i][k]){
                 Ci ++;
                 if(i < citysize - 1){
                     for(int l = 0; l < citysize; l++){
                         HA += da -> _distance_matrix[k][l] * da -> _current_qubit_matrix[i+1][l];
                     }
                 }
                 else{ //last city to first city
                     for(int l = 0; l < citysize; l++){
                         HA += da -> _distance_matrix[k][l] * da -> _current_qubit_matrix[0][l];
                     }
                 }

             }
             if(da -> _current_qubit_matrix[k][i]) Bi++;
         }
         HB += penalty_funciotn(Bi);
         HC += penalty_funciotn(Ci);
     }
     H = HA + _A*(HB + HC);
     return H;
 }


 void calculate_distance(struct DA* da)
 {
     for(int i = 0; i < citysize; i++){
         for(int j = 0; j < citysize; j++){
             da -> _distance_matrix[i][j] =
             sqrt((da -> _nodeArray[i]._x - da -> _nodeArray[j]._x)*(da -> _nodeArray[i]._x - da -> _nodeArray[j]._x)+(da -> _nodeArray[i]._y - da -> _nodeArray[j]._y)*(da -> _nodeArray[i]._y - da -> _nodeArray[j]._y));
         }
     }
 }

 double calculate_delta_energy(struct DA* da, int i, int j)
 {
     double H = 0, HA = 0 , HB = 0, HC = 0;
     int sgn;
     int Bi = 0, Ci = 0;
     sgn = (da -> _current_qubit_matrix[i][j])?-1:1; //sign
     for(int l = 0; l < citysize; l++){
    	 if(i-1 >= 0 && i-1 < citysize)
    		 HA += da -> _distance_matrix[j][l] * da -> _current_qubit_matrix[i-1][l];
    	 if(i+1 >= 0 && i+1 < citysize)
    	     		 HA += da -> _distance_matrix[j][l] * da -> _current_qubit_matrix[i+1][l];

         if(da -> _current_qubit_matrix[i][l]){
             Bi ++;
         }
         if(da -> _current_qubit_matrix[l][j]){
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
 bool calculate_delta(struct DA* da)
 {
     bool flipResult = 0;
     int flipx, flipy;
     da -> _E_off = 0;
     for(int i=0;i<5 && !flipResult; i++)
     {
#pragma HLS loop_tripcount min=1 max=5 avg=2
         bool candidate[citysize][citysize] = {};
         //cout << "Candidate: " << endl;
         for(int i = 0; i < citysize; i++){
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
     da ->  _current_qubit_matrix[flipx][flipy] = !da ->  _current_qubit_matrix[flipx][flipy];
     return true;
 }


 bool replica(struct DA* da){
     return calculate_delta(da);
 }


 bool replica_exchange_ADB(struct DA* da, int replicaIdx1, int replicaIdx2)
 {
     double delta_beta = da -> _replicaArray[replicaIdx1]._beta - da -> _replicaArray[replicaIdx2]._beta;
     double delta_energy = da -> _replicaArray[replicaIdx1]._energy - da -> _replicaArray[replicaIdx2]._energy;
     //an ramdom number[0,1)
     double random0to1 = (double) (pseudo_random()%100) / 100;
     double probabilty = exp(delta_beta*delta_energy);
     double acceptance_probability;
     if(probabilty < 1) acceptance_probability = probabilty;
     else acceptance_probability = 1;
     if(acceptance_probability >= random0to1) return 1; //mean accept
     else return 0;
 }

 void replica_exchange(struct DA* da, int replicaIdx1, int replicaIdx2){
     bool exchange = replica_exchange_ADB(da,replicaIdx1, replicaIdx2);
     bool temp_qubit_matrix[citysize][citysize];
     double temp_energy = 0;
     if(exchange){
         for(int i = 0; i < citysize; i++){
             for(int j = 0; j < citysize; j++){
                 temp_qubit_matrix[i][j] = da -> _replicaArray[replicaIdx1]._qubit_matrix[i][j];
                 da -> _replicaArray[replicaIdx1]._qubit_matrix[i][j] = da -> _replicaArray[replicaIdx2]._qubit_matrix[i][j];
                 da -> _replicaArray[replicaIdx2]._qubit_matrix[i][j] = temp_qubit_matrix[i][j];
             }
         }
         temp_energy = da -> _replicaArray[replicaIdx1]._energy;
         da -> _replicaArray[replicaIdx1]._energy = da -> _replicaArray[replicaIdx2]._energy;
         da -> _replicaArray[replicaIdx2]._energy = temp_energy;
     }
 }


 void find_best_energy(struct DA* da){

     for(int replicaIdx = 0; replicaIdx < replicaNum; replicaIdx++){
         double energy = da -> _replicaArray[replicaIdx]._energy;
         if(energy < da -> _best_energy){
             da -> _best_energy = energy;
             for(int i = 0; i < citysize; i++){
                 for(int j = 0; j < citysize; j++){
                     da -> _best_qubit_matrix[i][j] = da -> _replicaArray[replicaIdx]._qubit_matrix[i][j];
                 }
             }
         }
     }
 }


void DigitalAnnealer(struct DA* da, Node nodeArray[citysize]) {
     reset(da, nodeArray);
     calculate_distance(da);

     for(int iter = 0; iter < iteration; iter++){
		 for(int replicaIdx = 0; replicaIdx < replicaNum; replicaIdx++){
             #pragma HLS UNROLL factor=20
             da -> _beta = da -> _replicaArray[replicaIdx]._beta;
             for(int i = 0; i < citysize; i++){
                 for(int j = 0; j < citysize; j++){
                     da -> _current_qubit_matrix[i][j] = da -> _replicaArray[replicaIdx]._qubit_matrix[i][j];
                 }
             }
             replica(da);
             for(int i = 0; i < citysize; i++){
                 for(int j = 0; j < citysize; j++){
                     da -> _replicaArray[replicaIdx]._qubit_matrix[i][j] = da -> _current_qubit_matrix[i][j];
                 }
             }
             da -> _replicaArray[replicaIdx]._energy = calculate_energy(da);
         }//finish one iteration

         //replica exchange
         for(int replicaIdx = 0; replicaIdx < replicaNum; replicaIdx++){
             if(replicaIdx < replicaIdx-1 )replica_exchange(da, replicaIdx, replicaIdx+1);
         }

         //find the best for all setting(each iteration find ones)
         find_best_energy(da);
     }
}
