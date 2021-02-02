#include "aesecb.h"
#include "aescbc.h"

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

void aescbc(ciphermode_t mode,
			uint8_t data_in[AESKEYSIZE],
			uint8_t data_out[AESBLKSIZE])
{
//#pragma HLS INTERFACE s_axilite port=key_in depth=32 //bundle=p0
//#pragma HLS INTERFACE s_axilite port=iv_in depth=16//bundle=p0
#pragma HLS INTERFACE s_axilite port=data_in depth=32
#pragma HLS INTERFACE s_axilite port=data_out depth=16
#pragma HLS INTERFACE s_axilite port=mode //bundle=p0
#pragma HLS INTERFACE s_axilite port=return

	uint8_t buf[AESBLKSIZE];            // FPGA copy of crypto data from/to interface args
	static uint8_t lastbuf[AESBLKSIZE]; // Used in decryption only
	static uint8_t iv[AESBLKSIZE];      // Initialization vector for first XOR operation
	static uint8_t xorv[AESBLKSIZE];    // Current vector for next XOR operation
	static uint8_t key[AESKEYSIZE];     // Encryption key
    static aes_context ctx;  // ECB block context
    uint8_t i;                  // generic iterator

    switch( mode ) {
    case RESET:
    	// zero output
    	loop_dataoutclr0:
		for(i=0; i<AESBLKSIZE; i++)
    		data_out[i] = 0;

    	loop_xorvreset:
		for(i=0; i<AESBLKSIZE; i++)
    		xorv[i] = iv[i];

		aes_init(&ctx, key);
    	break;

    case ENCRYPT:
    	// copy data into buffer
    	for(i=0; i<AESBLKSIZE; i++)
    		buf[i] = data_in[i];
    	// scramble the input based on the iv/last cipher output block
    	for(i=0; i<AESBLKSIZE; i++)
    		buf[i] = buf[i]^xorv[i];
    	// apply the ECB encryption algorithm
    	aes_encrypt_ecb(&ctx, buf);
    	// copy the output to xorv for the next operation
    	for(i=0; i<AESBLKSIZE; i++)
    		xorv[i] = buf[i];
    	// copy the output to the destination region in memory
    	for(i=0; i<AESBLKSIZE; i++)
    		data_out[i] = buf[i];
    	break;

    case DECRYPT:
    	for(i=0; i<AESBLKSIZE; i++)
    		buf[i] = data_in[i];
    	// retain cipher block for next cycle's xorv[]
    	for(i=0; i<AESBLKSIZE; i++)
    		lastbuf[i] = buf[i];
    	// apply the ECB decryption algorithm
    	aes_decrypt_ecb(&ctx, buf);
    	// unscramble the results based on the iv/last cipher block output
    	for(i=0; i<AESBLKSIZE; i++)
    		buf[i] = buf[i]^xorv[i];
    	// set up xorv for the next cycle
    	for(i=0; i<AESBLKSIZE; i++)
    		xorv[i] = lastbuf[i];
    	// copy the output to the destination region in memory
    	for(i=0; i<AESBLKSIZE;  i++)
    		data_out[i] = buf[i];
    	break;

    case SET_IV:
    	loop_setiv:
		for(i=0; i<AESBLKSIZE; i++)
    		iv[i] = data_in[i];

		loop_dataoutclr1:
		for(i=0; i<AESBLKSIZE; i++)
			data_out[i] = 0;
    	break;

    case SET_KEY:
		loop_setkey:
		for(i=0; i<AESKEYSIZE; i++)
			key[i] = data_in[i];

    	loop_dataoutclr2:
		for(i=0; i<AESBLKSIZE; i++)
			data_out[i] = 0;
    	break;
    }
} 
