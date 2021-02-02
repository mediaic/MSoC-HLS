
module DP_geno_Top(
    /////////////////////////////////////// Basics /////////////////////////////////////
    input                                       clk,
    input                                       rst_n, 
   
    // input ports
    output                                          o_geno_ready,
    input                                           i_geno_valid,
    input [2*`HAP_MAX_LENGTH-1:0]                   i_geno_sequence_A,              // reference one.   Genotyping: haplotype sequence
    input [2*`READ_MAX_LENGTH-1:0]                  i_geno_sequence_B,              // query one.       Genotyping: short-read
    input [2*`READ_MAX_LENGTH-1:0]                  i_geno_sequence_B_qualities,    // quantized read quality score
    input [$clog2(`HAP_MAX_LENGTH):0]               i_geno_seq_A_length,            // 0~512 (1-based)
    input [$clog2(`READ_MAX_LENGTH):0]              i_geno_seq_B_length,            // 0~512 (1-based)
    input [$clog2(`GENO_SRAM_WORD_AMOUNT)-1:0]              i_geno_address_ID,             // only Genotyping
    // output ports
    input                                           i_geno_ready,
    output                                          o_geno_valid,
    output signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0]  o_geno_alignment_score,          // Genotyping: Viterbi-Decoding likelihood in log
    output [$clog2(`GENO_SRAM_WORD_AMOUNT)-1:0]             o_geno_address_ID
);
    integer i, j, k;
    genvar gv;
    localparam GENO_DP_ENGINE_AMOUNT = 4;


    wire                                            DP_o_ready               [0:GENO_DP_ENGINE_AMOUNT-1];
    wire                                            DP_i_valid               [0:GENO_DP_ENGINE_AMOUNT-1];
    wire [2*`HAP_MAX_LENGTH-1:0]                    DP_i_sequence_A          [0:GENO_DP_ENGINE_AMOUNT-1];
    wire [2*`READ_MAX_LENGTH-1:0]                   DP_i_sequence_B          [0:GENO_DP_ENGINE_AMOUNT-1];
    wire [2*`READ_MAX_LENGTH-1:0]                   DP_i_sequence_B_qualities[0:GENO_DP_ENGINE_AMOUNT-1];
    wire [$clog2(`HAP_MAX_LENGTH):0]                DP_i_seq_A_length        [0:GENO_DP_ENGINE_AMOUNT-1];
    wire [$clog2(`READ_MAX_LENGTH):0]               DP_i_seq_B_length        [0:GENO_DP_ENGINE_AMOUNT-1];
    wire [$clog2(`GENO_SRAM_WORD_AMOUNT)-1:0]       DP_i_geno_address_ID    [0:GENO_DP_ENGINE_AMOUNT-1];

    wire                                            DP_i_ready                [0:GENO_DP_ENGINE_AMOUNT-1];
    wire                                            DP_o_valid                [0:GENO_DP_ENGINE_AMOUNT-1];
    wire signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0]    DP_o_alignment_score      [0:GENO_DP_ENGINE_AMOUNT-1];
    wire [$clog2(`GENO_SRAM_WORD_AMOUNT)-1:0]       DP_o_geno_address_ID     [0:GENO_DP_ENGINE_AMOUNT-1];


    DP_geno_Adaptor_i u_DP_Adaptor_i(
        /////////////////////////////////////// Basics /////////////////////////////////////
        .clk                            (clk),
        .rst_n                          (rst_n),
        
        
        ////////////////////////////////////// Genotyping I/Os ////////////////////////////////////// 
        .o_geno_ready                   (o_geno_ready               ),
        .i_geno_valid                   (i_geno_valid               ),
        .i_geno_sequence_A              (i_geno_sequence_A          ),  // reference one.   Genotyping: haplotype sequence
        .i_geno_sequence_B              (i_geno_sequence_B          ),  // query one.       Genotyping: short-read
        .i_geno_sequence_B_qualities    (i_geno_sequence_B_qualities),  // quantized read quality score
        .i_geno_seq_A_length            (i_geno_seq_A_length        ),  // 0~512 (1-based)
        .i_geno_seq_B_length            (i_geno_seq_B_length        ),  // 0~512 (1-based)
        .i_geno_address_ID             (i_geno_address_ID         ),  // only Genotyping


        /////////////////////////////////// PE DP0 /////////////////////////////////////
        .DP0_o_ready                    (DP_o_ready               [0]),
        .DP0_i_valid                    (DP_i_valid               [0]),
        .DP0_i_sequence_A               (DP_i_sequence_A          [0]), // reference one.   Mapping: reference sequence
        .DP0_i_sequence_B               (DP_i_sequence_B          [0]), // query one.       Mapping: short-read
        .DP0_i_sequence_B_qualities     (DP_i_sequence_B_qualities[0]), // quantized read quality score
        .DP0_i_seq_A_length             (DP_i_seq_A_length        [0]), // 0~512 (1-based)
        .DP0_i_seq_B_length             (DP_i_seq_B_length        [0]), // 0~512 (1-based)
        .DP0_i_geno_address_ID         (DP_i_geno_address_ID    [0]), // only Genotyping

        /////////////////////////////////// PE DP1 /////////////////////////////////////
        .DP1_o_ready                    (DP_o_ready               [1]),
        .DP1_i_valid                    (DP_i_valid               [1]),
        .DP1_i_sequence_A               (DP_i_sequence_A          [1]), // reference one.   Mapping: reference sequence
        .DP1_i_sequence_B               (DP_i_sequence_B          [1]), // query one.       Mapping: short-read
        .DP1_i_sequence_B_qualities     (DP_i_sequence_B_qualities[1]), // quantized read quality score
        .DP1_i_seq_A_length             (DP_i_seq_A_length        [1]), // 0~512 (1-based)
        .DP1_i_seq_B_length             (DP_i_seq_B_length        [1]), // 0~512 (1-based)
        .DP1_i_geno_address_ID         (DP_i_geno_address_ID    [1]), // only Genotyping

        /////////////////////////////////// PE DP2 /////////////////////////////////////
        .DP2_o_ready                    (DP_o_ready               [2]),
        .DP2_i_valid                    (DP_i_valid               [2]),
        .DP2_i_sequence_A               (DP_i_sequence_A          [2]), // reference one.   Mapping: reference sequence
        .DP2_i_sequence_B               (DP_i_sequence_B          [2]), // query one.       Mapping: short-read
        .DP2_i_sequence_B_qualities     (DP_i_sequence_B_qualities[2]), // quantized read quality score
        .DP2_i_seq_A_length             (DP_i_seq_A_length        [2]), // 0~512 (1-based)
        .DP2_i_seq_B_length             (DP_i_seq_B_length        [2]), // 0~512 (1-based)
        .DP2_i_geno_address_ID         (DP_i_geno_address_ID    [2]), // only Genotyping

        /////////////////////////////////// PE DP3 /////////////////////////////////////
        .DP3_o_ready                    (DP_o_ready               [3]),
        .DP3_i_valid                    (DP_i_valid               [3]),
        .DP3_i_sequence_A               (DP_i_sequence_A          [3]), // reference one.   Mapping: reference sequence
        .DP3_i_sequence_B               (DP_i_sequence_B          [3]), // query one.       Mapping: short-read
        .DP3_i_sequence_B_qualities     (DP_i_sequence_B_qualities[3]), // quantized read quality score
        .DP3_i_seq_A_length             (DP_i_seq_A_length        [3]), // 0~512 (1-based)
        .DP3_i_seq_B_length             (DP_i_seq_B_length        [3]), // 0~512 (1-based)
        .DP3_i_geno_address_ID         (DP_i_geno_address_ID    [3])  // only Genotyping
    );


    generate
    for (gv=0;gv<GENO_DP_ENGINE_AMOUNT;gv=gv+1)
    begin: DP_Array

        DP_geno_thin_Array u_DP_geno_thin_Array(
            /////////////////////////////////////// Basics /////////////////////////////////////
            .clk                        (clk   ),
            .rst_n                      (rst_n ),
            .refresh                    (1'b0),
            ////////////////////////////////////// Mapping I/Os ////////////////////////////////////// 
            .o_ready                    (DP_o_ready               [gv]),
            .i_valid                    (DP_i_valid               [gv]),
            .i_sequence_A               (DP_i_sequence_A          [gv]),    // reference one.   Mapping: reference sequence
            .i_sequence_B               (DP_i_sequence_B          [gv]),    // query one.       Mapping: short-read
            .i_sequence_B_qualities     (DP_i_sequence_B_qualities[gv]),    // quantized read quality score
            .i_seq_A_length             (DP_i_seq_A_length        [gv]),    // 0~512 (1-based)
            .i_seq_B_length             (DP_i_seq_B_length        [gv]),    // 0~512 (1-based)
            .i_geno_address_ID          (DP_i_geno_address_ID    [gv]),    // only Genotyping
            // ----------------------------------------------------------------------
            .i_ready                    (DP_i_ready               [gv]),
            .o_valid                    (DP_o_valid               [gv]),
            .o_alignment_score          (DP_o_alignment_score     [gv]),    // Mapping: SW score
            .o_geno_address_ID          (DP_o_geno_address_ID    [gv])     // only Genotyping
        );
    end
    endgenerate

    DP_geno_Adaptor_o u_DP_Adaptor_o(
        /////////////////////////////////////// Basics /////////////////////////////////////
        .clk                            (clk),
        .rst_n                          (rst_n),
        
        ////////////////////////////////////// Genotyping I/Os ////////////////////////////////////// 
        .i_geno_ready                   (i_geno_ready           ),
        .o_geno_valid                   (o_geno_valid           ),
        .o_geno_alignment_score         (o_geno_alignment_score ),          // Genotyping: Viterbi-Decoding likelihood in log
        .o_geno_address_ID             (o_geno_address_ID     ),



        // DP[0]
        .DP0_i_ready                    (DP_i_ready               [0]),
        .DP0_o_valid                    (DP_o_valid               [0]),
        .DP0_o_alignment_score          (DP_o_alignment_score     [0]),      // Mapping: SW score
        .DP0_o_geno_address_ID         (DP_o_geno_address_ID    [0]),     // only Genotyping

        // DP[1]
        .DP1_i_ready                    (DP_i_ready               [1]),
        .DP1_o_valid                    (DP_o_valid               [1]),
        .DP1_o_alignment_score          (DP_o_alignment_score     [1]),      // Mapping: SW score
        .DP1_o_geno_address_ID         (DP_o_geno_address_ID    [1]),    // only Genotyping

        // DP[2]
        .DP2_i_ready                    (DP_i_ready               [2]),
        .DP2_o_valid                    (DP_o_valid               [2]),
        .DP2_o_alignment_score          (DP_o_alignment_score     [2]),      // Mapping: SW score
        .DP2_o_geno_address_ID         (DP_o_geno_address_ID    [2]),     // only Genotyping

        // DP[3]
        .DP3_i_ready                    (DP_i_ready               [3]),
        .DP3_o_valid                    (DP_o_valid               [3]),
        .DP3_o_alignment_score          (DP_o_alignment_score     [3]),      // Mapping: SW score
        .DP3_o_geno_address_ID         (DP_o_geno_address_ID    [3])     // only Genotyping
        
    );


endmodule

