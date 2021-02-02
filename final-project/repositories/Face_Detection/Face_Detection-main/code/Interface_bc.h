#include "hls_stream.h"
#include "ap_int.h"
#include "ap_axi_sdata.h"

typedef ap_axiu<32,1,1,1> value_t;
typedef hls::stream<value_t> stream_t;

void detectFace_wrapper(stream_t *In, stream_t* Out);
