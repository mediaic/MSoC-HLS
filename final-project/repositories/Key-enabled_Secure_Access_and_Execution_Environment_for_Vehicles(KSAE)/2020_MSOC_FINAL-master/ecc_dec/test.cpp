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

void ecc_dec(ap_uint<W> a,
          ap_uint<W> b,
          ap_uint<W> p,
          ap_uint<W> C1x,
          ap_uint<W> C1y,
          ap_uint<W> C2x,
          ap_uint<W> C2y,
          ap_uint<W> privateKey,
          ap_uint<W>& PMx,
          ap_uint<W>& PMy) {
#pragma HLS INTERFACE s_axilite port=a
#pragma HLS INTERFACE s_axilite port=b
#pragma HLS INTERFACE s_axilite port=p
#pragma HLS INTERFACE s_axilite port=C1x
#pragma HLS INTERFACE s_axilite port=C1y
#pragma HLS INTERFACE s_axilite port=C2x
#pragma HLS INTERFACE s_axilite port=C2y
#pragma HLS INTERFACE s_axilite port=privateKey
#pragma HLS INTERFACE s_axilite port=PMx
#pragma HLS INTERFACE s_axilite port=PMy
#pragma HLS INTERFACE s_axilite port=return
    xf::security::ecc<W> processor;
    processor.init(a, b, p);
    processor.decrypt(C1x, C1y, C2x, C2y, privateKey, PMx, PMy);
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

    ap_uint<W> gldx = 10;
    ap_uint<W> gldy = 9;
    ap_uint<W> randomKey = 3;

    ap_uint<W> PMx, PMy;

    ap_uint<W> C1x = 8;
    ap_uint<W> C1y = 3;
    ap_uint<W> C2x = 10;
    ap_uint<W> C2y = 2;

    ecc_dec(a, b, p, C1x, C1y, C2x, C2y, privateKey, PMx, PMy);

    if (gldx != PMx || gldy != PMy) {
        return 1;
    } else {
        return 0;
    }
}
