
module DP_geno_Adaptor_i(
    /////////////////////////////////////// Basics /////////////////////////////////////
    input                                clk,
    input                                rst_n,
    
    ////////////////////////////////////// Genotyping I/Os ////////////////////////////////////// 
    output reg                          o_geno_ready,
    input                               i_geno_valid,
    input [2*`HAP_MAX_LENGTH-1:0]       i_geno_sequence_A,              // reference one.   Genotyping: haplotype sequence
    input [2*`READ_MAX_LENGTH-1:0]      i_geno_sequence_B,              // query one.       Genotyping: short-read
    input [2*`READ_MAX_LENGTH-1:0]      i_geno_sequence_B_qualities,    // quantized read quality score
    input [$clog2(`HAP_MAX_LENGTH):0]   i_geno_seq_A_length,            // 0~512 (1-based)
    input [$clog2(`READ_MAX_LENGTH):0]  i_geno_seq_B_length,            // 0~512 (1-based)
    input [$clog2(`GENO_SRAM_WORD_AMOUNT)-1:0]  i_geno_address_ID,             // only Genotyping




    // DP[0]
    input                                   DP0_o_ready,
    output reg                              DP0_i_valid,
    output reg [2*`HAP_MAX_LENGTH-1:0]      DP0_i_sequence_A,           // reference one.   Mapping: reference sequence
    output reg [2*`READ_MAX_LENGTH-1:0]     DP0_i_sequence_B,           // query one.       Mapping: short-read
    output reg [2*`READ_MAX_LENGTH-1:0]     DP0_i_sequence_B_qualities, // quantized read quality score
    output reg [$clog2(`HAP_MAX_LENGTH):0]  DP0_i_seq_A_length,         // 0~512 (1-based)
    output reg [$clog2(`READ_MAX_LENGTH):0] DP0_i_seq_B_length,         // 0~512 (1-based)
    output reg [$clog2(`GENO_SRAM_WORD_AMOUNT)-1:0] DP0_i_geno_address_ID,     // only Genotyping

    // DP[1]
    input                                   DP1_o_ready,
    output reg                              DP1_i_valid,
    output reg [2*`HAP_MAX_LENGTH-1:0]      DP1_i_sequence_A,           // reference one.   Mapping: reference sequence
    output reg [2*`READ_MAX_LENGTH-1:0]     DP1_i_sequence_B,           // query one.       Mapping: short-read
    output reg [2*`READ_MAX_LENGTH-1:0]     DP1_i_sequence_B_qualities, // quantized read quality score
    output reg [$clog2(`HAP_MAX_LENGTH):0]  DP1_i_seq_A_length,         // 0~512 (1-based)
    output reg [$clog2(`READ_MAX_LENGTH):0] DP1_i_seq_B_length,         // 0~512 (1-based)
    output reg [$clog2(`GENO_SRAM_WORD_AMOUNT)-1:0] DP1_i_geno_address_ID,     // only Genotyping

    // DP[2]
    input                                   DP2_o_ready,
    output reg                              DP2_i_valid,
    output reg [2*`HAP_MAX_LENGTH-1:0]      DP2_i_sequence_A,           // reference one.   Mapping: reference sequence
    output reg [2*`READ_MAX_LENGTH-1:0]     DP2_i_sequence_B,           // query one.       Mapping: short-read
    output reg [2*`READ_MAX_LENGTH-1:0]     DP2_i_sequence_B_qualities, // quantized read quality score
    output reg [$clog2(`HAP_MAX_LENGTH):0]  DP2_i_seq_A_length,         // 0~512 (1-based)
    output reg [$clog2(`READ_MAX_LENGTH):0] DP2_i_seq_B_length,         // 0~512 (1-based)
    output reg [$clog2(`GENO_SRAM_WORD_AMOUNT)-1:0] DP2_i_geno_address_ID,     // only Genotyping

    // DP[3]
    input                                   DP3_o_ready,
    output reg                              DP3_i_valid,
    output reg [2*`HAP_MAX_LENGTH-1:0]      DP3_i_sequence_A,           // reference one.   Mapping: reference sequence
    output reg [2*`READ_MAX_LENGTH-1:0]     DP3_i_sequence_B,           // query one.       Mapping: short-read
    output reg [2*`READ_MAX_LENGTH-1:0]     DP3_i_sequence_B_qualities, // quantized read quality score
    output reg [$clog2(`HAP_MAX_LENGTH):0]  DP3_i_seq_A_length,         // 0~512 (1-based)
    output reg [$clog2(`READ_MAX_LENGTH):0] DP3_i_seq_B_length,         // 0~512 (1-based)
    output reg [$clog2(`GENO_SRAM_WORD_AMOUNT)-1:0] DP3_i_geno_address_ID      // only Genotyping

);

    
    wire DPs_ready = (DP0_o_ready | DP1_o_ready | DP2_o_ready | DP3_o_ready);

    always@(*)  begin

        o_geno_ready = DPs_ready;


        DP0_i_valid                 = 0;
        DP0_i_sequence_A            = 0;
        DP0_i_sequence_B            = 0;
        DP0_i_sequence_B_qualities  = 0;
        DP0_i_seq_A_length          = 0;
        DP0_i_seq_B_length          = 0;
        DP0_i_geno_address_ID      = 0;

        DP1_i_valid                 = 0;
        DP1_i_sequence_A            = 0;
        DP1_i_sequence_B            = 0;
        DP1_i_sequence_B_qualities  = 0;
        DP1_i_seq_A_length          = 0;
        DP1_i_seq_B_length          = 0;
        DP1_i_geno_address_ID      = 0;

        DP2_i_valid                 = 0;
        DP2_i_sequence_A            = 0;
        DP2_i_sequence_B            = 0;
        DP2_i_sequence_B_qualities  = 0;
        DP2_i_seq_A_length          = 0;
        DP2_i_seq_B_length          = 0;
        DP2_i_geno_address_ID      = 0;

        DP3_i_valid                 = 0;
        DP3_i_sequence_A            = 0;
        DP3_i_sequence_B            = 0;
        DP3_i_sequence_B_qualities  = 0;
        DP3_i_seq_A_length          = 0;
        DP3_i_seq_B_length          = 0;
        DP3_i_geno_address_ID      = 0;


        if (DP0_o_ready) begin
            DP0_i_valid                 = i_geno_valid;
            DP0_i_sequence_A            = i_geno_sequence_A;
            DP0_i_sequence_B            = i_geno_sequence_B;
            DP0_i_sequence_B_qualities  = i_geno_sequence_B_qualities;
            DP0_i_seq_A_length          = i_geno_seq_A_length;
            DP0_i_seq_B_length          = i_geno_seq_B_length;
            DP0_i_geno_address_ID      = i_geno_address_ID;
        end else if (DP1_o_ready) begin
            DP1_i_valid                 = i_geno_valid;
            DP1_i_sequence_A            = i_geno_sequence_A;
            DP1_i_sequence_B            = i_geno_sequence_B;
            DP1_i_sequence_B_qualities  = i_geno_sequence_B_qualities;
            DP1_i_seq_A_length          = i_geno_seq_A_length;
            DP1_i_seq_B_length          = i_geno_seq_B_length;
            DP1_i_geno_address_ID      = i_geno_address_ID;
        end else if (DP2_o_ready) begin
            DP2_i_valid                 = i_geno_valid;
            DP2_i_sequence_A            = i_geno_sequence_A;
            DP2_i_sequence_B            = i_geno_sequence_B;
            DP2_i_sequence_B_qualities  = i_geno_sequence_B_qualities;
            DP2_i_seq_A_length          = i_geno_seq_A_length;
            DP2_i_seq_B_length          = i_geno_seq_B_length;
            DP2_i_geno_address_ID      = i_geno_address_ID;
        end else if (DP3_o_ready) begin
            DP3_i_valid                 = i_geno_valid;
            DP3_i_sequence_A            = i_geno_sequence_A;
            DP3_i_sequence_B            = i_geno_sequence_B;
            DP3_i_sequence_B_qualities  = i_geno_sequence_B_qualities;
            DP3_i_seq_A_length          = i_geno_seq_A_length;
            DP3_i_seq_B_length          = i_geno_seq_B_length;
            DP3_i_geno_address_ID      = i_geno_address_ID;
        end
    end
    

endmodule
