
module DP_geno_thin_Array(
    input                                               clk,
    input                                               rst_n,
    input refresh,
    output                                              o_ready,
    input                                               i_valid,
    input         [2*`HAP_MAX_LENGTH-1:0]               i_sequence_A,
    input         [2*`READ_MAX_LENGTH-1:0]              i_sequence_B,
    input         [2*`READ_MAX_LENGTH-1:0]              i_sequence_B_qualities,
    input         [$clog2(`HAP_MAX_LENGTH):0]           i_seq_A_length,
    input         [$clog2(`READ_MAX_LENGTH):0]          i_seq_B_length,
    input         [$clog2(`GENO_SRAM_WORD_AMOUNT)-1:0]  i_geno_address_ID,
    input                                               i_ready,
    output                                              o_valid,
    output signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0]      o_alignment_score,
    output        [$clog2(`GENO_SRAM_WORD_AMOUNT)-1:0]  o_geno_address_ID
);
    integer i, j, k, l;
    genvar gv;
    localparam  S_idle                  = 4'd0,
                S_calculate             = 4'd1,
                S_select_highest        = 4'd2,
                S_output_score          = 4'd3;

    localparam MOST_NEGATIVE = {1'b1, {(`DP_PAIRHMM_SCORE_BITWIDTH-1){1'b0}}};
    localparam MOST_POSITIVE = {1'b0, {(`DP_PAIRHMM_SCORE_BITWIDTH-1){1'b1}}};


    ///////////////////////////// main registers ////////////////////////////////
    reg [3:0]                                               state, state_n;

    reg [$clog2(`HAP_MAX_LENGTH+`READ_MAX_LENGTH):0]        end_count, end_count_n;
    reg [2*`HAP_MAX_LENGTH-1:0]                             hap_seq, hap_seq_n;
    reg [2*`READ_MAX_LENGTH-1:0]                            read_seq, read_seq_n;
    reg [2*`READ_MAX_LENGTH-1:0]                            read_base_qualities, read_base_qualities_n;
    reg [$clog2(`HAP_MAX_LENGTH)-1:0]                       hap_length, hap_length_n;
    reg [$clog2(`READ_MAX_LENGTH)-1:0]                      read_length, read_length_n;
    reg [$clog2(`GENO_SRAM_WORD_AMOUNT)-1:0]                geno_address_ID, geno_address_ID_n;
    
    reg [$clog2(`HAP_MAX_LENGTH+`READ_MAX_LENGTH):0]        counter,     counter_n;
    reg [$clog2(`HAP_MAX_LENGTH+`READ_MAX_LENGTH):0]        counter_d,   counter_d_n;
    reg [$clog2(`HAP_MAX_LENGTH+`READ_MAX_LENGTH):0]        counter_dd,  counter_dd_n;
    reg [$clog2(`HAP_MAX_LENGTH+`READ_MAX_LENGTH):0]        counter_ddd, counter_ddd_n;
    reg [8-1:0]                                             shift_counter, shift_counter_n;

    reg first_pe_en, first_pe_en_n;
    
    reg [`READ_MAX_LENGTH*`DP_PAIRHMM_SCORE_BITWIDTH-1:0]   row_max_scores, row_max_scores_n;
    reg signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0]             row_max_score[0:`READ_MAX_LENGTH-1];
    always@(*) begin 
        for (i=0;i<`READ_MAX_LENGTH;i=i+1) row_max_score[i] = row_max_scores[i*`DP_PAIRHMM_SCORE_BITWIDTH+:`DP_PAIRHMM_SCORE_BITWIDTH];
    end

    //----------------------------------------------------------------------------------------
    wire PE_refresh = (refresh | state==S_idle);
    wire signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0]  PE_o_INDEL_dd[0:`READ_MAX_LENGTH-1];
    wire signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0]  PE_o_I_d[0:`READ_MAX_LENGTH-1];
    wire signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0]  PE_o_A_dd[0:`READ_MAX_LENGTH-1];
    wire signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0]  PE_o_A_d_add_M2I[0:`READ_MAX_LENGTH-1];
    wire                                          PE_o_valid_d[0:`READ_MAX_LENGTH-1];
    wire                                          PE_o_valid_dd[0:`READ_MAX_LENGTH-1];
    wire                                          PE_o_valid_ddd[0:`READ_MAX_LENGTH-1];
    wire signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0]  PE_o_Max[0:`READ_MAX_LENGTH-1];
    wire [1:0]                                    PE_o_hap_base[0:`READ_MAX_LENGTH-1];

    

    always@(*) begin
        state_n = state;
        case(state)
            S_idle:             state_n = (i_valid) ? S_calculate : state;
            S_calculate:        state_n = (counter_ddd == end_count) ? S_select_highest : state;
            S_select_highest:   state_n = (|shift_counter) ? state : S_output_score;
            S_output_score:     state_n = (i_ready) ? S_idle : state;
        endcase
    end

    always@(*) begin
        end_count_n = end_count;
        hap_seq_n = hap_seq;
        read_seq_n = read_seq;
        read_base_qualities_n = read_base_qualities;
        hap_length_n = hap_length;
        read_length_n = read_length;
        geno_address_ID_n = geno_address_ID;
        counter_n     = counter;
        counter_d_n   = counter_d;
        counter_dd_n  = counter_dd;
        counter_ddd_n = counter_ddd;
        shift_counter_n = shift_counter;
        first_pe_en_n = first_pe_en;
        row_max_scores_n = row_max_scores;

        if (refresh) begin
            end_count_n = 0;
            hap_seq_n =  {(2*`HAP_MAX_LENGTH){1'b0}};
            read_seq_n = {(2*`READ_MAX_LENGTH){1'b0}};
            read_base_qualities_n = {(2*`READ_MAX_LENGTH){1'b0}};
            hap_length_n = 0;
            read_length_n = 0;
            geno_address_ID_n = 0;
            counter_n = 0;
            counter_d_n   = 0;
            counter_dd_n  = 0;
            counter_ddd_n = 0;
            first_pe_en_n = i_valid;
            row_max_scores_n = {`READ_MAX_LENGTH{MOST_NEGATIVE}};
            shift_counter_n = 0;
            
        end else begin
            case(state)
            S_idle: begin
                end_count_n = i_valid ? i_seq_A_length + i_seq_B_length - 2 : 0;
                hap_seq_n = i_valid ? i_sequence_A : {(2*`HAP_MAX_LENGTH){1'b0}};
                read_seq_n = i_valid ? i_sequence_B : {(2*`READ_MAX_LENGTH){1'b0}};
                read_base_qualities_n = i_valid ? i_sequence_B_qualities : {(2*`READ_MAX_LENGTH){1'b0}};
                hap_length_n = i_valid ? i_seq_A_length : 0;
                read_length_n = i_valid ? i_seq_B_length : 0;
                geno_address_ID_n = i_valid ? i_geno_address_ID : 0;
                counter_n = 0;
                counter_d_n   = 0;
                counter_dd_n  = 0;
                counter_ddd_n = 0;
                first_pe_en_n = i_valid;
                row_max_scores_n = {`READ_MAX_LENGTH{MOST_NEGATIVE}};
                shift_counter_n = i_valid ? `READ_MAX_LENGTH - i_seq_B_length : 0;
            end
            S_calculate: begin
                hap_seq_n = hap_seq << 2;
                counter_n = counter + !(counter == end_count);
                counter_d_n   = counter;
                counter_dd_n  = counter_d;
                counter_ddd_n = counter_dd;
                first_pe_en_n = first_pe_en & ~(counter == hap_length - 1);
                
                for (i=0;i<`READ_MAX_LENGTH;i=i+1) begin
                    row_max_scores_n[i*`DP_PAIRHMM_SCORE_BITWIDTH+:`DP_PAIRHMM_SCORE_BITWIDTH] = (PE_o_valid_ddd[i]) ? PE_o_Max[i] : row_max_score[i];
                end
            end
            S_select_highest: begin
                if (shift_counter[7]) begin
                    shift_counter_n[7] = 0;
                    row_max_scores_n = row_max_scores << (`DP_PAIRHMM_SCORE_BITWIDTH*128);
                end else if (shift_counter[6]) begin
                    shift_counter_n[6] = 0;
                    row_max_scores_n = row_max_scores << (`DP_PAIRHMM_SCORE_BITWIDTH*64);
                end else if (shift_counter[5]) begin
                    shift_counter_n[5] = 0;
                    row_max_scores_n = row_max_scores << (`DP_PAIRHMM_SCORE_BITWIDTH*32);
                end else if (shift_counter[4]) begin
                    shift_counter_n[4] = 0;
                    row_max_scores_n = row_max_scores << (`DP_PAIRHMM_SCORE_BITWIDTH*16);
                end else if (shift_counter[3]) begin
                    shift_counter_n[3] = 0;
                    row_max_scores_n = row_max_scores << (`DP_PAIRHMM_SCORE_BITWIDTH*8);
                end else if (shift_counter[2]) begin
                    shift_counter_n[2] = 0;
                    row_max_scores_n = row_max_scores << (`DP_PAIRHMM_SCORE_BITWIDTH*4);
                end else if (shift_counter[1]) begin
                    shift_counter_n[1] = 0;
                    row_max_scores_n = row_max_scores << (`DP_PAIRHMM_SCORE_BITWIDTH*2);
                end else if (shift_counter[0]) begin
                    shift_counter_n[0] = 0;
                    row_max_scores_n = row_max_scores << (`DP_PAIRHMM_SCORE_BITWIDTH);
                end 
            end
            endcase
        end
    end



    generate
        for (gv=0;gv<`READ_MAX_LENGTH;gv=gv+1) begin: PEs
            if (gv==0) begin
                DP_geno_thin_PE u_DP_geno_thin_PE(
                    .clk                    (clk),
                    .rst_n                  (rst_n),
                    .refresh                (PE_refresh),
                    .i_en                   (first_pe_en),
                    .i_hap_base             (hap_seq[2*`HAP_MAX_LENGTH-1-:2]),
                    .i_read_base            (read_seq[2*`READ_MAX_LENGTH-1-2*gv-:2]),
                    .i_read_base_quality    (read_base_qualities[2*`READ_MAX_LENGTH-1-2*gv-:2]),
                    .i_A_top_add_M2I        (MOST_NEGATIVE),
                    .i_I_top                (MOST_NEGATIVE),
                    .i_A_diag               (MOST_NEGATIVE),
                    .i_INDEL_diag           (MOST_POSITIVE),
                    .o_INDEL_dd             (PE_o_INDEL_dd[gv]),
                    .o_I_d                  (PE_o_I_d[gv]),
                    .o_A_dd                 (PE_o_A_dd[gv]),
                    .o_A_d_add_M2I          (PE_o_A_d_add_M2I[gv]),
                    .o_valid_d              (PE_o_valid_d[gv]),
                    .o_valid_dd             (PE_o_valid_dd[gv]),
                    .o_valid_ddd            (PE_o_valid_ddd[gv]),
                    .o_Max                  (PE_o_Max[gv]),
                    .o_hap_base             (PE_o_hap_base[gv])
                );
            end else begin
                DP_geno_thin_PE u_DP_geno_thin_PE(
                    .clk                    (clk),
                    .rst_n                  (rst_n),
                    .refresh                (PE_refresh),
                    .i_en                   (PE_o_valid_d[gv-1]),
                    .i_hap_base             (PE_o_hap_base[gv-1]),
                    .i_read_base            (read_seq[2*`READ_MAX_LENGTH-1-2*gv-:2]),
                    .i_read_base_quality    (read_base_qualities[2*`READ_MAX_LENGTH-1-2*gv-:2]),
                    .i_A_top_add_M2I        (PE_o_A_d_add_M2I[gv-1]),
                    .i_I_top                (PE_o_I_d[gv-1]),
                    .i_A_diag               (PE_o_A_dd[gv-1]),
                    .i_INDEL_diag           (PE_o_INDEL_dd[gv-1]),
                    .o_INDEL_dd             (PE_o_INDEL_dd[gv]),
                    .o_I_d                  (PE_o_I_d[gv]),
                    .o_A_dd                 (PE_o_A_dd[gv]),
                    .o_A_d_add_M2I          (PE_o_A_d_add_M2I[gv]),
                    .o_valid_d              (PE_o_valid_d[gv]),
                    .o_valid_dd             (PE_o_valid_dd[gv]),
                    .o_valid_ddd            (PE_o_valid_ddd[gv]),
                    .o_Max                  (PE_o_Max[gv]),
                    .o_hap_base             (PE_o_hap_base[gv]) 
                );
            end
        end
    endgenerate



    assign o_ready = (state==S_idle);
    assign o_valid = (state==S_output_score);
    assign o_alignment_score = row_max_scores[`READ_MAX_LENGTH*`DP_PAIRHMM_SCORE_BITWIDTH-1-:`DP_PAIRHMM_SCORE_BITWIDTH];
    assign o_geno_address_ID = geno_address_ID;



    always@(posedge clk) begin
        if (!rst_n) begin
            state               <= S_idle;
            end_count           <= 0;
            hap_seq             <= {(2*`HAP_MAX_LENGTH){1'b0}};
            read_seq            <= {(2*`READ_MAX_LENGTH){1'b0}};
            read_base_qualities <= {(2*`READ_MAX_LENGTH){1'b0}};
            hap_length          <= 0;
            read_length         <= 0;
            geno_address_ID     <= 0;
            counter             <= 0;
            counter_d           <= 0;
            counter_dd          <= 0;
            counter_ddd         <= 0;
            shift_counter       <= 0;
            first_pe_en         <= 0;
            row_max_scores      <= {`READ_MAX_LENGTH{MOST_NEGATIVE}};
        end else begin
            state               <= state_n;
            end_count           <= end_count_n;
            hap_seq             <= hap_seq_n;
            read_seq            <= read_seq_n;
            read_base_qualities <= read_base_qualities_n;
            hap_length          <= hap_length_n;
            read_length         <= read_length_n;
            geno_address_ID     <= geno_address_ID_n;
            counter             <=     counter_n;
            counter_d           <=   counter_d_n;
            counter_dd          <=  counter_dd_n;
            counter_ddd         <= counter_ddd_n;
            shift_counter       <= shift_counter_n;
            first_pe_en         <= first_pe_en_n;
            row_max_scores      <= row_max_scores_n;
        end
    end

endmodule

