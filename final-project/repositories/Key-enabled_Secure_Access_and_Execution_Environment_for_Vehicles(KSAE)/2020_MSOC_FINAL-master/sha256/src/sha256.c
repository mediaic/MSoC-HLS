#include "sha256.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>  // for overloaded memcpy() function
#include "sha256_impl.h"

void sha256( unsigned char data[MAXDATASIZE],  // input: data to be hashed
			 unsigned int  base_offset,        // input: memory offset to start of memory region to hash (bytes)
			 unsigned int  bytes,              // input: length of memory region to hash (bytes)
			 unsigned char digest[HASHSIZE] ) {
	   // output: hash digest of input data

// Interface definitions
#pragma HLS INTERFACE s_axilite port=data
#pragma HLS INTERFACE s_axilite port=digest
#pragma HLS INTERFACE s_axilite port=base_offset //bundle=p0
#pragma HLS INTERFACE s_axilite port=bytes //bundle=p0
#pragma HLS INTERFACE s_axilite port=return
	// We work on buffers of up to 64 bytes - hard-coded into SHA256 algorithm
	unsigned char seg_buf[64];	   // 64byte segment buffer
	unsigned int seg_offset = 0;   // progress thru the region of interest
	int i=0;
	unsigned int n = bytes;

	// Initialize the SHA256 context
	SHA256_CTX sha256ctx;
	sha256_init(&sha256ctx);

	// Process the data (byte at a time...)
	while( n )
	{
		if( n >= 64 )
		{
			for (i=0; i<64; i++)
			// #pragma HLS unroll
				seg_buf[i] = *(data + base_offset + seg_offset + i);
				// printf("seg_buf [63]= %X",seg_buf[63]);
				// printf("data = %c",*data);
				// printf("base_offset = %d",base_offset);
				// printf("seg_offset = %d",seg_offset);
			n -= 64;
			seg_offset += 64;
			sha256_update(&sha256ctx, seg_buf, 64);
		}
		else
		{
			for (i=0; i<n; i++)
			// #pragma HLS unroll
				seg_buf[i] = *(data + base_offset + seg_offset+i);
				// printf("seg_buf [0]= %X",seg_buf[0]);
				// printf("data = %c",*data);
				// printf("base_offset = %d",base_offset);
				// printf("seg_offset = %d",seg_offset);
			sha256_update(&sha256ctx, seg_buf, n);
			n=0;
		}
	}

	// Finish computing the hash (recycle FPGAbuf), and copy results back to proc mem
	sha256_final(&sha256ctx, seg_buf);

	for (i=0; i<32; i++) {
#pragma HLS UNROLL
		digest[i] = seg_buf[i];
	}
}
