#pragma once

#include <stdbool.h>

#define MAXDATASIZE 51200
#define HASHSIZE 32     // A SHA256 hash is 32 bytes long (256 bits:)
#define VRAMSIZE HASHSIZE+MAXDATASIZE

void sha256( unsigned char data[MAXDATASIZE],  // input: data to be hashed
			 unsigned int  base_offset,        // input: memory offset to start of memory region to hash (bytes)
			 unsigned int  bytes,              // input: length of memory region to hash (bytes)
			 unsigned char digest[HASHSIZE] );  // output: hash digest of input data
