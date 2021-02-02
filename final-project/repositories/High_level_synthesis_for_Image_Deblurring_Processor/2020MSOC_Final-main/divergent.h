#include "ap_int.h"
#include "ap_fixed.h"
#include "math.h"
typedef  float  eita_t; //ap_uint<8>
#define ITERATION 20
#define SIGMA 1.0
#define TAU 0.02
#define First_Derivative 0.025 //0.25
#define SET_DEBUG 0.075
#define lambda_cross 1.0
#define LR 1.0
#define  cr_w 1.0
#define THETA 1.0
#define HEIGHT 128
#define WIDTH 128
#define UPPER 128
#define LOWER 0
void my_filter_v1( eita_t f_n[HEIGHT][WIDTH],eita_t f[HEIGHT][WIDTH],eita_t adjChImg[HEIGHT][WIDTH],eita_t g1 [HEIGHT][WIDTH],eita_t g2 [HEIGHT][WIDTH],eita_t g3 [HEIGHT][WIDTH],eita_t g4 [HEIGHT][WIDTH],eita_t g5 [HEIGHT][WIDTH],eita_t g6 [HEIGHT][WIDTH],eita_t g7 [HEIGHT][WIDTH]);//,eita_t g8 [HEIGHT][WIDTH],eita_t g9 [HEIGHT][WIDTH]);
void Relax(eita_t x[HEIGHT][WIDTH],eita_t x_old[HEIGHT][WIDTH],eita_t x_bar[HEIGHT][WIDTH]);
