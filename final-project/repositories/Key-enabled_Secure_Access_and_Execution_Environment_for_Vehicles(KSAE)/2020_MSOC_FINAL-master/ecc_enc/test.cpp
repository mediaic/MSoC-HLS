/*
 * Copyright 2019 Xilinx, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "ecc.hpp"
#define W 4

void ecc_enc(ap_uint<W> a,
          ap_uint<W> b,
          ap_uint<W> p,
          ap_uint<W> Gx,
          ap_uint<W> Gy,
          ap_uint<W> Px,
          ap_uint<W> Py,
          ap_uint<W> randomKey,
          ap_uint<W> PMx,
          ap_uint<W> PMy,
          ap_uint<W>& C1x,
          ap_uint<W>& C1y,
          ap_uint<W>& C2x,
          ap_uint<W>& C2y) {
#pragma HLS INTERFACE s_axilite port=a
#pragma HLS INTERFACE s_axilite port=b
#pragma HLS INTERFACE s_axilite port=p
#pragma HLS INTERFACE s_axilite port=Gx
#pragma HLS INTERFACE s_axilite port=Gy
#pragma HLS INTERFACE s_axilite port=Px
#pragma HLS INTERFACE s_axilite port=Py
#pragma HLS INTERFACE s_axilite port=randomKey
#pragma HLS INTERFACE s_axilite port=PMx
#pragma HLS INTERFACE s_axilite port=PMy
#pragma HLS INTERFACE s_axilite port=C1x
#pragma HLS INTERFACE s_axilite port=C1y
#pragma HLS INTERFACE s_axilite port=C2x
#pragma HLS INTERFACE s_axilite port=C2y
#pragma HLS INTERFACE s_axilite port=return

    xf::security::ecc<W> processor;
    processor.init(a, b, p);
    processor.encrypt(Gx, Gy, Px, Py, randomKey, PMx, PMy, C1x, C1y, C2x, C2y);
}

int main() {
    ap_uint<W> a = 1;
    ap_uint<W> b = 6;
    ap_uint<W> p = 11;

    ap_uint<W> Gx = 2;
    ap_uint<W> Gy = 7;
    ap_uint<W> privateKey = 7;
    ap_uint<W> Px = 7;
    ap_uint<W> Py = 2;

    ap_uint<W> PMx = 10;
    ap_uint<W> PMy = 9;
    ap_uint<W> randomKey = 3;

    ap_uint<W> gld1x = 8;
    ap_uint<W> gld1y = 3;
    ap_uint<W> gld2x = 10;
    ap_uint<W> gld2y = 2;

    ap_uint<W> C1x, C1y, C2x, C2y;

    ecc_enc(a, b, p, Gx, Gy, Px, Py, randomKey, PMx, PMy, C1x, C1y, C2x, C2y);

    if (gld1x != C1x || gld1y != C1y || gld2x != C2x || gld2y != C2y) {
        return 1;
    } else {
        return 0;
    }
}
