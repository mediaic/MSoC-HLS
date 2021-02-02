
module DP_geno_thin_PE(

    ///////////////////////////////////// I/Os //////////////////////////////////////
    input clk,
    input rst_n,
    input refresh,

    input                                           i_en,
    input [1:0]                                     i_hap_base,          // haplotype base
    input [1:0]                                     i_read_base,          // read base
    input [1:0]                                     i_read_base_quality,  // read base quality

    input signed  [`DP_PAIRHMM_SCORE_BITWIDTH-1:0]  i_A_top_add_M2I,
    input signed  [`DP_PAIRHMM_SCORE_BITWIDTH-1:0]  i_I_top,

    input signed  [`DP_PAIRHMM_SCORE_BITWIDTH-1:0]  i_A_diag,
    input signed  [`DP_PAIRHMM_SCORE_BITWIDTH-1:0]  i_INDEL_diag,

    output signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0]  o_INDEL_dd,
    output signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0]  o_I_d,
    output signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0]  o_A_dd,
    output signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0]  o_A_d_add_M2I,

    output                                          o_valid_d,
    output                                          o_valid_dd,
    output                                          o_valid_ddd,
    output signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0]  o_Max,
    output [1:0]                                    o_hap_base
);

    localparam signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0] MOST_NEGATIVE = {1'b1, {(`DP_PAIRHMM_SCORE_BITWIDTH-1){1'b0}}};
    localparam signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0] MOST_POSITIVE = {1'b0, {(`DP_PAIRHMM_SCORE_BITWIDTH-1){1'b1}}};

    // DFF
    reg signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0] D_d, D_d_n;
    reg signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0] I_d, I_d_n;
    reg signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0] A_d, A_d_n;
    reg signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0] A_dd, A_dd_n;

    reg signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0] INDEL_dd, INDEL_dd_n;
    reg signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0] V_dd, V_dd_n;
    reg signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0] Max,  Max_n;

    reg output_valid_d, output_valid_d_n;
    reg output_valid_dd, output_valid_dd_n;
    reg output_valid_ddd, output_valid_ddd_n;

    reg [1:0] hap_base, hap_base_n;

    always@(*) begin
        output_valid_d_n   = output_valid_d;
        output_valid_dd_n  = output_valid_dd;
        output_valid_ddd_n = output_valid_ddd;
        hap_base_n = hap_base;
        if (refresh) begin
            output_valid_d_n   = 0;
            output_valid_dd_n  = 0;
            output_valid_ddd_n = 0;
            hap_base_n = 0;
        end else begin
            output_valid_d_n   = i_en;
            output_valid_dd_n  = output_valid_d;
            output_valid_ddd_n = output_valid_dd;
            hap_base_n = i_hap_base;
        end
    end    

    // deletion
    
    wire signed [`DP_PAIRHMM_SCORE_BITWIDTH:0] D_left_add_I2I = D_d + `CONST_I2I;
    wire signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0] D_left_add_I2I_bounded;
    assign D_left_add_I2I_bounded = (D_left_add_I2I[`DP_PAIRHMM_SCORE_BITWIDTH] & ~D_left_add_I2I[`DP_PAIRHMM_SCORE_BITWIDTH-1]) ? 
                                    MOST_NEGATIVE : D_left_add_I2I[`DP_PAIRHMM_SCORE_BITWIDTH-1:0];
    always@(*) begin
        D_d_n = D_d;
        if (refresh) D_d_n = MOST_NEGATIVE;
        else if (i_en) D_d_n = (o_A_d_add_M2I > D_left_add_I2I_bounded) ? o_A_d_add_M2I : D_left_add_I2I_bounded;
    end


    // insertion
    wire signed [`DP_PAIRHMM_SCORE_BITWIDTH:0] I_top_add_I2I = i_I_top + `CONST_I2I;
    wire signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0] I_top_add_I2I_bounded;
    assign I_top_add_I2I_bounded = (I_top_add_I2I[`DP_PAIRHMM_SCORE_BITWIDTH] & ~I_top_add_I2I[`DP_PAIRHMM_SCORE_BITWIDTH-1]) ? 
                                    MOST_NEGATIVE : I_top_add_I2I[`DP_PAIRHMM_SCORE_BITWIDTH-1:0];
    always@(*) begin
        I_d_n = I_d;
        if (refresh) I_d_n = MOST_NEGATIVE;
        else if (i_en) I_d_n = (i_A_top_add_M2I > I_top_add_I2I_bounded) ? i_A_top_add_M2I : I_top_add_I2I_bounded;
    end

    // INDEL
    always@(*) begin
        INDEL_dd_n = INDEL_dd;
        if (refresh) INDEL_dd_n = MOST_NEGATIVE;
        else if (output_valid_d) INDEL_dd_n = (D_d > I_d) ? D_d : I_d;
    end

    // alignment
    //* match prior
    reg signed [`CONST_MATCH_BITWIDTH-1:0] the_match_prior;
    always@(*) begin
        case(i_read_base_quality)
        2'd0: the_match_prior = `CONST_BQ0_MATCH_SCORE;
        2'd1: the_match_prior = `CONST_BQ1_MATCH_SCORE;
        2'd2: the_match_prior = `CONST_BQ2_MATCH_SCORE;
        2'd3: the_match_prior = `CONST_BQ3_MATCH_SCORE;
        endcase
    end
    //* mismatch prior
    reg signed [`CONST_MISMATCH_BITWIDTH-1:0] the_mismatch_prior;
    always@(*) begin
        case(i_read_base_quality)
        2'd0: the_mismatch_prior = `CONST_BQ0_MISMATCH_SCORE;
        2'd1: the_mismatch_prior = `CONST_BQ1_MISMATCH_SCORE;
        2'd2: the_mismatch_prior = `CONST_BQ2_MISMATCH_SCORE;
        2'd3: the_mismatch_prior = `CONST_BQ3_MISMATCH_SCORE;
        endcase
    end
    wire signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0] prior = (i_hap_base == i_read_base) ? the_match_prior : the_mismatch_prior;
    wire signed [`DP_PAIRHMM_SCORE_BITWIDTH:0] A_diag_add_M2M = i_A_diag + `CONST_M2M;
    wire signed [`DP_PAIRHMM_SCORE_BITWIDTH:0] INDEL_add_I2M = i_INDEL_diag + `CONST_I2M;
    wire signed [`DP_PAIRHMM_SCORE_BITWIDTH:0] greater_diag = (INDEL_add_I2M > A_diag_add_M2M) ? INDEL_add_I2M : A_diag_add_M2M;
    wire signed [`DP_PAIRHMM_SCORE_BITWIDTH:0] diag_add_prior = greater_diag + prior;
    wire signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0] diag_bounded;
    assign diag_bounded = (diag_add_prior[`DP_PAIRHMM_SCORE_BITWIDTH] & ~diag_add_prior[`DP_PAIRHMM_SCORE_BITWIDTH-1]) ?
                           MOST_NEGATIVE : diag_add_prior[`DP_PAIRHMM_SCORE_BITWIDTH-1:0];
    always@(*) begin
        A_d_n = A_d;
        if (refresh) A_d_n = MOST_NEGATIVE;
        else if (i_en) A_d_n = diag_bounded;

        A_dd_n = A_dd;
        if (refresh) A_dd_n = MOST_NEGATIVE;
        else A_dd_n = A_d;
    end
    wire signed [`DP_PAIRHMM_SCORE_BITWIDTH:0] A_d_add_M2I = A_d + `CONST_M2I;
    wire signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0] A_d_add_M2I_bounded;
    assign A_d_add_M2I_bounded = (A_d_add_M2I[`DP_PAIRHMM_SCORE_BITWIDTH] & ~A_d_add_M2I[`DP_PAIRHMM_SCORE_BITWIDTH-1]) ? 
                                MOST_NEGATIVE : A_d_add_M2I[`DP_PAIRHMM_SCORE_BITWIDTH-1:0];

    // V & Max
    always@(*) begin
        V_dd_n = V_dd;
        if (refresh) V_dd_n = MOST_NEGATIVE;
        else V_dd_n = (I_d > A_d) ? I_d : A_d;

        Max_n = Max;
        if (refresh) Max_n = MOST_NEGATIVE;
        else Max_n = (V_dd > Max) ? V_dd : Max;
    end



    // Sequential citcuit
    always@(posedge clk) begin
        if (!rst_n) begin
            D_d                 <= MOST_NEGATIVE;
            I_d                 <= MOST_NEGATIVE;
            A_d                 <= MOST_NEGATIVE;
            A_dd                <= MOST_NEGATIVE;
            INDEL_dd            <= MOST_NEGATIVE;
            V_dd                <= MOST_NEGATIVE;
            Max                 <= MOST_NEGATIVE;
            output_valid_d      <= 0;
            output_valid_dd     <= 0;
            output_valid_ddd    <= 0;
            hap_base            <= 0;
        end else begin
            D_d                 <= D_d_n;
            I_d                 <= I_d_n;
            A_d                 <= A_d_n;
            A_dd                <= A_dd_n;
            INDEL_dd            <= INDEL_dd_n;
            V_dd                <= V_dd_n;
            Max                 <= Max_n;
            output_valid_d      <= output_valid_d_n;
            output_valid_dd     <= output_valid_dd_n;
            output_valid_ddd    <= output_valid_ddd_n;
            hap_base            <= hap_base_n;
        end
    end

    assign o_INDEL_dd       = INDEL_dd;
    assign o_I_d            = I_d;
    assign o_A_dd           = A_dd;
    assign o_A_d_add_M2I    = A_d_add_M2I_bounded;
    assign o_valid_d        = output_valid_d;
    assign o_valid_dd       = output_valid_dd;
    assign o_valid_ddd      = output_valid_ddd;
    assign o_Max            = Max;
    assign o_hap_base       = hap_base;


endmodule