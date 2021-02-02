#include <iostream>
#include <fstream>
#include "render.h"
using namespace std;

int main(int argc, char *argv[])
{
    value_t stream_data;

    cout << ">> HLS rendering" << endl;

    stream_data.data = 0;
    stream_data.keep = 0xFF;
    stream_data.strb = 0xFF;
    stream_data.user = 0;
    stream_data.last = 0;
    stream_data.id = 0;
    stream_data.dest = 0;

    stream_t stream_input;
    stream_t stream_output;

    int num_faces = 1520;

    float transform[3][4] = {
        {1.0, 0.0, 0.0, 0.0},
        {0.0, 1.0, 0.0, 0.0},
        {0.0, 0.0, 1.0, 0.0}
    };
    float obj_scale = 1.0;

    float lnorm[3] = {0.81, 0.55, 0.21};
    float cam_scale[3] = {514.22, 514.22, -1.0};
    float cam_offset[3] = {320.0, 240.0, 0.0};
    int fh[2];

    uint8_t result[480][640][3];
    uint8_t _;

    // rasterization
    ofstream outfile;
    outfile.open("result.txt");

    for (int i = 0; i < 480/BUF_H; i++) {
        cout << "iteration " << i+1 << "..." << endl;

        ifstream testfile;
        testfile.open("C:\\Users\\victorhuang\\Desktop\\HLS3D_vivado\\HLS3D\\scene.txt");
        float tmp1, tmp2;

        fh[0] = BUF_H * i;
        fh[1] = BUF_H * (i+1);

        for (int j = 0; j < num_faces; j++) {
            for (int k = 0; k < 12; k++) {
                testfile >> tmp1 >> tmp2;
                float_2_to_apuint64_1(tmp1, tmp2, stream_data.data);
                stream_data.last = ((j+1==num_faces) && (k+1==12));
                stream_input.write(stream_data);
            }
        }

        render(&stream_input, &stream_output, 0, num_faces,
               transform, obj_scale, 0, lnorm, cam_scale, cam_offset, fh);

        render(&stream_input, &stream_output, 2, num_faces,
               transform, obj_scale, 0, lnorm, cam_scale, cam_offset, fh);

        render(&stream_input, &stream_output, 3, num_faces,
               transform, obj_scale, 0, lnorm, cam_scale, cam_offset, fh);

        for (int j = fh[0]; j < fh[1]; j++) {
            for (int k = 0; k < 640; k+=2) {
                apuint64_1_to_uint8_8(stream_output.read().data,
                                      result[j][k+0][0],
                                      result[j][k+0][1],
                                      result[j][k+0][2], _,
                                      result[j][k+1][0],
                                      result[j][k+1][1],
                                      result[j][k+1][2], _);
            }
        }
    }

    for (int i = 0; i < 480; i++) {
        for (int j = 0; j < 640; j++) {
            outfile << (int)result[i][j][0] << " ";
            outfile << (int)result[i][j][1] << " ";
            outfile << (int)result[i][j][2] << endl;
        }
    }

    return 0;
}
