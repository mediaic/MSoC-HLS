

module DP_geno_Adaptor_o(
    /////////////////////////////////////// Basics /////////////////////////////////////
    input                                               clk,
    input                                               rst_n,
    
   
    ////////////////////////////////////// Genotyping I/Os ////////////////////////////////////// 
    input                                               i_geno_ready,
    output reg                                          o_geno_valid,
    output reg signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0]  o_geno_alignment_score,          // Genotyping: Viterbi-Decoding likelihood in log
    output reg [$clog2(`GENO_SRAM_WORD_AMOUNT)-1:0]             o_geno_address_ID,



    // DP[0]
    output reg                                          DP0_i_ready,
    input                                               DP0_o_valid,
    input signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0]       DP0_o_alignment_score,      // Mapping: SW score
    input [$clog2(`GENO_SRAM_WORD_AMOUNT)-1:0]                  DP0_o_geno_address_ID,     // only Genotyping

    // DP[1]
    output reg                                          DP1_i_ready,
    input                                               DP1_o_valid,
    input signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0]       DP1_o_alignment_score,      // Mapping: SW score
    input [$clog2(`GENO_SRAM_WORD_AMOUNT)-1:0]                  DP1_o_geno_address_ID,     // only Genotyping

// DP[2]
    output reg                                          DP2_i_ready,
    input                                               DP2_o_valid,
    input signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0]       DP2_o_alignment_score,      // Mapping: SW score
    input [$clog2(`GENO_SRAM_WORD_AMOUNT)-1:0]                  DP2_o_geno_address_ID,     // only Genotyping


// DP[3]
    output reg                                          DP3_i_ready,
    input                                               DP3_o_valid,
    input signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0]       DP3_o_alignment_score,      // Mapping: SW score
    input [$clog2(`GENO_SRAM_WORD_AMOUNT)-1:0]                  DP3_o_geno_address_ID     // only Genotyping

);
    


    reg                                         the_DP_o_valid;
    reg signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0] the_DP_o_alignment_score;
    reg [$clog2(`GENO_SRAM_WORD_AMOUNT)-1:0]            the_DP_o_geno_address_ID;

    



    reg  [1:0] DP_pointer;
    wire [1:0] DP_pointer_n;
    // always@(posedge clk or negedge rst_n)
    always@(posedge clk)
    begin
        if (!rst_n) DP_pointer <= 0;
        else DP_pointer <= DP_pointer_n;
    end
    assign DP_pointer_n = DP_pointer + 1;

    always@(*)
    begin
        DP0_i_ready = (DP_pointer==0) ? i_geno_ready : 0;
        DP1_i_ready = (DP_pointer==1) ? i_geno_ready : 0;
        DP2_i_ready = (DP_pointer==2) ? i_geno_ready : 0;
        DP3_i_ready = (DP_pointer==3) ? i_geno_ready : 0;

        the_DP_o_valid              = 0;
        the_DP_o_alignment_score    = 0;
        the_DP_o_geno_address_ID   = 0;
        case(DP_pointer)
            0: begin
                the_DP_o_valid              = DP0_o_valid;
                the_DP_o_alignment_score    = DP0_o_alignment_score;
                the_DP_o_geno_address_ID   = DP0_o_geno_address_ID;
            end
            1:begin
                the_DP_o_valid              = DP1_o_valid;
                the_DP_o_alignment_score    = DP1_o_alignment_score;
                the_DP_o_geno_address_ID   = DP1_o_geno_address_ID;
            end
            2:begin
                the_DP_o_valid              = DP2_o_valid;
                the_DP_o_alignment_score    = DP2_o_alignment_score;
                the_DP_o_geno_address_ID   = DP2_o_geno_address_ID;
            end
            3:begin
                the_DP_o_valid              = DP3_o_valid;
                the_DP_o_alignment_score    = DP3_o_alignment_score;
                the_DP_o_geno_address_ID   = DP3_o_geno_address_ID;
            end
        endcase

        ////////////////////////////////////// Genotyping I/Os ////////////////////////////////////// 
        o_geno_valid            = the_DP_o_valid;
        o_geno_alignment_score  = the_DP_o_alignment_score;
        o_geno_address_ID      = the_DP_o_geno_address_ID;


    end

endmodule
