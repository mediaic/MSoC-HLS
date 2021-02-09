#ifndef DANEW_V1_H
#define DANEW_V1_H

#include <iostream>
#include <fstream>
#include "node_v1.h"
#include "ap_int.h"
#include "ap_fixed.h"

using namespace std;
#define citysize 5
#define iteration 20//for each setting
#define replicaNum 20
#define beta_max 0.01
#define cooling_rate 0.2
#define _E_off_increment 1


struct Replica
{
    double _beta;
    double _A;
    double _distance_matrix[citysize][citysize];
    bool   _qubit_matrix[citysize][citysize];
    double _energy;
};


void DigitalAnnealer(double A, double _distance_matrix[citysize][citysize], double _beta[replicaNum], bool (&best_qubit_matrix)[citysize][citysize], double &best_energy);
//void DigitalAnnealer(double (&delta_energy)[citysize][citysize]);

#endif