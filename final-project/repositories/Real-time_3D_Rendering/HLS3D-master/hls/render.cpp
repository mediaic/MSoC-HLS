#include "render.h"

void render (
    stream_t* stream_input,
    stream_t* stream_output,
    int mode,
    int num_faces,
    float transform[3][4],
    float obj_scale,
    int texture_id,
    float lnorm[3],
    float cam_scale[3],
    float cam_offset[3],
    int frameh[2]
) {
    #pragma HLS INTERFACE axis register both port=stream_input
    #pragma HLS INTERFACE axis register both port=stream_output
    #pragma HLS INTERFACE s_axilite port=mode
    #pragma HLS INTERFACE s_axilite port=num_faces
    #pragma HLS INTERFACE s_axilite port=transform
    #pragma HLS INTERFACE s_axilite port=obj_scale
    #pragma HLS INTERFACE s_axilite port=texture_id
    #pragma HLS INTERFACE s_axilite port=lnorm
    #pragma HLS INTERFACE s_axilite port=cam_scale
    #pragma HLS INTERFACE s_axilite port=cam_offset
    #pragma HLS INTERFACE s_axilite port=frameh
    #pragma HLS INTERFACE s_axilite port=return

    if (mode == 5) {
        for (int i = 0; i < 640*480/2; i++) {
            #pragma HLS pipeline
            stream_output->write(stream_input->read());
        }
    }
    else if (mode == 4) {
        geometric_transform(stream_input, stream_output,
                            num_faces, transform, obj_scale);
    }
    else {
        rasterization(stream_input, stream_output, mode, texture_id,
                      num_faces, lnorm, cam_scale, cam_offset, frameh);
    }

    return;
}
