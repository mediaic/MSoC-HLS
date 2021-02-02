#include "morph.h"


void cordic_sqrt(
	CORDIC_SQRT_BW x0,
	CORDIC_SQRT_BW y0,
	CORDIC_SQRT_BW &magnitude
)
{
#pragma HLS INLINE
    unsigned char i;

    const CORDIC_SQRT_CONST inv_G = 0.607253031529134; // that is 0.6072 == 453 / 746;

    CORDIC_SQRT_BW x, y, xp, yp, x2;
    
    xp = x0;
    yp = y0;

    for (i=0;i<CORDIC_SQRT_ROT;i++)
    {
    #pragma HLS PIPELINE II=1
        if (yp<0) {
            x = xp - (yp>>i);
            y = yp + (xp>>i);
        } else {
            x = xp + (yp>>i);
            y = yp - (xp>>i);
        }
        xp=x;
        yp=y;
    }

    // compensating the cordic gain
    // #pragma HLS RESOURCE variable=magnitude core=MUL6S
    magnitude =  xp * inv_G; //xn = ((x * 453) / 746) ;

}
