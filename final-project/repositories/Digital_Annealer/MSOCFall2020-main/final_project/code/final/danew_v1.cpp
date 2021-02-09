#include "danew_v1.h"
#include "math.h"

static ap_uint<32> lfsr0=0;
static ap_uint<32> lfsr1=1;
static ap_uint<32> lfsr2=2;
static ap_uint<32> lfsr3=3;
static ap_uint<32> lfsr4=4;
static ap_uint<32> lfsr5=5;
static ap_uint<32> lfsr6=6;
static ap_uint<32> lfsr7=7;
static ap_uint<32> lfsr8=8;
static ap_uint<32> lfsr9=9;
static ap_uint<32> lfsr10=10;
static ap_uint<32> lfsr11=11;
static ap_uint<32> lfsr12=12;
static ap_uint<32> lfsr13=13;
static ap_uint<32> lfsr14=14;
static ap_uint<32> lfsr15=15;
static ap_uint<32> lfsr16=16;
static ap_uint<32> lfsr17=17;
static ap_uint<32> lfsr18=18;
static ap_uint<32> lfsr19=19;
static ap_uint<32> lfsrexchange = 0;

unsigned int pseudo_random_exchange() {
  if (lfsrexchange == 0 )
    lfsrexchange = 123;
  bool b_32 = lfsrexchange.get_bit(32-32);
  bool b_22 = lfsrexchange.get_bit(32-22);
  bool b_2  = lfsrexchange.get_bit(32-2);
  bool b_1  = lfsrexchange.get_bit(32-1);
  bool new_bit = b_32 ^ b_22 ^ b_2 ^ b_1;
  lfsrexchange = lfsrexchange >> 1;
  lfsrexchange.set_bit(31, new_bit);
  return lfsrexchange;
}

