#ifndef __CORDIC_H__
#define __CORDIC_H__

#include "../common.h"

// Number of iterations

#ifdef float_typeYPE // Fixed-point settings

// Include the Vivado HLS ap_int & ap_fixed headers
#include "ap_fixed.h"
#include "ap_int.h"

// Set a default number of bitwidth if it's not
// defined in the Makefile or Tcl script
#ifndef TOT_WIDTH
#define TOT_WIDTH 32
#endif

#ifndef INT_WIDTH
#define INT_WIDTH 8
#endif

// Note: For the sake of simplicity, we use the same 
// bitwidth configuration for theta and cos_sin types.
typedef ap_fixed<TOT_WIDTH, INT_WIDTH> theta_type;
typedef ap_fixed<TOT_WIDTH, INT_WIDTH> cos_sin_type;

typedef ap_uint<6> index_type;
typedef ap_int<2> mu_type;
typedef ap_uint<1> mode_type;

#else // float_typeing-point settings

typedef float_type theta_type;
typedef float_type cos_sin_type;

typedef unsigned int index_type;
typedef int mu_type;
typedef bool mode_type;

#endif

// Set a default number of iterations if it's not 
// defined in the Makefile or Tcl script
#ifndef NUM_ITER 
#define NUM_ITER 15
#endif

// Stops at 90 degree.
const int NUM_DEGREE = 90;

// The angle of each iteration in radian
const theta_type cordic_ctab[64] = \
		{0.78539816339744828000,0.46364760900080609000,0.24497866312686414000,0.12435499454676144000, \
	     0.06241880999595735000,0.03123983343026827700,0.01562372862047683100,0.00781234106010111110, \
		 0.00390623013196697180,0.00195312251647881880,0.00097656218955931946,0.00048828121119489829, \
		 0.00024414062014936177,0.00012207031189367021,0.00006103515617420877,0.00003051757811552610, \
		 0.00001525878906131576,0.00000762939453110197,0.00000381469726560650,0.00000190734863281019, \
		 0.00000095367431640596,0.00000047683715820309,0.00000023841857910156,0.00000011920928955078, \
		 0.00000005960464477539,0.00000002980232238770,0.00000001490116119385,0.00000000745058059692, \
		 0.00000000372529029846,0.00000000186264514923,0.00000000093132257462,0.00000000046566128731, \
		 0.00000000023283064365,0.00000000011641532183,0.00000000005820766091,0.00000000002910383046, \
		 0.00000000001455191523,0.00000000000727595761,0.00000000000363797881,0.00000000000181898940, \
		 0.00000000000090949470,0.00000000000045474735,0.00000000000022737368,0.00000000000011368684, \
		 0.00000000000005684342,0.00000000000002842171,0.00000000000001421085,0.00000000000000710543, \
		 0.00000000000000355271,0.00000000000000177636,0.00000000000000088818,0.00000000000000044409, \
		 0.00000000000000022204,0.00000000000000011102,0.00000000000000005551,0.00000000000000002776, \
		 0.00000000000000001388,0.00000000000000000694,0.00000000000000000347,0.00000000000000000173, \
		 0.00000000000000000087,0.00000000000000000043,0.00000000000000000022,0.00000000000000000011};

// The reciprocal of accumulated scaling factor. Used as the starting
// x-coordinate to eliminate MUL/DIV operations at the end of CORDIC
const cos_sin_type cordic_reciprocal_cuml_scaling[64] = \
		{0.7071067811865475, 0.6324555320336759, 0.6135719910778963, 0.6088339125177524, \
	     0.6076482562561681, 0.6073517701412959, 0.607277644093526, 0.6072591122988928,  \
		 0.6072544793325624, 0.6072533210898752, 0.6072530315291343, 0.6072529591389448, \
		 0.6072529410413973, 0.6072529365170103, 0.6072529353859135, 0.6072529351031394, \
		 0.6072529350324457, 0.6072529350147724, 0.607252935010354, 0.6072529350092495,  \
		 0.6072529350089733, 0.6072529350089043, 0.607252935008887, 0.6072529350088827,  \
		 0.6072529350088816, 0.6072529350088813, 0.6072529350088813, 0.6072529350088813, \
		 0.6072529350088813, 0.6072529350088813, 0.6072529350088813, 0.6072529350088813, \
		 0.6072529350088813, 0.6072529350088813, 0.6072529350088813, 0.6072529350088813, \
		 0.6072529350088813, 0.6072529350088813, 0.6072529350088813, 0.6072529350088813, \
		 0.6072529350088813, 0.6072529350088813, 0.6072529350088813, 0.6072529350088813, \
		 0.6072529350088813, 0.6072529350088813, 0.6072529350088813, 0.6072529350088813, \
		 0.6072529350088813, 0.6072529350088813, 0.6072529350088813, 0.6072529350088813, \
		 0.6072529350088813, 0.6072529350088813, 0.6072529350088813, 0.6072529350088813, \
		 0.6072529350088813, 0.6072529350088813, 0.6072529350088813, 0.6072529350088813, \
		 0.6072529350088813, 0.6072529350088813, 0.6072529350088813, 0.6072529350088813};

void cordic(mode_type mode, mode_type operation, cos_sin_type in_x, cos_sin_type in_y, theta_type in_z, cos_sin_type& out_x, cos_sin_type& out_y, theta_type& out_z);

#endif