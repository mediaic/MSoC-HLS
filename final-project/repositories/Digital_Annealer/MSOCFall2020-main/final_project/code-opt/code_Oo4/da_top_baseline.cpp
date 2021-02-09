#include "danew.h"
#include "math.h"
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
    //output.open("out.txt", ios::out);

    string str;
    while(getline(input,str)){
        ClearAllSpace(str);
        int idx = str.find(":");
        string dataType = str.substr(0,idx);
        string data = str.substr(idx+1); 
        if(dataType == "NODE_COORD_SECTION")break;
    }

    
    Node nodeArray[citysize] = {};
    double _distance_matrix[citysize][citysize] = {};
    double _beta[replicaNum];
    bool   best_qubit_matrix[citysize][citysize] = {};
    double best_energy;

    //data
    for(int i = 0; i < citysize; i++){
        input >> str;//neglect name
        input >> str;
        nodeArray[i]._x = stod(str);
        input >> str;
        nodeArray[i]._y = stod(str);
    }
    
    //calculate distance
    for(int i = 0; i < citysize; i++){
        for(int j = 0; j < citysize; j++){
       	    double xi = nodeArray[i]._x;
       	    double yi = nodeArray[i]._y;
       	    double xj = nodeArray[j]._x;
       	    double yj = nodeArray[j]._y;
            _distance_matrix[i][j] = sqrt((xi-xj)*(xi-xj) + (yi-yj)*(yi-yj));
       }
    }

    double _A = 0;
    for(int i = 0; i < citysize; i++){
        for(int j=0; j < citysize; j++){
            if(_A < _distance_matrix[i][j]) _A = _distance_matrix[i][j];
        }
    }
    _A += 1;
    
    //beta
    _beta[0] = beta_max;
    double cr = cooling_rate;
    for(int i = 1; i < replicaNum; i++){
	     _beta[i] = beta_max/cr;
         cr = cr * cooling_rate;  
	}

    cout << "Distance : " << endl;
    for(int i = 0;i<citysize;i++){
        for(int j = 0;j<citysize;j++){
            cout << _distance_matrix[i][j] << " ";
        }
        cout << endl;    
    }
    cout << "Beta : " << endl;
    for(int i = 0;i<replicaNum;i++){
            cout << _beta[i] << endl;
            
    }    
    cout << endl;
    DigitalAnnealer(_A,_distance_matrix, _beta, best_qubit_matrix, best_energy);
    cout << "Best tour : " << endl;
    for(int i = 0;i<citysize;i++){
        for(int j = 0;j<citysize;j++){
            cout << best_qubit_matrix[i][j] << " ";
        }
        cout << endl;    
    }
    cout << "Best energy : " << best_energy << endl;
    return 0;
}
