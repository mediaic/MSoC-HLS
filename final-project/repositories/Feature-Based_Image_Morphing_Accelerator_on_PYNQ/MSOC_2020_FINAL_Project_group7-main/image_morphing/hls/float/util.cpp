#include "morph.h"
#include "math.h"

void calculate_u
(
    /* input */ Vector XP,
    /* input */ Vector PQ,
    /* input */ Length PQ_length,
    /* output */ Scaler *out

)
{   
    *out = ((XP.x_val * PQ.x_val) + (XP.y_val*PQ.y_val)) / (PQ_length*PQ_length);
}

void calculate_v
(
    /* input */ Vector XP,
    /* input */ Vector PQ_perp,
    /* input */ Length PQ_length,
    /* output */ Scaler *out

)
{
    *out = ((XP.x_val * PQ_perp.x_val) + (XP.y_val*PQ_perp.y_val)) / (PQ_length);
}

void calculate_X
(
    /* input */ Line line_in,
    /* input */ Scaler u,
    /* input */ Scaler v,
    /* output */ Vector *out
)
{
    (*out).x_val = line_in.P.x_val + u * (line_in.PQ.x_val) + (v * (-line_in.PQ.y_val) / line_in.length);
    (*out).y_val = line_in.P.y_val + u * (line_in.PQ.y_val) + (v * (line_in.PQ.x_val) / line_in.length);
}


void calculate_dist
(
    /* input */ Vector a,
    /* output */ Length *dist
)   
{   
    // Change the sqrt function to hardware friendly version!!
    // TODO 
    float temp;
    float dist_tmp;
    temp = a.x_val * a.x_val + a.y_val*a.y_val;
    dist_tmp = sqrt(temp);
    *dist = Length(dist_tmp);
}