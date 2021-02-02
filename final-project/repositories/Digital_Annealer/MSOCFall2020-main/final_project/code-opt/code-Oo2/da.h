#ifndef DA_H
#define DA_H

#include <iostream>
#include <fstream>
#include "node.h"
#include "typedefs.h"

using namespace std;
#define citysize 5
#define iteration 10   //for each setting
#define repeat    1  //for repeat this code
#define replicaNum 20
#define _A 2
#define beta 0.02
#define cooling_rate 0.999
#define _E_off_increment 1

struct Replica
{
    double _beta;
    bool   _qubit_matrix[citysize][citysize];
    //bool   _best_qubit_matrix[citysize][citysize]; 
    double _energy;
};

struct DA
{   
    Node                _nodeArray[citysize];
    double              _distance_matrix[citysize][citysize];
//    bool                _current_qubit_matrix[citysize][citysize];
    //double              _A;
    double              _E_off;
    //double              _E_off_increment;     
    double              _beta;
    double              _energy;
    bool                _qubit_matrix[citysize][citysize];
//    Replica             _replicaArray[replicaNum];
};

void DigitalAnnealer(Node nodeArray[citysize], bool best_qubit_matrix[citysize][citysize], double *best_energy);
// void reset(struct DA* da);
// void calculate_distnace(struct DA*);
// double calculate_energy(struct DA*);
// bool calculate_delta(struct DA*);
// // double calculate_energy(struct DA* da);
// // double calculate_delta_energy(struct DA* da, int i, int j)
// bool replica(struct DA*);

#endif // DA_H

