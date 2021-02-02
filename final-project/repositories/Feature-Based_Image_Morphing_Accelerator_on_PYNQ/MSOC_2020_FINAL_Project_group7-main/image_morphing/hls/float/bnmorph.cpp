#include "morph.h"
#include "math.h"
#include <stdio.h>
#include <stdlib.h>

// Define Constant...
const static float PARAM_P = 0.5;
const static float PARAM_A = 0.1;
const static float PARAM_B = 1;

// Do Beier-Neely Algorithm

void bnmorph
(
    /* input */ Vector X,
    /* input */ Line line_src,
    /* input */ Line line_dst,
    /* input */ Line line_mid,
    /* output */ Vector *D_sum_src,
    /* output */ Weight *W_sum_src,
    /* output */ Vector *D_sum_dst,
    /* output */ Weight *W_sum_dst
)
{   
    Vector X_src;
    Vector X_dst;
    Scaler u;
    Scaler v;

    Vector PQ_perp_src;
    Vector PQ_perp_dst;
    Vector PQ_perp;
    Vector XP;

    // ininialize 
    PQ_perp_src.x_val = -line_src.PQ.y_val;
    PQ_perp_src.y_val =  line_src.PQ.x_val;
    PQ_perp_dst.x_val = -line_dst.PQ.y_val;
    PQ_perp_dst.y_val =  line_dst.PQ.x_val;
    PQ_perp.x_val     = -line_mid.PQ.y_val;
    PQ_perp.y_val     =  line_mid.PQ.x_val;
    XP.x_val          =  X.x_val - line_mid.P.x_val;
    XP.y_val          =  X.y_val - line_mid.P.y_val;
    
    // Calculate u,v
    // u = (X-Pi).(QPi) / ||QPi||^2
    calculate_u( XP, line_mid.PQ, line_mid.length, &u);
    calculate_v( XP, PQ_perp, line_mid.length, &v);
      
    
    // Calculate X
    calculate_X( line_src, u, v, &X_src);
    calculate_X( line_dst, u, v, &X_dst);

    if(X.x_val==1 && X.y_val==1){
        printf("==============================\n");
        printf("u: %f\n", u);
        printf("v: %f\n", v);
    }

    // Calculate dist
    Length dist;


    // prepare XP, XQ
    Vector XQ;
    Length XP_dist;
    Length XQ_dist;
    
    

    // get vectro XQ
    XQ.x_val = XP.x_val - line_mid.PQ.x_val;
    XQ.y_val = XP.y_val - line_mid.PQ.y_val;
    
    
    
    // prepare abs(v)
    Scaler abs_v;

    // get length of vector XQ, XP 
    calculate_dist(XQ, &XQ_dist);
    calculate_dist(XP, &XP_dist);
    
    

    if(v < 0)   abs_v = -v;
    else        abs_v =  v;
    
        
    // get distance 
    if      (u < 0) { dist = XP_dist; /* XP */}
    else if (u > 1) { dist = XQ_dist; /* XQ */}
    else            { dist = abs_v; /* abs(v) */}


    // Update W, D
    float weight;
    Vector D_src;
    Vector D_dst;

    weight = (sqrt(line_mid.length) / (PARAM_A + dist)) * PARAM_B;
    D_src.x_val = weight * (X_src.x_val - X.x_val);
    D_src.y_val = weight * (X_src.y_val - X.y_val);
    D_dst.x_val = weight * (X_dst.x_val - X.x_val);
    D_dst.y_val = weight * (X_dst.y_val - X.y_val);

    (*D_sum_src).x_val =  (*D_sum_src).x_val + D_src.x_val;
    (*D_sum_src).y_val =  (*D_sum_src).y_val + D_src.y_val;
    (*D_sum_dst).x_val =  (*D_sum_dst).x_val + D_dst.x_val;
    (*D_sum_dst).y_val =  (*D_sum_dst).y_val + D_dst.y_val;

    // we can share the W_sum
    *W_sum_src = *W_sum_src + weight;
    *W_sum_dst = *W_sum_dst + weight;

}

