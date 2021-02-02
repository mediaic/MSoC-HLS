#include "morph.h"
#include "math.h"

void calculate_u
(
    /* input */ Vector XP,
    /* input */ Vector PQ,
    /* input */ Length PQ_length,
    /* output */ Scaler &out
)
{
// #pragma HLS RESOURCE variable=tmp core=DivnS
	Length PQ_length_rec = len_div_table[(unsigned int)(PQ_length.range(LEN_DIV_UBIT,LEN_DIV_LBIT))];
	out = ((XP.x_val * PQ.x_val) + (XP.y_val*PQ.y_val)) * (PQ_length_rec * PQ_length_rec);
}

void calculate_v
(
    /* input */ Vector XP,
    /* input */ Vector PQ_perp,
    /* input */ Length PQ_length,
    /* output */ Scaler &out
)
{
	Length PQ_length_rec = len_div_table[(unsigned int)(PQ_length.range(LEN_DIV_UBIT,LEN_DIV_LBIT))];
    out = ((XP.x_val * PQ_perp.x_val) + (XP.y_val*PQ_perp.y_val)) * PQ_length_rec;
}

void calculate_X
(
    /* input */ Line line_in,
    /* input */ Scaler u,
    /* input */ Scaler v,
    /* output */ Vector &out
)
{
	Length length_rec = len_div_table[(unsigned int)(line_in.length.range(LEN_DIV_UBIT,LEN_DIV_LBIT))];
    (out).x_val = line_in.P.x_val + u * (line_in.PQ.x_val) + (v * (-line_in.PQ.y_val) * length_rec);
    (out).y_val = line_in.P.y_val + u * (line_in.PQ.y_val) + (v * (line_in.PQ.x_val) * length_rec);
}


void calculate_dist
(
    /* input */ Vector a,
    /* output */ Length &dist
)   
{   
    // Change the sqrt function to hardware friendly version!!
    cordic_sqrt(a.x_val, a.y_val, dist);
}
