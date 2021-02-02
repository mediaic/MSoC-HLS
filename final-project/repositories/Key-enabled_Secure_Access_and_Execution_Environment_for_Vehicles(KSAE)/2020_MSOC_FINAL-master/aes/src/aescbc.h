#pragma once

#include <stdint.h>

#define AESBLKSIZE 16
#define AESKEYSIZE 32

typedef enum { RESET = 0, ENCRYPT, DECRYPT, SET_IV, SET_KEY } ciphermode_t;

//void aescbc(uint8_t memptr[DATA_IN_SIZE], ciphermode_t mode, uint32_t inbuf_addr, uint32_t outbuf_addr);
void aescbc(ciphermode_t mode,
			uint8_t data_in[AESKEYSIZE],
			uint8_t data_out[AESBLKSIZE] );
