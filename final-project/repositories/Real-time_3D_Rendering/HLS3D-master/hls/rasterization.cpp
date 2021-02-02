#include "render.h"

#include <iostream>
using namespace std;

void rasterization (
    stream_t* stream_input,
    stream_t* stream_output,
    int mode,  // 0: reset, 1: texture, 2: mesh in, 3: frame out
    int texture_id,
    int num_faces,
    float lnorm[3],
    float cam_scale[3],
    float cam_offset[3],
    int fh[2]  // frame height range
) {
    value_t stream_data;
    stream_data.data = 0;
    stream_data.keep = 0xFF;
    stream_data.strb = 0xFF;
    stream_data.user = 0;
    stream_data.last = 0;
    stream_data.id = 0;
    stream_data.dest = 0;

    static half depth_buffer[BUF_H][640];
    static uint8_t frame_buffer[BUF_H][640][3];
    static uint8_t texture[4][64][64][3];

    #pragma HLS RESOURCE variable=depth_buffer core=RAM_2P
    #pragma HLS ARRAY_PARTITION variable=depth_buffer cyclic factor=2 dim=2
    #pragma HLS ARRAY_PARTITION variable=frame_buffer cyclic factor=3 dim=3
    #pragma HLS ARRAY_PARTITION variable=texture cyclic factor=3 dim=4

    half cv0[3], cv1[3], cv2[3];
    half cn0[3], cn1[3], cn2[3];
    half ct0[2], ct1[2], ct2[2];

    half fv0[3], fv1[3], fv2[3];
    half fz, fz_1, fz0_1, fz1_1, fz2_1;

    int fv0i[3], fv1i[3], fv2i[3];
    int fymax, fymin, fxmax, fxmin;

    half l0, l1, l2;
    half lnormh[3];
    half lambt = 0.5;

    float area;
    half w0, w1, w2;
    half fvp[3];

    half clip = 1.0;

    int ct[2];
    uint8_t tex[3];
    half lum;

    for (int i = 0; i < 3; i++) {
        lnormh[i] = lnorm[i];
    }

    uint8_t u0, u1, u2, u3, u4, u5, u6, u7;

    static bool texture_initilized = false;

    if (mode == 0) {
        for (int i = 0; i < BUF_H; i++) {
            for (int j = 0; j < 640; j++) {
                #pragma HLS pipeline
                depth_buffer[i][j] = 10000.0;
                frame_buffer[i][j][0] = 0;
                frame_buffer[i][j][1] = 0;
                frame_buffer[i][j][2] = 0;
            }
        }

        if (!texture_initilized) {
            for (int n = 0; n < 4; n++) {
                for (int i = 0; i < 64; i++) {
                    for (int j = 0; j < 64; j++) {
                        #pragma HLS pipeline
                        texture[n][i][j][0] = 255;
                        texture[n][i][j][1] = 255;
                        texture[n][i][j][2] = 255;
                    }
                }
            }
            texture_initilized = true;
        }
    }
    else if (mode == 1) {
        for (int i = 0; i < 64; i++) {
            for (int j = 0; j < 64; j+=2) {
                #pragma HLS pipeline
                apuint64_1_to_uint8_8(stream_input->read().data,
                                      u0, u1, u2, u3, u4, u5, u6, u7);
                texture[texture_id][i][j+0][0] = u0;
                texture[texture_id][i][j+0][1] = u1;
                texture[texture_id][i][j+0][2] = u2;
                texture[texture_id][i][j+1][0] = u4;
                texture[texture_id][i][j+1][1] = u5;
                texture[texture_id][i][j+1][2] = u6;
            }
        }
    }
    else if (mode == 2) {
        for (int i = 0; i < num_faces; i++) {
            #pragma HLS pipeline II=12
            apuint64_1_to_half_2(stream_input->read().data, ct0[0], ct0[1]);
            apuint64_1_to_half_2(stream_input->read().data, cn0[0], cn0[1]);
            apuint64_1_to_half_2(stream_input->read().data, cn0[2], cv0[0]);
            apuint64_1_to_half_2(stream_input->read().data, cv0[1], cv0[2]);

            apuint64_1_to_half_2(stream_input->read().data, ct1[0], ct1[1]);
            apuint64_1_to_half_2(stream_input->read().data, cn1[0], cn1[1]);
            apuint64_1_to_half_2(stream_input->read().data, cn1[2], cv1[0]);
            apuint64_1_to_half_2(stream_input->read().data, cv1[1], cv1[2]);

            apuint64_1_to_half_2(stream_input->read().data, ct2[0], ct2[1]);
            apuint64_1_to_half_2(stream_input->read().data, cn2[0], cn2[1]);
            apuint64_1_to_half_2(stream_input->read().data, cn2[2], cv2[0]);
            apuint64_1_to_half_2(stream_input->read().data, cv2[1], cv2[2]);

            l0 = lambt + vector_dot_vector(cn0, lnormh)*(1.0-lambt);
            l1 = lambt + vector_dot_vector(cn1, lnormh)*(1.0-lambt);
            l2 = lambt + vector_dot_vector(cn2, lnormh)*(1.0-lambt);

            cam_project(cv0, cam_scale, cam_offset, fv0, fv0i);
            cam_project(cv1, cam_scale, cam_offset, fv1, fv1i);
            cam_project(cv2, cam_scale, cam_offset, fv2, fv2i);

            if ((fv0[2]<clip) && (fv1[2]<clip) && (fv2[2]<clip)) continue;

            area = triangle_area(fv2, fv1, fv0);
            if (area <= 0) continue;

            fz0_1 = 1 / fv0[2];
            fz1_1 = 1 / fv1[2];
            fz2_1 = 1 / fv2[2];

            fymax = imin(fh[1]-1, imax(fv0i[1], imax(fv1i[1], fv2i[1])));
            fymin = imax(  fh[0], imin(fv0i[1], imin(fv1i[1], fv2i[1])));
            fxmax = imin(  640-1, imax(fv0i[0], imax(fv1i[0], fv2i[0])));
            fxmin = imax(      0, imin(fv0i[0], imin(fv1i[0], fv2i[0])));

            for (int fy = fymin; fy <= fymax; fy++) {
                #pragma HLS pipeline
                for (int fx = fxmin; fx <= fxmax; fx++) {
                    #pragma HLS pipeline
                    #pragma HLS dependence variable=depth_buffer inter false
                    fvp[0] = fx;
                    fvp[1] = fy;
                    fvp[2] = 1;

                    w0 = triangle_area(fvp, fv2, fv1) / area;
                    w1 = triangle_area(fvp, fv0, fv2) / area;
                    w2 = triangle_area(fvp, fv1, fv0) / area;

                    if ((w0>=0) && (w1>=0) && (w2>=0)) {
                        fz_1 = w0*fz0_1 + w1*fz1_1 + w2*fz2_1;
                        fz = 1 / fz_1;

                        if ((fz>=clip) && (fz < depth_buffer[fy-fh[0]][fx])) {
                            depth_buffer[fy-fh[0]][fx] = fz;

                            ct[0] = round(64 * (w0*ct0[0]*fz0_1 + w1*ct1[0]*fz1_1 + w2*ct2[0]*fz2_1) * fz);
                            ct[1] = round(64 * (w0*ct0[1]*fz0_1 + w1*ct1[1]*fz1_1 + w2*ct2[1]*fz2_1) * fz);

                            ct[0] = (ct[0]<0) ? 0 : ((ct[0]>63) ? 63 : ct[0]);
                            ct[1] = (ct[1]<0) ? 0 : ((ct[1]>63) ? 63 : ct[1]);

                            lum = (w0*l0*fz0_1 + w1*l1*fz1_1 + w2*l2*fz2_1) * fz;

                            tex[0] = ((half)texture[texture_id][ct[0]][ct[1]][0]) * lum;
                            tex[1] = ((half)texture[texture_id][ct[0]][ct[1]][1]) * lum;
                            tex[2] = ((half)texture[texture_id][ct[0]][ct[1]][2]) * lum;

                            frame_buffer[fy-fh[0]][fx][0] = tex[0];
                            frame_buffer[fy-fh[0]][fx][1] = tex[1];
                            frame_buffer[fy-fh[0]][fx][2] = tex[2];
                        }
                    }
                }
            }
        }
    }
    else if (mode == 3) {
        for (int i = 0; i < BUF_H; i++) {
            for (int j = 0; j < 640; j+=2) {
                #pragma HLS pipeline
                uint8_8_to_apuint64_1(
                    frame_buffer[i][j+0][0], frame_buffer[i][j+0][1], frame_buffer[i][j+0][2], 0,
                    frame_buffer[i][j+1][0], frame_buffer[i][j+1][1], frame_buffer[i][j+1][2], 0,
                    stream_data.data);
                stream_data.last = ((i+1)==BUF_H) && ((j+2)==640);
                stream_output->write(stream_data);
            }
        }
    }

    return;
}
