#ifndef DANEW_H
#define DANEW_H

#include <iostream>
#include <fstream>
#include "node.h"
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
    bool   _qubit_matrix[citysize][citysize];
    double _energy;
    double _distance_matrix[citysize][citysize];
};


void DigitalAnnealer(double A, double _distance_matrix[citysize][citysize], double _beta[replicaNum], bool (&best_qubit_matrix)[citysize][citysize], double &best_energy);
//void DigitalAnnealer(double (&delta_energy)[citysize][citysize]);

#endif