unsigned int pseudo_random(ap_uint<32> &lfsr) {
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

int penalty_funciotn(int x){
  x = x-1;
  return x*x;
}

double calculate_energy(double A,double distance_matrix[citysize][citysize], bool qubit_matrix[citysize][citysize])
{
  //i order
  //k city
  double H = 0, HA = 0, HB = 0, HC=0;
  //HA,HC
  for(int k = 0; k < citysize; k++){
      int Bi = 0, Ci = 0;
      for(int i = 0; i < citysize; i++){
          if(qubit_matrix[i][k]){
              Ci ++;
              if(i < citysize - 1){
                  for(int l = 0; l < citysize; l++){
                      HA += distance_matrix[k][l] * qubit_matrix[i+1][l];
                  }
              }
              else{ //last city to first city
                  for(int l = 0; l < citysize; l++){
                      HA += distance_matrix[k][l] * qubit_matrix[0][l];
                  }
              }

          }
          if(qubit_matrix[k][i]) Bi++;
      }
      HB += penalty_funciotn(Bi);
      HC += penalty_funciotn(Ci);
  }
  H = HA + A*(HB + HC);
  return H;
}

double calculate_delta_energy(double A, double distance_matrix[citysize][citysize], bool qubit_matrix[citysize][citysize], int i, int j)
{
     double H = 0, HA = 0 , HB = 0, HC = 0;
     int sgn;
     int Bi = 0, Ci = 0;
     sgn = (qubit_matrix[i][j])?-1:1; //sign
     for(int l = 0; l < citysize; l++){
        if(i-1 >= 0 && i-1 < citysize)
          HA += distance_matrix[j][l] * qubit_matrix[i-1][l];
        if(i == 0) 
          HA += distance_matrix[j][l] * qubit_matrix[citysize-1][l];
        if(i+1 >= 0 && i+1 < citysize)
          HA += distance_matrix[j][l] * qubit_matrix[i+1][l];
        if(i == citysize - 1)
          HA += distance_matrix[j][l] * qubit_matrix[0][l];  

        if(qubit_matrix[i][l]){
          Bi ++;
        }
        if(qubit_matrix[l][j]){
          Ci ++;
        }
     }
     HB = penalty_funciotn(Bi+sgn) - penalty_funciotn(Bi);
     HC = penalty_funciotn(Ci+sgn) - penalty_funciotn(Ci);
     H = sgn * HA + A*(HB + HC);
     return H;
}

bool ADB(double delta_energy, double beta, ap_uint<32> lfsr){
  //an ramdom number[0,1)
  double random0to1 = (double) (pseudo_random(lfsr)%100) / 100; 
  double probabilty = exp(-delta_energy* beta);
  double acceptance_probability;
  if(probabilty < 1) acceptance_probability = probabilty;
  else acceptance_probability = 1;
  if(acceptance_probability >= random0to1) return 1; //mean accept
  else return 0;
}

void execute_replica(struct Replica* replica, ap_uint<32> &lfsr){  
  double delta_energy[citysize][citysize] = {};
  bool candidate[citysize][citysize] = {};
  double Eoff = 0;
  int flipx, flipy;
  bool flipResult = false;
  
  double distance_matrix[citysize][citysize];
  for(int i=0; i<citysize;i++){
    for(int j=0;j<citysize;j++){
       distance_matrix[i][j] = replica->_distance_matrix[i][j];
    }
  }

  for(int i=0;i<5 && !flipResult; i++){//at least five time
  #pragma HLS loop_tripcount min=1 max=5 avg=2
    //parallel trial
    for(int i = 0; i < citysize; i++){
      for(int j = 0; j < citysize; j++){
        delta_energy[i][j] = calculate_delta_energy(replica->_A,distance_matrix, replica -> _qubit_matrix,i,j) - Eoff;// add or minus ?
        candidate[i][j] = ADB(delta_energy[i][j], replica -> _beta, lfsr);
      }
    }
    //choose one to flip;
    int candidatecount = 0;
    for(int i = 0; i < citysize; i++){
        for(int j = 0; j < citysize; j++){
            if(candidate[i][j]) candidatecount++;
        }
    }
    if(candidatecount == 0) flipResult = 0; //no cadicate;
    else{
      int ramdom_candidate = pseudo_random(lfsr) % candidatecount;
      candidatecount = 0;
      for(int i = 0; i < citysize; i++){
          for(int j = 0; j < citysize; j++){
              if(candidate[i][j]){
                  if(candidatecount++ == ramdom_candidate){
                      flipx = i;
                      flipy = j;
                      flipResult = 1;
                  }
              }
          }
      }
      flipResult = 0;
    }
    Eoff += _E_off_increment;
  }
  replica -> _qubit_matrix[flipx][flipy] = !replica -> _qubit_matrix[flipx][flipy];
  replica->_energy = calculate_energy(replica->_A,distance_matrix, replica->_qubit_matrix);
}

bool replica_exchange_ADB(double beta1, double beta2, double energy1, double energy2){
     double delta_beta = beta1 - beta2;
     double delta_energy = energy1 - energy2;
     //an ramdom number[0,1)
     double random0to1 = (double) (pseudo_random_exchange()%100) / 100;
     double probabilty = exp(delta_beta*delta_energy);
     double acceptance_probability;
     if(probabilty < 1) acceptance_probability = probabilty;
     else acceptance_probability = 1;
     if(acceptance_probability >= random0to1) return 1; //mean accept
     else return 0;
}
void replica_exchange(struct Replica* replica1, struct Replica* replica2){
	double temp_energy = 0;
  bool temp_qubit_matrix[citysize][citysize];
  bool exchange = replica_exchange_ADB(replica1->_beta, replica2->_beta, replica1->_energy, replica2->_energy);
  if(exchange){
    for(int i = 0; i < citysize; i++){
      for(int j = 0; j < citysize; j++){
        temp_qubit_matrix[i][j] = replica1->_qubit_matrix[i][j];
        replica1->_qubit_matrix[i][j] = replica2->_qubit_matrix[i][j];
        replica2->_qubit_matrix[i][j] = temp_qubit_matrix[i][j];
      }
    }
    temp_energy = replica1->_energy;
    replica1->_energy = replica2->_energy;
    replica2->_energy = temp_energy;
  }
 }
void do_replica_exchange(struct Replica* replica0, struct Replica* replica1, struct Replica* replica2, struct Replica* replica3, struct Replica* replica4, struct Replica* replica5,struct Replica* replica6, struct Replica* replica7, struct Replica* replica8, struct Replica* replica9,struct Replica* replica10, struct Replica* replica11, struct Replica* replica12, struct Replica* replica13, struct Replica* replica14, struct Replica* replica15,struct Replica* replica16, struct Replica* replica17, struct Replica* replica18, struct Replica* replica19 ){
  replica_exchange(replica0, replica1);
  replica_exchange(replica1, replica2);
  replica_exchange(replica2, replica3);            
  replica_exchange(replica3, replica4);
  replica_exchange(replica4, replica5);
  replica_exchange(replica5, replica6);
  replica_exchange(replica6, replica7);
  replica_exchange(replica7, replica8);
  replica_exchange(replica8, replica9);
  replica_exchange(replica9, replica10);
  replica_exchange(replica10, replica11);
  replica_exchange(replica11, replica12);
  replica_exchange(replica12, replica13);            
  replica_exchange(replica13, replica14);
  replica_exchange(replica14, replica15);
  replica_exchange(replica15, replica16);
  replica_exchange(replica16, replica17);
  replica_exchange(replica17, replica18);
  replica_exchange(replica18, replica19);
}      
void replace_best_matrix(bool (&best_qubit_matrix)[citysize][citysize], bool qubit_matrix[citysize][citysize]){
      for(int i = 0; i < citysize; i++){
        for(int j = 0; j < citysize; j++){
          best_qubit_matrix[i][j] = qubit_matrix[i][j];
          }
      }
}
int find_the_best(double &best_energy, struct Replica* replica0, struct Replica* replica1, struct Replica* replica2, struct Replica* replica3, struct Replica* replica4, struct Replica* replica5,struct Replica* replica6, struct Replica* replica7, struct Replica* replica8, struct Replica* replica9,struct Replica* replica10, struct Replica* replica11, struct Replica* replica12, struct Replica* replica13, struct Replica* replica14, struct Replica* replica15,struct Replica* replica16, struct Replica* replica17, struct Replica* replica18, struct Replica* replica19){
//find the best for all setting(each iteration find ones)
  int index;
  if(replica0->_energy < best_energy){best_energy = replica0->_energy;index = 0;}
  if(replica1->_energy < best_energy){best_energy = replica1->_energy;index = 1;}
  if(replica2->_energy < best_energy){best_energy = replica2->_energy;index = 2;}
  if(replica3->_energy < best_energy){best_energy = replica3->_energy;index = 3;}
  if(replica4->_energy < best_energy){best_energy = replica4->_energy;index = 4;}
  if(replica5->_energy < best_energy){best_energy = replica5->_energy;index = 5;}
  if(replica6->_energy < best_energy){best_energy = replica6->_energy;index = 6;}
  if(replica7->_energy < best_energy){best_energy = replica7->_energy;index = 7;}
  if(replica8->_energy < best_energy){best_energy = replica8->_energy;index = 8;}
  if(replica9->_energy < best_energy){best_energy = replica9->_energy;index = 9;}
  if(replica10->_energy < best_energy){best_energy = replica10->_energy;index = 10;};
  if(replica11->_energy < best_energy){best_energy = replica11->_energy;index = 11;};
  if(replica12->_energy < best_energy){best_energy = replica12->_energy;index = 12;};
  if(replica13->_energy < best_energy){best_energy = replica13->_energy;index = 13;};
  if(replica14->_energy < best_energy){best_energy = replica14->_energy;index = 14;};
  if(replica15->_energy < best_energy){best_energy = replica15->_energy;index = 15;};
  if(replica16->_energy < best_energy){best_energy = replica16->_energy;index = 16;};
  if(replica17->_energy < best_energy){best_energy = replica17->_energy;index = 17;};
  if(replica18->_energy < best_energy){best_energy = replica18->_energy;index = 18;};
  if(replica19->_energy < best_energy){best_energy = replica19->_energy;index = 19;};
  return index;
}

void execute_replica_parallel(struct Replica* replica0, struct Replica* replica1, struct Replica* replica2, struct Replica* replica3, struct Replica* replica4, struct Replica* replica5,struct Replica* replica6, struct Replica* replica7, struct Replica* replica8, struct Replica* replica9,struct Replica* replica10, struct Replica* replica11, struct Replica* replica12, struct Replica* replica13, struct Replica* replica14, struct Replica* replica15,struct Replica* replica16, struct Replica* replica17, struct Replica* replica18, struct Replica* replica19){
  #pragma HLS ALLOCATION instances= execute_replica limit=20 function
  execute_replica(replica0,lfsr0);
  execute_replica(replica1,lfsr1);
  execute_replica(replica2,lfsr2);
  execute_replica(replica3,lfsr3);
  execute_replica(replica4,lfsr4);
  execute_replica(replica5,lfsr5);
  execute_replica(replica6,lfsr6);
  execute_replica(replica7,lfsr7);
  execute_replica(replica8,lfsr8);
  execute_replica(replica9,lfsr9);
  execute_replica(replica10,lfsr10);
  execute_replica(replica11,lfsr11);
  execute_replica(replica12,lfsr12);
  execute_replica(replica13,lfsr13);
  execute_replica(replica14,lfsr14);
  execute_replica(replica15,lfsr15);
  execute_replica(replica16,lfsr16);
  execute_replica(replica17,lfsr17);
  execute_replica(replica18,lfsr18);
  execute_replica(replica19,lfsr19);
}


void DigitalAnnealer(double A, double _distance_matrix[citysize][citysize], double _beta[replicaNum], bool (&best_qubit_matrix)[citysize][citysize],double &best_energy){
  bool initial_qubit_matrix[citysize][citysize] = {};//all set to 0
  double initial_energy = 10*A;
  best_energy = initial_energy;
  Replica replica0 = {replica0._beta = _beta[0]};replica0._energy = initial_energy;replica0._A = A;
  Replica replica1 = {replica1._beta = _beta[1]};replica1._energy = initial_energy;replica1._A = A;
  Replica replica2 = {replica2._beta = _beta[2]};replica2._energy = initial_energy;replica2._A = A;
  Replica replica3 = {replica3._beta = _beta[3]};replica3._energy = initial_energy;replica3._A = A;
  Replica replica4 = {replica4._beta = _beta[4]};replica4._energy = initial_energy;replica4._A = A;
  Replica replica5 = {replica5._beta = _beta[5]};replica5._energy = initial_energy;replica5._A = A;
  Replica replica6 = {replica6._beta = _beta[6]};replica6._energy = initial_energy;replica6._A = A;
  Replica replica7 = {replica7._beta = _beta[7]};replica7._energy = initial_energy;replica7._A = A;
  Replica replica8 = {replica8._beta = _beta[8]};replica8._energy = initial_energy;replica8._A = A;
  Replica replica9 = {replica9._beta = _beta[9]};replica9._energy = initial_energy;replica9._A = A;
  Replica replica10 = {replica10._beta = _beta[10]};replica10._energy = initial_energy;replica10._A = A;
  Replica replica11 = {replica11._beta = _beta[11]};replica11._energy = initial_energy;replica11._A = A;
  Replica replica12 = {replica12._beta = _beta[12]};replica12._energy = initial_energy;replica12._A = A;
  Replica replica13 = {replica13._beta = _beta[13]};replica13._energy = initial_energy;replica13._A = A;
  Replica replica14 = {replica14._beta = _beta[14]};replica14._energy = initial_energy;replica14._A = A;
  Replica replica15 = {replica15._beta = _beta[15]};replica15._energy = initial_energy;replica15._A = A;
  Replica replica16 = {replica16._beta = _beta[16]};replica16._energy = initial_energy;replica16._A = A;
  Replica replica17 = {replica17._beta = _beta[17]};replica17._energy = initial_energy;replica17._A = A;
  Replica replica18 = {replica18._beta = _beta[18]};replica18._energy = initial_energy;replica18._A = A;
  Replica replica19 = {replica19._beta = _beta[19]};replica19._energy = initial_energy;replica19._A = A;     
  

  for(int i=0; i<citysize;i++){
    for(int j=0;j<citysize;j++){
      replica0._distance_matrix[i][j] = _distance_matrix[i][j];
      replica1._distance_matrix[i][j] = _distance_matrix[i][j];
      replica2._distance_matrix[i][j] = _distance_matrix[i][j];
      replica3._distance_matrix[i][j] = _distance_matrix[i][j];
      replica4._distance_matrix[i][j] = _distance_matrix[i][j];
      replica5._distance_matrix[i][j] = _distance_matrix[i][j];     
      replica6._distance_matrix[i][j] = _distance_matrix[i][j];
      replica7._distance_matrix[i][j] = _distance_matrix[i][j];
      replica8._distance_matrix[i][j] = _distance_matrix[i][j];
      replica9._distance_matrix[i][j] = _distance_matrix[i][j];
      replica10._distance_matrix[i][j] = _distance_matrix[i][j];
      replica11._distance_matrix[i][j] = _distance_matrix[i][j];
      replica12._distance_matrix[i][j] = _distance_matrix[i][j];
      replica13._distance_matrix[i][j] = _distance_matrix[i][j];
      replica14._distance_matrix[i][j] = _distance_matrix[i][j];
      replica15._distance_matrix[i][j] = _distance_matrix[i][j];     
      replica16._distance_matrix[i][j] = _distance_matrix[i][j];
      replica17._distance_matrix[i][j] = _distance_matrix[i][j];
      replica18._distance_matrix[i][j] = _distance_matrix[i][j];
      replica19._distance_matrix[i][j] = _distance_matrix[i][j];      
    }
  }

  DigitalAnnealer_label0:
  for(int i = 0; i < iteration; i++){

    execute_replica_parallel(&replica0,&replica1,&replica2,&replica3,&replica4,&replica5,&replica6,&replica7,&replica8,&replica9,&replica10,&replica11,&replica12,&replica13,&replica14,&replica15,&replica16,&replica17,&replica18,&replica19);

    do_replica_exchange(&replica0,&replica1,&replica2,&replica3,&replica4,&replica5,&replica6,&replica7,&replica8,&replica9,&replica10,&replica11,&replica12,&replica13,&replica14,&replica15,&replica16,&replica17,&replica18,&replica19);
    int wherebest = find_the_best(best_energy,&replica0,&replica1,&replica2,&replica3,&replica4,&replica5,&replica6,&replica7,&replica8,&replica9,&replica10,&replica11,&replica12,&replica13,&replica14,&replica15,&replica16,&replica17,&replica18,&replica19);
    switch(wherebest) {
    case 0:replace_best_matrix(best_qubit_matrix,replica0._qubit_matrix);break;
    case 1:replace_best_matrix(best_qubit_matrix,replica1._qubit_matrix);break;
    case 2:replace_best_matrix(best_qubit_matrix,replica2._qubit_matrix);break;
    case 3:replace_best_matrix(best_qubit_matrix,replica3._qubit_matrix);break;
    case 4:replace_best_matrix(best_qubit_matrix,replica4._qubit_matrix);break;
    case 5:replace_best_matrix(best_qubit_matrix,replica5._qubit_matrix);break;
    case 6:replace_best_matrix(best_qubit_matrix,replica6._qubit_matrix);break;
    case 7:replace_best_matrix(best_qubit_matrix,replica7._qubit_matrix);break; 
    case 8:replace_best_matrix(best_qubit_matrix,replica8._qubit_matrix);break;
    case 9:replace_best_matrix(best_qubit_matrix,replica9._qubit_matrix);break;     
    case 10:replace_best_matrix(best_qubit_matrix,replica10._qubit_matrix);break;
    case 11:replace_best_matrix(best_qubit_matrix,replica11._qubit_matrix);break;
    case 12:replace_best_matrix(best_qubit_matrix,replica12._qubit_matrix);break;
    case 13:replace_best_matrix(best_qubit_matrix,replica13._qubit_matrix);break;
    case 14:replace_best_matrix(best_qubit_matrix,replica14._qubit_matrix);break;
    case 15:replace_best_matrix(best_qubit_matrix,replica15._qubit_matrix);break;
    case 16:replace_best_matrix(best_qubit_matrix,replica16._qubit_matrix);break;
    case 17:replace_best_matrix(best_qubit_matrix,replica17._qubit_matrix);break; 
    case 18:replace_best_matrix(best_qubit_matrix,replica18._qubit_matrix);break;
    case 19:replace_best_matrix(best_qubit_matrix,replica19._qubit_matrix);break;          
    default:break;
    }
  }
}