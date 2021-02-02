#include "aescbc.h"
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

// For truth generation use OpenSSL as standard
#include <openssl/conf.h>
#include <openssl/evp.h>
#include <openssl/err.h>


// results caclulated using openSSL EVP
char openSSL_result[32] = {
		0xA8, 0x87, 0x01, 0xE4, 0x43, 0x4F, 0x59, 0x00, 0x9F, 0xF8, 0x9A, 0x40, 0x29, 0x98, 0x49, 0x57,
		0x99, 0x29, 0x0C, 0x6C, 0xB1, 0xB1, 0x6D, 0x1A, 0x8B, 0x0A, 0xF7, 0xAF, 0x2D, 0x96, 0x7E, 0xF1};



const char teststr[32] = "The Quick Brown Fox Jumped Over "; // string to encrypt

static void dumpmsg( uint8_t *pbuf ) {
	int index;

	for( index = 0; index < 16; index++ ) {
		printf("%02X ", pbuf[index]);
	}
	printf("\n");
}

int main( int argc, char *argv[]) {
	uint8_t key[32] = { 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
			0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F,
			0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17,
			0x18, 0x19, 0x1A, 0x1B, 0x1C, 0x1D, 0x1E, 0x1F };

	uint8_t iv[16] = { 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
			0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f };

	uint8_t buf0[32];
	uint8_t buf1[32];
	memset(buf0,0,32);
	memset(buf1,0,32);

	// Text to encrypt/decrypt
	strncpy((char *)buf0, teststr, 32);
	printf("TEXT  :\n");
	dumpmsg(buf0);
	dumpmsg(&(buf0[16]));

	// Test our engine
	aescbc(SET_KEY, key, buf1);
	aescbc(SET_IV,  iv,  buf1);
	aescbc(RESET,   buf0,buf1);
	aescbc(ENCRYPT, buf0, buf1);
	aescbc(ENCRYPT, &buf0[16],&buf1[16]);

	printf("DUTENC:\n");
	dumpmsg(buf1);
	dumpmsg(&(buf1[16]));

	//	if (strncmp((const char*)&(vRAM[32]), openSSL_result, 32))
	if (memcmp(buf1, openSSL_result, 32))
	{
		printf("ERROR: ENCRYPTED DATA NOT CORRECT\n");
		return -1;
	}

	// Erase the original plain text
	memset(buf0,0,32);

	// Decrypt
	aescbc(RESET,   buf1, buf0);
	aescbc(DECRYPT, buf1, buf0);
	aescbc(DECRYPT, &buf1[16],&buf0[16]);

	printf("DUTDEC:\n");
	dumpmsg(buf0);
	dumpmsg(&(buf0[16]));

	//	if (strncmp(vRAM, teststr, 32))
	if (memcmp(buf0, teststr, 32))
	{
		printf("ERROR: DECRYPTED DATA NOT CORRECT\n");
		return -1;
	}
	return 0;
}
