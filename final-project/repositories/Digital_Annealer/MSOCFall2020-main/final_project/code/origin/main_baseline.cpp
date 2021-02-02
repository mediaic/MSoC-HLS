#include "da.h"
#include <time.h>
using namespace std;

string& ClearAllSpace(string &str)
{
    int index = 0;
    if( !str.empty())
    {
        while( (index = str.find(' ',index)) != string::npos)
        {
            str.erase(index,1);
        }
    }

    return str;
}
int main(int argc, char** argv)
{
    srand( time(NULL) );
    fstream input, output;
    input.open("easy.tsp", ios::in);
    output.open("out.txt", ios::out);

    DA da;

    string str;
    while(getline(input,str)){
        ClearAllSpace(str);
        int idx = str.find(":");
        string dataType = str.substr(0,idx);
        string data = str.substr(idx+1); 
        if(dataType == "NODE_COORD_SECTION")break;
    }


    Node nodeArray[citysize] = {};
    for(int i = 0; i < citysize; i++){
        input >> str;//neglect name
        input >> str;
        nodeArray[i]._x = stod(str);
        input >> str;
        nodeArray[i]._y = stod(str);
    }


    DigitalAnnealer(&da, nodeArray);
     cout << "Result :" << endl;
     for(int i = 0; i < citysize; i++){
         for(int j = 0; j < citysize; j++){
             cout << da._best_qubit_matrix[i][j] << " ";
         }
         cout << endl;
     }
     cout << "Best Cost = "<< da._best_energy << endl;
    

    //initial patameter
    // for(int i = 0; i < citysize; i++){
    //     for(int j=0; j < citysize; j++){
    //         if(i == j)da._qubit_matrix[i][j] = 0;
    //     }
    // }    
    // double longest_distnace = 0;
    // calculate_distnace(&da);
    // for(int i = 0; i < citysize; i++){
    //     for(int j=0; j < citysize; j++){
    //         if(longest_distnace < da._distance_matrix[i][j]) longest_distnace = da._distance_matrix[i][j];
    //     }
    // }    
    // da._B = 2*longest_distnace;
    // da._C = 2*longest_distnace;
    //da._beta *= da._r;
    //double rep_best_energy_list[repeat] = {};
    // double sum_best_energy = 0;
    // double rep_best_energy = 10000;
    // bool   rep_best_qubit_matrix[citysize][citysize] = {};
    
    // double beta_array[10000] = {};
    
    //double replica[replicaNum][citysize][citysize]

    // double q[citysize][citysize] = {};
    
    // for(int i = 0; i < citysize; i++){
    //     for(int j=0; j < citysize; j++){
    //         if(i == j) q[i][j] = 1;
    //         else q[i][j] = 0;
    //     }
    // }

    // for(int i = 0; i < citysize; i++){
    //     for(int j=0; j < citysize; j++){
    //         cout << q[i][j] << " " ;
    //     }
    //     cout << endl;
    // }

    // cout << endl;

    // for(int i = 0; i < replicaNum; i++){
    //     da._replicaArray[i]._beta = i;
    //     for(int j = 0; j < citysize; j++){
    //         for(int k=0; k < citysize; k++){
    //             da._replicaArray[i]._qubit_matrix[j][k] = q[j][k];
    //             //cout << da._replicaArray[i]._qubit_matrix[j][k] << endl;
    //         }
    //         //cout << endl;
    //     }    
        
    //     //cout << da._replicaArray[i]._beta << endl;

    // }

    // for(int r = 0; r < citysize; r++){
    //     for(int i = 0; i < citysize; i++){
    //         for(int j=0; j < citysize; j++){
    //             cout << da._replicaArray[r]._qubit_matrix[i][j] << " " ;
    //         }
    //         cout << endl;
    //     }
    //     cout << endl;
    // }



    // for(int rep = 0; rep < repeat; rep++){//repeat this code for x times    
    //     //cout << "=============================== Repeat this code : " << rep << " ================================" <<endl;
    //     reset(&da);
    //     while(da._beta <= 2){
    //         cout << "Count = " << count << endl;
    //         cout << "beta =" << da._beta << endl;
    //         //da._B = da._beta*longest_distnace;
    //         //da._C = da._beta*longest_distnace;
    //         // for(int i = 0; i < iteration; i++){
    //         //     //cout << "=============================== The trial i for a setteing: " << i << " ================================" <<endl;
    //         //     if(!replica(&da)){
    //         //         cout << "Cannot escape local Minimun" << endl;
    //         //         break;
    //         //     }
    //         // }
    //         da._beta /= da._r;
    //         count ++;
    //     }
    //     //rep_best_energy_list[repeat] = da._best_energy;
    //     sum_best_energy += da._best_energy;
    //     if(da._best_energy < rep_best_energy){
    //         rep_best_energy = da._best_energy;
    //         for(int i = 0; i < citysize; i++){
    //             for(int j = 0; j < citysize; j++){
    //                 rep_best_qubit_matrix[i][j] = da._best_qubit_matrix[i][j];
    //             }       
    //         }
    //     } 
    // }      
  
    // //print the benchmark information
    // cout << "==== Print Result ====" << endl;
    // cout << "-------------------------" << endl;
    // cout << "The Best Cost : " << rep_best_energy << endl;
    // cout << "The Average Cost : " << sum_best_energy/repeat << endl;
    // cout << "The Best Qubit : " << endl;
    // for(int i = 0; i < citysize; i++){
    //     for(int j = 0; j < citysize; j++){
    //         cout << rep_best_qubit_matrix[i][j] << " ";
    //     }
    //     cout << endl;
    // }
    // cout << "-------------------------" << endl;
    // cout << "=========================================" << endl;
    
    // //output file
    // for(int i = 0; i < citysize; i++){
    //     for(int j = 0; j < citysize; j++){
    //         if(rep_best_qubit_matrix[i][j] == 1){
    //             output << da._nodeArray[j]._x << " " << da._nodeArray[j]._y << endl;
    //         }
            
    //     }
    // }

    // output.close();
    
    // return 0;
}
