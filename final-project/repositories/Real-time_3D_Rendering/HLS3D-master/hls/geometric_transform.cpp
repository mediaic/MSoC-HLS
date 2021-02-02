#include "render.h"

void geometric_transform (
    stream_t* stream_input,
    stream_t* stream_output,
    int num_faces,
    float transform[3][4],
    float obj_scale
) {
    value_t stream_data;
    stream_data.data = 0;
    stream_data.keep = 0xFF;
    stream_data.strb = 0xFF;
    stream_data.user = 0;
    stream_data.last = 0;
    stream_data.id = 0;
    stream_data.dest = 0;

    float near_clip = 1.0;
    float far_clip = 10000.0;

    half v0[3], v1[3], v2[3];
    half n0[3], n1[3], n2[3];
    half t0[2], t1[2], t2[2];

    half cv0[3], cv1[3], cv2[3];
    half cn0[3], cn1[3], cn2[3];
    half ct0[2], ct1[2], ct2[2];

    half transform_h[3][4];

    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 4; j++) {
            transform_h[i][j] = transform[i][j];
        }
    }

    for (int i = 0; i < num_faces; i++) {
        #pragma HLS pipeline II=12
        apuint64_1_to_half_2(stream_input->read().data, t0[0], t0[1]);
        apuint64_1_to_half_2(stream_input->read().data, n0[0], n0[1]);
        apuint64_1_to_half_2(stream_input->read().data, n0[2], v0[0]);
        apuint64_1_to_half_2(stream_input->read().data, v0[1], v0[2]);

        apuint64_1_to_half_2(stream_input->read().data, t1[0], t1[1]);
        apuint64_1_to_half_2(stream_input->read().data, n1[0], n1[1]);
        apuint64_1_to_half_2(stream_input->read().data, n1[2], v1[0]);
        apuint64_1_to_half_2(stream_input->read().data, v1[1], v1[2]);

        apuint64_1_to_half_2(stream_input->read().data, t2[0], t2[1]);
        apuint64_1_to_half_2(stream_input->read().data, n2[0], n2[1]);
        apuint64_1_to_half_2(stream_input->read().data, n2[2], v2[0]);
        apuint64_1_to_half_2(stream_input->read().data, v2[1], v2[2]);

        matrix_mul_vector(0, transform_h, obj_scale, v0, cv0);
        matrix_mul_vector(0, transform_h, obj_scale, v1, cv1);
        matrix_mul_vector(0, transform_h, obj_scale, v2, cv2);

        matrix_mul_vector(1, transform_h, 1.0, n0, cn0);
        matrix_mul_vector(1, transform_h, 1.0, n1, cn1);
        matrix_mul_vector(1, transform_h, 1.0, n2, cn2);

        ct0[0] = t0[0]; ct0[1] = t0[1];
        ct1[0] = t1[0]; ct1[1] = t1[1];
        ct2[0] = t2[0]; ct2[1] = t2[1];

        float_2_to_apuint64_1(ct0[0], ct0[1], stream_data.data); stream_output->write(stream_data);
        float_2_to_apuint64_1(cn0[0], cn0[1], stream_data.data); stream_output->write(stream_data);
        float_2_to_apuint64_1(cn0[2], cv0[0], stream_data.data); stream_output->write(stream_data);
        float_2_to_apuint64_1(cv0[1], cv0[2], stream_data.data); stream_output->write(stream_data);

        float_2_to_apuint64_1(ct1[0], ct1[1], stream_data.data); stream_output->write(stream_data);
        float_2_to_apuint64_1(cn1[0], cn1[1], stream_data.data); stream_output->write(stream_data);
        float_2_to_apuint64_1(cn1[2], cv1[0], stream_data.data); stream_output->write(stream_data);
        float_2_to_apuint64_1(cv1[1], cv1[2], stream_data.data); stream_output->write(stream_data);

        float_2_to_apuint64_1(ct2[0], ct2[1], stream_data.data); stream_output->write(stream_data);
        float_2_to_apuint64_1(cn2[0], cn2[1], stream_data.data); stream_output->write(stream_data);
        float_2_to_apuint64_1(cn2[2], cv2[0], stream_data.data); stream_output->write(stream_data);
        stream_data.last = (i==num_faces-1);
        float_2_to_apuint64_1(cv2[1], cv2[2], stream_data.data); stream_output->write(stream_data);
    }

    return;
}
