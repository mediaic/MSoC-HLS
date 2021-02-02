// ==========================
// = GATK define parameters =
// ==========================

`timescale 1ns/100ps

`define VERSION 101


// ----- Global parameters -----
`define REF_MAX_LENGTH              300
`define HAP_MAX_LENGTH              400
`define READ_MAX_LENGTH             150
`define MAX_HAPLOTYPE_AMOUNT        256
`define MAX_ALLELE_LENGTH           120 // 128



// SRAM 
`define READ_SRAM_BIT_PER_WORD      1024
`define READ_SRAM_WORD_AMOUNT       512
`define HAP_SRAM_BIT_PER_WORD       1034 // 1024 + 10
`define HAP_SRAM_WORD_AMOUNT        1 + `MAX_HAPLOTYPE_AMOUNT
`define HAP_TEMP_SRAM_BIT_PER_WORD  `HAP_MAX_LENGTH*2+10+4    //4b transitions + 10-b locations + haplotypelength = 814
`define HAP_TEMP_SRAM_WORD_AMOUNT   1 + `MAX_HAPLOTYPE_AMOUNT

// Sorter
`define KMER_LENGTH_MAX             80

// DP for Variant Calling
`define DP_SW_SCORE_BITWIDTH        14
`define DP_VAR_MATCH_BIT_DECLARE    6
`define CONST_MATCH_SCORE           20
`define CONST_MISMATCH_SCORE        -15
`define DP_VAR_OPEN_BIT_DELCARE     6
`define CONST_GAP_OPEN              -26
`define DP_VAR_EXT_BIT_DELCARE      2
`define CONST_GAP_EXTEND            -1


// DP for Genotyping
`define DP_PAIRHMM_SCORE_BITWIDTH   16
`define GENO_ADDRESS_BITWIDTH       7
`define DP_ENGINE_AMOUNT            2
`define CONST_M2M                   0
`define CONST_M2I                   -4096
`define CONST_I2I                   -1024
`define CONST_I2M                   -47

`define CONST_MATCH_BITWIDTH        9
`define CONST_BQ0_MATCH_SCORE       -227
`define CONST_BQ1_MATCH_SCORE       -18
`define CONST_BQ2_MATCH_SCORE       -2
`define CONST_BQ3_MATCH_SCORE       0

`define CONST_MISMATCH_BITWIDTH     16
`define CONST_BQ0_MISMATCH_SCORE    -896
`define CONST_BQ1_MISMATCH_SCORE    -1920
`define CONST_BQ2_MISMATCH_SCORE    -2944
`define CONST_BQ3_MISMATCH_SCORE    -3968



// Genotype calling
`define SKIP_READ_BASE_MARGIN       2

// Variant data and SRAM data parameters
`define VAR_BEGIN                   $clog2(`REF_MAX_LENGTH) // 9 bits
`define VAR_TYPE                    2
`define VAR_REF_ALT                 2*(`MAX_ALLELE_LENGTH+1)
`define VAR_LENGTH                  $clog2(`MAX_ALLELE_LENGTH) + 1 // = 7 + 1 = 8
`define VAR_PACK_BIT_WIDTH          `VAR_BEGIN + `VAR_TYPE + `VAR_REF_ALT + `VAR_LENGTH // 9 + 2 + 242 + 8 = 261
`define VAR_ID                      3
`define VAR_SRAM_BIT_PER_WORD       `VAR_BEGIN + `VAR_TYPE + `VAR_REF_ALT + `VAR_LENGTH + `VAR_ID // 9 + 2 + 242 + 8 + 3 = 264
`define VAR_SRAM_WORD_AMOUNT        8

`define GENO_SRAM_BIT_PER_WORD      `DP_PAIRHMM_SCORE_BITWIDTH + 1
`define GENO_SRAM_WORD_AMOUNT       1 + `MAX_HAPLOTYPE_AMOUNT

`define DIR_SRAM_BIT_PER_WORD       `HAP_MAX_LENGTH*2
`define DIR_SRAM_WORD_AMOUNT        `REF_MAX_LENGTH + `HAP_MAX_LENGTH
`define DIR_SRAM_ADDR_WIDTH         10

// region parameters
`define MAX_VAR_AMOUNT              8
`define OVERLAP_BASE_IN_READS       16
`define PADDING_DATA_DIWTH          9

// Xilinx Latency
`define FP_ADDSUB_LATENCY           11
`define FP_MULT_LATENCY             8
`define FP_EXP_LATENCY				29
`define FP_LOG_LATENCY              28
`define FP_DIV_LATENCY				28
`define FP_EXP10_LATENCY            `FP_MULT_LATENCY + `FP_EXP_LATENCY
`define FP_LOG10_LATENCY            `FP_LOG_LATENCY + `FP_DIV_LATENCY
`define SRAM_LATENCY                2
`define LN_10             			32'b0100_0000_0001_0011_0101_1101_1000_1110

// Events & PL Calculation
`define ALTERNATIVE_AMOUNT          8
`define EVENT_AMOUNT                `ALTERNATIVE_AMOUNT
`define MAX_GT_AMOUNT               45
`define PL_SRAM_BIT_PER_WORD        32
`define PL_SRAM_WORD_AMOUNT         `EVENT_AMOUNT*`MAX_GT_AMOUNT

`define MIN_KMER_LENGTH             16
`define MAX_KMER_LENGTH             `MIN_KMER_LENGTH + 4*19 // = 92

`define MAX_KMER_AMOUNT_PER_SEQ     150 // = 300 / 2 = 8 bits

// Table A: seq kmer SRAM parameters
`define TABLE_A_SRAM_BIT_PER_WORD   2 * `MAX_KMER_LENGTH * 16 // = 184 * 16 
`define TABLE_A_SRAM_WORD_AMOUNT    32 // = (512 / 2) / 16


// Table B: duplicate kmer SRAM parameters
`define TABLE_B_SRAM_BIT_PER_WORD   (2 * `MAX_KMER_LENGTH + 8) * 16 // = 192 * 16
`define TABLE_B_SRAM_WORD_AMOUNT    16 // = 256 / 16

// Table C: kmer table SRAM parameters
`define TABLE_C_SRAM_BIT_PER_WORD   232 * 16 // = (8 + 184 + 40) * 16
`define TABLE_C_SRAM_WORD_AMOUNT    128 // = 2048 / 16





module GATK_TOP (
input 				clk,
input 				rst_n,

output    [63:0]	axi_m_araddr,
output    [7:0] 	axi_m_arlen,
input   			axi_m_arready,
output   			axi_m_arvalid,
	
output    	[63:0]	axi_m_awaddr,
output    	[7:0] 	axi_m_awlen,
input    			axi_m_awready,
output    			axi_m_awvalid,
	
output 				axi_m_bready,
input 				axi_m_bvalid,
	
input [511:0] 		axi_m_rdata,
output 				axi_m_rready,
input 				axi_m_rvalid,

output    	[511:0] axi_m_wdata,
output    			axi_m_wlast,
input    			axi_m_wready,
output    			axi_m_wvalid,
output    	[63:0]	axi_m_wstrb,

input [31:0]		axil_araddr,
output 				axil_arready,
input				axil_arvalid,
	
input [31:0]		axil_awaddr,
output 				axil_awready,
input				axil_awvalid, 
input				axil_bready,
output 				axil_bvalid,

output 	 	[31:0]	axil_rdata,
input				axil_rready,
output 				axil_rvalid,
	
input [31:0]		axil_wdata,
output 				axil_wready,
input				axil_wvalid

);

wire [8:0] 								CONST_read_length;
wire [9:0] 								CONST_active_region_length;
wire [63:0] 							CONST_ref_addr;
wire [63:0]								CONST_read_addr;
wire [63:0]								CONST_variant_addr;
wire [63:0]        						CONST_var_event_amount_addr;
wire [63:0]        						CONST_var_info_addr;
wire [63:0]        						CONST_event_info_addr;
wire [`PADDING_DATA_DIWTH-1:0]			CONST_padding_base;
wire [31:0]								CONST_total_read_num;
wire [`DP_PAIRHMM_SCORE_BITWIDTH-1:0] 	CONST_max_likelihood_difference;
wire [`DP_PAIRHMM_SCORE_BITWIDTH-1:0] 	CONST_filter_threshold;






wire				fetch_activate;
wire				hap_activate;
wire				var_activate;
wire				geno_activate;

wire [7:0]			state_fetch;
wire [7:0]			state_hap;
wire [3:0]			state_var;
wire [2:0]			state_geno;

wire [3:0] state_geno_tx;
wire [2:0] state_geno_rx;
wire [4:0] state_geno_find_max;
wire [4:0] state_geno_PL_CTRL;
wire [3:0] state_geno_o2dram;

wire				out_valid_fecth;
wire 				out_valid_hap;
wire 				out_valid_var;
wire 				out_valid_geno;

reg manual_rst_n;

wire [`READ_SRAM_BIT_PER_WORD-1:0] D_FETCH_READ_SRAM;
wire [$clog2(`READ_SRAM_WORD_AMOUNT)-1:0]	A_FETCH_READ_SRAM;
wire W_FETCH_READ_SRAM;

reg [`READ_SRAM_BIT_PER_WORD-1:0] Q_hap_READ_SRAM, Q_var_READ_SRAM, Q_geno_READ_SRAM;
wire [$clog2(`READ_SRAM_WORD_AMOUNT)-1:0] A_hap_READ_SRAM, A_var_READ_SRAM, A_geno_READ_SRAM;

wire [1:0] sram_bank_sel;

wire [$clog2(`READ_SRAM_WORD_AMOUNT):0] read_amount_in_region_source;
wire fetch_ready;

wire [31:0] active_region_start_source;
wire [31:0] active_region_end_source;

wire [31:0] read_offset_out, read_offset_in;

wire [`READ_SRAM_BIT_PER_WORD-1:0] Q_READ_0, Q_READ_1, Q_READ_2, Q_READ_3;
reg [`READ_SRAM_BIT_PER_WORD-1:0] D_READ_0, D_READ_1, D_READ_2, D_READ_3;
reg [$clog2(`READ_SRAM_WORD_AMOUNT)-1:0] A_READ_0, A_READ_1, A_READ_2, A_READ_3;
reg W_READ_0, W_READ_1, W_READ_2, W_READ_3;

wire [`HAP_SRAM_BIT_PER_WORD-1:0] Q_HAP_0, Q_HAP_1, Q_HAP_2, Q_HAP_3;
reg [`HAP_SRAM_BIT_PER_WORD-1:0] D_HAP_0, D_HAP_1, D_HAP_2, D_HAP_3;
reg [$clog2(`HAP_SRAM_WORD_AMOUNT)-1:0] A_HAP_0, A_HAP_1, A_HAP_2, A_HAP_3;
reg W_HAP_0, W_HAP_1, W_HAP_2, W_HAP_3;

wire [`VAR_SRAM_BIT_PER_WORD-1:0] Q_VAR_0, Q_VAR_1;
reg [`VAR_SRAM_BIT_PER_WORD-1:0] D_VAR_0, D_VAR_1;
reg [$clog2(`VAR_SRAM_WORD_AMOUNT)-1:0] A_VAR_0, A_VAR_1;
reg W_VAR_0, W_VAR_1;

reg [`HAP_SRAM_BIT_PER_WORD-1:0] Q_var_HAPLOTYPE_SRAM, Q_geno_HAPLOTYPE_SRAM;
wire [`HAP_SRAM_BIT_PER_WORD-1:0] D_hap_HAPLOTYPE_SRAM, D_var_HAPLOTYPE_SRAM, D_geno_HAPLOTYPE_SRAM;
wire [$clog2(`HAP_SRAM_WORD_AMOUNT)-1:0] A_hap_HAPLOTYPE_SRAM, A_var_HAPLOTYPE_SRAM, A_geno_HAPLOTYPE_SRAM;
wire W_hap_HAPLOTYPE_SRAM, W_var_HAPLOTYPE_SRAM, W_geno_HAPLOTYPE_SRAM;

reg  [`VAR_SRAM_BIT_PER_WORD-1:0] Q_var_VAR_SRAM;
wire [`VAR_SRAM_BIT_PER_WORD-1:0] D_var_VAR_SRAM;
wire [$clog2(`VAR_SRAM_WORD_AMOUNT)-1:0] A_var_VAR_SRAM, A_geno_VAR_SRAM;
wire W_var_VAR_SRAM;

reg [`VAR_SRAM_BIT_PER_WORD-1:0] Q_geno_VAR_SRAM;


reg  [$clog2(`READ_SRAM_WORD_AMOUNT):0] read_amount_in_region_fetch, read_amount_in_region_hap, read_amount_in_region_var, read_amount_in_region_geno;
wire [$clog2(`MAX_HAPLOTYPE_AMOUNT):0]	haplotype_amount_in_region_source;
wire [`MAX_HAPLOTYPE_AMOUNT-1:0]        haplotype_amount_in_region_1hot_source;
reg  [$clog2(`MAX_HAPLOTYPE_AMOUNT):0] 	haplotype_amount_in_region_hap, haplotype_amount_in_region_var, haplotype_amount_in_region_geno;
reg  [`MAX_HAPLOTYPE_AMOUNT-1:0]        haplotype_amount_in_region_1hot_hap, haplotype_amount_in_region_1hot_var, haplotype_amount_in_region_1hot_geno;
reg  [31:0] 							active_region_start_fetch, active_region_start_hap, active_region_start_var, active_region_start_geno;
reg  [31:0] 							active_region_end_fetch, active_region_end_hap, active_region_end_var, active_region_end_geno;


// variant calling output reg
	wire [3:0] variant_amount_in_region_source;
	wire  [`MAX_HAPLOTYPE_AMOUNT-1:0] unsorted_var_hap1hot_0_source;
	wire  [`MAX_HAPLOTYPE_AMOUNT-1:0] unsorted_var_hap1hot_1_source;
	wire  [`MAX_HAPLOTYPE_AMOUNT-1:0] unsorted_var_hap1hot_2_source;
	wire  [`MAX_HAPLOTYPE_AMOUNT-1:0] unsorted_var_hap1hot_3_source;
	wire  [`MAX_HAPLOTYPE_AMOUNT-1:0] unsorted_var_hap1hot_4_source;
	wire  [`MAX_HAPLOTYPE_AMOUNT-1:0] unsorted_var_hap1hot_5_source;
	wire  [`MAX_HAPLOTYPE_AMOUNT-1:0] unsorted_var_hap1hot_6_source;
	wire  [`MAX_HAPLOTYPE_AMOUNT-1:0] unsorted_var_hap1hot_7_source;
	wire  [$clog2(`MAX_VAR_AMOUNT):0] event_amount_in_region_source;
	wire  [`VAR_BEGIN-1:0]            event_begin_0_source;
	wire  [`VAR_BEGIN-1:0]            event_begin_1_source;
	wire  [`VAR_BEGIN-1:0]            event_begin_2_source;
	wire  [`VAR_BEGIN-1:0]            event_begin_3_source;
	wire  [`VAR_BEGIN-1:0]            event_begin_4_source;
	wire  [`VAR_BEGIN-1:0]            event_begin_5_source;
	wire  [`VAR_BEGIN-1:0]            event_begin_6_source;
	wire  [`VAR_BEGIN-1:0]            event_begin_7_source;
	wire  [2*`MAX_VAR_AMOUNT-1:0]     event_var2hot_0_source;
	wire  [2*`MAX_VAR_AMOUNT-1:0]     event_var2hot_1_source;
	wire  [2*`MAX_VAR_AMOUNT-1:0]     event_var2hot_2_source;
	wire  [2*`MAX_VAR_AMOUNT-1:0]     event_var2hot_3_source;
	wire  [2*`MAX_VAR_AMOUNT-1:0]     event_var2hot_4_source;
	wire  [2*`MAX_VAR_AMOUNT-1:0]     event_var2hot_5_source;
	wire  [2*`MAX_VAR_AMOUNT-1:0]     event_var2hot_6_source;
	wire  [2*`MAX_VAR_AMOUNT-1:0]     event_var2hot_7_source;
	wire [9:0] o_var_location_min_source;
	wire [9:0] o_var_location_max_source;

	reg  [3:0] variant_amount_in_region_var, variant_amount_in_region_geno;
	reg  [9:0] var_location_min_var, var_location_max_var;
	reg  [9:0] var_location_min_geno, var_location_max_geno;
	reg  [`MAX_HAPLOTYPE_AMOUNT-1:0] unsorted_var_hap1hot_0_var, unsorted_var_hap1hot_0_geno;
	reg  [`MAX_HAPLOTYPE_AMOUNT-1:0] unsorted_var_hap1hot_1_var, unsorted_var_hap1hot_1_geno;
	reg  [`MAX_HAPLOTYPE_AMOUNT-1:0] unsorted_var_hap1hot_2_var, unsorted_var_hap1hot_2_geno;
	reg  [`MAX_HAPLOTYPE_AMOUNT-1:0] unsorted_var_hap1hot_3_var, unsorted_var_hap1hot_3_geno;
	reg  [`MAX_HAPLOTYPE_AMOUNT-1:0] unsorted_var_hap1hot_4_var, unsorted_var_hap1hot_4_geno;
	reg  [`MAX_HAPLOTYPE_AMOUNT-1:0] unsorted_var_hap1hot_5_var, unsorted_var_hap1hot_5_geno;
	reg  [`MAX_HAPLOTYPE_AMOUNT-1:0] unsorted_var_hap1hot_6_var, unsorted_var_hap1hot_6_geno;
	reg  [`MAX_HAPLOTYPE_AMOUNT-1:0] unsorted_var_hap1hot_7_var, unsorted_var_hap1hot_7_geno;
	reg  [$clog2(`MAX_VAR_AMOUNT):0] event_amount_in_region_var, event_amount_in_region_geno;
	reg  [`VAR_BEGIN-1:0]            event_begin_0_var, event_begin_0_geno;
	reg  [`VAR_BEGIN-1:0]            event_begin_1_var, event_begin_1_geno;
	reg  [`VAR_BEGIN-1:0]            event_begin_2_var, event_begin_2_geno;
	reg  [`VAR_BEGIN-1:0]            event_begin_3_var, event_begin_3_geno;
	reg  [`VAR_BEGIN-1:0]            event_begin_4_var, event_begin_4_geno;
	reg  [`VAR_BEGIN-1:0]            event_begin_5_var, event_begin_5_geno;
	reg  [`VAR_BEGIN-1:0]            event_begin_6_var, event_begin_6_geno;
	reg  [`VAR_BEGIN-1:0]            event_begin_7_var, event_begin_7_geno;
	reg  [2*`MAX_VAR_AMOUNT-1:0]     event_var2hot_0_var, event_var2hot_0_geno;
	reg  [2*`MAX_VAR_AMOUNT-1:0]     event_var2hot_1_var, event_var2hot_1_geno;
	reg  [2*`MAX_VAR_AMOUNT-1:0]     event_var2hot_2_var, event_var2hot_2_geno;
	reg  [2*`MAX_VAR_AMOUNT-1:0]     event_var2hot_3_var, event_var2hot_3_geno;
	reg  [2*`MAX_VAR_AMOUNT-1:0]     event_var2hot_4_var, event_var2hot_4_geno;
	reg  [2*`MAX_VAR_AMOUNT-1:0]     event_var2hot_5_var, event_var2hot_5_geno;
	reg  [2*`MAX_VAR_AMOUNT-1:0]     event_var2hot_6_var, event_var2hot_6_geno;
	reg  [2*`MAX_VAR_AMOUNT-1:0]     event_var2hot_7_var, event_var2hot_7_geno;

	wire [31:0]       			FP_addsub_dataa;
	wire [31:0]      			FP_addsub_datab;   
	wire              			FP_addsub_op;
	wire [31:0]            		FP_addsub_result;

	wire [31:0]       			FP_mult_dataa;
	wire [31:0]       			FP_mult_datab;
	wire [31:0]            		FP_mult_result;

	wire [31:0]       			FP_exp_data_ref, FP_exp_data_alt;
	wire [31:0]            		FP_exp_result_ref, FP_exp_result_alt;

	wire [31:0]       			FP_log_data;
	wire [31:0]            		FP_log_result;


	wire 						read_explode;

	wire [31:0]           o_var_event_amount_write_amount;
    wire [31:0]           o_var_info_write_amount;
    wire [31:0]           o_event_info_write_amount;
    






always@(*) begin
	D_READ_0 = 0;
	A_READ_0 = 0;
	W_READ_0 = 0;
	
	D_READ_1 = 0;
	A_READ_1 = 0;
	W_READ_1 = 0;
	
	D_READ_2 = 0;
	A_READ_2 = 0;
	W_READ_2 = 0;	

	D_READ_3 = 0;
	A_READ_3 = 0;
	W_READ_3 = 0;
	
	//Haplotype SRAM
	D_HAP_0 = 0;
	A_HAP_0 = 0;
	W_HAP_0 = 0;

	D_HAP_1 = 0;
	A_HAP_1 = 0;
	W_HAP_1 = 0;

	D_HAP_2 = 0;
	A_HAP_2 = 0;
	W_HAP_2 = 0;
	
	D_HAP_3 = 0;
	A_HAP_3 = 0;
	W_HAP_3 = 0;	
	
	//VARIANT SRAM
	D_VAR_0 = 0;
	A_VAR_0 = 0;
	W_VAR_0 = 0;
	
	D_VAR_1 = 0;
	A_VAR_1 = 0;
	W_VAR_1 = 0;
	
	case(sram_bank_sel)
	0: begin
		D_READ_0 = D_FETCH_READ_SRAM;
		A_READ_0 = A_FETCH_READ_SRAM;
		W_READ_0 = W_FETCH_READ_SRAM;
		
		D_READ_1 = 0;
		A_READ_1 = A_geno_READ_SRAM;
		W_READ_1 = 0;
		
		D_READ_2 = 0;
		A_READ_2 = A_var_READ_SRAM;
		W_READ_2 = 0;	
	
		D_READ_3 = 0;
		A_READ_3 = A_hap_READ_SRAM;
		W_READ_3 = 0;
		
		//Haplotype SRAM
		D_HAP_0 = 0;
		A_HAP_0 = 0;
		W_HAP_0 = 0;
	
		D_HAP_1 = 0;
		A_HAP_1 = A_geno_HAPLOTYPE_SRAM;
		W_HAP_1 = 0;
	
		D_HAP_2 = 0;
		A_HAP_2 = A_var_HAPLOTYPE_SRAM;
		W_HAP_2 = 0;
		
		D_HAP_3 = D_hap_HAPLOTYPE_SRAM;
		A_HAP_3 = A_hap_HAPLOTYPE_SRAM;
		W_HAP_3 = W_hap_HAPLOTYPE_SRAM;
		
		//VARIANT SRAM
		D_VAR_0 = D_var_VAR_SRAM;
		A_VAR_0 = A_var_VAR_SRAM;
		W_VAR_0 = W_var_VAR_SRAM;

		D_VAR_1 = 0;
		A_VAR_1 = A_geno_VAR_SRAM;
		W_VAR_1 = 0;		
		
	end
	1: begin
		D_READ_0 = 0;
		A_READ_0 = A_hap_READ_SRAM;
		W_READ_0 = 0;
		
		D_READ_1 = D_FETCH_READ_SRAM;
		A_READ_1 = A_FETCH_READ_SRAM;
		W_READ_1 = W_FETCH_READ_SRAM;
		
		D_READ_2 = 0;
		A_READ_2 = A_geno_READ_SRAM;
		W_READ_2 = 0;	
	
		D_READ_3 = 0;
		A_READ_3 = A_var_READ_SRAM;
		W_READ_3 = 0;

		//Haplotype SRAM
		D_HAP_0 = D_hap_HAPLOTYPE_SRAM;
		A_HAP_0 = A_hap_HAPLOTYPE_SRAM;
		W_HAP_0 = W_hap_HAPLOTYPE_SRAM;
	
		D_HAP_1 = 0;
		A_HAP_1 = 0;
		W_HAP_1 = 0;
	
		D_HAP_2 = 0;
		A_HAP_2 = A_geno_HAPLOTYPE_SRAM;
		W_HAP_2 = 0;
		
		D_HAP_3 = 0;
		A_HAP_3 = A_var_HAPLOTYPE_SRAM;
		W_HAP_3 = 0;			
		
		//VARIANT SRAM
		D_VAR_0 = 0;
		A_VAR_0 = A_geno_VAR_SRAM;
		W_VAR_0 = 0;

		D_VAR_1 = D_var_VAR_SRAM;
		A_VAR_1 = A_var_VAR_SRAM;
		W_VAR_1 = W_var_VAR_SRAM;		
		
	end
	2: begin
		D_READ_0 = 0;
		A_READ_0 = A_var_READ_SRAM;
		W_READ_0 = 0;
		
		D_READ_1 = 0;
		A_READ_1 = A_hap_READ_SRAM;
		W_READ_1 = 0;
		
		D_READ_2 = D_FETCH_READ_SRAM;
		A_READ_2 = A_FETCH_READ_SRAM;
		W_READ_2 = W_FETCH_READ_SRAM;	
	
		D_READ_3 = 0;
		A_READ_3 = A_geno_READ_SRAM;
		W_READ_3 = 0;

		//Haplotype SRAM
		D_HAP_0 = 0;
		A_HAP_0 = A_var_HAPLOTYPE_SRAM;
		W_HAP_0 = 0;
	
		D_HAP_1 = D_hap_HAPLOTYPE_SRAM;
		A_HAP_1 = A_hap_HAPLOTYPE_SRAM;
		W_HAP_1 = W_hap_HAPLOTYPE_SRAM;
	
		D_HAP_2 = 0;
		A_HAP_2 = 0;
		W_HAP_2 = 0;
		
		D_HAP_3 = 0;
		A_HAP_3 = A_geno_HAPLOTYPE_SRAM;
		W_HAP_3 = 0;	
		
		//VARIANT SRAM
		D_VAR_0 = D_var_VAR_SRAM;
		A_VAR_0 = A_var_VAR_SRAM;
		W_VAR_0 = W_var_VAR_SRAM;

		D_VAR_1 = 0;
		A_VAR_1 = A_geno_VAR_SRAM;
		W_VAR_1 = 0;		
		
		
	end
	3: begin
		D_READ_0 = 0;
		A_READ_0 = A_geno_READ_SRAM;
		W_READ_0 = 0;
		
		D_READ_1 = 0;
		A_READ_1 = A_var_READ_SRAM;
		W_READ_1 = 0;
		
		D_READ_2 = 0;
		A_READ_2 = A_hap_READ_SRAM;
		W_READ_2 = 0;	
	
		D_READ_3 = D_FETCH_READ_SRAM;
		A_READ_3 = A_FETCH_READ_SRAM;
		W_READ_3 = W_FETCH_READ_SRAM;

		//Haplotype SRAM
		D_HAP_0 = 0;
		A_HAP_0 = A_geno_HAPLOTYPE_SRAM;
		W_HAP_0 = 0;
	
		D_HAP_1 = 0;
		A_HAP_1 = A_var_HAPLOTYPE_SRAM;
		W_HAP_1 = 0;
	
		D_HAP_2 = D_hap_HAPLOTYPE_SRAM;
		A_HAP_2 = A_hap_HAPLOTYPE_SRAM;
		W_HAP_2 = W_hap_HAPLOTYPE_SRAM;
		
		D_HAP_3 = 0;
		A_HAP_3 = 0;
		W_HAP_3 = 0;	

		//VARIANT SRAM
		D_VAR_0 = 0;
		A_VAR_0 = A_geno_VAR_SRAM;
		W_VAR_0 = 0;

		D_VAR_1 = D_var_VAR_SRAM;
		A_VAR_1 = A_var_VAR_SRAM;
		W_VAR_1 = W_var_VAR_SRAM;
		
	end
	endcase
	
end

always@(*) begin
	Q_hap_READ_SRAM = 0;
	
	Q_var_READ_SRAM = 0;
	Q_var_HAPLOTYPE_SRAM = 0;
	Q_var_VAR_SRAM = 0;
	
	Q_geno_READ_SRAM = 0;
	Q_geno_HAPLOTYPE_SRAM = 0;
	Q_geno_VAR_SRAM = 0;
	
	
	case(sram_bank_sel)
	0: begin
		Q_hap_READ_SRAM = Q_READ_3;
		
		Q_var_READ_SRAM = Q_READ_2;
		Q_var_HAPLOTYPE_SRAM = Q_HAP_2;
		Q_var_VAR_SRAM = Q_VAR_0;
		
		Q_geno_READ_SRAM = Q_READ_1;
		Q_geno_HAPLOTYPE_SRAM = Q_HAP_1;
		Q_geno_VAR_SRAM = Q_VAR_1;
	end
	1: begin
		Q_hap_READ_SRAM = Q_READ_0;
		
		Q_var_READ_SRAM = Q_READ_3;
		Q_var_HAPLOTYPE_SRAM = Q_HAP_3;
		Q_var_VAR_SRAM = Q_VAR_1;
		
		Q_geno_READ_SRAM = Q_READ_2;
		Q_geno_HAPLOTYPE_SRAM = Q_HAP_2;
		Q_geno_VAR_SRAM = Q_VAR_0;
	end
	2: begin
		Q_hap_READ_SRAM = Q_READ_1;
		
		Q_var_READ_SRAM = Q_READ_0;
		Q_var_HAPLOTYPE_SRAM = Q_HAP_0;
		Q_var_VAR_SRAM = Q_VAR_0;
		
		Q_geno_READ_SRAM = Q_READ_3;
		Q_geno_HAPLOTYPE_SRAM = Q_HAP_3;
		Q_geno_VAR_SRAM = Q_VAR_1;
	end
	3: begin
		Q_hap_READ_SRAM = Q_READ_2;
		
		Q_var_READ_SRAM = Q_READ_1;
		Q_var_HAPLOTYPE_SRAM = Q_HAP_1;
		Q_var_VAR_SRAM = Q_VAR_1;
		
		Q_geno_READ_SRAM = Q_READ_0;
		Q_geno_HAPLOTYPE_SRAM = Q_HAP_0;
		Q_geno_VAR_SRAM = Q_VAR_0;
	end
	endcase
end




always@(posedge clk) begin
	if(!rst_n) begin
		read_amount_in_region_fetch 		<= 0;
		read_amount_in_region_hap			<= 0;
		read_amount_in_region_var			<= 0;
		read_amount_in_region_geno			<= 0;
			
		haplotype_amount_in_region_hap		<= 0;
		haplotype_amount_in_region_var		<= 0;
		haplotype_amount_in_region_geno		<= 0;

		haplotype_amount_in_region_1hot_hap		<= 256'd0;
		haplotype_amount_in_region_1hot_var		<= 256'd0;
		haplotype_amount_in_region_1hot_geno	<= 256'd0;
		
		active_region_start_fetch			<= 0;
		active_region_start_hap				<= 0;
		active_region_start_var				<= 0;
		active_region_start_geno			<= 0;
			
		active_region_end_fetch				<= 0;
		active_region_end_hap				<= 0;
		active_region_end_var				<= 0;
		active_region_end_geno				<= 0;
		
		variant_amount_in_region_var		<= 0;
		variant_amount_in_region_geno		<= 0;
		
		
		unsorted_var_hap1hot_0_var	<= 0;
		unsorted_var_hap1hot_1_var	<= 0;
		unsorted_var_hap1hot_2_var	<= 0;
		unsorted_var_hap1hot_3_var	<= 0;
		unsorted_var_hap1hot_4_var	<= 0;
		unsorted_var_hap1hot_5_var	<= 0;
		unsorted_var_hap1hot_6_var	<= 0;
		unsorted_var_hap1hot_7_var	<= 0;
		unsorted_var_hap1hot_0_geno	<= 0;
		unsorted_var_hap1hot_1_geno	<= 0;
		unsorted_var_hap1hot_2_geno	<= 0;
		unsorted_var_hap1hot_3_geno	<= 0;
		unsorted_var_hap1hot_4_geno	<= 0;
		unsorted_var_hap1hot_5_geno	<= 0;
		unsorted_var_hap1hot_6_geno	<= 0;
		unsorted_var_hap1hot_7_geno	<= 0;
		event_amount_in_region_var	<= 0;
		event_amount_in_region_geno	<= 0;
		event_begin_0_var	<= 0;
		event_begin_1_var	<= 0;
		event_begin_2_var	<= 0;
		event_begin_3_var	<= 0;
		event_begin_4_var	<= 0;
		event_begin_5_var	<= 0;
		event_begin_6_var	<= 0;
		event_begin_7_var	<= 0;
		event_begin_0_geno	<= 0;
		event_begin_1_geno	<= 0;
		event_begin_2_geno	<= 0;
		event_begin_3_geno	<= 0;
		event_begin_4_geno	<= 0;
		event_begin_5_geno	<= 0;
		event_begin_6_geno	<= 0;
		event_begin_7_geno	<= 0;
		event_var2hot_0_var	<= 0;
		event_var2hot_1_var	<= 0;
		event_var2hot_2_var	<= 0;
		event_var2hot_3_var	<= 0;
		event_var2hot_4_var	<= 0;
		event_var2hot_5_var	<= 0;
		event_var2hot_6_var	<= 0;
		event_var2hot_7_var	<= 0;
		event_var2hot_0_geno	<= 0;
		event_var2hot_1_geno	<= 0;
		event_var2hot_2_geno	<= 0;
		event_var2hot_3_geno	<= 0;
		event_var2hot_4_geno	<= 0;
		event_var2hot_5_geno	<= 0;
		event_var2hot_6_geno	<= 0;
		event_var2hot_7_geno	<= 0;
		
		var_location_min_var				<= 0;
		var_location_max_var				<= 0;
		
		var_location_min_geno				<= 0;
		var_location_max_geno				<= 0;
		
	end
	else if(!manual_rst_n) begin
		read_amount_in_region_fetch 		<= 0;
		read_amount_in_region_hap			<= 0;
		read_amount_in_region_var			<= 0;
		read_amount_in_region_geno			<= 0;
	
		haplotype_amount_in_region_hap		<= 0;
		haplotype_amount_in_region_var		<= 0;
		haplotype_amount_in_region_geno		<= 0;

		haplotype_amount_in_region_1hot_hap		<= 256'd0;
		haplotype_amount_in_region_1hot_var		<= 256'd0;
		haplotype_amount_in_region_1hot_geno	<= 256'd0;
	
		active_region_start_fetch			<= 0;
		active_region_start_hap				<= 0;
		active_region_start_var				<= 0;
		active_region_start_geno			<= 0;
			
		active_region_end_fetch				<= 0;
		active_region_end_hap				<= 0;
		active_region_end_var				<= 0;
		active_region_end_geno				<= 0;

		variant_amount_in_region_var		<= 0;
		variant_amount_in_region_geno		<= 0;		
		
		unsorted_var_hap1hot_0_var	<= 0;
		unsorted_var_hap1hot_1_var	<= 0;
		unsorted_var_hap1hot_2_var	<= 0;
		unsorted_var_hap1hot_3_var	<= 0;
		unsorted_var_hap1hot_4_var	<= 0;
		unsorted_var_hap1hot_5_var	<= 0;
		unsorted_var_hap1hot_6_var	<= 0;
		unsorted_var_hap1hot_7_var	<= 0;
		unsorted_var_hap1hot_0_geno	<= 0;
		unsorted_var_hap1hot_1_geno	<= 0;
		unsorted_var_hap1hot_2_geno	<= 0;
		unsorted_var_hap1hot_3_geno	<= 0;
		unsorted_var_hap1hot_4_geno	<= 0;
		unsorted_var_hap1hot_5_geno	<= 0;
		unsorted_var_hap1hot_6_geno	<= 0;
		unsorted_var_hap1hot_7_geno	<= 0;
		event_amount_in_region_var	<= 0;
		event_amount_in_region_geno	<= 0;
		event_begin_0_var	<= 0;
		event_begin_1_var	<= 0;
		event_begin_2_var	<= 0;
		event_begin_3_var	<= 0;
		event_begin_4_var	<= 0;
		event_begin_5_var	<= 0;
		event_begin_6_var	<= 0;
		event_begin_7_var	<= 0;
		event_begin_0_geno	<= 0;
		event_begin_1_geno	<= 0;
		event_begin_2_geno	<= 0;
		event_begin_3_geno	<= 0;
		event_begin_4_geno	<= 0;
		event_begin_5_geno	<= 0;
		event_begin_6_geno	<= 0;
		event_begin_7_geno	<= 0;
		event_var2hot_0_var	<= 0;
		event_var2hot_1_var	<= 0;
		event_var2hot_2_var	<= 0;
		event_var2hot_3_var	<= 0;
		event_var2hot_4_var	<= 0;
		event_var2hot_5_var	<= 0;
		event_var2hot_6_var	<= 0;
		event_var2hot_7_var	<= 0;
		event_var2hot_0_geno	<= 0;
		event_var2hot_1_geno	<= 0;
		event_var2hot_2_geno	<= 0;
		event_var2hot_3_geno	<= 0;
		event_var2hot_4_geno	<= 0;
		event_var2hot_5_geno	<= 0;
		event_var2hot_6_geno	<= 0;
		event_var2hot_7_geno	<= 0;
		
		var_location_min_var				<= 0;
		var_location_max_var				<= 0;
		
		var_location_min_geno				<= 0;
		var_location_max_geno				<= 0;
	end
	else begin
		read_amount_in_region_fetch 		<= out_valid_fecth ? read_amount_in_region_source : read_amount_in_region_fetch;
		read_amount_in_region_hap			<= hap_activate    ? read_amount_in_region_fetch  : read_amount_in_region_hap;
		read_amount_in_region_var			<= var_activate    ? read_amount_in_region_hap    : read_amount_in_region_var;
		read_amount_in_region_geno			<= geno_activate   ? read_amount_in_region_var    : read_amount_in_region_geno;
	
		haplotype_amount_in_region_hap		<= out_valid_hap   ? haplotype_amount_in_region_source : haplotype_amount_in_region_hap;
		haplotype_amount_in_region_var		<= var_activate    ? haplotype_amount_in_region_hap    : haplotype_amount_in_region_var;
		haplotype_amount_in_region_geno		<= geno_activate   ? haplotype_amount_in_region_var    : haplotype_amount_in_region_geno;

		haplotype_amount_in_region_1hot_hap		<= out_valid_hap   ? haplotype_amount_in_region_1hot_source : haplotype_amount_in_region_1hot_hap;
		haplotype_amount_in_region_1hot_var		<= var_activate    ? haplotype_amount_in_region_1hot_hap    : haplotype_amount_in_region_1hot_var;
		haplotype_amount_in_region_1hot_geno	<= geno_activate   ? haplotype_amount_in_region_1hot_var    : haplotype_amount_in_region_1hot_geno;
	
		active_region_start_fetch			<= fetch_activate  ? active_region_start_source : active_region_start_fetch;
		active_region_start_hap				<= hap_activate    ? active_region_start_fetch  : active_region_start_hap;
		active_region_start_var				<= var_activate    ? active_region_start_hap    : active_region_start_var;
		active_region_start_geno			<= geno_activate   ? active_region_start_var    : active_region_start_geno;
	
		active_region_end_fetch				<= fetch_activate  ? active_region_end_source : active_region_end_fetch;
		active_region_end_hap				<= hap_activate    ? active_region_end_fetch  : active_region_end_hap;
		active_region_end_var				<= var_activate    ? active_region_end_hap    : active_region_end_var;
		active_region_end_geno				<= geno_activate   ? active_region_end_var    : active_region_end_geno;
		
		variant_amount_in_region_var		<= out_valid_var   ? variant_amount_in_region_source : variant_amount_in_region_var;
		variant_amount_in_region_geno		<= geno_activate   ? variant_amount_in_region_var    : variant_amount_in_region_geno;
			
		
		unsorted_var_hap1hot_0_var	<= out_valid_var ? unsorted_var_hap1hot_0_source : unsorted_var_hap1hot_0_var;
		unsorted_var_hap1hot_1_var	<= out_valid_var ? unsorted_var_hap1hot_1_source : unsorted_var_hap1hot_1_var;
		unsorted_var_hap1hot_2_var	<= out_valid_var ? unsorted_var_hap1hot_2_source : unsorted_var_hap1hot_2_var;
		unsorted_var_hap1hot_3_var	<= out_valid_var ? unsorted_var_hap1hot_3_source : unsorted_var_hap1hot_3_var;
		unsorted_var_hap1hot_4_var	<= out_valid_var ? unsorted_var_hap1hot_4_source : unsorted_var_hap1hot_4_var;
		unsorted_var_hap1hot_5_var	<= out_valid_var ? unsorted_var_hap1hot_5_source : unsorted_var_hap1hot_5_var;
		unsorted_var_hap1hot_6_var	<= out_valid_var ? unsorted_var_hap1hot_6_source : unsorted_var_hap1hot_6_var;
		unsorted_var_hap1hot_7_var	<= out_valid_var ? unsorted_var_hap1hot_7_source : unsorted_var_hap1hot_7_var;
		event_amount_in_region_var	<= out_valid_var ? event_amount_in_region_source : event_amount_in_region_var;
		event_begin_0_var			<= out_valid_var ? event_begin_0_source : event_begin_0_var;
		event_begin_1_var			<= out_valid_var ? event_begin_1_source : event_begin_1_var;
		event_begin_2_var			<= out_valid_var ? event_begin_2_source : event_begin_2_var;
		event_begin_3_var			<= out_valid_var ? event_begin_3_source : event_begin_3_var;
		event_begin_4_var			<= out_valid_var ? event_begin_4_source : event_begin_4_var;
		event_begin_5_var			<= out_valid_var ? event_begin_5_source : event_begin_5_var;
		event_begin_6_var			<= out_valid_var ? event_begin_6_source : event_begin_6_var;
		event_begin_7_var			<= out_valid_var ? event_begin_7_source : event_begin_7_var;
		event_var2hot_0_var			<= out_valid_var ? event_var2hot_0_source : event_var2hot_0_var;
		event_var2hot_1_var			<= out_valid_var ? event_var2hot_1_source : event_var2hot_1_var;
		event_var2hot_2_var			<= out_valid_var ? event_var2hot_2_source : event_var2hot_2_var;
		event_var2hot_3_var			<= out_valid_var ? event_var2hot_3_source : event_var2hot_3_var;
		event_var2hot_4_var			<= out_valid_var ? event_var2hot_4_source : event_var2hot_4_var;
		event_var2hot_5_var			<= out_valid_var ? event_var2hot_5_source : event_var2hot_5_var;
		event_var2hot_6_var			<= out_valid_var ? event_var2hot_6_source : event_var2hot_6_var;
		event_var2hot_7_var			<= out_valid_var ? event_var2hot_7_source : event_var2hot_7_var;
		unsorted_var_hap1hot_0_geno	<= geno_activate ? unsorted_var_hap1hot_0_var : unsorted_var_hap1hot_0_geno;
		unsorted_var_hap1hot_1_geno	<= geno_activate ? unsorted_var_hap1hot_1_var : unsorted_var_hap1hot_1_geno;
		unsorted_var_hap1hot_2_geno	<= geno_activate ? unsorted_var_hap1hot_2_var : unsorted_var_hap1hot_2_geno;
		unsorted_var_hap1hot_3_geno	<= geno_activate ? unsorted_var_hap1hot_3_var : unsorted_var_hap1hot_3_geno;
		unsorted_var_hap1hot_4_geno	<= geno_activate ? unsorted_var_hap1hot_4_var : unsorted_var_hap1hot_4_geno;
		unsorted_var_hap1hot_5_geno	<= geno_activate ? unsorted_var_hap1hot_5_var : unsorted_var_hap1hot_5_geno;
		unsorted_var_hap1hot_6_geno	<= geno_activate ? unsorted_var_hap1hot_6_var : unsorted_var_hap1hot_6_geno;
		unsorted_var_hap1hot_7_geno	<= geno_activate ? unsorted_var_hap1hot_7_var : unsorted_var_hap1hot_7_geno;
		event_amount_in_region_geno	<= geno_activate ? event_amount_in_region_var : event_amount_in_region_geno;
		event_begin_0_geno			<= geno_activate ? event_begin_0_var : event_begin_0_geno;
		event_begin_1_geno			<= geno_activate ? event_begin_1_var : event_begin_1_geno;
		event_begin_2_geno			<= geno_activate ? event_begin_2_var : event_begin_2_geno;
		event_begin_3_geno			<= geno_activate ? event_begin_3_var : event_begin_3_geno;
		event_begin_4_geno			<= geno_activate ? event_begin_4_var : event_begin_4_geno;
		event_begin_5_geno			<= geno_activate ? event_begin_5_var : event_begin_5_geno;
		event_begin_6_geno			<= geno_activate ? event_begin_6_var : event_begin_6_geno;
		event_begin_7_geno			<= geno_activate ? event_begin_7_var : event_begin_7_geno;
		event_var2hot_0_geno		<= geno_activate ? event_var2hot_0_var : event_var2hot_0_geno;
		event_var2hot_1_geno		<= geno_activate ? event_var2hot_1_var : event_var2hot_1_geno;
		event_var2hot_2_geno		<= geno_activate ? event_var2hot_2_var : event_var2hot_2_geno;
		event_var2hot_3_geno		<= geno_activate ? event_var2hot_3_var : event_var2hot_3_geno;
		event_var2hot_4_geno		<= geno_activate ? event_var2hot_4_var : event_var2hot_4_geno;
		event_var2hot_5_geno		<= geno_activate ? event_var2hot_5_var : event_var2hot_5_geno;
		event_var2hot_6_geno		<= geno_activate ? event_var2hot_6_var : event_var2hot_6_geno;
		event_var2hot_7_geno		<= geno_activate ? event_var2hot_7_var : event_var2hot_7_geno;
		
		var_location_min_var				<= out_valid_var ? o_var_location_min_source : var_location_min_var;
		var_location_max_var				<= out_valid_var ? o_var_location_max_source : var_location_max_var;
		
		var_location_min_geno				<= geno_activate ? var_location_min_var : var_location_min_geno;
		var_location_max_geno				<= geno_activate ? var_location_max_var : var_location_max_geno;
	end
end


//reset the IP
always@(posedge clk) begin 
	if(!rst_n) manual_rst_n <= 1;
	else if(axil_awvalid && axil_awaddr == 6'd63) manual_rst_n <= 0;	
	else manual_rst_n <= 1;
end

GATK_Preprocess GATK_preprocess(
	.clk								(clk),
	.rst_n								(rst_n),
	.manual_rst_n						(manual_rst_n),

	.CONST_read_length					(CONST_read_length),
	.CONST_active_region_length			(CONST_active_region_length),
	.CONST_ref_addr						(CONST_ref_addr),
	.CONST_read_addr					(CONST_read_addr),
	.CONST_variant_addr					(CONST_variant_addr),
	.CONST_var_event_amount_addr		(CONST_var_event_amount_addr),
	.CONST_var_info_addr				(CONST_var_info_addr),
	.CONST_event_info_addr				(CONST_event_info_addr),
	.CONST_padding_base					(CONST_padding_base),
	.CONST_total_read_num				(CONST_total_read_num),
	.CONST_max_likelihood_difference	(CONST_max_likelihood_difference),
	.CONST_filter_threshold				(CONST_filter_threshold),

	.axil_araddr						(axil_araddr	),
	.axil_arready						(axil_arready	),
	.axil_arvalid						(axil_arvalid	),
	.axil_awaddr						(axil_awaddr	),
	.axil_awready						(axil_awready	),
	.axil_awvalid						(axil_awvalid	),
	.axil_bready						(axil_bready	),
	.axil_bvalid						(axil_bvalid	),
	.axil_rdata							(axil_rdata		),
	.axil_rready						(axil_rready	),
	.axil_rvalid						(axil_rvalid	),
	.axil_wdata							(axil_wdata		),
	.axil_wready						(axil_wready	),
	.axil_wvalid						(axil_wvalid	),


	.fetch_activate						(fetch_activate),
	.hap_activate						(hap_activate),
	.var_activate						(var_activate),
	.geno_activate						(geno_activate),

	.active_region_start				(active_region_start_source),
	.active_region_end					(active_region_end_source),

	.state_fetch						(state_fetch),
	.state_hap							(state_hap),
	.state_var							(state_var),
	.state_geno							(state_geno),
	.state_geno_tx						(state_geno_tx		),
	.state_geno_rx						(state_geno_rx		),
	.state_geno_find_max				(state_geno_find_max),
	.state_geno_PL_CTRL					(state_geno_PL_CTRL	),
	.state_geno_o2dram					(state_geno_o2dram	),


	.read_amount_in_region_fetch		(read_amount_in_region_fetch), 
	.read_amount_in_region_hap			(read_amount_in_region_hap), 
	.read_amount_in_region_var			(read_amount_in_region_var), 
	.read_amount_in_region_geno			(read_amount_in_region_geno),

	.haplotype_amount_in_region_hap		(haplotype_amount_in_region_hap),
	.haplotype_amount_in_region_var		(haplotype_amount_in_region_var),
	.haplotype_amount_in_region_geno	(haplotype_amount_in_region_geno),


	.variant_amount_in_region_var		(variant_amount_in_region_var), 
	.variant_amount_in_region_geno		(variant_amount_in_region_geno),

	.active_region_start_fetch			(active_region_start_fetch),
	.active_region_start_hap			(active_region_start_hap),
	.active_region_start_var			(active_region_start_var),
	.active_region_start_geno			(active_region_start_geno),

	.done_fetch							(out_valid_fecth),
	.done_hap							(out_valid_hap),
	.done_var							(out_valid_var),
	.done_geno							(out_valid_geno),


	.read_offset						(read_offset_out),
	.read_offset_update					(read_offset_in),
	.read_explode						(read_explode),
	.sram_bank_sel						(sram_bank_sel),

	.var_event_amount_write_amount		(o_var_event_amount_write_amount),
	.var_info_write_amount				(o_var_info_write_amount),
	.event_info_write_amount			(o_event_info_write_amount)
);

FETCH_CIRCUIT fetch_circuit(
	.clk							(clk),
	.rst_n							(rst_n),
	.manual_rst_n					(manual_rst_n),
	.in_valid						(fetch_activate), 

	.CONST_read_length				(CONST_read_length),
	.CONST_ref_addr					(CONST_ref_addr),
	.CONST_read_addr				(CONST_read_addr),
	.CONST_padding_base				(CONST_padding_base),
	.CONST_total_read_num			(CONST_total_read_num),

	.axi_araddr					(axi_m_araddr	),
	.axi_arlen					(axi_m_arlen	),
	.axi_arready					(axi_m_arready	),
	.axi_arvalid					(axi_m_arvalid	),
	.axi_rdata					(axi_m_rdata	),
	.axi_rready					(axi_m_rready	),
	.axi_rvalid					(axi_m_rvalid	),

	.D_READ_SRAM					(D_FETCH_READ_SRAM),
	.A_READ_SRAM					(A_FETCH_READ_SRAM),
	.W_READ_SRAM					(W_FETCH_READ_SRAM),

	.read_amount_in_region			(read_amount_in_region_source),
	.out_valid						(out_valid_fecth),

	.active_region_start			(active_region_start_fetch),
	.active_region_end				(active_region_end_fetch),

	.state							(state_fetch),
	.read_offset					(read_offset_out),
	.read_explode					(read_explode),

	.read_offset_in					(read_offset_in)

);


Haplotype_Calling haplotype_calling(
	.clk							(clk),
	.rst_n							(rst_n),
	.manual_rst_n					(manual_rst_n),

	.CONST_read_length				(CONST_read_length),
	.CONST_active_region_length		(CONST_active_region_length),

	.Q_READ_SRAM					(Q_hap_READ_SRAM),
	.A_READ_SRAM					(A_hap_READ_SRAM),

	.D_HAP_SRAM						(D_hap_HAPLOTYPE_SRAM),
	.A_HAP_SRAM						(A_hap_HAPLOTYPE_SRAM),
	.W_HAP_SRAM						(W_hap_HAPLOTYPE_SRAM),

	.in_valid						(hap_activate),

	.read_amount_in_region			(read_amount_in_region_hap),
	.haplotype_amount_in_region		(haplotype_amount_in_region_source),
	.haplotype_amount_in_region_1hot(haplotype_amount_in_region_1hot_source),

	.state							(state_hap),

	.out_valid						(out_valid_hap),

	.active_region_end				(active_region_end_hap)

);

Variant_Calling variant_calling(
	.clk								(clk),
	.rst_n								(rst_n),
	.manual_rst_n						(manual_rst_n),
// Global constant
	.CONST_active_region_length			(CONST_active_region_length),
	.CONST_padding_length				(CONST_padding_base),
	.CONST_haplotype_amount_in_region	(haplotype_amount_in_region_var),

// SRAM I/O 
	.Q_READ_SRAM						(Q_var_READ_SRAM),
	.A_READ_SRAM						(A_var_READ_SRAM),
	.Q_HAP_SRAM							(Q_var_HAPLOTYPE_SRAM),
	.A_HAP_SRAM							(A_var_HAPLOTYPE_SRAM),
	.D_VAR_SRAM							(D_var_VAR_SRAM),
	.A_VAR_SRAM							(A_var_VAR_SRAM),
	.W_VAR_SRAM							(W_var_VAR_SRAM),
	.Q_VAR_SRAM							(Q_var_VAR_SRAM),

// Haplotyping I/O 
	.i_valid							(var_activate),

// to Genotyping I/O
	.state								(state_var),
		
	.o_valid							(out_valid_var),
	.o_variant_amount_in_region			(variant_amount_in_region_source),
	.o_unsorted_var_hap1hot_0			(unsorted_var_hap1hot_0_source),
	.o_unsorted_var_hap1hot_1			(unsorted_var_hap1hot_1_source),
	.o_unsorted_var_hap1hot_2			(unsorted_var_hap1hot_2_source),
	.o_unsorted_var_hap1hot_3			(unsorted_var_hap1hot_3_source),
	.o_unsorted_var_hap1hot_4			(unsorted_var_hap1hot_4_source),
	.o_unsorted_var_hap1hot_5			(unsorted_var_hap1hot_5_source),
	.o_unsorted_var_hap1hot_6			(unsorted_var_hap1hot_6_source),
	.o_unsorted_var_hap1hot_7			(unsorted_var_hap1hot_7_source),

	.o_event_amount_in_region			(event_amount_in_region_source),
	.o_event_begin_0					(event_begin_0_source),
	.o_event_begin_1					(event_begin_1_source),
	.o_event_begin_2					(event_begin_2_source),
	.o_event_begin_3					(event_begin_3_source),
	.o_event_begin_4					(event_begin_4_source),
	.o_event_begin_5					(event_begin_5_source),
	.o_event_begin_6					(event_begin_6_source),
	.o_event_begin_7					(event_begin_7_source),
	.o_event_var2hot_0					(event_var2hot_0_source),
	.o_event_var2hot_1					(event_var2hot_1_source),
	.o_event_var2hot_2					(event_var2hot_2_source),
	.o_event_var2hot_3					(event_var2hot_3_source),
	.o_event_var2hot_4					(event_var2hot_4_source),
	.o_event_var2hot_5					(event_var2hot_5_source),
	.o_event_var2hot_6					(event_var2hot_6_source),
	.o_event_var2hot_7					(event_var2hot_7_source),

	.o_var_location_min					(o_var_location_min_source),
	.o_var_location_max					(o_var_location_max_source)
);


Genotyping genotyping(
	.clk								(clk),
	.rst_n								(rst_n),
	.manual_rst_n						(manual_rst_n),
	// Global Address Bias
	.CONST_var_event_amount_addr		(CONST_var_event_amount_addr),
	.CONST_var_info_addr				(CONST_var_info_addr),
	.CONST_event_info_addr				(CONST_event_info_addr),
	// Constant Parameter 
	.CONST_read_length					(CONST_read_length),
	.CONST_active_region_length			(CONST_active_region_length),
	.CONST_max_likelihood_difference	(CONST_max_likelihood_difference),
	.CONST_min_max_likelihood			(CONST_filter_threshold),
	// region constant
	.read_amount_in_region				(read_amount_in_region_geno),          // (1-based)
	.haplotype_amount_in_region			(haplotype_amount_in_region_geno),     // (1-based)
	.haplotype_amount_in_region_1hot	(haplotype_amount_in_region_1hot_geno),
	.location_bias						(active_region_start_geno),				// (1-based)
	.var_location_min					(var_location_min_geno),
	.var_location_max					(var_location_max_geno),
	.event_amount_in_region				(event_amount_in_region_geno),
    .event_begin_0						(event_begin_0_geno),
    .event_begin_1						(event_begin_1_geno),
    .event_begin_2						(event_begin_2_geno),
    .event_begin_3						(event_begin_3_geno),
    .event_begin_4						(event_begin_4_geno),
    .event_begin_5						(event_begin_5_geno),
    .event_begin_6						(event_begin_6_geno),
    .event_begin_7						(event_begin_7_geno),
    .event_var2hot_0					(event_var2hot_0_geno),
    .event_var2hot_1					(event_var2hot_1_geno),
    .event_var2hot_2					(event_var2hot_2_geno),
    .event_var2hot_3					(event_var2hot_3_geno),
    .event_var2hot_4					(event_var2hot_4_geno),
    .event_var2hot_5					(event_var2hot_5_geno),
    .event_var2hot_6					(event_var2hot_6_geno),
    .event_var2hot_7					(event_var2hot_7_geno),
    .unsorted_var_hap1hot_0				(unsorted_var_hap1hot_0_geno),
    .unsorted_var_hap1hot_1				(unsorted_var_hap1hot_1_geno),
    .unsorted_var_hap1hot_2				(unsorted_var_hap1hot_2_geno),
    .unsorted_var_hap1hot_3				(unsorted_var_hap1hot_3_geno),
    .unsorted_var_hap1hot_4				(unsorted_var_hap1hot_4_geno),
    .unsorted_var_hap1hot_5				(unsorted_var_hap1hot_5_geno),
    .unsorted_var_hap1hot_6				(unsorted_var_hap1hot_6_geno),
    .unsorted_var_hap1hot_7				(unsorted_var_hap1hot_7_geno),
	.variant_amount_in_region			(variant_amount_in_region_geno),       // (1-based)	
	// Access SRAM 
	.Q_READ_SRAM						(Q_geno_READ_SRAM),
	.A_READ_SRAM						(A_geno_READ_SRAM),
	.Q_HAP_SRAM							(Q_geno_HAPLOTYPE_SRAM),
	.A_HAP_SRAM							(A_geno_HAPLOTYPE_SRAM),
	.Q_VAR_SRAM							(Q_geno_VAR_SRAM),
	.A_VAR_SRAM							(A_geno_VAR_SRAM),

	// AXI bus IO
	.axi_awaddr                       (axi_m_awaddr),
	.axi_awlen                        (axi_m_awlen),
	.axi_awready                      (axi_m_awready),
	.axi_awvalid                      (axi_m_awvalid),
	.axi_wdata                        (axi_m_wdata),
	.axi_wstrb                        (axi_m_wstrb),
	.axi_wlast                        (axi_m_wlast),
	.axi_wready                       (axi_m_wready),
	.axi_wvalid                       (axi_m_wvalid),
	.axi_bready                       (axi_m_bready),
	.axi_bvalid                       (axi_m_bvalid),

	// Floating point 
	.FP_addsub_data_a					(FP_addsub_dataa),
	.FP_addsub_data_b					(FP_addsub_datab),
	.FP_addsub_op						(FP_addsub_op),
	.FP_addsub_result					(FP_addsub_result),   // 10 based
	.FP_mult_data_a						(FP_mult_dataa),
	.FP_mult_data_b						(FP_mult_datab), 
	.FP_mult_result						(FP_mult_result),  
	.FP_exp_data_a						(FP_exp_data_ref),
	.FP_exp_result_a					(FP_exp_result_ref),
	.FP_exp_data_b						(FP_exp_data_alt),
	.FP_exp_result_b					(FP_exp_result_alt),
	.FP_log_data						(FP_log_data),
	.FP_log_result						(FP_log_result),

	// Required Information 
	.i_region_valid						(geno_activate),	// Represent we can start calculating this region
	.o_region_done						(out_valid_geno),	// Meaning calculation for this region is finished
	.o_var_event_amount_write_amount	(o_var_event_amount_write_amount),
    .o_var_info_write_amount			(o_var_info_write_amount),
    .o_event_info_write_amount			(o_event_info_write_amount),
	
    // .i_region_check						(i_region_check),
	.state								(state_geno),
	.state_tx		(state_geno_tx		),
	.state_rx		(state_geno_rx		),
	.state_find_max	(state_geno_find_max	),
	.state_PL_CTRL	(state_geno_PL_CTRL	),
	.state_o2dram	(state_geno_o2dram	)
);

FP_ADD_SUB  FP_ADDSUB (
    .aclk					(clk),

	.s_axis_a_tdata			(FP_addsub_dataa),
	.s_axis_a_tvalid		(1'b1),
	
    .s_axis_b_tdata			(FP_addsub_datab),
    .s_axis_b_tvalid		(1'b1),
	
	.s_axis_operation_tdata	({7'b0, FP_addsub_op}),
	.s_axis_operation_tvalid(1'b1),
	
    .m_axis_result_tdata 	(FP_addsub_result)
);

FP_MULT u_FP_MULT(
    .aclk					(clk),

	.s_axis_a_tdata			(FP_mult_dataa),
	.s_axis_a_tvalid		(1'b1),
	
    .s_axis_b_tdata			(FP_mult_datab),
	.s_axis_b_tvalid		(1'b1),
	
    .m_axis_result_tdata	(FP_mult_result)
);

wire [31:0]					FP_exp_temp_ref, FP_exp_temp_alt;

FP_MULT u_FP_MULT_ref(
    .aclk					(clk),

	.s_axis_a_tdata			(FP_exp_data_ref),
	.s_axis_a_tvalid		(1'b1),
	
    .s_axis_b_tdata			(`LN_10),
	.s_axis_b_tvalid		(1'b1),
	
    .m_axis_result_tdata	(FP_exp_temp_ref)
);

FP_EXP u_FP_EXP_ref (
    .aclk					(clk),

	.s_axis_a_tdata			(FP_exp_temp_ref),
	.s_axis_a_tvalid		(1'b1),
	
    .m_axis_result_tdata	(FP_exp_result_ref)
);

FP_MULT u_FP_MULT_alt(
    .aclk					(clk),

	.s_axis_a_tdata			(FP_exp_data_alt),
	.s_axis_a_tvalid		(1'b1),
	
    .s_axis_b_tdata			(`LN_10),
	.s_axis_b_tvalid		(1'b1),
	
    .m_axis_result_tdata	(FP_exp_temp_alt)
);

FP_EXP u_FP_EXP_alt (
    .aclk					(clk),

	.s_axis_a_tdata			(FP_exp_temp_alt),
	.s_axis_a_tvalid		(1'b1),
	
    .m_axis_result_tdata	(FP_exp_result_alt)
);

wire [31:0]					FP_ln_data;

FP_LOG u_FP_LOG (
    .aclk					(clk),

	.s_axis_a_tdata			(FP_log_data),
	.s_axis_a_tvalid		(1'b1),
	
    .m_axis_result_tdata	(FP_ln_data)
);

FP_DIV u_FP_DIV(
    .aclk					(clk),

	.s_axis_a_tdata			(FP_ln_data),
	.s_axis_a_tvalid		(1'b1),
	
    .s_axis_b_tdata			(`LN_10),
	.s_axis_b_tvalid		(1'b1),
	
    .m_axis_result_tdata	(FP_log_result)
);


// wire [31:0] fp_exp_fucker_a;
// FP_Exponential_10_base u_FP_EXP_10_ref (
//     .aclk					(clk),

// 	.s_axis_a_tdata			(FP_exp_data_ref),
// 	.s_axis_a_tvalid		(1'b1),
	
//     .m_axis_result_tdata	(fp_exp_fucker_a)
// );

// wire [31:0] fp_exp_fucker_b;
// FP_Exponential_10_base u_FP_EXP_10_alt (
//     .aclk					(clk),

// 	.s_axis_a_tdata			(FP_exp_data_alt),
// 	.s_axis_a_tvalid		(1'b1),
	
//     .m_axis_result_tdata	(fp_exp_fucker_b)
// );

// wire [31:0] fp_exp_fucker_c;
// FP_LOG_10_base u_FP_LOG_10 (
//     .aclk					(clk),

// 	.s_axis_a_tdata			(FP_log_data),
// 	.s_axis_a_tvalid		(1'b1),

//     .m_axis_result_tdata	(fp_exp_fucker_c)
// );


GATK_Read_SRAM READ_BANK_0(
	.clka	(clk),
	.douta	(Q_READ_0),
	.dina	(D_READ_0),
	.addra	(A_READ_0),
	.wea	(W_READ_0)
);

GATK_Read_SRAM READ_BANK_1(
	.clka	(clk),
	.douta	(Q_READ_1),
	.dina	(D_READ_1),
	.addra	(A_READ_1),
	.wea	(W_READ_1)
);

GATK_Read_SRAM READ_BANK_2(
	.clka	(clk),
	.douta	(Q_READ_2),
	.dina	(D_READ_2),
	.addra	(A_READ_2),
	.wea	(W_READ_2)
);

GATK_Read_SRAM READ_BANK_3(
	.clka	(clk),
	.douta	(Q_READ_3),
	.dina	(D_READ_3),
	.addra	(A_READ_3),
	.wea	(W_READ_3)
);



GATK_Haplotype_SRAM HAPLOTYPE_BANK_0(
	.clka	(clk),
	.douta	(Q_HAP_0),
	.dina	(D_HAP_0),
	.addra	(A_HAP_0),
	.wea	(W_HAP_0)
);

GATK_Haplotype_SRAM HAPLOTYPE_BANK_1(
	.clka	(clk),
	.douta	(Q_HAP_1),
	.dina	(D_HAP_1),
	.addra	(A_HAP_1),
	.wea	(W_HAP_1)
);

GATK_Haplotype_SRAM HAPLOTYPE_BANK_2(
	.clka	(clk),
	.douta	(Q_HAP_2),
	.dina	(D_HAP_2),
	.addra	(A_HAP_2),
	.wea	(W_HAP_2)
);

GATK_Haplotype_SRAM HAPLOTYPE_BANK_3(
	.clka	(clk),
	.douta	(Q_HAP_3),
	.dina	(D_HAP_3),
	.addra	(A_HAP_3),
	.wea	(W_HAP_3)
);




GATK_Variant_SRAM VARIANT_BANK_0(
	.clka	(clk),
	.douta	(Q_VAR_0),
	.dina	(D_VAR_0),
	.addra	(A_VAR_0),
	.wea	(W_VAR_0)
);

GATK_Variant_SRAM VARIANT_BANK_1(
	.clka	(clk),
	.douta	(Q_VAR_1),
	.dina	(D_VAR_1),
	.addra	(A_VAR_1),
	.wea	(W_VAR_1)
);


endmodule


module GATK_Preprocess(

	input 										clk,
	input										rst_n,
	input										manual_rst_n,

	output reg [8:0] 							CONST_read_length,
	output reg [9:0] 							CONST_active_region_length,
	output reg [63:0] 							CONST_ref_addr,
	output reg [63:0]							CONST_read_addr,
	output reg [63:0]							CONST_variant_addr,
	output reg [63:0]   						CONST_var_event_amount_addr,
	output reg [63:0]   						CONST_var_info_addr,
	output reg [63:0]   						CONST_event_info_addr,
	output reg [`PADDING_DATA_DIWTH-1:0]		CONST_padding_base,
	output reg [31:0]							CONST_total_read_num,
	output reg [`DP_PAIRHMM_SCORE_BITWIDTH-1:0]	CONST_max_likelihood_difference,
	output reg [`DP_PAIRHMM_SCORE_BITWIDTH-1:0] CONST_filter_threshold,

	input [31:0]		axil_araddr,
	output 				axil_arready,
	input				axil_arvalid,
		
	input [31:0]		axil_awaddr,
	output 				axil_awready,
	input				axil_awvalid, 
	input				axil_bready,
	output 				axil_bvalid,

	output reg [31:0]   axil_rdata,
	input				axil_rready,
	output reg			axil_rvalid,
		
	input [31:0]		axil_wdata,
	output 				axil_wready,
	input				axil_wvalid,

	output 				fetch_activate,
	output 				hap_activate,
	output 				var_activate,
	output 				geno_activate,

	output reg [31:0]	active_region_start,
	output reg [31:0]	active_region_end,

	input [7:0]			state_fetch,
	input [7:0]			state_hap,
	input [3:0]			state_var,
	input [2:0]			state_geno,
	input [3:0] 		state_geno_tx,
	input [2:0] 		state_geno_rx,
	input [4:0] 		state_geno_find_max,
	input [4:0] 		state_geno_PL_CTRL,
	input [3:0] 		state_geno_o2dram,

	input [9:0]			read_amount_in_region_fetch,
	input [9:0]			read_amount_in_region_hap,
	input [9:0]			read_amount_in_region_var,
	input [9:0]			read_amount_in_region_geno,

	input [$clog2(`MAX_HAPLOTYPE_AMOUNT):0]			haplotype_amount_in_region_hap,
	input [$clog2(`MAX_HAPLOTYPE_AMOUNT):0]			haplotype_amount_in_region_var,
	input [$clog2(`MAX_HAPLOTYPE_AMOUNT):0]			haplotype_amount_in_region_geno,

	input [3:0]			variant_amount_in_region_var,
	input [3:0]			variant_amount_in_region_geno,

	input [31:0]		active_region_start_fetch,
	input [31:0]		active_region_start_hap,
	input [31:0]		active_region_start_var,
	input [31:0]		active_region_start_geno,

	input				done_fetch,
	input				done_hap,
	input				done_var,
	input				done_geno,


	input [31:0]		read_offset,
	output reg [31:0]	read_offset_update,
	input				read_explode,
	output reg [1:0]	sram_bank_sel,

	input [31:0]        var_event_amount_write_amount,
    input [31:0]        var_info_write_amount,
    input [31:0]        event_info_write_amount
);

parameter	IDLE				= 8'd0,
			ACTIVATE			= 8'd1,
			WAIT				= 8'd2,
			CHECK				= 8'd3,
			FINISH				= 8'd4;

reg [7:0] state, state_n;

reg [31:0]	active_region_start_n;
reg [31:0]	active_region_end_n;

reg [31:0]	CONST_start_base;
reg [31:0]	CONST_end_base;

wire out_valid;

reg [3:0] done_signal, done_signal_n;
reg [3:0] issue_signal, issue_signal_n;

reg [1:0]	sram_bank_sel_n;
reg [63:0]	system_counter;
wire [63:0] system_counter_n;
reg [63:0]	fetch_counter;
wire [63:0] fetch_counter_n;
reg [63:0]	hap_counter;
wire [63:0] hap_counter_n;
reg [63:0]	var_counter;
wire [63:0] var_counter_n;
reg [63:0]	geno_counter;
wire [63:0] geno_counter_n;

reg fetching;
reg haping;
reg varing;
reg genoing;



reg [31:0]  axil_rdata_n;
reg 		axil_rvalid_n;

reg [31:0] axil_waddr;
wire [31:0] axil_waddr_n;

assign system_counter_n = system_counter + (state != IDLE);
assign fetch_counter_n 	= fetch_counter + fetching;
assign hap_counter_n	= hap_counter + haping;
assign var_counter_n	= var_counter + varing;
assign geno_counter_n	= geno_counter + genoing;


assign axil_arready = 1;
assign axil_awready = 1;

assign axil_bvalid = 1;

assign axil_waddr_n = (axil_awvalid) ? axil_awaddr : axil_waddr;
assign axil_wready = 1;


assign out_valid = (state == ACTIVATE);

assign fetch_activate = (out_valid && (active_region_start < CONST_end_base) && (~read_explode) );
assign hap_activate = (out_valid && done_signal[0]);
assign var_activate = (out_valid && done_signal[1]);
assign geno_activate = (out_valid && done_signal[2]);

always@(posedge clk) begin
	if(!rst_n) begin
		fetching		<= 0;
		haping			<= 0;
		varing			<= 0;
		genoing			<= 0;
	end
	else begin
	
		if(fetch_activate) 	fetching	<= 1;
		else if(done_fetch) fetching	<= 0;
		
		if(hap_activate)	haping		<= 1;
		else if(done_hap)	haping		<= 0;
		
		if(var_activate)	varing		<= 1;
		else if(done_var)	varing		<= 0;
	
		if(geno_activate)	genoing		<= 1;
		else if(done_geno)	genoing		<= 0;
	end
end

always@(*) begin
	active_region_start_n = active_region_start;
	active_region_end_n = active_region_end;
	
	case(state)
	IDLE: begin
		active_region_start_n = CONST_start_base;
		active_region_end_n = (CONST_start_base + CONST_active_region_length);
	end
	CHECK: begin
		active_region_start_n = active_region_end - {CONST_padding_base, 1'b0};
		active_region_end_n = active_region_end - {CONST_padding_base, 1'b0} + CONST_active_region_length;
	end
	endcase
	
end

always@(*) begin
	issue_signal_n = issue_signal;
	
	case(state)
	ACTIVATE: begin
		issue_signal_n[0] = fetch_activate;
		issue_signal_n[1] = hap_activate;
		issue_signal_n[2] = var_activate;
		issue_signal_n[3] = geno_activate;
	end
	CHECK: issue_signal_n = 0;
	endcase
	
end

always@(*) begin

	done_signal_n = done_signal;
	
	case(state)
	ACTIVATE: done_signal_n = 4'b0;
	WAIT: begin
		done_signal_n[0] = done_fetch ? 1 : done_signal[0];
		done_signal_n[1] = done_hap   ? 1 : done_signal[1];
		done_signal_n[2] = done_var   ? 1 : done_signal[2];
		done_signal_n[3] = done_geno  ? 1 : done_signal[3];
	end
	endcase

end

always@(*) begin
	sram_bank_sel_n = sram_bank_sel;
	
	case(state)
	CHECK: sram_bank_sel_n = sram_bank_sel + 1'b1;
	endcase
end

always@(*) begin
	state_n = state;
	
	case(state)
		IDLE: 				state_n = (axil_awvalid && axil_awaddr == 32'd62) ? ACTIVATE : state;
		ACTIVATE:			state_n = WAIT;
		WAIT:				state_n = (issue_signal == done_signal) ? CHECK : state;
		CHECK:				state_n = (done_signal == 4'b1000) ? FINISH : ACTIVATE;
		FINISH:				state_n = state;
	endcase
end

always@(*) begin
	axil_rdata_n = axil_rdata;
	if (axil_arvalid) begin
		case(axil_araddr)
			0:  axil_rdata_n = `VERSION;
			1: 	axil_rdata_n = CONST_start_base;
			2: 	axil_rdata_n = CONST_read_length;
			3: 	axil_rdata_n = CONST_active_region_length;
			4: 	axil_rdata_n = CONST_ref_addr[63:32];
			5: 	axil_rdata_n = CONST_ref_addr[31:0];
			6: 	axil_rdata_n = CONST_read_addr[63:32];
			7: 	axil_rdata_n = CONST_read_addr[31:0];
			8: 	axil_rdata_n = CONST_variant_addr[63:32];
			9: 	axil_rdata_n = CONST_variant_addr[31:0];
			10: axil_rdata_n = CONST_padding_base;
			11: axil_rdata_n = state_fetch;
			12:	axil_rdata_n = state_hap;
			13:	axil_rdata_n = state_var;
			14:	axil_rdata_n = state_geno;
			15: axil_rdata_n = state_geno_tx;
			16: axil_rdata_n = state_geno_rx;
			17: axil_rdata_n = state_geno_find_max;
			18: axil_rdata_n = state_geno_PL_CTRL;
			19: axil_rdata_n = state_geno_o2dram;
			20: axil_rdata_n = read_amount_in_region_fetch;
			21: axil_rdata_n = read_amount_in_region_hap;
			22: axil_rdata_n = read_amount_in_region_var;
			23: axil_rdata_n = read_amount_in_region_geno;
			24: axil_rdata_n = variant_amount_in_region_var;
			25: axil_rdata_n = variant_amount_in_region_geno;
			26: axil_rdata_n = haplotype_amount_in_region_hap;
			27: axil_rdata_n = haplotype_amount_in_region_var;
			28: axil_rdata_n = haplotype_amount_in_region_geno;
			29: axil_rdata_n = active_region_start_fetch;
			30: axil_rdata_n = active_region_start_hap;
			31: axil_rdata_n = active_region_start_var;
			32: axil_rdata_n = active_region_start_geno;
			33: axil_rdata_n = read_offset;
			34: axil_rdata_n = state;
			35: axil_rdata_n = active_region_start;
			36: axil_rdata_n = CONST_end_base;
			37: axil_rdata_n = system_counter[63:32];
			38: axil_rdata_n = system_counter[31:0];
			39: axil_rdata_n = fetch_counter[63:32];
			40: axil_rdata_n = fetch_counter[31:0];
			41: axil_rdata_n = hap_counter[63:32];
			42: axil_rdata_n = hap_counter[31:0];
			43: axil_rdata_n = var_counter[63:32];
			44: axil_rdata_n = var_counter[31:0];
			45: axil_rdata_n = geno_counter[63:32];
			46: axil_rdata_n = geno_counter[31:0];
			47: axil_rdata_n = var_event_amount_write_amount;
			48: axil_rdata_n = var_info_write_amount;
			49: axil_rdata_n = event_info_write_amount;
			50: axil_rdata_n = CONST_var_event_amount_addr[63:32];
			51: axil_rdata_n = CONST_var_event_amount_addr[31:0];
			52: axil_rdata_n = CONST_var_info_addr[63:32];
			53: axil_rdata_n = CONST_var_info_addr[31:0];
			54: axil_rdata_n = CONST_event_info_addr[63:32];
			55: axil_rdata_n = CONST_event_info_addr[31:0];
		endcase
	end

	axil_rvalid_n = axil_rvalid;
	if (axil_rvalid) axil_rvalid_n = (axil_rready) ? 0 : axil_rvalid;
	else axil_rvalid_n = (axil_arvalid) ? 1 : axil_rvalid;
end

always@(posedge clk) begin
	if(!rst_n) begin
		state 						<= 0;
		CONST_start_base			<= 0;
		CONST_end_base				<= 0;
		CONST_read_length			<= 0;
		CONST_active_region_length	<= 0;
		CONST_ref_addr				<= 0;
		CONST_read_addr				<= 0;
		CONST_variant_addr			<= 0;
		CONST_var_event_amount_addr	<= 0;
		CONST_var_info_addr			<= 0;
		CONST_event_info_addr		<= 0;
		CONST_padding_base			<= 0;
		CONST_total_read_num		<= 0;
		active_region_start			<= 0;
		active_region_end			<= 0;
		done_signal					<= 0;
		issue_signal				<= 0;
		read_offset_update			<= 0;
		sram_bank_sel				<= 0;
		CONST_max_likelihood_difference	<= 0;
		CONST_filter_threshold		<= 0;
		system_counter				<= 0;
		fetch_counter				<= 0;
		hap_counter					<= 0;
		var_counter					<= 0;
		geno_counter				<= 0;
		axil_rvalid					<= 0;
		axil_rdata        			<= 0;
		axil_waddr					<= 0;
	end
	else if(!manual_rst_n) begin
		state 						<= 0;
		CONST_start_base			<= 0;
		CONST_end_base				<= 0;
		CONST_read_length			<= 0;
		CONST_active_region_length	<= 0;
		CONST_ref_addr				<= 0;
		CONST_read_addr				<= 0;
		CONST_variant_addr			<= 0;
		CONST_var_event_amount_addr	<= 0;
		CONST_var_info_addr			<= 0;
		CONST_event_info_addr		<= 0;
		CONST_padding_base			<= 0;
		CONST_total_read_num		<= 0;
		active_region_start			<= 0;
		active_region_end			<= 0;
		done_signal					<= 0;
		issue_signal				<= 0;
		read_offset_update			<= 0;
		sram_bank_sel				<= 0;
		CONST_max_likelihood_difference	<= 0;
		CONST_filter_threshold		<= 0;
		system_counter				<= 0;
		fetch_counter				<= 0;
		hap_counter					<= 0;
		var_counter					<= 0;
		geno_counter				<= 0;
		axil_rvalid					<= 0;
		axil_rdata 					<= 0;
		axil_waddr					<= 0;
	end
	else begin
		state								<= state_n;
		CONST_start_base					<= (axil_wvalid && axil_waddr == 32'd24) ? axil_wdata : CONST_start_base;
		CONST_read_length					<= (axil_wvalid && axil_waddr == 32'd25) ? axil_wdata : CONST_read_length;
		CONST_active_region_length			<= (axil_wvalid && axil_waddr == 32'd26) ? axil_wdata : CONST_active_region_length;
		CONST_ref_addr[63:32]				<= (axil_wvalid && axil_waddr == 32'd27) ? axil_wdata : CONST_ref_addr[63:32];
		CONST_ref_addr[31:0]				<= (axil_wvalid && axil_waddr == 32'd28) ? axil_wdata : CONST_ref_addr[31:0];
		CONST_read_addr[63:32]				<= (axil_wvalid && axil_waddr == 32'd29) ? axil_wdata : CONST_read_addr[63:32];
		CONST_read_addr[31:0]				<= (axil_wvalid && axil_waddr == 32'd30) ? axil_wdata : CONST_read_addr[31:0];
		CONST_variant_addr[63:32]			<= (axil_wvalid && axil_waddr == 32'd31) ? axil_wdata : CONST_variant_addr[63:32];
		CONST_variant_addr[31:0]			<= (axil_wvalid && axil_waddr == 32'd32) ? axil_wdata : CONST_variant_addr[31:0];
		CONST_padding_base					<= (axil_wvalid && axil_waddr == 32'd33) ? axil_wdata : CONST_padding_base;
		CONST_total_read_num				<= (axil_wvalid && axil_waddr == 32'd34) ? axil_wdata : CONST_total_read_num;
		CONST_max_likelihood_difference 	<= (axil_wvalid && axil_waddr == 32'd35) ? axil_wdata : CONST_max_likelihood_difference;
		CONST_end_base						<= (axil_wvalid && axil_waddr == 32'd36) ? axil_wdata : CONST_end_base;
		CONST_filter_threshold				<= (axil_wvalid && axil_waddr == 32'd37) ? axil_wdata : CONST_filter_threshold;
		// new 20201208 added by longlong
		CONST_var_event_amount_addr[63:32]	<= (axil_wvalid && axil_waddr == 32'd38) ? axil_wdata : CONST_var_event_amount_addr[63:32];
		CONST_var_event_amount_addr[31:0]	<= (axil_wvalid && axil_waddr == 32'd39) ? axil_wdata : CONST_var_event_amount_addr[31:0];
		CONST_var_info_addr[63:32]			<= (axil_wvalid && axil_waddr == 32'd40) ? axil_wdata : CONST_var_info_addr[63:32];
		CONST_var_info_addr[31:0]			<= (axil_wvalid && axil_waddr == 32'd41) ? axil_wdata : CONST_var_info_addr[31:0];
		CONST_event_info_addr[63:32]		<= (axil_wvalid && axil_waddr == 32'd42) ? axil_wdata : CONST_event_info_addr[63:32];
		CONST_event_info_addr[31:0]			<= (axil_wvalid && axil_waddr == 32'd43) ? axil_wdata : CONST_event_info_addr[31:0];
		active_region_start					<= active_region_start_n;
		active_region_end					<= active_region_end_n;
		done_signal							<= done_signal_n;
		issue_signal						<= issue_signal_n;
		read_offset_update					<= done_fetch ? read_offset : read_offset_update;
		sram_bank_sel						<= sram_bank_sel_n;
		system_counter						<= system_counter_n;
		fetch_counter						<= fetch_counter_n;
		hap_counter							<= hap_counter_n;
		var_counter							<= var_counter_n;
		geno_counter						<= geno_counter_n;
		axil_rvalid							<= axil_rvalid_n;
		axil_rdata							<= axil_rdata_n;
		axil_waddr							<= axil_waddr_n;
	end

end

endmodule

module FETCH_CIRCUIT (
input 					clk,
input 					rst_n,
input					manual_rst_n,
input 					in_valid, 

input [8:0] 			CONST_read_length,
input [63:0] 			CONST_ref_addr,
input [63:0]			CONST_read_addr,
input [`PADDING_DATA_DIWTH-1:0]	CONST_padding_base,
input [31:0]			CONST_total_read_num,


output reg [63:0]	axi_araddr,
output reg [7:0] 	axi_arlen,
input 				axi_arready,
output reg			axi_arvalid,
input [511:0] 		axi_rdata,
output reg 			axi_rready,
input 				axi_rvalid,



output reg [1023:0]		D_READ_SRAM,
output reg [8:0]		A_READ_SRAM,
output reg 				W_READ_SRAM,

output reg [9:0]		read_amount_in_region,
output  				out_valid,

input [31:0]			active_region_start,
input [31:0]		 	active_region_end,

output reg [7:0]		state,
output reg [31:0]		read_offset,
output					read_explode,

input [31:0]			read_offset_in
);

parameter	IDLE			= 8'd0, 
			FETCH_REF		= 8'd1,
			FETCH_REF_WAIT 	= 8'd2,
			FETCH_READ		= 8'd3,
			FETCH_READ_WAIT	= 8'd4,
			ROTATE_7		= 8'd5,
			ROTATE_6		= 8'd6,
			ROTATE_5		= 8'd7,
			ROTATE_4		= 8'd8,
			ROTATE_3		= 8'd9,
			ROTATE_2		= 8'd10,
			ROTATE_1		= 8'd11,
			ROTATE_0		= 8'd12,
			FIX_REF			= 8'd13,
			C_READ_NUM		= 8'd14,
			S_READ			= 8'd15,
			FINISH			= 8'd16;

reg [7:0] 		state_n;
reg [31:0] 		read_offset_n;
reg [512*3-1:0] ref_seq, ref_seq_n;
reg [5:0] 		counter, counter_n;

reg [8:0] 		A_READ_SRAM_n;
reg 			W_READ_SRAM_n;
reg [9:0] 		read_amount_in_region_n;
reg [9:0]		read_simply_count, read_simply_count_n;

reg [31:0]  	Mapping_loc, Mapping_loc_n;
reg [479:0] 	Mapping_read, Mapping_read_n;

wire [31:0]		read_addr_normalized;

wire			read_in_bound_front;
wire			read_in_bound_back;


assign			read_in_bound_front = (axi_rdata[31:0] + CONST_read_length >= active_region_start + `OVERLAP_BASE_IN_READS);
assign			read_in_bound_back = (axi_rdata[31:0] + `OVERLAP_BASE_IN_READS < active_region_end);

assign 			read_addr_normalized = {read_offset_in + read_simply_count};
assign 			out_valid = (state == FINISH);
assign			read_explode = (read_offset >= CONST_total_read_num);

always@(*) begin
	D_READ_SRAM = {Mapping_read, Mapping_loc, axi_rdata};
	
	case(state)
	FIX_REF, FETCH_READ: D_READ_SRAM = ref_seq[512*3-1:512];
	endcase
	
end



always@(*) begin

	axi_araddr	= 0;
	axi_arlen		= 0;
	axi_arvalid	= 0;
	case(state)
	FETCH_REF: begin
		axi_araddr	= CONST_ref_addr + {active_region_start[31:8], 6'b0};
		axi_arlen		= 2;
		axi_arvalid	= 1;
	end
	FETCH_READ: begin
		axi_araddr	= CONST_read_addr + {read_addr_normalized, 7'b0};
		axi_arlen		= 7;		//fetch 4 reads at a time
		axi_arvalid	= 1;
	end
	endcase
	 
	axi_rready	= 1;

end

always@(*) begin
	counter_n = 0; 
	
	case(state)
	FETCH_REF_WAIT, FETCH_READ_WAIT: counter_n = counter + axi_rvalid;
	endcase
end


always@(*) begin
	ref_seq_n = ref_seq;
	
	case(state)
	FETCH_REF_WAIT: ref_seq_n = axi_rvalid ? {ref_seq, axi_rdata} : ref_seq;
	ROTATE_7: ref_seq_n = active_region_start[7] ? (ref_seq << 256) : ref_seq;
	ROTATE_6: ref_seq_n = active_region_start[6] ? (ref_seq << 128) : ref_seq;
	ROTATE_5: ref_seq_n = active_region_start[5] ? (ref_seq << 64) : ref_seq;
	ROTATE_4: ref_seq_n = active_region_start[4] ? (ref_seq << 32) : ref_seq;
	ROTATE_3: ref_seq_n = active_region_start[3] ? (ref_seq << 16) : ref_seq;
	ROTATE_2: ref_seq_n = active_region_start[2] ? (ref_seq << 8) : ref_seq;
	ROTATE_1: ref_seq_n = active_region_start[1] ? (ref_seq << 4) : ref_seq;
	ROTATE_0: ref_seq_n = active_region_start[0] ? (ref_seq << 2) : ref_seq;
	endcase
	
end

always@(*) begin
	state_n = state;
	
	case(state)
	IDLE: 				state_n = in_valid ? FETCH_REF : state;
	FETCH_REF:			state_n = axi_arready ? state : FETCH_REF_WAIT;
	FETCH_REF_WAIT:		state_n = (axi_rvalid && counter==2) ? ROTATE_7 : state;
	ROTATE_7:			state_n = ROTATE_6;
	ROTATE_6:			state_n = ROTATE_5;
	ROTATE_5:			state_n = ROTATE_4;
	ROTATE_4:			state_n = ROTATE_3;
	ROTATE_3:			state_n = ROTATE_2;
	ROTATE_2:			state_n = ROTATE_1;
	ROTATE_1:			state_n = ROTATE_0;
	ROTATE_0:			state_n = FIX_REF;
	FIX_REF:			state_n = FETCH_READ;
	FETCH_READ:			state_n = axi_arready ? state : FETCH_READ_WAIT;
	FETCH_READ_WAIT:	state_n = (axi_rvalid && counter==7) ? C_READ_NUM : state;
	C_READ_NUM: begin
		if(read_explode) state_n = FINISH;
		else state_n = (Mapping_loc + `OVERLAP_BASE_IN_READS < active_region_end) ? S_READ : FINISH;
	end
	S_READ:				state_n = FETCH_READ;
	FINISH:				state_n = IDLE;
	endcase
end

always@(*) begin
	Mapping_loc_n = Mapping_loc;
	Mapping_read_n = Mapping_read;
	
	case(state)
	FETCH_READ_WAIT: begin
		if(axi_rvalid) begin
			Mapping_loc_n = (counter[0]==0) ? axi_rdata[31:0] : Mapping_loc;
			Mapping_read_n = (counter[0]==0) ? axi_rdata[511:32] : Mapping_read;
		end
	end
	endcase
end

always@(*) begin

	W_READ_SRAM_n = 0;
	A_READ_SRAM_n = 0;

	case(state)
	FIX_REF: begin
		W_READ_SRAM_n = 1;
		A_READ_SRAM_n = 0;
	end
	FETCH_READ_WAIT: begin
		if(axi_rvalid && counter[0]==0) begin
			W_READ_SRAM_n = (read_in_bound_front && read_in_bound_back && !read_explode);
			A_READ_SRAM_n = read_amount_in_region + 1'b1;
		end
	end
	endcase
	
end


always@(*) begin
	read_amount_in_region_n = read_amount_in_region;
	read_offset_n = read_offset;
	read_simply_count_n = read_simply_count;
	
	case(state)
	FETCH_READ_WAIT: begin
		if(axi_rvalid && (counter[0]==0) ) begin
			read_amount_in_region_n = read_amount_in_region + (read_in_bound_front && read_in_bound_back && !read_explode);
			read_offset_n = read_offset + ((axi_rdata[31:0] + CONST_read_length < active_region_start + CONST_padding_base + `OVERLAP_BASE_IN_READS) && !read_explode);
			read_simply_count_n = read_simply_count + 1'b1;
		end
	end
	IDLE: begin
		read_amount_in_region_n = 0;
		read_offset_n = in_valid ? read_offset_in : read_offset;
		read_simply_count_n = 0;
	end
	endcase
	
end

// always@(posedge clk or negedge rst_n) begin
always@(posedge clk ) begin
	if(!rst_n) begin
		state 					<= 0;
		ref_seq					<= 0;
		counter					<= 0;
		A_READ_SRAM				<= 0;
		W_READ_SRAM				<= 0;
		Mapping_loc				<= 0;
		Mapping_read			<= 0;
		read_amount_in_region	<= 0;
		read_offset				<= 0;
		read_simply_count		<= 0;
	end
	else if(!manual_rst_n) begin
		state 					<= 0;
		ref_seq					<= 0;
		counter					<= 0;
		A_READ_SRAM				<= 0;
		W_READ_SRAM				<= 0;
		Mapping_loc				<= 0;
		Mapping_read			<= 0;
		read_amount_in_region	<= 0;
		read_offset				<= 0;
		read_simply_count		<= 0;
	end
	else begin
		state					<= state_n;
		ref_seq					<= ref_seq_n;
		counter					<= counter_n;
		A_READ_SRAM				<= A_READ_SRAM_n;
		W_READ_SRAM				<= W_READ_SRAM_n;
		Mapping_loc				<= Mapping_loc_n;
		Mapping_read			<= Mapping_read_n;		
		read_amount_in_region	<= read_amount_in_region_n;
		read_offset				<= read_offset_n;
		read_simply_count		<= read_simply_count_n;
	end
end


endmodule


module Haplotype_Calling (
input 					clk,
input 					rst_n,
input					manual_rst_n,

input [8:0] 			CONST_read_length,
input [9:0] 			CONST_active_region_length,

input [`READ_SRAM_BIT_PER_WORD-1:0]			Q_READ_SRAM,
output reg [$clog2(`READ_SRAM_WORD_AMOUNT)-1:0]		A_READ_SRAM,

output reg [`HAP_SRAM_BIT_PER_WORD-1:0]		D_HAP_SRAM,
output reg [$clog2(`HAP_SRAM_WORD_AMOUNT)-1:0]		A_HAP_SRAM,
output reg				W_HAP_SRAM,

input 					in_valid,

input [9:0]				read_amount_in_region,
output [$clog2(`MAX_HAPLOTYPE_AMOUNT):0]	haplotype_amount_in_region,
output [`MAX_HAPLOTYPE_AMOUNT-1:0] haplotype_amount_in_region_1hot,
output reg [7:0]		state,
output 					out_valid,

input [31:0]			active_region_end
);

parameter				IDLE						= 8'd0,
						FETCH_REF					= 8'd1,
						ROTATE_REF					= 8'd2,
						ROTATE_REF_BUF  			= 8'd3,
						PUT_SORT_REF				= 8'd4,
						FETCH_READ					= 8'd5,
						SET_READ					= 8'd6,
						QUERY_READ					= 8'd7,
						PUT_SORT_READ				= 8'd8,
						ROTATE_READ					= 8'd9,
						QUERY_TRAN					= 8'd10,
						QUERY_HAP					= 8'd11,
						QUERY_HAP_WAIT				= 8'd12,
						ASSEMBLY					= 8'd13,
						BRANCH						= 8'd14,
						ROTATE_READ_BUF				= 8'd15,
						WRITE_HAP					= 8'd16,
						READ_HAP_TEMP				= 8'd17,
						READ_HAP_TEMP_W				= 8'd18,
						READ_HAP_TEMP_W1			= 8'd19,
						READ_HAP_TEMP_W_BUFF		= 8'd20,
						READ_HAP_TEMP_WC			= 8'd21,
						READ_HAP_TEMP_WG			= 8'd22,
						READ_HAP_TEMP_WT			= 8'd23,
						KMER_CHANGE					= 8'd24,
						CHECK_JUMP					= 8'd25,
						END							= 8'd26,
						QUERY_READ_2				= 8'd27,
						READ_HAP_TEMP_BUFF 			= 8'd28,
						ALIGN_HAP					= 8'd29,
						GIVE_UP						= 8'd30,
						READ_HAP_TEMP_W_BUFF_WAIT	= 8'd31,
						DISCARD_HAP					= 8'd32,
						ALIGN_HAP_WAIT				= 8'd33,
						DISCARD_HAP_WAIT			= 8'd34,
						TEST_1						= 8'd50;

						
reg								sort_refresh;
reg 							sort_in_valid, sort_in_valid_reg;
reg 							sort_mode;

reg								sort_is_ref, sort_is_ref_n;

reg [`KMER_LENGTH_MAX*2-1:0]	sort_in_suffix;
reg [1:0]						sort_in_BWT;

wire [7:0] 						sort_sel_count;
reg [7:0] 						sort_sel_count_reg, sort_sel_count_n;
wire 	 						sort_sel_path;
reg 							sort_sel_path_reg, sort_sel_path_n;
wire							sort_out_valid;

reg [1:0]						kmer_size, kmer_size_n;
reg [`KMER_LENGTH_MAX*2-1:0]	kmer;
reg [`KMER_LENGTH_MAX*2-1:0]	kmer_qua;
reg [`KMER_LENGTH_MAX*2-1:0]	kmer_assembly;

reg [80*2-1:0]			kmer_source, kmer_source_n, kmer_sink, kmer_sink_n;
reg [7:0]				kmer_sink_ID, kmer_sink_ID_n;

reg [479:0]				mapping_read, mapping_read_n;
reg [31:0]				mapping_loc, mapping_loc_n;
reg [511:0]				mapping_qua, mapping_qua_n;

reg [8:0]				A_READ_SRAM_n;

reg [7:0]				state_n;
reg [9:0]				rotate_counter, rotate_counter_n;
reg [1:0]				kmer_transition;
reg [9:0]				read_count, read_count_n;
reg [1:0]				transition_qua;

wire					bad_quality;

reg						out_of_read_bound;
reg						out_of_active_region;
reg						out_of_ref_bound;

reg [`HAP_MAX_LENGTH*2-1:0]	haplotype, haplotype_n;

wire					trans_A, trans_C, trans_G, trans_T;
wire [2:0]				branch_count;
wire					branch_end;
wire					branch_split;

reg [1033:0]			D_HAP_SRAM_n;
reg [6:0]				A_HAP_SRAM_n;
reg						W_HAP_SRAM_n;

wire [`HAP_TEMP_SRAM_BIT_PER_WORD-1:0]			Q_hap_temp;
reg [`HAP_TEMP_SRAM_BIT_PER_WORD-1:0]			D_hap_temp;
reg [$clog2(`HAP_TEMP_SRAM_WORD_AMOUNT)-1:0]	A_hap_temp;
reg						W_hap_temp;

wire [2047:0]			Q_hap_temp_path;

reg [7:0]				hap_temp_count, hap_temp_count_n;

reg [9:0]				haplotype_length, haplotype_length_n;

reg [9:0]				rotate_counter_add;

reg [7:0]				hap_total_count, hap_total_count_n;
reg [`MAX_HAPLOTYPE_AMOUNT-1:0] hap_total_count_1hot, hap_total_count_1hot_n;

reg [3:0]				temp_transition, temp_transition_n;

reg [1:0]				transition_reg, transition_n;

reg						refresh_detection, in_valid_detection;
reg [`KMER_LENGTH_MAX*2-1:0]			in_kmer_detection;
wire 					exist_detection;
wire [5:0]				kmer_count_detection;

reg						refresh_kmer_label, in_valid_kmer_label;
reg [81*2-1:0]			in_kmer_label;
reg [5:0]				in_label;
wire					exist_label;
wire [5:0]				out_label;
reg [6:0]				align_diff, align_diff_n;

wire [2047:0]			path_out;
wire 					restore_path;
wire [2047:0]			path_content;

wire					read_full_score;

assign					out_valid = (state == END);

assign					trans_A = sort_sel_count_reg[1];	//weight >= 2;
assign					trans_C = sort_sel_count_reg[3];
assign					trans_G = sort_sel_count_reg[5];
assign					trans_T = sort_sel_count_reg[7];

assign					branch_count = (trans_A + trans_C + trans_G + trans_T);
assign					branch_end   = (branch_count == 0);
assign					branch_split = (branch_count > 1);
assign					haplotype_amount_in_region = hap_total_count;
assign					haplotype_amount_in_region_1hot = hap_total_count_1hot;

assign					restore_path = (state == READ_HAP_TEMP_W_BUFF);
assign 					read_full_score	= Q_READ_SRAM[0];

always@(*) begin
	D_HAP_SRAM_n = 0;
	A_HAP_SRAM_n = 0;
	W_HAP_SRAM_n = 0;
	
	if(!manual_rst_n) begin
		D_HAP_SRAM_n = 0;
		A_HAP_SRAM_n = 0;
		W_HAP_SRAM_n = 0;
	end
	else begin
		case(state)
		WRITE_HAP: begin
			D_HAP_SRAM_n = {haplotype, {{`HAP_SRAM_BIT_PER_WORD-`HAP_MAX_LENGTH*2-10}{1'b0}}, haplotype_length};
			A_HAP_SRAM_n = hap_total_count;
			W_HAP_SRAM_n = 1;
		end
		endcase
	end
end

always@(*) begin
	case(kmer_size)
	0: haplotype_length_n = (rotate_counter + 16);
	1: haplotype_length_n = (rotate_counter + 32);
	2: haplotype_length_n = (rotate_counter + 48);
	3: haplotype_length_n = (rotate_counter + 80);
	endcase
end

always@(*) begin
	
	case(kmer_size)
	0: begin
		out_of_read_bound =  (haplotype_length_n >= CONST_read_length);
		out_of_active_region = (mapping_loc + 16 >= active_region_end);
		out_of_ref_bound = (haplotype_length_n >= CONST_active_region_length);
		kmer_assembly = haplotype[16*2-1:0];
	end
	1: begin
		out_of_read_bound =  (haplotype_length_n >= CONST_read_length);
		out_of_active_region = (mapping_loc + 32 >= active_region_end);
		out_of_ref_bound = (haplotype_length_n >= CONST_active_region_length);
		kmer_assembly = haplotype[32*2-1:0];
	end
	2: begin
		out_of_read_bound =  (haplotype_length_n >= CONST_read_length);
		out_of_active_region = (mapping_loc + 48 >= active_region_end);
		out_of_ref_bound = (haplotype_length_n >= CONST_active_region_length);
		kmer_assembly = haplotype[48*2-1:0];
	end
	3: begin
		out_of_read_bound =  (haplotype_length_n >= CONST_read_length);
		out_of_active_region = (mapping_loc + 80 >= active_region_end);
		out_of_ref_bound = (haplotype_length_n >= CONST_active_region_length);
		kmer_assembly = haplotype[80*2-1:0];
	end
	endcase
end

always@(*) begin
	case(kmer_size)
	0: begin
		kmer = mapping_read[479:448];
		kmer_qua = {mapping_qua[511:480], {128{1'b1}} };
		kmer_transition = mapping_read[447:446];
		transition_qua = mapping_qua[479:478];
	end
	1: begin
		kmer = mapping_read[479:416];
		kmer_qua = {mapping_qua[511:448], {96{1'b1}}};
		kmer_transition = mapping_read[415:414];
		transition_qua = mapping_qua[447:446];
	end
	2: begin
		kmer = mapping_read[479:384];
		kmer_qua = {mapping_qua[511:416], {64{1'b1}}};
		kmer_transition = mapping_read[383:382];
		transition_qua = mapping_qua[415:414];
	end
	3: begin
		kmer = mapping_read[479:320];
		kmer_qua = mapping_qua[511:352];
		kmer_transition = mapping_read[319:318];
		transition_qua = mapping_qua[351:350];
	end
	endcase
end

always@(*) begin
	state_n = state;
	
	if(!manual_rst_n) state_n = 0;
	else begin
	
		case(state)
		IDLE:				state_n = in_valid ? CHECK_JUMP : state;
		CHECK_JUMP:			state_n = (read_amount_in_region==0) ? END : FETCH_REF;
		FETCH_REF:			state_n = PUT_SORT_REF;
		PUT_SORT_REF:		state_n = ROTATE_REF_BUF;
		ROTATE_REF_BUF: begin
			if(sort_out_valid) begin
				if(out_of_ref_bound) state_n = sort_is_ref ? SET_READ : FETCH_REF;
				else state_n = PUT_SORT_REF;
			end
		end
		SET_READ:			state_n = (read_count >= read_amount_in_region) ? QUERY_TRAN : QUERY_READ;
		QUERY_READ:			state_n = QUERY_READ_2;
		QUERY_READ_2:		state_n = FETCH_READ;
		FETCH_READ:			state_n = read_full_score ? SET_READ : PUT_SORT_READ;
		PUT_SORT_READ:		state_n = ROTATE_READ_BUF;
		ROTATE_READ_BUF: begin
			if(sort_in_valid_reg) begin
				if(sort_out_valid) begin
					state_n = (out_of_read_bound || out_of_active_region) ? SET_READ : PUT_SORT_READ;
				end
			end
			else state_n = (out_of_read_bound || out_of_active_region) ? SET_READ : PUT_SORT_READ;
		end
		QUERY_TRAN:			state_n = QUERY_HAP;
		QUERY_HAP: begin
			if(kmer_assembly == kmer_sink) state_n = ALIGN_HAP_WAIT;
			else if(haplotype_length >= `HAP_MAX_LENGTH) state_n = DISCARD_HAP_WAIT;
			else state_n = QUERY_HAP_WAIT;
		end
		QUERY_HAP_WAIT: 	state_n = sort_out_valid ? ASSEMBLY : state;
		ASSEMBLY: begin
			if(sort_sel_path_reg) 	state_n = (kmer_size == 3) ? GIVE_UP : KMER_CHANGE;
			else if(kmer_assembly == kmer_sink)	state_n = ALIGN_HAP;
			else if(branch_end) 	state_n = (hap_temp_count==0) ? END : DISCARD_HAP;
			else if(branch_split)	state_n = BRANCH;
			else					state_n = QUERY_HAP;
		end
		ALIGN_HAP_WAIT:		state_n = sort_out_valid ? ALIGN_HAP : state;
		ALIGN_HAP: 			state_n = (align_diff == 0) ? WRITE_HAP : ALIGN_HAP;
		DISCARD_HAP_WAIT:	state_n = sort_out_valid ? DISCARD_HAP : state;
		DISCARD_HAP:		state_n = (hap_temp_count==0) ? END : READ_HAP_TEMP_BUFF;
		WRITE_HAP: 			state_n = (hap_temp_count==0) ? END : READ_HAP_TEMP_BUFF;
		READ_HAP_TEMP_BUFF:	state_n = READ_HAP_TEMP;
		READ_HAP_TEMP:		state_n = READ_HAP_TEMP_W;
		READ_HAP_TEMP_W:	state_n = READ_HAP_TEMP_W_BUFF;
		READ_HAP_TEMP_W_BUFF:	state_n = READ_HAP_TEMP_W_BUFF_WAIT;
		READ_HAP_TEMP_W_BUFF_WAIT: state_n = sort_out_valid ? READ_HAP_TEMP_W1 : state;
		READ_HAP_TEMP_W1: begin
		
			case(transition_reg)
			2'b00: begin
				if(temp_transition[2]) 		state_n = READ_HAP_TEMP_WC;
				else if(temp_transition[1]) state_n = READ_HAP_TEMP_WG;
				else if(temp_transition[0]) state_n = READ_HAP_TEMP_WT;
				else 						state_n = END;
			end
			2'b01: begin
				if(temp_transition[1]) 		state_n = READ_HAP_TEMP_WG;
				else if(temp_transition[0]) state_n = READ_HAP_TEMP_WT;
				else 						state_n = END;
			end
			2'b10: begin
				if(temp_transition[0]) 		state_n = READ_HAP_TEMP_WT;
				else 						state_n = END;
			end
			2'b11: 							state_n = END;
			endcase
		end
		READ_HAP_TEMP_WC:	state_n = QUERY_HAP;
		READ_HAP_TEMP_WG:	state_n = QUERY_HAP;
		READ_HAP_TEMP_WT:	state_n = QUERY_HAP;
		BRANCH:				state_n = QUERY_HAP;
		END:				state_n = IDLE;
		KMER_CHANGE:		state_n = FETCH_REF;
		GIVE_UP:			state_n = END;
		endcase
	
	end
end

always@(*) begin
	hap_total_count_n = hap_total_count;
	hap_total_count_1hot_n = hap_total_count_1hot;
	if(!manual_rst_n) begin
		hap_total_count_n = 0;
		hap_total_count_1hot_n = 0;
	end else begin
		case(state)
		IDLE, KMER_CHANGE, GIVE_UP:	begin
			hap_total_count_n = 0;
			hap_total_count_1hot_n = 0;
		end
		WRITE_HAP: begin
			hap_total_count_n = hap_total_count + 1'b1;
			hap_total_count_1hot_n = {hap_total_count_1hot, 1'b1};
		end
		endcase
	end
end

always@(*) begin
	kmer_size_n = kmer_size;
	
	if(!manual_rst_n) kmer_size_n = 0;
	else begin
		case(state)
		IDLE: 			kmer_size_n = 0;
		KMER_CHANGE:	kmer_size_n = kmer_size + 1'b1;
		endcase
	end
end

always@(posedge clk) begin
	if(!rst_n) sort_in_valid_reg	<= 0;
	else begin
		case(state)
		PUT_SORT_REF, PUT_SORT_READ: sort_in_valid_reg	<= sort_in_valid;
		endcase
	end
end

always@(*) begin

	sort_refresh = 0;
	sort_in_valid = 0;
	sort_mode = 0;
	
	sort_in_suffix = kmer;
	sort_in_BWT = 0;
	
	case(state)
	PUT_SORT_REF: begin
		sort_in_valid = 1;
		sort_mode = 0;	//Build
		
		sort_in_suffix = kmer;
		sort_in_BWT = kmer_transition;
	end
	ROTATE_REF_BUF, ROTATE_READ_BUF: begin
		sort_in_BWT = kmer_transition;
	end
	PUT_SORT_READ: begin
		sort_in_valid = (~(out_of_read_bound || out_of_active_region)) && (~bad_quality) ;
		sort_mode = 0;	//Build
		
		sort_in_suffix = kmer;
		sort_in_BWT = kmer_transition;
	end
	QUERY_HAP: begin
		sort_in_valid = 1;
		sort_mode = 1;	//Query
		
		sort_in_suffix = kmer_assembly;
		sort_in_BWT = 0;
	end
	QUERY_HAP_WAIT: begin
		sort_in_suffix = kmer_assembly;
	end
	KMER_CHANGE, END: begin
		sort_refresh = 1;
	end
	endcase

end

always@(*) begin
	read_count_n = read_count;
	
	if(!manual_rst_n) read_count_n = 0;
	else begin
		case(state)
		IDLE, KMER_CHANGE: read_count_n = 0;
		SET_READ: read_count_n = read_count + 1'b1;
		endcase
	end
end

always@(*) begin
	A_READ_SRAM_n = 0;
	
	if(!manual_rst_n) 	A_READ_SRAM_n = 0;
	else begin
		case(state)
		IDLE: 			A_READ_SRAM_n = 0;
		KMER_CHANGE:	A_READ_SRAM_n = 0;
		SET_READ: 		A_READ_SRAM_n = read_count + 1'b1;
		endcase
	end
	
end

always@(*) begin
	rotate_counter_n = rotate_counter;
	
	if(!manual_rst_n) rotate_counter_n = 0;
	else begin
		case(state)
		FETCH_READ, FETCH_REF, QUERY_TRAN: 	rotate_counter_n = 0;
		PUT_SORT_REF, PUT_SORT_READ: 		rotate_counter_n = rotate_counter + 1'b1;
		ASSEMBLY: 							rotate_counter_n = rotate_counter + 1'b1;
		READ_HAP_TEMP_W_BUFF:				rotate_counter_n = Q_hap_temp[`HAP_MAX_LENGTH*2+9:`HAP_MAX_LENGTH*2];
		KMER_CHANGE:						rotate_counter_n = 0;
		endcase
	end
end

always@(*) begin
	mapping_read_n = mapping_read;
	mapping_loc_n = mapping_loc;
	mapping_qua_n = mapping_qua;
	
	if(!manual_rst_n) begin
		mapping_read_n = 0;
		mapping_loc_n = 0;
		mapping_qua_n = 0;
	end
	else begin
		case(state)
		FETCH_REF, FETCH_READ: begin
			mapping_read_n = Q_READ_SRAM[1023:512+32];
			mapping_loc_n = Q_READ_SRAM[512+31:512];
			mapping_qua_n = Q_READ_SRAM[511:0];
		end
		ROTATE_REF_BUF: begin
			if(sort_out_valid) begin
				mapping_read_n = {mapping_read, mapping_loc[31:30]};
				mapping_loc_n = {mapping_loc, mapping_qua[511:510]};
				mapping_qua_n = (mapping_qua << 2);
			end
		end
		ROTATE_READ_BUF: begin
			if(state_n == PUT_SORT_READ) begin
				mapping_read_n = (mapping_read << 2);
				mapping_loc_n = mapping_loc + 1'b1;
				mapping_qua_n = (mapping_qua << 2);
			end
		end
		endcase
	end
end

always@(*) begin
	haplotype_n = haplotype;
	temp_transition_n = temp_transition;
	transition_n = transition_reg;
	
	if(!manual_rst_n) begin
		haplotype_n = 0;
		temp_transition_n = 0;
		transition_n = 0;
	end
	else begin
		case(state)
		KMER_CHANGE: begin
			haplotype_n	= 0;
			temp_transition_n = 0;
			transition_n = 0;
		end
		FETCH_REF: begin
			case(kmer_size)
			0: haplotype_n = mapping_read_n[479:448];
			1: haplotype_n = mapping_read_n[479:416];
			2: haplotype_n = mapping_read_n[479:384];
			3: haplotype_n = mapping_read_n[479:320];
			endcase
		end
		ASSEMBLY: begin
			if(!branch_end) begin
				if(trans_A) 		haplotype_n = {haplotype, 2'b00};
				else if(trans_C) 	haplotype_n = {haplotype, 2'b01};
				else if(trans_G) 	haplotype_n = {haplotype, 2'b10};
				else 				haplotype_n = {haplotype, 2'b11};
			end
		end
		READ_HAP_TEMP_W_BUFF: begin
			haplotype_n 		= Q_hap_temp[`HAP_MAX_LENGTH*2-1:2];
			temp_transition_n 	= Q_hap_temp[`HAP_TEMP_SRAM_BIT_PER_WORD-1:`HAP_TEMP_SRAM_BIT_PER_WORD-4];
			transition_n 		= Q_hap_temp[1:0];
		end
		ALIGN_HAP: begin
			if(align_diff[6]) haplotype_n = (haplotype << 128);
			else if(align_diff[5]) haplotype_n = (haplotype << 64);
			else if(align_diff[4]) haplotype_n = (haplotype << 32);
			else if(align_diff[3]) haplotype_n = (haplotype << 16);
			else if(align_diff[2]) haplotype_n = (haplotype << 8);
			else if(align_diff[1]) haplotype_n = (haplotype << 4);
			else if(align_diff[0]) haplotype_n = (haplotype << 2);
		end
		READ_HAP_TEMP_WC: 			haplotype_n = {haplotype, 2'b01};
		READ_HAP_TEMP_WG: 			haplotype_n = {haplotype, 2'b10};
		READ_HAP_TEMP_WT: 			haplotype_n = {haplotype, 2'b11};
		endcase
	end
end

always@(*) begin
	hap_temp_count_n 	= hap_temp_count;
	A_hap_temp 			= 0;
	D_hap_temp			= 0;
	W_hap_temp			= 0;
	
	if(!manual_rst_n) begin
		hap_temp_count_n		= 0;
		A_hap_temp				= 0;
		D_hap_temp				= 0;
		W_hap_temp				= 0;
	end
	else begin
		case(state)
		IDLE, KMER_CHANGE: begin
			hap_temp_count_n	= 0;
		end
		BRANCH: begin
			hap_temp_count_n	= hap_temp_count + 1'b1;
			A_hap_temp			= hap_temp_count;
			D_hap_temp			= {trans_A, trans_C, trans_G, trans_T, rotate_counter, haplotype};
			W_hap_temp			= 1;
		end
		WRITE_HAP, DISCARD_HAP: begin
			hap_temp_count_n	= hap_temp_count - 1'b1;
		end
		READ_HAP_TEMP: begin
			A_hap_temp			= hap_temp_count;
			W_hap_temp			= 0;
		end
		endcase
	end
end

always@(*) begin
	align_diff_n = align_diff;
	
	if(!manual_rst_n) align_diff_n = 0;
	else begin
		case(state)
		KMER_CHANGE: align_diff_n = 0;
		QUERY_HAP, ASSEMBLY: align_diff_n = (kmer_assembly == kmer_sink) ? ((`HAP_MAX_LENGTH-1)-haplotype_length) : align_diff;
		ALIGN_HAP: begin
			if(align_diff[6]) align_diff_n[6] = 0;
			else if(align_diff[5]) align_diff_n[5] = 0;
			else if(align_diff[4]) align_diff_n[4] = 0;
			else if(align_diff[3]) align_diff_n[3] = 0;
			else if(align_diff[2]) align_diff_n[2] = 0;
			else if(align_diff[1]) align_diff_n[1] = 0;
			else if(align_diff[0]) align_diff_n[0] = 0;
		end
		endcase
	end
	
end

always@(*) begin
	sort_is_ref_n = sort_is_ref;

	if(!manual_rst_n) sort_is_ref_n = 0;
	else if(sort_refresh) sort_is_ref_n = 0;
	else if(state == ROTATE_REF_BUF) begin
		if(sort_out_valid) sort_is_ref_n = out_of_ref_bound ? 1 : sort_is_ref;
	end
end

always@(*) begin
	kmer_source_n	= kmer_source;
	kmer_sink_n		= kmer_sink;
	kmer_sink_ID_n	= kmer_sink_ID;
	
	if(!manual_rst_n) begin
		kmer_source_n	= 0;
		kmer_sink_n		= 0;
		kmer_sink_ID_n	= 0;
	end
	else begin
		case(state)
		FETCH_REF: begin
			case(kmer_size)
			0: begin
				kmer_source_n	= Q_READ_SRAM[1023-:32];
				kmer_sink_n		= Q_READ_SRAM[424+16*2-1:424];
			end
			1: begin
				kmer_source_n	= Q_READ_SRAM[1023-:64];
				kmer_sink_n		= Q_READ_SRAM[424+32*2-1:424];
			end
			2: begin
				kmer_source_n	= Q_READ_SRAM[1023-:96];
				kmer_sink_n		= Q_READ_SRAM[424+48*2-1:424];
			end
			3: begin
				kmer_source_n	= Q_READ_SRAM[1023-:160];
				kmer_sink_n		= Q_READ_SRAM[424+80*2-1:424];
			end
			endcase
		end
		endcase
	end
end

always@(*) begin
	sort_sel_path_n		= sort_sel_path_reg;
	sort_sel_count_n	= sort_sel_count_reg;
	
	if(!manual_rst_n) begin
		sort_sel_path_n	= 0;
		sort_sel_count_n= 0;
	end
	else if(sort_out_valid) begin
		sort_sel_path_n	= sort_sel_path;
		sort_sel_count_n= sort_sel_count;
	end
end

always@(posedge clk) begin
	if(!rst_n) begin
		kmer_size				<= 0;		
		state 					<= 0;
		mapping_read			<= 0;
		mapping_loc				<= 0;
		mapping_qua				<= 0;
		A_READ_SRAM				<= 0;
		rotate_counter			<= 0;
		read_count				<= 0;
		haplotype				<= 0;
		hap_temp_count			<= 0;
		haplotype_length		<= 0;
		D_HAP_SRAM				<= 0;
		A_HAP_SRAM				<= 0;
		W_HAP_SRAM				<= 0;
		hap_total_count			<= 0;
		hap_total_count_1hot	<= 0;
		temp_transition			<= 0;
		transition_reg			<= 0;
		kmer_source				<= 0;
		kmer_sink				<= 0;
		kmer_sink_ID			<= 0;
		align_diff				<= 0;
		sort_is_ref				<= 0;
		sort_sel_count_reg		<= 0;
		sort_sel_path_reg		<= 0;
	end
	else begin
		kmer_size				<= kmer_size_n;
		state 					<= state_n;
		mapping_read			<= mapping_read_n;
		mapping_loc				<= mapping_loc_n;
		mapping_qua				<= mapping_qua_n;
		A_READ_SRAM				<= A_READ_SRAM_n;
		rotate_counter			<= rotate_counter_n;
		read_count				<= read_count_n;
		haplotype				<= haplotype_n;
		hap_temp_count			<= hap_temp_count_n;
		haplotype_length		<= haplotype_length_n;
		D_HAP_SRAM				<= D_HAP_SRAM_n;
		A_HAP_SRAM				<= A_HAP_SRAM_n;
		W_HAP_SRAM				<= W_HAP_SRAM_n;
		hap_total_count			<= hap_total_count_n;
		hap_total_count_1hot	<= hap_total_count_1hot_n;
		temp_transition			<= temp_transition_n;
		transition_reg			<= transition_n;
		kmer_source				<= kmer_source_n;
		kmer_sink				<= kmer_sink_n;
		kmer_sink_ID			<= kmer_sink_ID_n;
		align_diff				<= align_diff_n;
		sort_is_ref				<= sort_is_ref_n;
		sort_sel_count_reg		<= sort_sel_count_n;
		sort_sel_path_reg		<= sort_sel_path_n;
	end

end

Quality_Check Q_Check(
.kmer_qua(kmer_qua),
.kmer_size(kmer_size),

.transition_qua(transition_qua),

.bad_quality(bad_quality)
);

GATK_Hap_Temp_SRAM Haplotye_Temp(
.clka	(clk),
.douta		(Q_hap_temp),
.dina	(D_hap_temp),
.addra(A_hap_temp),
.wea	(W_hap_temp)
);

GATK_Hap_Temp_Path_SRAM Haplotye_Temp_Path(
.clka	(clk),
.douta		(Q_hap_temp_path),
.dina	(path_out),
.addra(A_hap_temp),
.wea	(W_hap_temp)
);


Graph_TOP	graph(
.clk			(clk),
.rst_n			(rst_n),
.refresh		(sort_refresh),
.in_valid		(sort_in_valid),
.mode			(sort_mode),

.in_suffix		(sort_in_suffix),
.in_sel			(sort_in_BWT),

.out_valid		(sort_out_valid),

.sel_count		(sort_sel_count),
.sel_path		(sort_sel_path),

.path_out_all	(path_out),

.restore_path	(restore_path),
.path_in		(Q_hap_temp_path)
);


endmodule




module Quality_Check (
input [80*2-1:0] kmer_qua,
input [1:0] kmer_size,

input [1:0] transition_qua,

output reg bad_quality
	
);

wire [79:0] bad_q;

wire k0_bad, k1_bad, k2_bad, k3_bad;

wire [15:0] k0_range_sel = bad_q[15:0];
wire [15:0] k1_range_sel = bad_q[31:16];
wire [15:0] k2_range_sel = bad_q[47:32];
wire [31:0] k3_range_sel = bad_q[79:48];

genvar i;
generate
	for(i=0;i<80;i=i+1) begin: quality_check
		assign bad_q[i] = (kmer_qua[159-i*2:158-i*2] == 2'b00);
	end
endgenerate

assign k0_bad = |k0_range_sel;
assign k1_bad = |k1_range_sel;
assign k2_bad = |k2_range_sel;
assign k3_bad = |k3_range_sel;

always@(*) begin

	bad_quality = 0;

	if(transition_qua == 2'b00)	bad_quality = 1;
	else begin
		case(kmer_size)
		0: bad_quality = k0_bad;
		1: bad_quality = k0_bad | k1_bad;
		2: bad_quality = k0_bad | k1_bad | k2_bad;
		3: bad_quality = k0_bad | k1_bad | k2_bad | k3_bad;
		endcase
	end
end

endmodule
//mode
//0: build de Bruijn graph
//1: query de Bruijn graph

module Graph_TOP(
input clk,
input rst_n,
input refresh,
input in_valid,
input mode,

input [2*`KMER_LENGTH_MAX-1:0] in_suffix,
input [1:0] in_sel,

output out_valid,

output [7:0] sel_count,
output sel_path,

output [2047:0] path_out_all,

input restore_path,
input [2047:0] path_in

);

parameter			IDLE			= 4'd0,
					QUERY_64		= 4'd2,
					QUERY_PE		= 4'd3,
					QUERY_64_BACK	= 4'd4,
					QUERY_TOP_BACK	= 4'd5,
					OUTPUT			= 4'd6,
					BUILD			= 4'd7,
					RESTORE_64		= 4'd8,
					RESTORE_PE		= 4'd9;

reg [3:0] state, state_n;
reg [2047:0] path_in_reg, path_in_n;
reg empty, empty_n;
wire [2047:0] target_all;

reg mode_reg, mode_n;

reg kmer_exist;

reg in_valid_circuit, mode_circuit, in_path_circuit;
reg kmer_exist_reg;

assign out_valid = (state == OUTPUT);

always@(*) begin
	path_in_n					= path_in_reg;
	
	if(restore_path) path_in_n	= path_in;
end

always@(*) begin
	state_n						= state;
	in_valid_circuit			= 0;
	mode_circuit				= 0;
	in_path_circuit				= 0;
	kmer_exist					= kmer_exist_reg;
	
	case(state)
	IDLE: begin
		if(in_valid) state_n	= QUERY_64;
		else if(restore_path) state_n = RESTORE_64;
	end
	QUERY_64: begin
		state_n			= QUERY_PE;
		in_path_circuit	= mode_reg;
	end
	QUERY_PE: state_n			= QUERY_64_BACK;
	QUERY_64_BACK: begin
		state_n					= QUERY_TOP_BACK;
		kmer_exist				= (|target_all);
	end
	QUERY_TOP_BACK: begin
		if(mode_reg) state_n	= OUTPUT;
		else state_n			= BUILD;
	end
	OUTPUT: state_n 			= IDLE;
	BUILD: begin
		state_n					= OUTPUT;
		in_valid_circuit		= 1;
		mode_circuit			= kmer_exist_reg;
	end
	RESTORE_64: state_n 		= RESTORE_PE;
	RESTORE_PE: state_n 		= OUTPUT;
	endcase
end

always@(*) begin
	mode_n						= mode_reg;
	
	if(refresh | out_valid) mode_n = 0;
	else if(in_valid) mode_n	= mode;
end

always@(*) begin
	empty_n						= empty;	
	
	if(refresh) empty_n			= 1;
	else if(out_valid) empty_n 	= 0;
end

always@(posedge clk) begin
	if(!rst_n) begin
		state			<= 0;
		empty			<= 1;
		kmer_exist_reg	<= 0;
		mode_reg		<= 0;
		path_in_reg		<= 0;
	end
	else begin
		state			<= state_n;
		empty			<= empty_n;
		kmer_exist_reg	<= kmer_exist;
		mode_reg		<= mode_n;
		path_in_reg		<= path_in_n;
	end
end

PE_graph_2048x 	Graph_2048x(
.clk			(clk),
.rst_n			(rst_n),
.refresh		(refresh),
.in_valid		(in_valid_circuit),
.mode			(mode_circuit),

.in_suffix		(in_suffix),
.in_sel			(in_sel),
.in_path		(in_path_circuit),		//updated path: 1=queried
.pre_end		(empty),

.target_all		(target_all),			//reged
.out_count		(sel_count),			//reged
.out_path		(sel_path),				//reged
.out_path_all	(path_out_all),			//reged

.restore_path	(restore_path),
.path			(path_in_reg)
);

endmodule


module PE_graph_2048x (
input clk,
input rst_n,
input refresh,
input in_valid,
input mode,

input [2*`KMER_LENGTH_MAX-1:0] in_suffix,
input [1:0] in_sel,
input in_path,
input pre_end,

output [2047:0] target_all,
output reg [7:0] out_count,
output reg out_path,
output [2047:0] out_path_all,

input restore_path,
input [2047:0] path
);

reg refresh_reg, in_valid_reg, mode_reg;
reg [2*`KMER_LENGTH_MAX-1:0] in_suffix_reg;
reg [1:0] in_sel_reg;
reg in_path_reg;
reg restore_path_reg;

wire pre_end_n[0:32];
wire [31:0] is_target_n;

wire [7:0] out_count_n[0:31];
reg [7:0] out_count_sel;

wire out_path_n[0:31];

reg out_path_sel;
reg pre_end_reg;

assign pre_end_n[0] = pre_end_reg;

always@(*) begin
	out_count_sel 		= 0;
	out_path_sel		= 0;
	
	case(1'b1)
	is_target_n[ 0]: begin out_count_sel = out_count_n[ 0]; out_path_sel = out_path_n[ 0];  end
	is_target_n[ 1]: begin out_count_sel = out_count_n[ 1]; out_path_sel = out_path_n[ 1];  end
	is_target_n[ 2]: begin out_count_sel = out_count_n[ 2]; out_path_sel = out_path_n[ 2];  end
	is_target_n[ 3]: begin out_count_sel = out_count_n[ 3]; out_path_sel = out_path_n[ 3];  end
	is_target_n[ 4]: begin out_count_sel = out_count_n[ 4]; out_path_sel = out_path_n[ 4];  end
	is_target_n[ 5]: begin out_count_sel = out_count_n[ 5]; out_path_sel = out_path_n[ 5];  end
	is_target_n[ 6]: begin out_count_sel = out_count_n[ 6]; out_path_sel = out_path_n[ 6];  end
	is_target_n[ 7]: begin out_count_sel = out_count_n[ 7]; out_path_sel = out_path_n[ 7];  end
	is_target_n[ 8]: begin out_count_sel = out_count_n[ 8]; out_path_sel = out_path_n[ 8];  end
	is_target_n[ 9]: begin out_count_sel = out_count_n[ 9]; out_path_sel = out_path_n[ 9];  end
	is_target_n[10]: begin out_count_sel = out_count_n[10]; out_path_sel = out_path_n[10];  end
	is_target_n[11]: begin out_count_sel = out_count_n[11]; out_path_sel = out_path_n[11];  end
	is_target_n[12]: begin out_count_sel = out_count_n[12]; out_path_sel = out_path_n[12];  end
	is_target_n[13]: begin out_count_sel = out_count_n[13]; out_path_sel = out_path_n[13];  end
	is_target_n[14]: begin out_count_sel = out_count_n[14]; out_path_sel = out_path_n[14];  end
	is_target_n[15]: begin out_count_sel = out_count_n[15]; out_path_sel = out_path_n[15];  end
	is_target_n[16]: begin out_count_sel = out_count_n[16]; out_path_sel = out_path_n[16];  end
	is_target_n[17]: begin out_count_sel = out_count_n[17]; out_path_sel = out_path_n[17];  end
	is_target_n[18]: begin out_count_sel = out_count_n[18]; out_path_sel = out_path_n[18];  end
	is_target_n[19]: begin out_count_sel = out_count_n[19]; out_path_sel = out_path_n[19];  end
	is_target_n[20]: begin out_count_sel = out_count_n[20]; out_path_sel = out_path_n[20];  end
	is_target_n[21]: begin out_count_sel = out_count_n[21]; out_path_sel = out_path_n[21];  end
	is_target_n[22]: begin out_count_sel = out_count_n[22]; out_path_sel = out_path_n[22];  end
	is_target_n[23]: begin out_count_sel = out_count_n[23]; out_path_sel = out_path_n[23];  end
	is_target_n[24]: begin out_count_sel = out_count_n[24]; out_path_sel = out_path_n[24];  end
	is_target_n[25]: begin out_count_sel = out_count_n[25]; out_path_sel = out_path_n[25];  end
	is_target_n[26]: begin out_count_sel = out_count_n[26]; out_path_sel = out_path_n[26];  end
	is_target_n[27]: begin out_count_sel = out_count_n[27]; out_path_sel = out_path_n[27];  end
	is_target_n[28]: begin out_count_sel = out_count_n[28]; out_path_sel = out_path_n[28];  end
	is_target_n[29]: begin out_count_sel = out_count_n[29]; out_path_sel = out_path_n[29];  end
	is_target_n[30]: begin out_count_sel = out_count_n[30]; out_path_sel = out_path_n[30];  end
	is_target_n[31]: begin out_count_sel = out_count_n[31]; out_path_sel = out_path_n[31];  end
	endcase
end

genvar i;
generate

	for(i=0;i<32;i=i+1) begin: parallel_pe_graph
		PE_graph_64x pe_graph_64x(
		.clk			(clk),
		.rst_n			(rst_n),
		.refresh		(refresh_reg),
		.in_valid		(in_valid_reg),
		.mode			(mode_reg),
		
		.in_suffix		(in_suffix_reg),
		.in_sel			(in_sel_reg),
		.in_path		(in_path_reg),
		.pre_end		(pre_end_n[i]),
		
		.is_end			(pre_end_n[i+1]),
		.is_target		(is_target_n[i]),
		.target_all		(target_all[(2047-i*64)-:64]),
		.out_count		(out_count_n[i]),
		.out_path		(out_path_n[i]),
		.out_path_all	(out_path_all[(2047-i*64)-:64]),
		
		.restore_path	(restore_path_reg),
		.path			(path[(2047-i*64)-:64])
		);
	end

endgenerate

always@(posedge clk) begin
	if(!rst_n) begin
		refresh_reg			<= 0;
		in_valid_reg		<= 0;
		mode_reg			<= 0;
		in_suffix_reg		<= {(2*`KMER_LENGTH_MAX){1'b1}};
		in_sel_reg			<= 0;
		in_path_reg			<= 0;
		restore_path_reg	<= 0;
		out_count			<= 0;
		out_path			<= 0;
		pre_end_reg			<= 0;
	end
	else begin
		refresh_reg			<= refresh;
		in_valid_reg		<= in_valid;
		mode_reg			<= mode;
		in_suffix_reg		<= in_suffix;
		in_sel_reg			<= in_sel;
		in_path_reg			<= in_path;
		restore_path_reg	<= restore_path;
		out_count			<= out_count_sel;
		out_path			<= out_path_sel;
		pre_end_reg			<= pre_end;
	end
end

endmodule


module PE_graph_64x (
input clk,
input rst_n,
input refresh,
input in_valid,
input mode,

input [2*`KMER_LENGTH_MAX-1:0] in_suffix,
input [1:0] in_sel,
input in_path,
input pre_end,

output is_end,
output reg is_target,
output [63:0] target_all,
output reg [7:0] out_count,
output reg out_path,
output [63:0] out_path_all,

input restore_path,
input [63:0] path
);

reg refresh_reg, in_valid_reg, mode_reg;
reg [2*`KMER_LENGTH_MAX-1:0] in_suffix_reg;
reg [1:0] in_sel_reg;
reg in_path_reg;
reg restore_path_reg;

wire pre_end_n[0:64];
wire [63:0] is_target_n;

wire [7:0] out_count_n[0:63];
reg [7:0] out_count_sel;

reg out_path_sel;
reg pre_end_reg;

assign pre_end_n[0] = pre_end_reg;
assign is_end = pre_end_n[64];
assign target_all = is_target_n;

always@(*) begin
	out_count_sel 		= 0;
	out_path_sel		= 0;
	
	case(1'b1)
	is_target_n[ 0]: begin out_count_sel = out_count_n[ 0]; out_path_sel = out_path_all[63- 0];  end
	is_target_n[ 1]: begin out_count_sel = out_count_n[ 1]; out_path_sel = out_path_all[63- 1];  end
	is_target_n[ 2]: begin out_count_sel = out_count_n[ 2]; out_path_sel = out_path_all[63- 2];  end
	is_target_n[ 3]: begin out_count_sel = out_count_n[ 3]; out_path_sel = out_path_all[63- 3];  end
	is_target_n[ 4]: begin out_count_sel = out_count_n[ 4]; out_path_sel = out_path_all[63- 4];  end
	is_target_n[ 5]: begin out_count_sel = out_count_n[ 5]; out_path_sel = out_path_all[63- 5];  end
	is_target_n[ 6]: begin out_count_sel = out_count_n[ 6]; out_path_sel = out_path_all[63- 6];  end
	is_target_n[ 7]: begin out_count_sel = out_count_n[ 7]; out_path_sel = out_path_all[63- 7];  end
	is_target_n[ 8]: begin out_count_sel = out_count_n[ 8]; out_path_sel = out_path_all[63- 8];  end
	is_target_n[ 9]: begin out_count_sel = out_count_n[ 9]; out_path_sel = out_path_all[63- 9];  end
	is_target_n[10]: begin out_count_sel = out_count_n[10]; out_path_sel = out_path_all[63-10];  end
	is_target_n[11]: begin out_count_sel = out_count_n[11]; out_path_sel = out_path_all[63-11];  end
	is_target_n[12]: begin out_count_sel = out_count_n[12]; out_path_sel = out_path_all[63-12];  end
	is_target_n[13]: begin out_count_sel = out_count_n[13]; out_path_sel = out_path_all[63-13];  end
	is_target_n[14]: begin out_count_sel = out_count_n[14]; out_path_sel = out_path_all[63-14];  end
	is_target_n[15]: begin out_count_sel = out_count_n[15]; out_path_sel = out_path_all[63-15];  end
	is_target_n[16]: begin out_count_sel = out_count_n[16]; out_path_sel = out_path_all[63-16];  end
	is_target_n[17]: begin out_count_sel = out_count_n[17]; out_path_sel = out_path_all[63-17];  end
	is_target_n[18]: begin out_count_sel = out_count_n[18]; out_path_sel = out_path_all[63-18];  end
	is_target_n[19]: begin out_count_sel = out_count_n[19]; out_path_sel = out_path_all[63-19];  end
	is_target_n[20]: begin out_count_sel = out_count_n[20]; out_path_sel = out_path_all[63-20];  end
	is_target_n[21]: begin out_count_sel = out_count_n[21]; out_path_sel = out_path_all[63-21];  end
	is_target_n[22]: begin out_count_sel = out_count_n[22]; out_path_sel = out_path_all[63-22];  end
	is_target_n[23]: begin out_count_sel = out_count_n[23]; out_path_sel = out_path_all[63-23];  end
	is_target_n[24]: begin out_count_sel = out_count_n[24]; out_path_sel = out_path_all[63-24];  end
	is_target_n[25]: begin out_count_sel = out_count_n[25]; out_path_sel = out_path_all[63-25];  end
	is_target_n[26]: begin out_count_sel = out_count_n[26]; out_path_sel = out_path_all[63-26];  end
	is_target_n[27]: begin out_count_sel = out_count_n[27]; out_path_sel = out_path_all[63-27];  end
	is_target_n[28]: begin out_count_sel = out_count_n[28]; out_path_sel = out_path_all[63-28];  end
	is_target_n[29]: begin out_count_sel = out_count_n[29]; out_path_sel = out_path_all[63-29];  end
	is_target_n[30]: begin out_count_sel = out_count_n[30]; out_path_sel = out_path_all[63-30];  end
	is_target_n[31]: begin out_count_sel = out_count_n[31]; out_path_sel = out_path_all[63-31];  end
	is_target_n[32]: begin out_count_sel = out_count_n[32]; out_path_sel = out_path_all[63-32];  end
	is_target_n[33]: begin out_count_sel = out_count_n[33]; out_path_sel = out_path_all[63-33];  end
	is_target_n[34]: begin out_count_sel = out_count_n[34]; out_path_sel = out_path_all[63-34];  end
	is_target_n[35]: begin out_count_sel = out_count_n[35]; out_path_sel = out_path_all[63-35];  end
	is_target_n[36]: begin out_count_sel = out_count_n[36]; out_path_sel = out_path_all[63-36];  end
	is_target_n[37]: begin out_count_sel = out_count_n[37]; out_path_sel = out_path_all[63-37];  end
	is_target_n[38]: begin out_count_sel = out_count_n[38]; out_path_sel = out_path_all[63-38];  end
	is_target_n[39]: begin out_count_sel = out_count_n[39]; out_path_sel = out_path_all[63-39];  end
	is_target_n[40]: begin out_count_sel = out_count_n[40]; out_path_sel = out_path_all[63-40];  end
	is_target_n[41]: begin out_count_sel = out_count_n[41]; out_path_sel = out_path_all[63-41];  end
	is_target_n[42]: begin out_count_sel = out_count_n[42]; out_path_sel = out_path_all[63-42];  end
	is_target_n[43]: begin out_count_sel = out_count_n[43]; out_path_sel = out_path_all[63-43];  end
	is_target_n[44]: begin out_count_sel = out_count_n[44]; out_path_sel = out_path_all[63-44];  end
	is_target_n[45]: begin out_count_sel = out_count_n[45]; out_path_sel = out_path_all[63-45];  end
	is_target_n[46]: begin out_count_sel = out_count_n[46]; out_path_sel = out_path_all[63-46];  end
	is_target_n[47]: begin out_count_sel = out_count_n[47]; out_path_sel = out_path_all[63-47];  end
	is_target_n[48]: begin out_count_sel = out_count_n[48]; out_path_sel = out_path_all[63-48];  end
	is_target_n[49]: begin out_count_sel = out_count_n[49]; out_path_sel = out_path_all[63-49];  end	
	is_target_n[50]: begin out_count_sel = out_count_n[50]; out_path_sel = out_path_all[63-50];  end
	is_target_n[51]: begin out_count_sel = out_count_n[51]; out_path_sel = out_path_all[63-51];  end
	is_target_n[52]: begin out_count_sel = out_count_n[52]; out_path_sel = out_path_all[63-52];  end
	is_target_n[53]: begin out_count_sel = out_count_n[53]; out_path_sel = out_path_all[63-53];  end
	is_target_n[54]: begin out_count_sel = out_count_n[54]; out_path_sel = out_path_all[63-54];  end
	is_target_n[55]: begin out_count_sel = out_count_n[55]; out_path_sel = out_path_all[63-55];  end
	is_target_n[56]: begin out_count_sel = out_count_n[56]; out_path_sel = out_path_all[63-56];  end
	is_target_n[57]: begin out_count_sel = out_count_n[57]; out_path_sel = out_path_all[63-57];  end
	is_target_n[58]: begin out_count_sel = out_count_n[58]; out_path_sel = out_path_all[63-58];  end
	is_target_n[59]: begin out_count_sel = out_count_n[59]; out_path_sel = out_path_all[63-59];  end
	is_target_n[60]: begin out_count_sel = out_count_n[60]; out_path_sel = out_path_all[63-60];  end
	is_target_n[61]: begin out_count_sel = out_count_n[61]; out_path_sel = out_path_all[63-61];  end
	is_target_n[62]: begin out_count_sel = out_count_n[62]; out_path_sel = out_path_all[63-62];  end
	is_target_n[63]: begin out_count_sel = out_count_n[63]; out_path_sel = out_path_all[63-63];  end
	endcase
end

genvar i;
generate

	for(i=0;i<64;i=i+1) begin: parallel_pe_graph
		PE_graph pe_graph(
		.clk			(clk),
		.rst_n			(rst_n),
		.refresh		(refresh_reg),
		.in_valid		(in_valid_reg),
		.mode			(mode_reg),
		
		.in_suffix		(in_suffix_reg),
		.in_sel			(in_sel_reg),
		.in_path		(in_path_reg),
		.pre_end		(pre_end_n[i]),
		
		.is_end			(pre_end_n[i+1]),
		.is_target		(is_target_n[i]),
		.out_count		(out_count_n[i]),
		.out_path		(out_path_all[63-i]),
		
		.restore_path	(restore_path_reg),
		.path			(path[63-i])
		);
	end

endgenerate

always@(posedge clk) begin
	if(!rst_n) begin
		refresh_reg			<= 0;
		in_valid_reg		<= 0;
		mode_reg			<= 0;
		in_suffix_reg		<= {(2*`KMER_LENGTH_MAX){1'b1}};
		in_sel_reg			<= 0;
		in_path_reg			<= 0;
		restore_path_reg	<= 0;
		is_target			<= 0;
		out_count			<= 0;
		out_path			<= 0;
		pre_end_reg			<= 0;
	end
	else begin
		refresh_reg			<= refresh;
		in_valid_reg		<= in_valid;
		mode_reg			<= mode;
		in_suffix_reg		<= in_suffix;
		in_sel_reg			<= in_sel;
		in_path_reg			<= in_path;
		restore_path_reg	<= restore_path;
		is_target			<= (|is_target_n);
		out_count			<= out_count_sel;
		out_path			<= out_path_sel;
		pre_end_reg			<= pre_end;
	end
end

endmodule


module PE_graph (
input clk,
input rst_n,
input refresh,
input in_valid,
input mode,

input [2*`KMER_LENGTH_MAX-1:0] in_suffix,
input [1:0] in_sel,
input in_path,
input pre_end,

output reg is_end,
output reg is_target,
output reg [7:0] out_count,
output reg out_path,

input restore_path,
input path
);

reg [2*`KMER_LENGTH_MAX-1:0] suffix, suffix_n;
wire is_target_n = (in_suffix == suffix);
reg [1:0] A_count_n, C_count_n, G_count_n, T_count_n;
wire [7:0] out_count_n = {T_count_n, G_count_n, C_count_n, A_count_n};
reg is_end_n;

reg [1:0] sel_count;
wire [1:0] sel_count_add;
reg out_path_n;

assign sel_count_add = sel_count + ((is_target | pre_end) && ~sel_count[1]);

always@(*) begin
	case(in_sel)
	0: sel_count = out_count[1:0];
	1: sel_count = out_count[3:2];
	2: sel_count = out_count[5:4];
	3: sel_count = out_count[7:6];
	endcase
end

always@(*) begin
	out_path_n	= out_path;
	
	if(refresh) out_path_n = 0;
	else if(restore_path) out_path_n = path;
	else out_path_n = (in_path && is_target_n) ? 1 : out_path;
	
end

always@(*) begin
	is_end_n			= is_end;
	suffix_n			= suffix;
	A_count_n			= out_count[1:0];
	C_count_n			= out_count[3:2];
	G_count_n			= out_count[5:4];
	T_count_n			= out_count[7:6];
	
	if(refresh) begin
		is_end_n		= 0;
		suffix_n		= 0;
		A_count_n		= 0;
		C_count_n		= 0;
		G_count_n		= 0;
		T_count_n		= 0;
	end
	else if(in_valid) begin
		case(mode)
		0: begin	//push new data
			is_end_n	= pre_end;
			suffix_n	= pre_end ? in_suffix : suffix;
			
			case(in_sel)
			0: A_count_n = pre_end ? sel_count_add : out_count[1:0];
			1: C_count_n = pre_end ? sel_count_add : out_count[3:2];
			2: G_count_n = pre_end ? sel_count_add : out_count[5:4];
			3: T_count_n = pre_end ? sel_count_add : out_count[7:6];
			endcase
		end
		1: begin	//update current data
		
			case(in_sel)
			0: A_count_n = is_target ? sel_count_add : out_count[1:0];
			1: C_count_n = is_target ? sel_count_add : out_count[3:2];
			2: G_count_n = is_target ? sel_count_add : out_count[5:4];
			3: T_count_n = is_target ? sel_count_add : out_count[7:6];
			endcase
		end
		endcase
	end
end

always@(posedge clk) begin
	if(!rst_n) begin
		is_end			<= 0;
		is_target		<= 0;
		suffix			<= {(2*`KMER_LENGTH_MAX){1'b1}};
		out_count		<= 0;
		out_path		<= 0;
	end
	else begin
		is_end			<= is_end_n;
		is_target		<= is_target_n;
		suffix			<= suffix_n;
		out_count		<= out_count_n;
		out_path		<= out_path_n;		
	end
end


endmodule
module Variant_Calling (
    input                   clk,
    input                   rst_n,
    input                   manual_rst_n,


    /////////// global constant //////////
    input [9:0]                                     CONST_active_region_length,
    input [`PADDING_DATA_DIWTH-1:0]                 CONST_padding_length,

    /////// region dependent constant //////////
    input [$clog2(`MAX_HAPLOTYPE_AMOUNT):0]         CONST_haplotype_amount_in_region,

    /////////////// SRAM I/O ///////////////////
    input [`READ_SRAM_BIT_PER_WORD-1:0]             Q_READ_SRAM,
    output reg [$clog2(`READ_SRAM_WORD_AMOUNT)-1:0] A_READ_SRAM,
    input [`HAP_SRAM_BIT_PER_WORD-1:0]              Q_HAP_SRAM,
    output reg [$clog2(`HAP_SRAM_WORD_AMOUNT)-1:0]  A_HAP_SRAM,
    output reg [`VAR_SRAM_BIT_PER_WORD-1:0]         D_VAR_SRAM,
    input     [`VAR_SRAM_BIT_PER_WORD-1:0]          Q_VAR_SRAM,
    output reg [$clog2(`VAR_SRAM_WORD_AMOUNT)-1:0]  A_VAR_SRAM,
    output reg                                      W_VAR_SRAM,
    
    ///////////////// Haplotyping I/O ////////////////////
    input                   i_valid,
    
    /****  Output Ports  ****/
	output reg				o_valid,
    output reg [3:0]		state, 

    output reg [$clog2(`MAX_VAR_AMOUNT):0]  o_variant_amount_in_region,
    
    output  [`MAX_HAPLOTYPE_AMOUNT-1:0] o_unsorted_var_hap1hot_0,
    output  [`MAX_HAPLOTYPE_AMOUNT-1:0] o_unsorted_var_hap1hot_1,
    output  [`MAX_HAPLOTYPE_AMOUNT-1:0] o_unsorted_var_hap1hot_2,
    output  [`MAX_HAPLOTYPE_AMOUNT-1:0] o_unsorted_var_hap1hot_3,
    output  [`MAX_HAPLOTYPE_AMOUNT-1:0] o_unsorted_var_hap1hot_4,
    output  [`MAX_HAPLOTYPE_AMOUNT-1:0] o_unsorted_var_hap1hot_5,
    output  [`MAX_HAPLOTYPE_AMOUNT-1:0] o_unsorted_var_hap1hot_6,
    output  [`MAX_HAPLOTYPE_AMOUNT-1:0] o_unsorted_var_hap1hot_7,

    output  [$clog2(`MAX_VAR_AMOUNT):0] o_event_amount_in_region,
    output  [`VAR_BEGIN-1:0]            o_event_begin_0,
    output  [`VAR_BEGIN-1:0]            o_event_begin_1,
    output  [`VAR_BEGIN-1:0]            o_event_begin_2,
    output  [`VAR_BEGIN-1:0]            o_event_begin_3,
    output  [`VAR_BEGIN-1:0]            o_event_begin_4,
    output  [`VAR_BEGIN-1:0]            o_event_begin_5,
    output  [`VAR_BEGIN-1:0]            o_event_begin_6,
    output  [`VAR_BEGIN-1:0]            o_event_begin_7,
    output  [2*`MAX_VAR_AMOUNT-1:0]     o_event_var2hot_0,
    output  [2*`MAX_VAR_AMOUNT-1:0]     o_event_var2hot_1,
    output  [2*`MAX_VAR_AMOUNT-1:0]     o_event_var2hot_2,
    output  [2*`MAX_VAR_AMOUNT-1:0]     o_event_var2hot_3,
    output  [2*`MAX_VAR_AMOUNT-1:0]     o_event_var2hot_4,
    output  [2*`MAX_VAR_AMOUNT-1:0]     o_event_var2hot_5,
    output  [2*`MAX_VAR_AMOUNT-1:0]     o_event_var2hot_6,
    output  [2*`MAX_VAR_AMOUNT-1:0]     o_event_var2hot_7,

	output reg [9:0]		o_var_location_min,
	output reg [9:0]		o_var_location_max   
);



    integer i, j, k;
    localparam  S_idle			        = 4'd0,
                S_check 		        = 4'd1,
                S_read_REF 		        = 4'd2,
                S_read_HAP 		        = 4'd3,
                S_call_DP 		        = 4'd4,
                S_DP_output 	        = 4'd5,
                S_next_HAP 		        = 4'd6,
                S_sort_var              = 4'd7,
                S_read_first_var        = 4'd8,
                S_event_determ          = 4'd9,
                S_done 			        = 4'd10;
    
    localparam SS_read          = 2'd1,
               SS_write_or_swap = 2'd2,
               SS_last_write    = 2'd3;
    
     


    // ---------------register -----------------
    reg [3:0]                               state_n;
    reg [2:0]                               sram_rw_counter, sram_rw_counter_n;
    reg [1:0]                               sub_state, sub_state_n;

    reg [$clog2(`MAX_HAPLOTYPE_AMOUNT):0]   haplotype_count, haplotype_count_n;
    reg [`MAX_HAPLOTYPE_AMOUNT-1:0]         hap_1hot_counter, hap_1hot_counter_n;
    reg [2*`REF_MAX_LENGTH-1:0]             region_reference, region_reference_n;
    reg [2*`HAP_MAX_LENGTH-1:0]             current_haplotype, current_haplotype_n;
    reg [$clog2(`HAP_MAX_LENGTH):0]         current_haplotype_length, current_haplotype_length_n;
    
    reg [$clog2(`MAX_VAR_AMOUNT):0]         var_counter, var_counter_n;
    reg [$clog2(`REF_MAX_LENGTH)-1:0]       var_begin       [0:7], var_begin_n      [0:7];
    reg [2-1:0]                             var_type        [0:7], var_type_n       [0:7];
    reg [2*(`MAX_ALLELE_LENGTH+1)-1:0]      var_REF_ALT     [0:7], var_REF_ALT_n    [0:7];
    reg [             `VAR_LENGTH-1:0]      var_length      [0:7], var_length_n     [0:7];
    reg [   `MAX_HAPLOTYPE_AMOUNT-1:0]      var_hap_1hot    [0:7], var_hap_1hot_n [0:7];

    reg [`VAR_SRAM_BIT_PER_WORD-1:0]            D_VAR_SRAM_buff, D_VAR_SRAM_buff_n;
    reg [$clog2(`VAR_SRAM_WORD_AMOUNT)-1:0]     A_VAR_SRAM_buff, A_VAR_SRAM_buff_n;
    reg				                            W_VAR_SRAM_buff, W_VAR_SRAM_buff_n;

    reg [$clog2(`MAX_VAR_AMOUNT):0]         round_count, round_count_n;
    reg [$clog2(`MAX_VAR_AMOUNT):0]         read_pointer, read_pointer_n;
    reg [$clog2(`MAX_VAR_AMOUNT):0]         write_pointer, write_pointer_n;
    reg [`VAR_SRAM_BIT_PER_WORD-1:0]        var_register_0, var_register_0_n;
    reg [`VAR_SRAM_BIT_PER_WORD-1:0]        var_register_1, var_register_1_n;
     
    reg [$clog2(`MAX_VAR_AMOUNT):0]         event_counter, event_counter_n;
    reg [15:0]                              event_2hot[0:7], event_2hot_n[0:7];
    reg [`VAR_BEGIN-1:0]                    event_begin[0:7], event_begin_n[0:7];
    reg [`VAR_BEGIN-1:0]                    event_current_begin, event_current_begin_n;
    reg [`VAR_BEGIN-1:0]                    read_var_begin, read_var_begin_n;
    reg [`VAR_LENGTH-1:0]                   read_var_length, read_var_length_n;
    reg [2:0]                               var_pointer, var_pointer_n;
    reg [15:0]                              var_nonstar_counter, var_nonstar_counter_n;
    reg [15:0]                              var_star_counter, var_star_counter_n;
    reg [2:0]                               event_pointer, event_pointer_n;
    
    



    // --------------- IP instantiation ---------------
    wire                                        DP_o_var_ready;
    reg                                         DP_i_var_valid;
    reg [2*`REF_MAX_LENGTH-1:0]                 DP_i_var_sequence_A;
    reg [2*`HAP_MAX_LENGTH-1:0]                 DP_i_var_sequence_B;
    reg [$clog2(`REF_MAX_LENGTH):0]             DP_i_var_seq_A_length;
    reg [$clog2(`HAP_MAX_LENGTH):0]             DP_i_var_seq_B_length;
    reg [$clog2(`MAX_HAPLOTYPE_AMOUNT)-1:0]     DP_i_var_haplotype_ID;
    reg                                         DP_i_var_ready;
    wire                                        DP_o_var_valid;
    wire                                        DP_o_var_done;
    wire signed [`DP_SW_SCORE_BITWIDTH-1:0]     DP_o_var_alignment_score;
    wire [$clog2(`REF_MAX_LENGTH)-1:0]          DP_o_var_local_location;
    wire [1:0]                                  DP_o_var_type;
    wire [2*`MAX_ALLELE_LENGTH-1:0]             DP_o_var_REF;
    wire [2*`MAX_ALLELE_LENGTH-1:0]             DP_o_var_ALT;
    wire [$clog2(`MAX_ALLELE_LENGTH):0]         DP_o_var_length;
    wire [$clog2(`MAX_HAPLOTYPE_AMOUNT)-1:0]    DP_o_var_haplotype_ID;
    DP_var_Top u_DP_var_Top(
        /////////////////////////////////////// Basics /////////////////////////////////////
        .clk                    (clk),
        .rst_n                  (rst_n & manual_rst_n),
        ////////////////////////////////////// Variant Calling I/Os ////////////////////////////////////// 
        .o_var_ready            (DP_o_var_ready          ),
        .i_var_valid            (DP_i_var_valid          ),
        .i_var_sequence_A       (DP_i_var_sequence_A     ),
        .i_var_sequence_B       (DP_i_var_sequence_B     ),
        .i_var_seq_A_length     (DP_i_var_seq_A_length   ),
        .i_var_seq_B_length     (DP_i_var_seq_B_length   ),
        .i_var_haplotype_ID     (DP_i_var_haplotype_ID   ),
        .i_var_ready            (DP_i_var_ready          ),
        .o_var_valid            (DP_o_var_valid          ),
        .o_var_done             (DP_o_var_done           ),
        .o_var_alignment_score  (DP_o_var_alignment_score),
        .o_var_local_location   (DP_o_var_local_location ),
        .o_var_type             (DP_o_var_type           ),
        .o_var_REF              (DP_o_var_REF            ),
        .o_var_ALT              (DP_o_var_ALT            ),
        .o_var_length           (DP_o_var_length         ),
        .o_var_haplotype_ID     (DP_o_var_haplotype_ID   )
    );


	reg [9:0] o_var_location_min_n;
    reg [9:0] o_var_location_max_n;
    
    wire [2*(`MAX_ALLELE_LENGTH+1)-1:0] DP_o_var_REF_ALT = (DP_o_var_type==2) ? {DP_o_var_REF[2*`MAX_ALLELE_LENGTH-1-:2], DP_o_var_ALT[2*`MAX_ALLELE_LENGTH-1-:2], {(2*`MAX_ALLELE_LENGTH-2){1'b0}}} :
                                                           (DP_o_var_type==1) ? {DP_o_var_REF[2*`MAX_ALLELE_LENGTH-1-:2], DP_o_var_ALT} :
                                                           (DP_o_var_type==3) ? {DP_o_var_ALT[2*`MAX_ALLELE_LENGTH-1-:2], DP_o_var_REF} : 0;

    wire [             `VAR_PACK_BIT_WIDTH-1:0] DP_o_var_info_pack;
    wire [`VAR_PACK_BIT_WIDTH-1-`VAR_REF_ALT:0] DP_o_var_info_pack_wo_REFALT;
    assign DP_o_var_info_pack = {DP_o_var_local_location, DP_o_var_type, DP_o_var_REF_ALT, DP_o_var_length};
    assign DP_o_var_info_pack_wo_REFALT = {DP_o_var_local_location, DP_o_var_type, DP_o_var_length};

    wire equal_to_var0 = (DP_o_var_info_pack_wo_REFALT == {var_begin[0], var_type[0], var_length[0]});
    wire equal_to_var1 = (DP_o_var_info_pack_wo_REFALT == {var_begin[1], var_type[1], var_length[1]});
    wire equal_to_var2 = (DP_o_var_info_pack_wo_REFALT == {var_begin[2], var_type[2], var_length[2]});
    wire equal_to_var3 = (DP_o_var_info_pack_wo_REFALT == {var_begin[3], var_type[3], var_length[3]});
    wire equal_to_var4 = (DP_o_var_info_pack_wo_REFALT == {var_begin[4], var_type[4], var_length[4]});
    wire equal_to_var5 = (DP_o_var_info_pack_wo_REFALT == {var_begin[5], var_type[5], var_length[5]});
    wire equal_to_var6 = (DP_o_var_info_pack_wo_REFALT == {var_begin[6], var_type[6], var_length[6]});
    wire equal_to_var7 = (DP_o_var_info_pack_wo_REFALT == {var_begin[7], var_type[7], var_length[7]});
    
    
    wire var_in_valid_region = (DP_o_var_local_location >= CONST_padding_length) && (DP_o_var_local_location < CONST_active_region_length - CONST_padding_length);

    wire sorting_write_valid = (var_register_0 > var_register_1);

    wire event_determination_finished = (read_var_begin == event_current_begin) && (var_pointer == var_counter);

    // output ports
    assign o_unsorted_var_hap1hot_0 = var_hap_1hot[0];
    assign o_unsorted_var_hap1hot_1 = var_hap_1hot[1];
    assign o_unsorted_var_hap1hot_2 = var_hap_1hot[2];
    assign o_unsorted_var_hap1hot_3 = var_hap_1hot[3];
    assign o_unsorted_var_hap1hot_4 = var_hap_1hot[4];
    assign o_unsorted_var_hap1hot_5 = var_hap_1hot[5];
    assign o_unsorted_var_hap1hot_6 = var_hap_1hot[6];
    assign o_unsorted_var_hap1hot_7 = var_hap_1hot[7];

    assign o_event_amount_in_region = event_counter;
    assign o_event_begin_0 = event_begin[0];
    assign o_event_begin_1 = event_begin[1];
    assign o_event_begin_2 = event_begin[2];
    assign o_event_begin_3 = event_begin[3];
    assign o_event_begin_4 = event_begin[4];
    assign o_event_begin_5 = event_begin[5];
    assign o_event_begin_6 = event_begin[6];
    assign o_event_begin_7 = event_begin[7];
    assign o_event_var2hot_0 = event_2hot[0];
    assign o_event_var2hot_1 = event_2hot[1];
    assign o_event_var2hot_2 = event_2hot[2];
    assign o_event_var2hot_3 = event_2hot[3];
    assign o_event_var2hot_4 = event_2hot[4];
    assign o_event_var2hot_5 = event_2hot[5];
    assign o_event_var2hot_6 = event_2hot[6];
    assign o_event_var2hot_7 = event_2hot[7];


    always@(*) begin
        state_n = state;
        if (~manual_rst_n) state_n = S_idle;
        else begin
            case(state)
                S_idle:             state_n = (i_valid) ? S_check : state;
				S_check:		    state_n = (CONST_haplotype_amount_in_region < 2) ? S_done : S_read_REF;
                S_read_REF:         state_n = (sram_rw_counter==2) ? S_read_HAP : state;
                S_read_HAP:         state_n = (sram_rw_counter==2) ? S_call_DP : state;
                S_call_DP:          state_n = (DP_o_var_ready) ? S_DP_output : state;
                S_DP_output:        state_n = (DP_o_var_done) ? S_next_HAP : state;
                S_next_HAP: begin
                    if (haplotype_count == CONST_haplotype_amount_in_region) begin
                        if (~|var_counter)          state_n = S_done;           // no variant
                        else if (var_counter == 1)  state_n = S_read_first_var; // only one variant
                        else                        state_n = S_sort_var;       // more than one variant
                    end else state_n = S_read_HAP;
                end
                S_sort_var:         state_n = (sub_state == SS_last_write && round_count == var_counter - 1) ? S_read_first_var : state;
                S_read_first_var:   state_n = (sram_rw_counter == 2) ? S_event_determ : state;
                S_event_determ:     state_n = (read_var_begin == event_current_begin && var_pointer == var_counter - 1 && sram_rw_counter == 3) ? S_done : state;
                S_done:             state_n = S_idle;
            endcase
        end
    end

    always@(*) begin
        sub_state_n = sub_state;
        if (~manual_rst_n || state==S_idle) sub_state_n = SS_read;
        else if (state==S_sort_var) begin
            case(sub_state)
                SS_read:            sub_state_n = (sram_rw_counter == 2) ? ((~|read_pointer) ? SS_read : SS_write_or_swap) : sub_state;
                SS_write_or_swap:   sub_state_n = (read_pointer == var_counter) ? SS_last_write : SS_read;
                SS_last_write:      sub_state_n = SS_read;
            endcase
        end
    end

    
    
    always@(*) begin
        haplotype_count_n = haplotype_count;
        hap_1hot_counter_n = hap_1hot_counter;
        if (state==S_idle || ~manual_rst_n)  begin
            haplotype_count_n = 0;
            hap_1hot_counter_n = 1;
        end else if (state==S_DP_output && DP_o_var_done) begin
            haplotype_count_n = haplotype_count + 1;
            hap_1hot_counter_n = hap_1hot_counter << 1;
        end





        region_reference_n = region_reference;
        if (state==S_idle || ~manual_rst_n) region_reference_n = 0;
        else if (state==S_read_REF & sram_rw_counter == 2) region_reference_n = Q_READ_SRAM[`READ_SRAM_BIT_PER_WORD-1-:(2*`REF_MAX_LENGTH)];





        current_haplotype_n = current_haplotype;
        current_haplotype_length_n = current_haplotype_length;
        if (state==S_idle || ~manual_rst_n) begin
            current_haplotype_n = 0;
            current_haplotype_length_n = 0;
        end
        else if (state==S_read_HAP & sram_rw_counter == 2) begin
            current_haplotype_n = Q_HAP_SRAM[`HAP_SRAM_BIT_PER_WORD-1-:(2*`HAP_MAX_LENGTH)];
            current_haplotype_length_n = Q_HAP_SRAM[0+:10];
        end





        sram_rw_counter_n = sram_rw_counter;
        if (state == S_idle || !manual_rst_n) begin
            sram_rw_counter_n = 0;
        end else if (state == S_read_HAP | state == S_read_REF | (state == S_sort_var && sub_state == SS_read) | state == S_read_first_var) begin
            sram_rw_counter_n = (sram_rw_counter == 2) ? 0 : sram_rw_counter + 1;
        end else if (state == S_event_determ) begin
            sram_rw_counter_n = (sram_rw_counter == 3) ? 0 : sram_rw_counter + 1;
        end


        
        /**** Dynamic Programming Output Ports ****/
        DP_i_var_valid         = 0;
        DP_i_var_sequence_A    = 0;
        DP_i_var_sequence_B    = 0;
        DP_i_var_seq_A_length  = 0;
        DP_i_var_seq_B_length  = 0;
        DP_i_var_haplotype_ID  = 0;
        if (state == S_call_DP) begin
            DP_i_var_valid         = 1;
            DP_i_var_sequence_A    = region_reference;
            DP_i_var_sequence_B    = current_haplotype;
            DP_i_var_seq_A_length  = CONST_active_region_length;
            DP_i_var_seq_B_length  = current_haplotype_length;
            DP_i_var_haplotype_ID  = haplotype_count;
        end

        DP_i_var_ready = 0;
        if (state == S_DP_output) DP_i_var_ready = 1;



        /**** variants handling ****/
        var_counter_n = var_counter;
        for (i=0; i<8; i=i+1) var_begin_n       [i] = var_begin      [i];
        for (i=0; i<8; i=i+1) var_type_n        [i] = var_type       [i];
        for (i=0; i<8; i=i+1) var_REF_ALT_n     [i] = var_REF_ALT    [i];
        for (i=0; i<8; i=i+1) var_length_n      [i] = var_length     [i];
        for (i=0; i<8; i=i+1) var_hap_1hot_n  [i] = var_hap_1hot [i];
        if (state==S_idle || ~manual_rst_n) begin
            var_counter_n = 0;
            for (i=0; i<8; i=i+1) var_begin_n      [i] = 0;
            for (i=0; i<8; i=i+1) var_type_n       [i] = 0;
            for (i=0; i<8; i=i+1) var_REF_ALT_n    [i] = 0;
            for (i=0; i<8; i=i+1) var_length_n     [i] = 0;
            for (i=0; i<8; i=i+1) var_hap_1hot_n [i] = 0;
        end else if (state==S_DP_output & DP_o_var_valid & var_in_valid_region & ~DP_o_var_done) begin
            case({equal_to_var0, equal_to_var1, equal_to_var2, equal_to_var3, equal_to_var4, equal_to_var5, equal_to_var6, equal_to_var7})
                8'b00000000: begin
                    if (var_counter!=`MAX_VAR_AMOUNT) begin
                        var_counter_n               = var_counter + 1;
                        var_begin_n   [var_counter] = DP_o_var_local_location;
                        var_type_n    [var_counter] = DP_o_var_type;
                        var_REF_ALT_n [var_counter] = DP_o_var_REF_ALT;
                        var_length_n  [var_counter] = DP_o_var_length;
                        var_hap_1hot_n[var_counter] = hap_1hot_counter;
                    end
                end
                8'b10000000:    var_hap_1hot_n[0] = var_hap_1hot[0] | hap_1hot_counter;
                8'b01000000:    var_hap_1hot_n[1] = var_hap_1hot[1] | hap_1hot_counter;
                8'b00100000:    var_hap_1hot_n[2] = var_hap_1hot[2] | hap_1hot_counter;
                8'b00010000:    var_hap_1hot_n[3] = var_hap_1hot[3] | hap_1hot_counter;
                8'b00001000:    var_hap_1hot_n[4] = var_hap_1hot[4] | hap_1hot_counter;
                8'b00000100:    var_hap_1hot_n[5] = var_hap_1hot[5] | hap_1hot_counter;
                8'b00000010:    var_hap_1hot_n[6] = var_hap_1hot[6] | hap_1hot_counter;
                8'b00000001:    var_hap_1hot_n[7] = var_hap_1hot[7] | hap_1hot_counter;
            endcase
        end


        
        

        /**** Read reference & haplotypes SRAM control ****/
        A_READ_SRAM = 0; // read reference sequence
        A_HAP_SRAM  = haplotype_count;


        /**** write vairants to SRAM buffer ****/
        D_VAR_SRAM_buff_n = 0;
        A_VAR_SRAM_buff_n = 0;
        W_VAR_SRAM_buff_n = 0;
        if (state==S_DP_output & DP_o_var_valid & var_in_valid_region & ~DP_o_var_done) begin
            if (~(equal_to_var0 | equal_to_var1 | equal_to_var2 | equal_to_var3 | equal_to_var4 | equal_to_var5 | equal_to_var6 | equal_to_var7)) begin
                D_VAR_SRAM_buff_n  = {DP_o_var_info_pack, var_counter[0+:3]};
                A_VAR_SRAM_buff_n  = var_counter[0+:3];
                W_VAR_SRAM_buff_n  = 1;
            end
        end

        
        /**** Sorting Variants ****/
        round_count_n = round_count;
        read_pointer_n = read_pointer;
        write_pointer_n = write_pointer;
        var_register_0_n = var_register_0;
        var_register_1_n = var_register_1;
        if (state==S_idle | ~manual_rst_n) begin
            round_count_n    = 0;
            read_pointer_n   = 0;
            write_pointer_n  = 0;
            var_register_0_n = 0;
            var_register_1_n = 0;
        end else if (state == S_sort_var) begin
            case(sub_state)
                SS_read: begin
                    if (sram_rw_counter == 2) begin
                        read_pointer_n = read_pointer + 1;
                        var_register_0_n = (~|read_pointer) ? Q_VAR_SRAM : var_register_0;
                        var_register_1_n = Q_VAR_SRAM;
                    end
                end
                SS_write_or_swap: begin
                    write_pointer_n = write_pointer + 1;
                    var_register_0_n = (sorting_write_valid) ? var_register_0 : var_register_1;
                    var_register_1_n = (sorting_write_valid) ? var_register_0 : var_register_1;
                end
                SS_last_write: begin
                    read_pointer_n = 0;
                    write_pointer_n = 0;
                    round_count_n = round_count + 1;
                end
            endcase
        end




        /****** Event Determination *****/
        event_counter_n         =  event_counter;
        for (i=0;i<8;i=i+1) event_2hot_n[i] = event_2hot[i];
        for (i=0;i<8;i=i+1) event_begin_n[i] = event_begin[i];
        var_pointer_n           = var_pointer;
        event_pointer_n         = event_pointer;
        event_current_begin_n   = event_current_begin;
        var_nonstar_counter_n   = var_nonstar_counter;
        var_star_counter_n      = var_star_counter;
        read_var_begin_n        = read_var_begin;
        read_var_length_n       = read_var_length;
        if (~manual_rst_n || state == S_idle) begin
            event_counter_n         =  0;
            for (i=0;i<8;i=i+1) event_2hot_n[i] = 0;
            for (i=0;i<8;i=i+1) event_begin_n[i] = 0;
            var_pointer_n           = 0;
            event_pointer_n         = 0;
            event_current_begin_n   = 0;
            var_nonstar_counter_n   = 16'b10;
            var_star_counter_n      = 16'b11;
            read_var_begin_n        = 0;
            read_var_length_n       = 0;
        end else if (state == S_read_first_var) begin
            if (sram_rw_counter == 2) event_current_begin_n = Q_VAR_SRAM[`VAR_SRAM_BIT_PER_WORD-1-:`VAR_BEGIN];
        end else if (state == S_event_determ) begin
            if (sram_rw_counter == 2) begin
                read_var_begin_n = Q_VAR_SRAM[`VAR_SRAM_BIT_PER_WORD-1-:`VAR_BEGIN];
                read_var_length_n = Q_VAR_SRAM[`VAR_ID+:`VAR_LENGTH];
            end

            if (sram_rw_counter == 3) begin
                if (read_var_begin > event_current_begin) begin
                    var_pointer_n           = 0;        // reset 
                    var_nonstar_counter_n   = 16'b10;   // variant
                    var_star_counter_n      = 16'b11;   // counter
                    
                end else begin
                    var_pointer_n           = var_pointer + 1;
                    var_nonstar_counter_n   = var_nonstar_counter << 2;
                    var_star_counter_n      = var_star_counter << 2;
                end    

                if (read_var_begin > event_current_begin || var_pointer == var_counter - 1) begin
                    event_pointer_n         = event_pointer + 1;
                    event_counter_n         = event_counter + 1;
                    event_current_begin_n   = read_var_begin;
                end

                if (read_var_begin == event_current_begin) event_begin_n[event_pointer] = event_current_begin;

                if (read_var_begin < event_current_begin && read_var_begin + read_var_length > event_current_begin) begin
                    event_2hot_n[event_pointer] = event_2hot[event_pointer] | var_star_counter;
                end else if (read_var_begin == event_current_begin) begin
                    event_2hot_n[event_pointer] = event_2hot[event_pointer] | var_nonstar_counter;
                end
            end
        end
        
        
        





        /**** SRAM output control ****/
        D_VAR_SRAM = 0;
        A_VAR_SRAM = 0;
        W_VAR_SRAM = 0;
        if (state == S_DP_output) begin
            D_VAR_SRAM = D_VAR_SRAM_buff;
            A_VAR_SRAM = A_VAR_SRAM_buff;
            W_VAR_SRAM = W_VAR_SRAM_buff;
        end else if (state == S_sort_var) begin
            A_VAR_SRAM = (sub_state == SS_read) ? read_pointer : write_pointer;
            W_VAR_SRAM = (sub_state == SS_write_or_swap) || (sub_state == SS_last_write);
            D_VAR_SRAM = (sub_state == SS_write_or_swap && ~sorting_write_valid) ? var_register_0 : var_register_1;
            
        end else if (state == S_event_determ) begin
            A_VAR_SRAM = var_pointer;
        end



        /**** otuput control ****/
        o_valid                         = (state==S_done);
        o_variant_amount_in_region      = (state==S_done) ? var_counter : 0;
        


    end



    /**** modified by Yi-Chung ****/
    always@(*) begin
		o_var_location_min_n 			= o_var_location_min;
		o_var_location_max_n 			= o_var_location_max;
		
		if(!manual_rst_n || (state == S_idle)) begin
			o_var_location_min_n		= CONST_active_region_length;
			o_var_location_max_n		= 0;
		end else if(W_VAR_SRAM_buff) begin
			o_var_location_min_n = (D_VAR_SRAM_buff[`VAR_SRAM_BIT_PER_WORD-1-:`VAR_BEGIN] < o_var_location_min) ? D_VAR_SRAM_buff[`VAR_SRAM_BIT_PER_WORD-1-:`VAR_BEGIN] : o_var_location_min;
			o_var_location_max_n = (D_VAR_SRAM_buff[`VAR_SRAM_BIT_PER_WORD-1-:`VAR_BEGIN] + D_VAR_SRAM_buff[`VAR_ID+:`VAR_LENGTH] > o_var_location_max) ? D_VAR_SRAM_buff[`VAR_SRAM_BIT_PER_WORD-1-:`VAR_BEGIN] + D_VAR_SRAM_buff[10:3] : o_var_location_max;
		end
	end
    


    // always@(posedge clk or negedge rst_n) begin
    always@(posedge clk ) begin
        if (!rst_n) begin
            state <= S_idle;
            sub_state <= SS_read;
            haplotype_count <= 0;
            region_reference <= 0;
            current_haplotype <= 0;
            current_haplotype_length <= 0;
            for (i=0; i<8; i=i+1) var_begin       [i] <= 0;
            for (i=0; i<8; i=i+1) var_type        [i] <= 0;
            for (i=0; i<8; i=i+1) var_REF_ALT     [i] <= 0;
            for (i=0; i<8; i=i+1) var_length      [i] <= 0;
            for (i=0; i<8; i=i+1) var_hap_1hot  [i] <= 0;

            D_VAR_SRAM_buff <=  0;
            A_VAR_SRAM_buff <=  0;
            W_VAR_SRAM_buff <=  0;

            sram_rw_counter <= 0;
			o_var_location_min	<= 0;
			o_var_location_max	<= 0;
            var_counter <= 0;
            hap_1hot_counter <= 1;

            /**** Sorting Variants ****/
            round_count    <= 0;
            read_pointer   <= 0;
            write_pointer  <= 0;
            var_register_0 <= 0;
            var_register_1 <= 0;

            event_counter         <=  0;
            for (i=0;i<8;i=i+1) event_2hot[i] <= 0;
            for (i=0;i<8;i=i+1) event_begin[i]  <= 0;
            var_pointer           <= 0;
            event_pointer         <= 0;
            event_current_begin   <= 0;
            var_nonstar_counter   <= 16'b10;
            var_star_counter      <= 16'b11;
            read_var_begin        <= 0;
            read_var_length       <= 0;
        end else begin
            state <= state_n;
            sub_state <= sub_state_n;
            haplotype_count <= haplotype_count_n;
            region_reference <= region_reference_n;
            current_haplotype <= current_haplotype_n;
            current_haplotype_length <= current_haplotype_length_n;
            for (i=0; i<8; i=i+1) var_begin       [i] <= var_begin_n      [i];
            for (i=0; i<8; i=i+1) var_type        [i] <= var_type_n       [i];
            for (i=0; i<8; i=i+1) var_REF_ALT     [i] <= var_REF_ALT_n    [i];
            for (i=0; i<8; i=i+1) var_length      [i] <= var_length_n     [i];
            for (i=0; i<8; i=i+1) var_hap_1hot  [i] <= var_hap_1hot_n [i];

            D_VAR_SRAM_buff <=  D_VAR_SRAM_buff_n;
            A_VAR_SRAM_buff <=  A_VAR_SRAM_buff_n;
            W_VAR_SRAM_buff <=  W_VAR_SRAM_buff_n;

            sram_rw_counter <= sram_rw_counter_n;
			o_var_location_min	<= o_var_location_min_n;
			o_var_location_max	<= o_var_location_max_n;
            var_counter <= var_counter_n;
            hap_1hot_counter <= hap_1hot_counter_n;

            round_count    <= round_count_n;
            read_pointer   <= read_pointer_n;
            write_pointer  <= write_pointer_n;
            var_register_0 <= var_register_0_n;
            var_register_1 <= var_register_1_n;


            event_counter         <=  event_counter_n;
            for (i=0;i<8;i=i+1) event_2hot[i] <= event_2hot_n[i];
            for (i=0;i<8;i=i+1) event_begin[i]  <= event_begin_n[i];
            var_pointer           <= var_pointer_n;
            event_pointer         <= event_pointer_n;
            event_current_begin   <= event_current_begin_n;
            var_nonstar_counter   <= var_nonstar_counter_n;
            var_star_counter      <= var_star_counter_n;
            read_var_begin        <= read_var_begin_n;
            read_var_length       <= read_var_length_n;
        end
    end


    

endmodule

module DP_var_ALU(
    ///////////////////////////////////// I/Os //////////////////////////////////////
    input                                   i_A_base_valid,
    input                                   i_B_base_valid,
    input [1:0]                             i_A_base,          // reference one.   Mapping: reference sequence
    input [1:0]                             i_B_base,          // query one.       Mapping: short-read

    input signed [`DP_SW_SCORE_BITWIDTH-1:0]   i_align_top_score,
    input signed [`DP_SW_SCORE_BITWIDTH-1:0]   i_align_diagonal_score,
    input signed [`DP_SW_SCORE_BITWIDTH-1:0]   i_align_left_score,
    input signed [`DP_SW_SCORE_BITWIDTH-1:0]   i_insert_top_score,
    input signed [`DP_SW_SCORE_BITWIDTH-1:0]   i_insert_diagonal_score,
    input signed [`DP_SW_SCORE_BITWIDTH-1:0]   i_insert_left_score,
    input signed [`DP_SW_SCORE_BITWIDTH-1:0]   i_delete_diagonal_score,
    input signed [`DP_SW_SCORE_BITWIDTH-1:0]   i_delete_left_score,

    output signed [`DP_SW_SCORE_BITWIDTH-1:0]  o_align_score,
    output signed [`DP_SW_SCORE_BITWIDTH-1:0]  o_insert_score,
    output signed [`DP_SW_SCORE_BITWIDTH-1:0]  o_delete_score,
    output reg [1:0]                           o_align_score_source,
    output [1:0]                               o_insert_score_source,
    output [1:0]                               o_delete_score_source,
    output reg [1:0]                           o_the_score_source,
    output signed [`DP_SW_SCORE_BITWIDTH-1:0]  o_the_score
    
);

localparam signed [`DP_SW_SCORE_BITWIDTH-1:0] MOST_NEGTIVE = {1'b1, {(`DP_SW_SCORE_BITWIDTH-1){1'b0}}};

//-----------
// DESIGN
//-----------
wire o_valid = i_A_base_valid & i_B_base_valid;

// ---------------------- align score ----------------------
wire signed [`DP_VAR_MATCH_BIT_DECLARE-1:0] prior = (i_A_base == i_B_base) ? `CONST_MATCH_SCORE : `CONST_MISMATCH_SCORE;

wire signed [`DP_SW_SCORE_BITWIDTH:0] align_candidate_A_extended = i_align_diagonal_score;
wire signed [`DP_SW_SCORE_BITWIDTH:0] align_candidate_I_extended = i_insert_diagonal_score;
wire signed [`DP_SW_SCORE_BITWIDTH:0] align_candidate_D_extended = i_delete_diagonal_score;

wire align_D_greater_than_I = (align_candidate_D_extended > align_candidate_I_extended);
wire signed [`DP_SW_SCORE_BITWIDTH:0] DI_sel = align_D_greater_than_I ? align_candidate_D_extended : align_candidate_I_extended;
wire DI_sel_greater_than_A = (DI_sel > align_candidate_A_extended);

wire signed [`DP_SW_SCORE_BITWIDTH:0] pre_align_score_extended = DI_sel_greater_than_A ? DI_sel : align_candidate_A_extended;
wire signed [`DP_SW_SCORE_BITWIDTH:0] align_score_extended = pre_align_score_extended + prior;

assign o_align_score = (o_valid) ? ((align_score_extended[`DP_SW_SCORE_BITWIDTH]) ? 0 : align_score_extended) : i_align_left_score;

wire [1:0] DI_sel_source = align_D_greater_than_I ? 3 : 1;

always@(*) begin
	if(|o_align_score) o_align_score_source = DI_sel_greater_than_A ? DI_sel_source : 2;
	else o_align_score_source = 0;
end

// ---------------------- insert score ----------------------
wire signed [`DP_SW_SCORE_BITWIDTH:0] insert_candidate_A_extended = i_align_top_score + `CONST_GAP_OPEN; 
wire signed [`DP_SW_SCORE_BITWIDTH:0] insert_candidate_I_extended = i_insert_top_score + `CONST_GAP_EXTEND;

wire insert_I_greater_than_A = (insert_candidate_I_extended > insert_candidate_A_extended);

wire signed [`DP_SW_SCORE_BITWIDTH:0] insert_score_extended = (insert_I_greater_than_A) ? insert_candidate_I_extended :  insert_candidate_A_extended;

assign o_insert_score = (o_valid) ? ((insert_score_extended[`DP_SW_SCORE_BITWIDTH]) ? 0 : insert_score_extended) : i_insert_left_score;

assign o_insert_score_source = (|o_insert_score) ? (insert_I_greater_than_A ? 1 : 2) : 0;


// ---------------------- delete score ----------------------
wire signed [`DP_SW_SCORE_BITWIDTH:0] delete_candidate_A_extended = i_align_left_score + `CONST_GAP_OPEN; 
wire signed [`DP_SW_SCORE_BITWIDTH:0] delete_candidate_D_extended = i_delete_left_score + `CONST_GAP_EXTEND;

wire delete_D_greater_than_A = (delete_candidate_D_extended > delete_candidate_A_extended);

wire signed [`DP_SW_SCORE_BITWIDTH:0] delete_score_extended = (delete_D_greater_than_A) ? delete_candidate_D_extended :  delete_candidate_A_extended;

assign o_delete_score = (o_valid) ? ((delete_score_extended[`DP_SW_SCORE_BITWIDTH]) ? 0 : delete_score_extended) : i_delete_left_score;

assign o_delete_score_source = (|o_delete_score) ? (delete_D_greater_than_A ? 3 : 2) : 0;

// ---------------------- output score  ----------------------
wire del_greater_than_insert = (o_delete_score > o_insert_score);
wire [1:0] delete_insert_sel_source = del_greater_than_insert ? 3 : 1;
wire signed [`DP_SW_SCORE_BITWIDTH-1:0] delete_insert_sel = del_greater_than_insert ? o_delete_score : o_insert_score;
wire INDEL_greater_than_align = (delete_insert_sel > o_align_score);


assign o_the_score = INDEL_greater_than_align ? delete_insert_sel : o_align_score;

always@(*) begin
	if(|o_the_score) o_the_score_source = INDEL_greater_than_align ? delete_insert_sel_source : 2;
	else o_the_score_source = 0;
end

endmodule

module DP_var_Array_single(
    /////////////////////////////////////// Basics /////////////////////////////////////
    input                                       clk,
    input                                       rst_n,   
   
    ////////////////////////////////////// Mapping I/Os ////////////////////////////////////// 
    output reg                                  o_ready,
    input                                       i_valid,
    input [2*`REF_MAX_LENGTH-1:0]               i_sequence_A,           // reference one.   Mapping: reference sequence
    input [2*`HAP_MAX_LENGTH-1:0]               i_sequence_B,           // query one.       Mapping: short-read
    input [$clog2(`REF_MAX_LENGTH):0]           i_seq_A_length,         // 0~512 (1-based)
    input [$clog2(`HAP_MAX_LENGTH):0]           i_seq_B_length,         // 0~512 (1-based)
    input [$clog2(`MAX_HAPLOTYPE_AMOUNT)-1:0]   i_var_haplotype_ID,     // only Variant Calling

    input                                           i_ready,
    output reg                                      o_valid,
    output reg                                      o_done,                 //
    output signed [`DP_SW_SCORE_BITWIDTH-1:0]       o_alignment_score,
    output reg [$clog2(`REF_MAX_LENGTH)-1:0]        o_var_local_location,   // only Variant Calling
    output reg [1:0]                                o_var_type,             // only Variant Calling
    output reg [2*`MAX_ALLELE_LENGTH-1:0]           o_var_REF,              // only Variant Calling
    output reg [2*`MAX_ALLELE_LENGTH-1:0]           o_var_ALT,              // only Variant Calling
    output reg [`VAR_LENGTH-1:0]                    o_var_length,           // only Variant Calling (1-based)
    output reg [$clog2(`MAX_HAPLOTYPE_AMOUNT)-1:0]  o_var_haplotype_ID      // only Variant Calling
);
    integer i, j, k, l;
    
    localparam  S_idle                  = 4'd0,
                S_input                 = 4'd1,
                S_calculate             = 4'd2,
                S_hold                  = 4'd3,
                S_select_highest        = 4'd4,
                S_output_score          = 4'd5,
                S_backtrace_and_output  = 4'd6,
                S_done                  = 4'd7;

    localparam MOST_NEGATIVE = {1'b1, {(`DP_SW_SCORE_BITWIDTH-1){1'b0}}};
    localparam MOST_POSITIVE = {1'b0, {(`DP_SW_SCORE_BITWIDTH-1){1'b1}}};



    // ----------------- memory unit ------------------
    ///////////////////////////// main registers ////////////////////////////////
    reg [3:0]                                       state, state_n;
    reg [$clog2(`REF_MAX_LENGTH+`HAP_MAX_LENGTH):0] counter, counter_n;
    reg [2*`REF_MAX_LENGTH-1:0]                     sequence_A;
    reg [2*`HAP_MAX_LENGTH-1:0]                     sequence_B;
    reg [$clog2(`REF_MAX_LENGTH):0]                 seq_A_length;
    reg [$clog2(`HAP_MAX_LENGTH):0]                 seq_B_length;
    reg [$clog2(`MAX_HAPLOTYPE_AMOUNT)-1:0]         var_haplotype_ID;
    reg [2*`REF_MAX_LENGTH-1:0]                    sequence_A_n       ; // = (i_valid) ? i_sequence_A :  sequence_A;
    reg [2*`HAP_MAX_LENGTH-1:0]                    sequence_B_n       ; // = (i_valid) ? i_sequence_B :  sequence_B;
    reg [$clog2(`REF_MAX_LENGTH):0]                seq_A_length_n     ; // = (i_valid) ? i_seq_A_length :  seq_A_length;
    reg [$clog2(`HAP_MAX_LENGTH):0]                seq_B_length_n     ; // = (i_valid) ? i_seq_B_length :  seq_B_length;
    reg [$clog2(`MAX_HAPLOTYPE_AMOUNT)-1:0]        var_haplotype_ID_n ; // = (i_valid) ? i_var_haplotype_ID :  var_haplotype_ID;

    reg                                             sequence_A_valid[0:`REF_MAX_LENGTH-1], sequence_A_valid_n[0:`REF_MAX_LENGTH-1];
    reg                                             sequence_B_valid[0:`HAP_MAX_LENGTH-1], sequence_B_valid_n[0:`HAP_MAX_LENGTH-1];
    reg [2*`REF_MAX_LENGTH-1:0]                     sequence_A_shifter, sequence_A_shifter_n;
    reg signed [`DP_SW_SCORE_BITWIDTH-1:0]          highest_score, highest_score_n;
    reg [$clog2(`REF_MAX_LENGTH)-1:0]               column, column_n;
    reg [$clog2(`HAP_MAX_LENGTH)-1:0]               row, row_n;
    reg [1:0]                                       the_score_source, the_score_source_n;
    reg [1:0]                                       last_score_source, last_score_source_n;
    reg signed [`DP_SW_SCORE_BITWIDTH-1:0]          row_highest_scores[0:`HAP_MAX_LENGTH-1];
	reg signed [`DP_SW_SCORE_BITWIDTH-1:0] 			row_highest_scores_n[0:`HAP_MAX_LENGTH-1];
    reg [$clog2(`REF_MAX_LENGTH)-1:0]               row_highest_columns[0:`HAP_MAX_LENGTH-1], row_highest_columns_n [0:`HAP_MAX_LENGTH-1];
    reg [1:0]                                       row_highest_sources[0:`HAP_MAX_LENGTH-1], row_highest_sources_n [0:`HAP_MAX_LENGTH-1];
    reg signed [`DP_SW_SCORE_BITWIDTH-1:0]          the_top_PE_align_score_d  , the_top_PE_align_score_d_n;
    reg signed [`DP_SW_SCORE_BITWIDTH-1:0]          the_top_PE_insert_score_d , the_top_PE_insert_score_d_n;
    reg signed [`DP_SW_SCORE_BITWIDTH-1:0]          the_top_PE_delete_score_d , the_top_PE_delete_score_d_n;
    reg signed [`DP_SW_SCORE_BITWIDTH-1:0]          the_top_PE_align_score_dd , the_top_PE_align_score_dd_n;
    reg signed [`DP_SW_SCORE_BITWIDTH-1:0]          the_top_PE_insert_score_dd, the_top_PE_insert_score_dd_n;
    reg signed [`DP_SW_SCORE_BITWIDTH-1:0]          the_top_PE_delete_score_dd, the_top_PE_delete_score_dd_n;
    reg signed [`DP_SW_SCORE_BITWIDTH-1:0]          PE_score_buff  [0:`HAP_MAX_LENGTH-1];
    wire signed [`DP_SW_SCORE_BITWIDTH-1:0]         PE_score_buff_n [0:`HAP_MAX_LENGTH-1];
    reg signed [`DP_SW_SCORE_BITWIDTH-1:0]          PE_align_score_d  [0:`HAP_MAX_LENGTH-1],   PE_align_score_d_n [0:`HAP_MAX_LENGTH-1];
    reg signed [`DP_SW_SCORE_BITWIDTH-1:0]          PE_insert_score_d [0:`HAP_MAX_LENGTH-1],  PE_insert_score_d_n [0:`HAP_MAX_LENGTH-1];
    reg signed [`DP_SW_SCORE_BITWIDTH-1:0]          PE_delete_score_d [0:`HAP_MAX_LENGTH-1],  PE_delete_score_d_n [0:`HAP_MAX_LENGTH-1];
    reg signed [`DP_SW_SCORE_BITWIDTH-1:0]          PE_align_score_dd [0:`HAP_MAX_LENGTH-1],  PE_align_score_dd_n [0:`HAP_MAX_LENGTH-1];
    reg signed [`DP_SW_SCORE_BITWIDTH-1:0]          PE_insert_score_dd[0:`HAP_MAX_LENGTH-1], PE_insert_score_dd_n [0:`HAP_MAX_LENGTH-1];
    reg signed [`DP_SW_SCORE_BITWIDTH-1:0]          PE_delete_score_dd[0:`HAP_MAX_LENGTH-1], PE_delete_score_dd_n [0:`HAP_MAX_LENGTH-1];
    reg [1:0]                                       PE_source_buff[`HAP_MAX_LENGTH:0];
    /////////////////////// back tracing //////////////////////////
    reg [1:0]                                       sram_Q_valid_counter, sram_Q_valid_counter_n;
    reg [`VAR_LENGTH-1:0]                           var_length, var_length_n;
    reg [2*`MAX_ALLELE_LENGTH-1:0]                  REF_buffer, REF_buffer_n;
    reg [2*`MAX_ALLELE_LENGTH-1:0]                  ALT_buffer, ALT_buffer_n;
    reg [1:0]                                       current_var, current_var_n;

    reg                                 align_source_sram_WEN;
    reg  [`DIR_SRAM_ADDR_WIDTH-1:0]     align_source_sram_ADDR;
    wire [2*`HAP_MAX_LENGTH-1:0]        align_source_sram_Q;

    // output reg
    reg                                 o_valid_n;
    reg                                 o_done_n;                 //
    reg [$clog2(`REF_MAX_LENGTH)-1:0]   o_var_local_location_n;   // only Variant Calling
    reg [                        1:0]   o_var_type_n;             // only Variant Calling
    reg [   2*`MAX_ALLELE_LENGTH-1:0]   o_var_REF_n;              // only Variant Calling
    reg [   2*`MAX_ALLELE_LENGTH-1:0]   o_var_ALT_n;              // only Variant Calling
    reg [            `VAR_LENGTH-1:0]   o_var_length_n;           // only Variant Calling (1-based)

    // -------------- non-memory unit (wire & reg) --------------
    wire sram_Q_valid = (sram_Q_valid_counter==2);

    assign o_alignment_score = highest_score;

    reg [1:0]                              the_chosen_A_base;
    reg [1:0]                              the_chosen_B_base;

    always@(*) begin
        the_chosen_A_base = 0;
        case(column)
            0: the_chosen_A_base = sequence_A[599-:2];
            1: the_chosen_A_base = sequence_A[597-:2];
            2: the_chosen_A_base = sequence_A[595-:2];
            3: the_chosen_A_base = sequence_A[593-:2];
            4: the_chosen_A_base = sequence_A[591-:2];
            5: the_chosen_A_base = sequence_A[589-:2];
            6: the_chosen_A_base = sequence_A[587-:2];
            7: the_chosen_A_base = sequence_A[585-:2];
            8: the_chosen_A_base = sequence_A[583-:2];
            9: the_chosen_A_base = sequence_A[581-:2];
            10: the_chosen_A_base = sequence_A[579-:2];
            11: the_chosen_A_base = sequence_A[577-:2];
            12: the_chosen_A_base = sequence_A[575-:2];
            13: the_chosen_A_base = sequence_A[573-:2];
            14: the_chosen_A_base = sequence_A[571-:2];
            15: the_chosen_A_base = sequence_A[569-:2];
            16: the_chosen_A_base = sequence_A[567-:2];
            17: the_chosen_A_base = sequence_A[565-:2];
            18: the_chosen_A_base = sequence_A[563-:2];
            19: the_chosen_A_base = sequence_A[561-:2];
            20: the_chosen_A_base = sequence_A[559-:2];
            21: the_chosen_A_base = sequence_A[557-:2];
            22: the_chosen_A_base = sequence_A[555-:2];
            23: the_chosen_A_base = sequence_A[553-:2];
            24: the_chosen_A_base = sequence_A[551-:2];
            25: the_chosen_A_base = sequence_A[549-:2];
            26: the_chosen_A_base = sequence_A[547-:2];
            27: the_chosen_A_base = sequence_A[545-:2];
            28: the_chosen_A_base = sequence_A[543-:2];
            29: the_chosen_A_base = sequence_A[541-:2];
            30: the_chosen_A_base = sequence_A[539-:2];
            31: the_chosen_A_base = sequence_A[537-:2];
            32: the_chosen_A_base = sequence_A[535-:2];
            33: the_chosen_A_base = sequence_A[533-:2];
            34: the_chosen_A_base = sequence_A[531-:2];
            35: the_chosen_A_base = sequence_A[529-:2];
            36: the_chosen_A_base = sequence_A[527-:2];
            37: the_chosen_A_base = sequence_A[525-:2];
            38: the_chosen_A_base = sequence_A[523-:2];
            39: the_chosen_A_base = sequence_A[521-:2];
            40: the_chosen_A_base = sequence_A[519-:2];
            41: the_chosen_A_base = sequence_A[517-:2];
            42: the_chosen_A_base = sequence_A[515-:2];
            43: the_chosen_A_base = sequence_A[513-:2];
            44: the_chosen_A_base = sequence_A[511-:2];
            45: the_chosen_A_base = sequence_A[509-:2];
            46: the_chosen_A_base = sequence_A[507-:2];
            47: the_chosen_A_base = sequence_A[505-:2];
            48: the_chosen_A_base = sequence_A[503-:2];
            49: the_chosen_A_base = sequence_A[501-:2];
            50: the_chosen_A_base = sequence_A[499-:2];
            51: the_chosen_A_base = sequence_A[497-:2];
            52: the_chosen_A_base = sequence_A[495-:2];
            53: the_chosen_A_base = sequence_A[493-:2];
            54: the_chosen_A_base = sequence_A[491-:2];
            55: the_chosen_A_base = sequence_A[489-:2];
            56: the_chosen_A_base = sequence_A[487-:2];
            57: the_chosen_A_base = sequence_A[485-:2];
            58: the_chosen_A_base = sequence_A[483-:2];
            59: the_chosen_A_base = sequence_A[481-:2];
            60: the_chosen_A_base = sequence_A[479-:2];
            61: the_chosen_A_base = sequence_A[477-:2];
            62: the_chosen_A_base = sequence_A[475-:2];
            63: the_chosen_A_base = sequence_A[473-:2];
            64: the_chosen_A_base = sequence_A[471-:2];
            65: the_chosen_A_base = sequence_A[469-:2];
            66: the_chosen_A_base = sequence_A[467-:2];
            67: the_chosen_A_base = sequence_A[465-:2];
            68: the_chosen_A_base = sequence_A[463-:2];
            69: the_chosen_A_base = sequence_A[461-:2];
            70: the_chosen_A_base = sequence_A[459-:2];
            71: the_chosen_A_base = sequence_A[457-:2];
            72: the_chosen_A_base = sequence_A[455-:2];
            73: the_chosen_A_base = sequence_A[453-:2];
            74: the_chosen_A_base = sequence_A[451-:2];
            75: the_chosen_A_base = sequence_A[449-:2];
            76: the_chosen_A_base = sequence_A[447-:2];
            77: the_chosen_A_base = sequence_A[445-:2];
            78: the_chosen_A_base = sequence_A[443-:2];
            79: the_chosen_A_base = sequence_A[441-:2];
            80: the_chosen_A_base = sequence_A[439-:2];
            81: the_chosen_A_base = sequence_A[437-:2];
            82: the_chosen_A_base = sequence_A[435-:2];
            83: the_chosen_A_base = sequence_A[433-:2];
            84: the_chosen_A_base = sequence_A[431-:2];
            85: the_chosen_A_base = sequence_A[429-:2];
            86: the_chosen_A_base = sequence_A[427-:2];
            87: the_chosen_A_base = sequence_A[425-:2];
            88: the_chosen_A_base = sequence_A[423-:2];
            89: the_chosen_A_base = sequence_A[421-:2];
            90: the_chosen_A_base = sequence_A[419-:2];
            91: the_chosen_A_base = sequence_A[417-:2];
            92: the_chosen_A_base = sequence_A[415-:2];
            93: the_chosen_A_base = sequence_A[413-:2];
            94: the_chosen_A_base = sequence_A[411-:2];
            95: the_chosen_A_base = sequence_A[409-:2];
            96: the_chosen_A_base = sequence_A[407-:2];
            97: the_chosen_A_base = sequence_A[405-:2];
            98: the_chosen_A_base = sequence_A[403-:2];
            99: the_chosen_A_base = sequence_A[401-:2];
            100: the_chosen_A_base = sequence_A[399-:2];
            101: the_chosen_A_base = sequence_A[397-:2];
            102: the_chosen_A_base = sequence_A[395-:2];
            103: the_chosen_A_base = sequence_A[393-:2];
            104: the_chosen_A_base = sequence_A[391-:2];
            105: the_chosen_A_base = sequence_A[389-:2];
            106: the_chosen_A_base = sequence_A[387-:2];
            107: the_chosen_A_base = sequence_A[385-:2];
            108: the_chosen_A_base = sequence_A[383-:2];
            109: the_chosen_A_base = sequence_A[381-:2];
            110: the_chosen_A_base = sequence_A[379-:2];
            111: the_chosen_A_base = sequence_A[377-:2];
            112: the_chosen_A_base = sequence_A[375-:2];
            113: the_chosen_A_base = sequence_A[373-:2];
            114: the_chosen_A_base = sequence_A[371-:2];
            115: the_chosen_A_base = sequence_A[369-:2];
            116: the_chosen_A_base = sequence_A[367-:2];
            117: the_chosen_A_base = sequence_A[365-:2];
            118: the_chosen_A_base = sequence_A[363-:2];
            119: the_chosen_A_base = sequence_A[361-:2];
            120: the_chosen_A_base = sequence_A[359-:2];
            121: the_chosen_A_base = sequence_A[357-:2];
            122: the_chosen_A_base = sequence_A[355-:2];
            123: the_chosen_A_base = sequence_A[353-:2];
            124: the_chosen_A_base = sequence_A[351-:2];
            125: the_chosen_A_base = sequence_A[349-:2];
            126: the_chosen_A_base = sequence_A[347-:2];
            127: the_chosen_A_base = sequence_A[345-:2];
            128: the_chosen_A_base = sequence_A[343-:2];
            129: the_chosen_A_base = sequence_A[341-:2];
            130: the_chosen_A_base = sequence_A[339-:2];
            131: the_chosen_A_base = sequence_A[337-:2];
            132: the_chosen_A_base = sequence_A[335-:2];
            133: the_chosen_A_base = sequence_A[333-:2];
            134: the_chosen_A_base = sequence_A[331-:2];
            135: the_chosen_A_base = sequence_A[329-:2];
            136: the_chosen_A_base = sequence_A[327-:2];
            137: the_chosen_A_base = sequence_A[325-:2];
            138: the_chosen_A_base = sequence_A[323-:2];
            139: the_chosen_A_base = sequence_A[321-:2];
            140: the_chosen_A_base = sequence_A[319-:2];
            141: the_chosen_A_base = sequence_A[317-:2];
            142: the_chosen_A_base = sequence_A[315-:2];
            143: the_chosen_A_base = sequence_A[313-:2];
            144: the_chosen_A_base = sequence_A[311-:2];
            145: the_chosen_A_base = sequence_A[309-:2];
            146: the_chosen_A_base = sequence_A[307-:2];
            147: the_chosen_A_base = sequence_A[305-:2];
            148: the_chosen_A_base = sequence_A[303-:2];
            149: the_chosen_A_base = sequence_A[301-:2];
            150: the_chosen_A_base = sequence_A[299-:2];
            151: the_chosen_A_base = sequence_A[297-:2];
            152: the_chosen_A_base = sequence_A[295-:2];
            153: the_chosen_A_base = sequence_A[293-:2];
            154: the_chosen_A_base = sequence_A[291-:2];
            155: the_chosen_A_base = sequence_A[289-:2];
            156: the_chosen_A_base = sequence_A[287-:2];
            157: the_chosen_A_base = sequence_A[285-:2];
            158: the_chosen_A_base = sequence_A[283-:2];
            159: the_chosen_A_base = sequence_A[281-:2];
            160: the_chosen_A_base = sequence_A[279-:2];
            161: the_chosen_A_base = sequence_A[277-:2];
            162: the_chosen_A_base = sequence_A[275-:2];
            163: the_chosen_A_base = sequence_A[273-:2];
            164: the_chosen_A_base = sequence_A[271-:2];
            165: the_chosen_A_base = sequence_A[269-:2];
            166: the_chosen_A_base = sequence_A[267-:2];
            167: the_chosen_A_base = sequence_A[265-:2];
            168: the_chosen_A_base = sequence_A[263-:2];
            169: the_chosen_A_base = sequence_A[261-:2];
            170: the_chosen_A_base = sequence_A[259-:2];
            171: the_chosen_A_base = sequence_A[257-:2];
            172: the_chosen_A_base = sequence_A[255-:2];
            173: the_chosen_A_base = sequence_A[253-:2];
            174: the_chosen_A_base = sequence_A[251-:2];
            175: the_chosen_A_base = sequence_A[249-:2];
            176: the_chosen_A_base = sequence_A[247-:2];
            177: the_chosen_A_base = sequence_A[245-:2];
            178: the_chosen_A_base = sequence_A[243-:2];
            179: the_chosen_A_base = sequence_A[241-:2];
            180: the_chosen_A_base = sequence_A[239-:2];
            181: the_chosen_A_base = sequence_A[237-:2];
            182: the_chosen_A_base = sequence_A[235-:2];
            183: the_chosen_A_base = sequence_A[233-:2];
            184: the_chosen_A_base = sequence_A[231-:2];
            185: the_chosen_A_base = sequence_A[229-:2];
            186: the_chosen_A_base = sequence_A[227-:2];
            187: the_chosen_A_base = sequence_A[225-:2];
            188: the_chosen_A_base = sequence_A[223-:2];
            189: the_chosen_A_base = sequence_A[221-:2];
            190: the_chosen_A_base = sequence_A[219-:2];
            191: the_chosen_A_base = sequence_A[217-:2];
            192: the_chosen_A_base = sequence_A[215-:2];
            193: the_chosen_A_base = sequence_A[213-:2];
            194: the_chosen_A_base = sequence_A[211-:2];
            195: the_chosen_A_base = sequence_A[209-:2];
            196: the_chosen_A_base = sequence_A[207-:2];
            197: the_chosen_A_base = sequence_A[205-:2];
            198: the_chosen_A_base = sequence_A[203-:2];
            199: the_chosen_A_base = sequence_A[201-:2];
            200: the_chosen_A_base = sequence_A[199-:2];
            201: the_chosen_A_base = sequence_A[197-:2];
            202: the_chosen_A_base = sequence_A[195-:2];
            203: the_chosen_A_base = sequence_A[193-:2];
            204: the_chosen_A_base = sequence_A[191-:2];
            205: the_chosen_A_base = sequence_A[189-:2];
            206: the_chosen_A_base = sequence_A[187-:2];
            207: the_chosen_A_base = sequence_A[185-:2];
            208: the_chosen_A_base = sequence_A[183-:2];
            209: the_chosen_A_base = sequence_A[181-:2];
            210: the_chosen_A_base = sequence_A[179-:2];
            211: the_chosen_A_base = sequence_A[177-:2];
            212: the_chosen_A_base = sequence_A[175-:2];
            213: the_chosen_A_base = sequence_A[173-:2];
            214: the_chosen_A_base = sequence_A[171-:2];
            215: the_chosen_A_base = sequence_A[169-:2];
            216: the_chosen_A_base = sequence_A[167-:2];
            217: the_chosen_A_base = sequence_A[165-:2];
            218: the_chosen_A_base = sequence_A[163-:2];
            219: the_chosen_A_base = sequence_A[161-:2];
            220: the_chosen_A_base = sequence_A[159-:2];
            221: the_chosen_A_base = sequence_A[157-:2];
            222: the_chosen_A_base = sequence_A[155-:2];
            223: the_chosen_A_base = sequence_A[153-:2];
            224: the_chosen_A_base = sequence_A[151-:2];
            225: the_chosen_A_base = sequence_A[149-:2];
            226: the_chosen_A_base = sequence_A[147-:2];
            227: the_chosen_A_base = sequence_A[145-:2];
            228: the_chosen_A_base = sequence_A[143-:2];
            229: the_chosen_A_base = sequence_A[141-:2];
            230: the_chosen_A_base = sequence_A[139-:2];
            231: the_chosen_A_base = sequence_A[137-:2];
            232: the_chosen_A_base = sequence_A[135-:2];
            233: the_chosen_A_base = sequence_A[133-:2];
            234: the_chosen_A_base = sequence_A[131-:2];
            235: the_chosen_A_base = sequence_A[129-:2];
            236: the_chosen_A_base = sequence_A[127-:2];
            237: the_chosen_A_base = sequence_A[125-:2];
            238: the_chosen_A_base = sequence_A[123-:2];
            239: the_chosen_A_base = sequence_A[121-:2];
            240: the_chosen_A_base = sequence_A[119-:2];
            241: the_chosen_A_base = sequence_A[117-:2];
            242: the_chosen_A_base = sequence_A[115-:2];
            243: the_chosen_A_base = sequence_A[113-:2];
            244: the_chosen_A_base = sequence_A[111-:2];
            245: the_chosen_A_base = sequence_A[109-:2];
            246: the_chosen_A_base = sequence_A[107-:2];
            247: the_chosen_A_base = sequence_A[105-:2];
            248: the_chosen_A_base = sequence_A[103-:2];
            249: the_chosen_A_base = sequence_A[101-:2];
            250: the_chosen_A_base = sequence_A[99-:2];
            251: the_chosen_A_base = sequence_A[97-:2];
            252: the_chosen_A_base = sequence_A[95-:2];
            253: the_chosen_A_base = sequence_A[93-:2];
            254: the_chosen_A_base = sequence_A[91-:2];
            255: the_chosen_A_base = sequence_A[89-:2];
            256: the_chosen_A_base = sequence_A[87-:2];
            257: the_chosen_A_base = sequence_A[85-:2];
            258: the_chosen_A_base = sequence_A[83-:2];
            259: the_chosen_A_base = sequence_A[81-:2];
            260: the_chosen_A_base = sequence_A[79-:2];
            261: the_chosen_A_base = sequence_A[77-:2];
            262: the_chosen_A_base = sequence_A[75-:2];
            263: the_chosen_A_base = sequence_A[73-:2];
            264: the_chosen_A_base = sequence_A[71-:2];
            265: the_chosen_A_base = sequence_A[69-:2];
            266: the_chosen_A_base = sequence_A[67-:2];
            267: the_chosen_A_base = sequence_A[65-:2];
            268: the_chosen_A_base = sequence_A[63-:2];
            269: the_chosen_A_base = sequence_A[61-:2];
            270: the_chosen_A_base = sequence_A[59-:2];
            271: the_chosen_A_base = sequence_A[57-:2];
            272: the_chosen_A_base = sequence_A[55-:2];
            273: the_chosen_A_base = sequence_A[53-:2];
            274: the_chosen_A_base = sequence_A[51-:2];
            275: the_chosen_A_base = sequence_A[49-:2];
            276: the_chosen_A_base = sequence_A[47-:2];
            277: the_chosen_A_base = sequence_A[45-:2];
            278: the_chosen_A_base = sequence_A[43-:2];
            279: the_chosen_A_base = sequence_A[41-:2];
            280: the_chosen_A_base = sequence_A[39-:2];
            281: the_chosen_A_base = sequence_A[37-:2];
            282: the_chosen_A_base = sequence_A[35-:2];
            283: the_chosen_A_base = sequence_A[33-:2];
            284: the_chosen_A_base = sequence_A[31-:2];
            285: the_chosen_A_base = sequence_A[29-:2];
            286: the_chosen_A_base = sequence_A[27-:2];
            287: the_chosen_A_base = sequence_A[25-:2];
            288: the_chosen_A_base = sequence_A[23-:2];
            289: the_chosen_A_base = sequence_A[21-:2];
            290: the_chosen_A_base = sequence_A[19-:2];
            291: the_chosen_A_base = sequence_A[17-:2];
            292: the_chosen_A_base = sequence_A[15-:2];
            293: the_chosen_A_base = sequence_A[13-:2];
            294: the_chosen_A_base = sequence_A[11-:2];
            295: the_chosen_A_base = sequence_A[9-:2];
            296: the_chosen_A_base = sequence_A[7-:2];
            297: the_chosen_A_base = sequence_A[5-:2];
            298: the_chosen_A_base = sequence_A[3-:2];
            299: the_chosen_A_base = sequence_A[1-:2];
        endcase
	end
	
	always@(*) begin
        the_chosen_B_base = 0;
        case(row)
            0:  the_chosen_B_base = sequence_B[799-:2];
            1:  the_chosen_B_base = sequence_B[797-:2];
            2:  the_chosen_B_base = sequence_B[795-:2];
            3:  the_chosen_B_base = sequence_B[793-:2];
            4:  the_chosen_B_base = sequence_B[791-:2];
            5:  the_chosen_B_base = sequence_B[789-:2];
            6:  the_chosen_B_base = sequence_B[787-:2];
            7:  the_chosen_B_base = sequence_B[785-:2];
            8:  the_chosen_B_base = sequence_B[783-:2];
            9:  the_chosen_B_base = sequence_B[781-:2];
            10:  the_chosen_B_base = sequence_B[779-:2];
            11:  the_chosen_B_base = sequence_B[777-:2];
            12:  the_chosen_B_base = sequence_B[775-:2];
            13:  the_chosen_B_base = sequence_B[773-:2];
            14:  the_chosen_B_base = sequence_B[771-:2];
            15:  the_chosen_B_base = sequence_B[769-:2];
            16:  the_chosen_B_base = sequence_B[767-:2];
            17:  the_chosen_B_base = sequence_B[765-:2];
            18:  the_chosen_B_base = sequence_B[763-:2];
            19:  the_chosen_B_base = sequence_B[761-:2];
            20:  the_chosen_B_base = sequence_B[759-:2];
            21:  the_chosen_B_base = sequence_B[757-:2];
            22:  the_chosen_B_base = sequence_B[755-:2];
            23:  the_chosen_B_base = sequence_B[753-:2];
            24:  the_chosen_B_base = sequence_B[751-:2];
            25:  the_chosen_B_base = sequence_B[749-:2];
            26:  the_chosen_B_base = sequence_B[747-:2];
            27:  the_chosen_B_base = sequence_B[745-:2];
            28:  the_chosen_B_base = sequence_B[743-:2];
            29:  the_chosen_B_base = sequence_B[741-:2];
            30:  the_chosen_B_base = sequence_B[739-:2];
            31:  the_chosen_B_base = sequence_B[737-:2];
            32:  the_chosen_B_base = sequence_B[735-:2];
            33:  the_chosen_B_base = sequence_B[733-:2];
            34:  the_chosen_B_base = sequence_B[731-:2];
            35:  the_chosen_B_base = sequence_B[729-:2];
            36:  the_chosen_B_base = sequence_B[727-:2];
            37:  the_chosen_B_base = sequence_B[725-:2];
            38:  the_chosen_B_base = sequence_B[723-:2];
            39:  the_chosen_B_base = sequence_B[721-:2];
            40:  the_chosen_B_base = sequence_B[719-:2];
            41:  the_chosen_B_base = sequence_B[717-:2];
            42:  the_chosen_B_base = sequence_B[715-:2];
            43:  the_chosen_B_base = sequence_B[713-:2];
            44:  the_chosen_B_base = sequence_B[711-:2];
            45:  the_chosen_B_base = sequence_B[709-:2];
            46:  the_chosen_B_base = sequence_B[707-:2];
            47:  the_chosen_B_base = sequence_B[705-:2];
            48:  the_chosen_B_base = sequence_B[703-:2];
            49:  the_chosen_B_base = sequence_B[701-:2];
            50:  the_chosen_B_base = sequence_B[699-:2];
            51:  the_chosen_B_base = sequence_B[697-:2];
            52:  the_chosen_B_base = sequence_B[695-:2];
            53:  the_chosen_B_base = sequence_B[693-:2];
            54:  the_chosen_B_base = sequence_B[691-:2];
            55:  the_chosen_B_base = sequence_B[689-:2];
            56:  the_chosen_B_base = sequence_B[687-:2];
            57:  the_chosen_B_base = sequence_B[685-:2];
            58:  the_chosen_B_base = sequence_B[683-:2];
            59:  the_chosen_B_base = sequence_B[681-:2];
            60:  the_chosen_B_base = sequence_B[679-:2];
            61:  the_chosen_B_base = sequence_B[677-:2];
            62:  the_chosen_B_base = sequence_B[675-:2];
            63:  the_chosen_B_base = sequence_B[673-:2];
            64:  the_chosen_B_base = sequence_B[671-:2];
            65:  the_chosen_B_base = sequence_B[669-:2];
            66:  the_chosen_B_base = sequence_B[667-:2];
            67:  the_chosen_B_base = sequence_B[665-:2];
            68:  the_chosen_B_base = sequence_B[663-:2];
            69:  the_chosen_B_base = sequence_B[661-:2];
            70:  the_chosen_B_base = sequence_B[659-:2];
            71:  the_chosen_B_base = sequence_B[657-:2];
            72:  the_chosen_B_base = sequence_B[655-:2];
            73:  the_chosen_B_base = sequence_B[653-:2];
            74:  the_chosen_B_base = sequence_B[651-:2];
            75:  the_chosen_B_base = sequence_B[649-:2];
            76:  the_chosen_B_base = sequence_B[647-:2];
            77:  the_chosen_B_base = sequence_B[645-:2];
            78:  the_chosen_B_base = sequence_B[643-:2];
            79:  the_chosen_B_base = sequence_B[641-:2];
            80:  the_chosen_B_base = sequence_B[639-:2];
            81:  the_chosen_B_base = sequence_B[637-:2];
            82:  the_chosen_B_base = sequence_B[635-:2];
            83:  the_chosen_B_base = sequence_B[633-:2];
            84:  the_chosen_B_base = sequence_B[631-:2];
            85:  the_chosen_B_base = sequence_B[629-:2];
            86:  the_chosen_B_base = sequence_B[627-:2];
            87:  the_chosen_B_base = sequence_B[625-:2];
            88:  the_chosen_B_base = sequence_B[623-:2];
            89:  the_chosen_B_base = sequence_B[621-:2];
            90:  the_chosen_B_base = sequence_B[619-:2];
            91:  the_chosen_B_base = sequence_B[617-:2];
            92:  the_chosen_B_base = sequence_B[615-:2];
            93:  the_chosen_B_base = sequence_B[613-:2];
            94:  the_chosen_B_base = sequence_B[611-:2];
            95:  the_chosen_B_base = sequence_B[609-:2];
            96:  the_chosen_B_base = sequence_B[607-:2];
            97:  the_chosen_B_base = sequence_B[605-:2];
            98:  the_chosen_B_base = sequence_B[603-:2];
            99:  the_chosen_B_base = sequence_B[601-:2];
            100:  the_chosen_B_base = sequence_B[599-:2];
            101:  the_chosen_B_base = sequence_B[597-:2];
            102:  the_chosen_B_base = sequence_B[595-:2];
            103:  the_chosen_B_base = sequence_B[593-:2];
            104:  the_chosen_B_base = sequence_B[591-:2];
            105:  the_chosen_B_base = sequence_B[589-:2];
            106:  the_chosen_B_base = sequence_B[587-:2];
            107:  the_chosen_B_base = sequence_B[585-:2];
            108:  the_chosen_B_base = sequence_B[583-:2];
            109:  the_chosen_B_base = sequence_B[581-:2];
            110:  the_chosen_B_base = sequence_B[579-:2];
            111:  the_chosen_B_base = sequence_B[577-:2];
            112:  the_chosen_B_base = sequence_B[575-:2];
            113:  the_chosen_B_base = sequence_B[573-:2];
            114:  the_chosen_B_base = sequence_B[571-:2];
            115:  the_chosen_B_base = sequence_B[569-:2];
            116:  the_chosen_B_base = sequence_B[567-:2];
            117:  the_chosen_B_base = sequence_B[565-:2];
            118:  the_chosen_B_base = sequence_B[563-:2];
            119:  the_chosen_B_base = sequence_B[561-:2];
            120:  the_chosen_B_base = sequence_B[559-:2];
            121:  the_chosen_B_base = sequence_B[557-:2];
            122:  the_chosen_B_base = sequence_B[555-:2];
            123:  the_chosen_B_base = sequence_B[553-:2];
            124:  the_chosen_B_base = sequence_B[551-:2];
            125:  the_chosen_B_base = sequence_B[549-:2];
            126:  the_chosen_B_base = sequence_B[547-:2];
            127:  the_chosen_B_base = sequence_B[545-:2];
            128:  the_chosen_B_base = sequence_B[543-:2];
            129:  the_chosen_B_base = sequence_B[541-:2];
            130:  the_chosen_B_base = sequence_B[539-:2];
            131:  the_chosen_B_base = sequence_B[537-:2];
            132:  the_chosen_B_base = sequence_B[535-:2];
            133:  the_chosen_B_base = sequence_B[533-:2];
            134:  the_chosen_B_base = sequence_B[531-:2];
            135:  the_chosen_B_base = sequence_B[529-:2];
            136:  the_chosen_B_base = sequence_B[527-:2];
            137:  the_chosen_B_base = sequence_B[525-:2];
            138:  the_chosen_B_base = sequence_B[523-:2];
            139:  the_chosen_B_base = sequence_B[521-:2];
            140:  the_chosen_B_base = sequence_B[519-:2];
            141:  the_chosen_B_base = sequence_B[517-:2];
            142:  the_chosen_B_base = sequence_B[515-:2];
            143:  the_chosen_B_base = sequence_B[513-:2];
            144:  the_chosen_B_base = sequence_B[511-:2];
            145:  the_chosen_B_base = sequence_B[509-:2];
            146:  the_chosen_B_base = sequence_B[507-:2];
            147:  the_chosen_B_base = sequence_B[505-:2];
            148:  the_chosen_B_base = sequence_B[503-:2];
            149:  the_chosen_B_base = sequence_B[501-:2];
            150:  the_chosen_B_base = sequence_B[499-:2];
            151:  the_chosen_B_base = sequence_B[497-:2];
            152:  the_chosen_B_base = sequence_B[495-:2];
            153:  the_chosen_B_base = sequence_B[493-:2];
            154:  the_chosen_B_base = sequence_B[491-:2];
            155:  the_chosen_B_base = sequence_B[489-:2];
            156:  the_chosen_B_base = sequence_B[487-:2];
            157:  the_chosen_B_base = sequence_B[485-:2];
            158:  the_chosen_B_base = sequence_B[483-:2];
            159:  the_chosen_B_base = sequence_B[481-:2];
            160:  the_chosen_B_base = sequence_B[479-:2];
            161:  the_chosen_B_base = sequence_B[477-:2];
            162:  the_chosen_B_base = sequence_B[475-:2];
            163:  the_chosen_B_base = sequence_B[473-:2];
            164:  the_chosen_B_base = sequence_B[471-:2];
            165:  the_chosen_B_base = sequence_B[469-:2];
            166:  the_chosen_B_base = sequence_B[467-:2];
            167:  the_chosen_B_base = sequence_B[465-:2];
            168:  the_chosen_B_base = sequence_B[463-:2];
            169:  the_chosen_B_base = sequence_B[461-:2];
            170:  the_chosen_B_base = sequence_B[459-:2];
            171:  the_chosen_B_base = sequence_B[457-:2];
            172:  the_chosen_B_base = sequence_B[455-:2];
            173:  the_chosen_B_base = sequence_B[453-:2];
            174:  the_chosen_B_base = sequence_B[451-:2];
            175:  the_chosen_B_base = sequence_B[449-:2];
            176:  the_chosen_B_base = sequence_B[447-:2];
            177:  the_chosen_B_base = sequence_B[445-:2];
            178:  the_chosen_B_base = sequence_B[443-:2];
            179:  the_chosen_B_base = sequence_B[441-:2];
            180:  the_chosen_B_base = sequence_B[439-:2];
            181:  the_chosen_B_base = sequence_B[437-:2];
            182:  the_chosen_B_base = sequence_B[435-:2];
            183:  the_chosen_B_base = sequence_B[433-:2];
            184:  the_chosen_B_base = sequence_B[431-:2];
            185:  the_chosen_B_base = sequence_B[429-:2];
            186:  the_chosen_B_base = sequence_B[427-:2];
            187:  the_chosen_B_base = sequence_B[425-:2];
            188:  the_chosen_B_base = sequence_B[423-:2];
            189:  the_chosen_B_base = sequence_B[421-:2];
            190:  the_chosen_B_base = sequence_B[419-:2];
            191:  the_chosen_B_base = sequence_B[417-:2];
            192:  the_chosen_B_base = sequence_B[415-:2];
            193:  the_chosen_B_base = sequence_B[413-:2];
            194:  the_chosen_B_base = sequence_B[411-:2];
            195:  the_chosen_B_base = sequence_B[409-:2];
            196:  the_chosen_B_base = sequence_B[407-:2];
            197:  the_chosen_B_base = sequence_B[405-:2];
            198:  the_chosen_B_base = sequence_B[403-:2];
            199:  the_chosen_B_base = sequence_B[401-:2];
            200:  the_chosen_B_base = sequence_B[399-:2];
            201:  the_chosen_B_base = sequence_B[397-:2];
            202:  the_chosen_B_base = sequence_B[395-:2];
            203:  the_chosen_B_base = sequence_B[393-:2];
            204:  the_chosen_B_base = sequence_B[391-:2];
            205:  the_chosen_B_base = sequence_B[389-:2];
            206:  the_chosen_B_base = sequence_B[387-:2];
            207:  the_chosen_B_base = sequence_B[385-:2];
            208:  the_chosen_B_base = sequence_B[383-:2];
            209:  the_chosen_B_base = sequence_B[381-:2];
            210:  the_chosen_B_base = sequence_B[379-:2];
            211:  the_chosen_B_base = sequence_B[377-:2];
            212:  the_chosen_B_base = sequence_B[375-:2];
            213:  the_chosen_B_base = sequence_B[373-:2];
            214:  the_chosen_B_base = sequence_B[371-:2];
            215:  the_chosen_B_base = sequence_B[369-:2];
            216:  the_chosen_B_base = sequence_B[367-:2];
            217:  the_chosen_B_base = sequence_B[365-:2];
            218:  the_chosen_B_base = sequence_B[363-:2];
            219:  the_chosen_B_base = sequence_B[361-:2];
            220:  the_chosen_B_base = sequence_B[359-:2];
            221:  the_chosen_B_base = sequence_B[357-:2];
            222:  the_chosen_B_base = sequence_B[355-:2];
            223:  the_chosen_B_base = sequence_B[353-:2];
            224:  the_chosen_B_base = sequence_B[351-:2];
            225:  the_chosen_B_base = sequence_B[349-:2];
            226:  the_chosen_B_base = sequence_B[347-:2];
            227:  the_chosen_B_base = sequence_B[345-:2];
            228:  the_chosen_B_base = sequence_B[343-:2];
            229:  the_chosen_B_base = sequence_B[341-:2];
            230:  the_chosen_B_base = sequence_B[339-:2];
            231:  the_chosen_B_base = sequence_B[337-:2];
            232:  the_chosen_B_base = sequence_B[335-:2];
            233:  the_chosen_B_base = sequence_B[333-:2];
            234:  the_chosen_B_base = sequence_B[331-:2];
            235:  the_chosen_B_base = sequence_B[329-:2];
            236:  the_chosen_B_base = sequence_B[327-:2];
            237:  the_chosen_B_base = sequence_B[325-:2];
            238:  the_chosen_B_base = sequence_B[323-:2];
            239:  the_chosen_B_base = sequence_B[321-:2];
            240:  the_chosen_B_base = sequence_B[319-:2];
            241:  the_chosen_B_base = sequence_B[317-:2];
            242:  the_chosen_B_base = sequence_B[315-:2];
            243:  the_chosen_B_base = sequence_B[313-:2];
            244:  the_chosen_B_base = sequence_B[311-:2];
            245:  the_chosen_B_base = sequence_B[309-:2];
            246:  the_chosen_B_base = sequence_B[307-:2];
            247:  the_chosen_B_base = sequence_B[305-:2];
            248:  the_chosen_B_base = sequence_B[303-:2];
            249:  the_chosen_B_base = sequence_B[301-:2];
            250:  the_chosen_B_base = sequence_B[299-:2];
            251:  the_chosen_B_base = sequence_B[297-:2];
            252:  the_chosen_B_base = sequence_B[295-:2];
            253:  the_chosen_B_base = sequence_B[293-:2];
            254:  the_chosen_B_base = sequence_B[291-:2];
            255:  the_chosen_B_base = sequence_B[289-:2];
            256:  the_chosen_B_base = sequence_B[287-:2];
            257:  the_chosen_B_base = sequence_B[285-:2];
            258:  the_chosen_B_base = sequence_B[283-:2];
            259:  the_chosen_B_base = sequence_B[281-:2];
            260:  the_chosen_B_base = sequence_B[279-:2];
            261:  the_chosen_B_base = sequence_B[277-:2];
            262:  the_chosen_B_base = sequence_B[275-:2];
            263:  the_chosen_B_base = sequence_B[273-:2];
            264:  the_chosen_B_base = sequence_B[271-:2];
            265:  the_chosen_B_base = sequence_B[269-:2];
            266:  the_chosen_B_base = sequence_B[267-:2];
            267:  the_chosen_B_base = sequence_B[265-:2];
            268:  the_chosen_B_base = sequence_B[263-:2];
            269:  the_chosen_B_base = sequence_B[261-:2];
            270:  the_chosen_B_base = sequence_B[259-:2];
            271:  the_chosen_B_base = sequence_B[257-:2];
            272:  the_chosen_B_base = sequence_B[255-:2];
            273:  the_chosen_B_base = sequence_B[253-:2];
            274:  the_chosen_B_base = sequence_B[251-:2];
            275:  the_chosen_B_base = sequence_B[249-:2];
            276:  the_chosen_B_base = sequence_B[247-:2];
            277:  the_chosen_B_base = sequence_B[245-:2];
            278:  the_chosen_B_base = sequence_B[243-:2];
            279:  the_chosen_B_base = sequence_B[241-:2];
            280:  the_chosen_B_base = sequence_B[239-:2];
            281:  the_chosen_B_base = sequence_B[237-:2];
            282:  the_chosen_B_base = sequence_B[235-:2];
            283:  the_chosen_B_base = sequence_B[233-:2];
            284:  the_chosen_B_base = sequence_B[231-:2];
            285:  the_chosen_B_base = sequence_B[229-:2];
            286:  the_chosen_B_base = sequence_B[227-:2];
            287:  the_chosen_B_base = sequence_B[225-:2];
            288:  the_chosen_B_base = sequence_B[223-:2];
            289:  the_chosen_B_base = sequence_B[221-:2];
            290:  the_chosen_B_base = sequence_B[219-:2];
            291:  the_chosen_B_base = sequence_B[217-:2];
            292:  the_chosen_B_base = sequence_B[215-:2];
            293:  the_chosen_B_base = sequence_B[213-:2];
            294:  the_chosen_B_base = sequence_B[211-:2];
            295:  the_chosen_B_base = sequence_B[209-:2];
            296:  the_chosen_B_base = sequence_B[207-:2];
            297:  the_chosen_B_base = sequence_B[205-:2];
            298:  the_chosen_B_base = sequence_B[203-:2];
            299:  the_chosen_B_base = sequence_B[201-:2];
            300:  the_chosen_B_base = sequence_B[199-:2];
            301:  the_chosen_B_base = sequence_B[197-:2];
            302:  the_chosen_B_base = sequence_B[195-:2];
            303:  the_chosen_B_base = sequence_B[193-:2];
            304:  the_chosen_B_base = sequence_B[191-:2];
            305:  the_chosen_B_base = sequence_B[189-:2];
            306:  the_chosen_B_base = sequence_B[187-:2];
            307:  the_chosen_B_base = sequence_B[185-:2];
            308:  the_chosen_B_base = sequence_B[183-:2];
            309:  the_chosen_B_base = sequence_B[181-:2];
            310:  the_chosen_B_base = sequence_B[179-:2];
            311:  the_chosen_B_base = sequence_B[177-:2];
            312:  the_chosen_B_base = sequence_B[175-:2];
            313:  the_chosen_B_base = sequence_B[173-:2];
            314:  the_chosen_B_base = sequence_B[171-:2];
            315:  the_chosen_B_base = sequence_B[169-:2];
            316:  the_chosen_B_base = sequence_B[167-:2];
            317:  the_chosen_B_base = sequence_B[165-:2];
            318:  the_chosen_B_base = sequence_B[163-:2];
            319:  the_chosen_B_base = sequence_B[161-:2];
            320:  the_chosen_B_base = sequence_B[159-:2];
            321:  the_chosen_B_base = sequence_B[157-:2];
            322:  the_chosen_B_base = sequence_B[155-:2];
            323:  the_chosen_B_base = sequence_B[153-:2];
            324:  the_chosen_B_base = sequence_B[151-:2];
            325:  the_chosen_B_base = sequence_B[149-:2];
            326:  the_chosen_B_base = sequence_B[147-:2];
            327:  the_chosen_B_base = sequence_B[145-:2];
            328:  the_chosen_B_base = sequence_B[143-:2];
            329:  the_chosen_B_base = sequence_B[141-:2];
            330:  the_chosen_B_base = sequence_B[139-:2];
            331:  the_chosen_B_base = sequence_B[137-:2];
            332:  the_chosen_B_base = sequence_B[135-:2];
            333:  the_chosen_B_base = sequence_B[133-:2];
            334:  the_chosen_B_base = sequence_B[131-:2];
            335:  the_chosen_B_base = sequence_B[129-:2];
            336:  the_chosen_B_base = sequence_B[127-:2];
            337:  the_chosen_B_base = sequence_B[125-:2];
            338:  the_chosen_B_base = sequence_B[123-:2];
            339:  the_chosen_B_base = sequence_B[121-:2];
            340:  the_chosen_B_base = sequence_B[119-:2];
            341:  the_chosen_B_base = sequence_B[117-:2];
            342:  the_chosen_B_base = sequence_B[115-:2];
            343:  the_chosen_B_base = sequence_B[113-:2];
            344:  the_chosen_B_base = sequence_B[111-:2];
            345:  the_chosen_B_base = sequence_B[109-:2];
            346:  the_chosen_B_base = sequence_B[107-:2];
            347:  the_chosen_B_base = sequence_B[105-:2];
            348:  the_chosen_B_base = sequence_B[103-:2];
            349:  the_chosen_B_base = sequence_B[101-:2];
            350:  the_chosen_B_base = sequence_B[99-:2];
            351:  the_chosen_B_base = sequence_B[97-:2];
            352:  the_chosen_B_base = sequence_B[95-:2];
            353:  the_chosen_B_base = sequence_B[93-:2];
            354:  the_chosen_B_base = sequence_B[91-:2];
            355:  the_chosen_B_base = sequence_B[89-:2];
            356:  the_chosen_B_base = sequence_B[87-:2];
            357:  the_chosen_B_base = sequence_B[85-:2];
            358:  the_chosen_B_base = sequence_B[83-:2];
            359:  the_chosen_B_base = sequence_B[81-:2];
            360:  the_chosen_B_base = sequence_B[79-:2];
            361:  the_chosen_B_base = sequence_B[77-:2];
            362:  the_chosen_B_base = sequence_B[75-:2];
            363:  the_chosen_B_base = sequence_B[73-:2];
            364:  the_chosen_B_base = sequence_B[71-:2];
            365:  the_chosen_B_base = sequence_B[69-:2];
            366:  the_chosen_B_base = sequence_B[67-:2];
            367:  the_chosen_B_base = sequence_B[65-:2];
            368:  the_chosen_B_base = sequence_B[63-:2];
            369:  the_chosen_B_base = sequence_B[61-:2];
            370:  the_chosen_B_base = sequence_B[59-:2];
            371:  the_chosen_B_base = sequence_B[57-:2];
            372:  the_chosen_B_base = sequence_B[55-:2];
            373:  the_chosen_B_base = sequence_B[53-:2];
            374:  the_chosen_B_base = sequence_B[51-:2];
            375:  the_chosen_B_base = sequence_B[49-:2];
            376:  the_chosen_B_base = sequence_B[47-:2];
            377:  the_chosen_B_base = sequence_B[45-:2];
            378:  the_chosen_B_base = sequence_B[43-:2];
            379:  the_chosen_B_base = sequence_B[41-:2];
            380:  the_chosen_B_base = sequence_B[39-:2];
            381:  the_chosen_B_base = sequence_B[37-:2];
            382:  the_chosen_B_base = sequence_B[35-:2];
            383:  the_chosen_B_base = sequence_B[33-:2];
            384:  the_chosen_B_base = sequence_B[31-:2];
            385:  the_chosen_B_base = sequence_B[29-:2];
            386:  the_chosen_B_base = sequence_B[27-:2];
            387:  the_chosen_B_base = sequence_B[25-:2];
            388:  the_chosen_B_base = sequence_B[23-:2];
            389:  the_chosen_B_base = sequence_B[21-:2];
            390:  the_chosen_B_base = sequence_B[19-:2];
            391:  the_chosen_B_base = sequence_B[17-:2];
            392:  the_chosen_B_base = sequence_B[15-:2];
            393:  the_chosen_B_base = sequence_B[13-:2];
            394:  the_chosen_B_base = sequence_B[11-:2];
            395:  the_chosen_B_base = sequence_B[9-:2];
            396:  the_chosen_B_base = sequence_B[7-:2];
            397:  the_chosen_B_base = sequence_B[5-:2];
            398:  the_chosen_B_base = sequence_B[3-:2];
            399:  the_chosen_B_base = sequence_B[1-:2];
        endcase
    end

    //----------------------------------------------------------------------------------------
    wire signed [`DP_SW_SCORE_BITWIDTH-1:0] PE_align_score              [`HAP_MAX_LENGTH:0];
    wire signed [`DP_SW_SCORE_BITWIDTH-1:0] PE_insert_score             [`HAP_MAX_LENGTH:0];
    wire signed [`DP_SW_SCORE_BITWIDTH-1:0] PE_delete_score             [`HAP_MAX_LENGTH:0];
    
    wire [1:0]                              PE_source_buff_n            [`HAP_MAX_LENGTH:0];
    wire signed [`DP_SW_SCORE_BITWIDTH-1:0] PE_the_score                [`HAP_MAX_LENGTH:0];
    wire                                    PE_last_A_base_valid        [`HAP_MAX_LENGTH:0];
    wire [1:0]                              PE_last_A_base              [`HAP_MAX_LENGTH:0];
	// source SRAM input ports
    wire [2*`HAP_MAX_LENGTH-1:0]  concatenated_align_sources;
    wire [2*`HAP_MAX_LENGTH-1:0]  concatenated_insert_sources;
    wire [2*`HAP_MAX_LENGTH-1:0]  concatenated_delete_sources;


    // PE[0]
    // PE[1]
    // PE[2]
    //  :
    //  :
    // PE[399]
    genvar gv;
    generate
        for (gv=0;gv<`HAP_MAX_LENGTH;gv=gv+1) begin: PEs
            if (gv==0) begin
                DP_var_PE_single u_PE_single(
                    ///////////////////////////////////// basics /////////////////////////////////////
                    .clk                        (clk),
                    .rst_n                      (rst_n),
                    ///////////////////////////////////// I/Os //////////////////////////////////////
                     .i_A_base_valid             ((state == S_calculate) && (counter < seq_A_length)),
                    .i_A_base                   (sequence_A_shifter[2*`REF_MAX_LENGTH-1-:2] ),
                    .i_B_base_valid             (sequence_B_valid[gv]                       ),
                    .i_B_base                   (sequence_B[2*`HAP_MAX_LENGTH-1-(2*gv)-:2]  ),
                    .i_align_top_score          ({(`DP_SW_SCORE_BITWIDTH){1'b0}}            ), // (0),
                    .i_insert_top_score         ({(`DP_SW_SCORE_BITWIDTH){1'b0}}            ), // (0),
                    .i_align_diagonal_score     ({(`DP_SW_SCORE_BITWIDTH){1'b0}}            ), // (0),
                    .i_insert_diagonal_score    ({(`DP_SW_SCORE_BITWIDTH){1'b0}}            ), // (0),
                    .i_delete_diagonal_score    ({(`DP_SW_SCORE_BITWIDTH){1'b0}}            ), // (0),
                    .i_align_left_score         (PE_align_score_d[gv]                       ),
                    .i_insert_left_score        (PE_insert_score_d[gv]                      ),
                    .i_delete_left_score        (PE_delete_score_d[gv]                      ),
                    .o_align_score              (PE_align_score[gv]                         ),
                    .o_insert_score             (PE_insert_score[gv]                        ),
                    .o_delete_score             (PE_delete_score[gv]                        ),
					.o_align_score_source       (concatenated_align_sources[2*gv+:2]        ),
                    .o_insert_score_source      (concatenated_insert_sources[2*gv+:2]       ),
                    .o_delete_score_source      (concatenated_delete_sources[2*gv+:2]       ),
                    .o_the_score_source         (PE_source_buff_n[gv]                       ),
                    .o_the_score                (PE_score_buff_n [gv]                       ),
                    .o_last_A_base_valid        (PE_last_A_base_valid[gv]                   ),
                    .o_last_A_base              (PE_last_A_base[gv]                         )
                );
            end else begin
                 DP_var_PE_single u_PE_single(
                    ///////////////////////////////////// basics /////////////////////////////////////
                    .clk                        (clk),
                    .rst_n                      (rst_n),
                    ///////////////////////////////////// I/Os //////////////////////////////////////
                    .i_A_base_valid             (PE_last_A_base_valid[gv-1]                 ),
                    .i_A_base                   (PE_last_A_base[gv-1]                       ),
                    .i_B_base_valid             (sequence_B_valid[gv]                       ),
                    .i_B_base                   (sequence_B[2*`HAP_MAX_LENGTH-1-(2*gv)-:2]  ),
                    .i_align_top_score          (PE_align_score_d  [gv-1]                   ),
                    .i_insert_top_score         (PE_insert_score_d [gv-1]                   ),
                    .i_align_diagonal_score     (PE_align_score_dd [gv-1]                   ),
                    .i_insert_diagonal_score    (PE_insert_score_dd[gv-1]                   ),
                    .i_delete_diagonal_score    (PE_delete_score_dd[gv-1]                   ),
                    .i_align_left_score         (PE_align_score_d[gv]                       ),
                    .i_insert_left_score        (PE_insert_score_d[gv]                      ),
                    .i_delete_left_score        (PE_delete_score_d[gv]                      ),
                    .o_align_score              (PE_align_score[gv]                         ),
                    .o_insert_score             (PE_insert_score[gv]                        ),
                    .o_delete_score             (PE_delete_score[gv]                        ),
                    .o_align_score_source       (concatenated_align_sources[2*gv+:2]        ),
                    .o_insert_score_source      (concatenated_insert_sources[2*gv+:2]       ),
                    .o_delete_score_source      (concatenated_delete_sources[2*gv+:2]       ),
                    .o_the_score_source         (PE_source_buff_n[gv]                       ),
                    .o_the_score                (PE_score_buff_n [gv]                       ),
                    .o_last_A_base_valid        (PE_last_A_base_valid[gv]                   ),
                    .o_last_A_base              (PE_last_A_base[gv]                         )
                );
            end
        end
    endgenerate

    

    // sources sram 

    GATK_Direction_SRAM u_align_source_sram(
        .clka	(clk),
        .wea	(align_source_sram_WEN),
        .addra  (align_source_sram_ADDR),
        .dina	(concatenated_align_sources),
        .douta		(align_source_sram_Q)
    );
    reg                                 insert_source_sram_WEN;
    reg  [`DIR_SRAM_ADDR_WIDTH-1:0]  insert_source_sram_ADDR;
    wire [2*`HAP_MAX_LENGTH-1:0]        insert_source_sram_Q;
    GATK_Direction_SRAM u_insert_source_sram(
        .clka   (clk),
        .wea	(insert_source_sram_WEN),
        .addra  (insert_source_sram_ADDR),
        .dina   (concatenated_insert_sources),
        .douta      (insert_source_sram_Q)
    );
    reg                                 delete_source_sram_WEN;
    reg  [`DIR_SRAM_ADDR_WIDTH-1:0]  delete_source_sram_ADDR;
    wire [2*`HAP_MAX_LENGTH-1:0]        delete_source_sram_Q;
    GATK_Direction_SRAM u_delete_source_sram(
        .clka   (clk),
        .wea 	(delete_source_sram_WEN),
        .addra  (delete_source_sram_ADDR),
        .dina   (concatenated_delete_sources),
        .douta      (delete_source_sram_Q)
    );

    reg [1:0] the_selected_align_source;
    reg [1:0] the_selected_insert_source;
    reg [1:0] the_selected_delete_source;
    wire [1:0] the_query_source = (the_score_source==2) ? the_selected_align_source :
                                  (the_score_source==1) ? the_selected_insert_source :
                                  (the_score_source==3) ? the_selected_delete_source : 0;
    
    // select row source from sram_Q
    always@(*) begin
        the_selected_align_source  = 0;
        the_selected_insert_source = 0;
        the_selected_delete_source = 0;

        case(row)
            0: begin
                the_selected_align_source = align_source_sram_Q[0+:2];
                the_selected_insert_source = insert_source_sram_Q[0+:2];
                the_selected_delete_source = delete_source_sram_Q[0+:2];
            end
            1: begin
                the_selected_align_source = align_source_sram_Q[2+:2];
                the_selected_insert_source = insert_source_sram_Q[2+:2];
                the_selected_delete_source = delete_source_sram_Q[2+:2];
            end
            2: begin
                the_selected_align_source = align_source_sram_Q[4+:2];
                the_selected_insert_source = insert_source_sram_Q[4+:2];
                the_selected_delete_source = delete_source_sram_Q[4+:2];
            end
            3: begin
                the_selected_align_source = align_source_sram_Q[6+:2];
                the_selected_insert_source = insert_source_sram_Q[6+:2];
                the_selected_delete_source = delete_source_sram_Q[6+:2];
            end
            4: begin
                the_selected_align_source = align_source_sram_Q[8+:2];
                the_selected_insert_source = insert_source_sram_Q[8+:2];
                the_selected_delete_source = delete_source_sram_Q[8+:2];
            end
            5: begin
                the_selected_align_source = align_source_sram_Q[10+:2];
                the_selected_insert_source = insert_source_sram_Q[10+:2];
                the_selected_delete_source = delete_source_sram_Q[10+:2];
            end
            6: begin
                the_selected_align_source = align_source_sram_Q[12+:2];
                the_selected_insert_source = insert_source_sram_Q[12+:2];
                the_selected_delete_source = delete_source_sram_Q[12+:2];
            end
            7: begin
                the_selected_align_source = align_source_sram_Q[14+:2];
                the_selected_insert_source = insert_source_sram_Q[14+:2];
                the_selected_delete_source = delete_source_sram_Q[14+:2];
            end
            8: begin
                the_selected_align_source = align_source_sram_Q[16+:2];
                the_selected_insert_source = insert_source_sram_Q[16+:2];
                the_selected_delete_source = delete_source_sram_Q[16+:2];
            end
            9: begin
                the_selected_align_source = align_source_sram_Q[18+:2];
                the_selected_insert_source = insert_source_sram_Q[18+:2];
                the_selected_delete_source = delete_source_sram_Q[18+:2];
            end
            10: begin
                the_selected_align_source = align_source_sram_Q[20+:2];
                the_selected_insert_source = insert_source_sram_Q[20+:2];
                the_selected_delete_source = delete_source_sram_Q[20+:2];
            end
            11: begin
                the_selected_align_source = align_source_sram_Q[22+:2];
                the_selected_insert_source = insert_source_sram_Q[22+:2];
                the_selected_delete_source = delete_source_sram_Q[22+:2];
            end
            12: begin
                the_selected_align_source = align_source_sram_Q[24+:2];
                the_selected_insert_source = insert_source_sram_Q[24+:2];
                the_selected_delete_source = delete_source_sram_Q[24+:2];
            end
            13: begin
                the_selected_align_source = align_source_sram_Q[26+:2];
                the_selected_insert_source = insert_source_sram_Q[26+:2];
                the_selected_delete_source = delete_source_sram_Q[26+:2];
            end
            14: begin
                the_selected_align_source = align_source_sram_Q[28+:2];
                the_selected_insert_source = insert_source_sram_Q[28+:2];
                the_selected_delete_source = delete_source_sram_Q[28+:2];
            end
            15: begin
                the_selected_align_source = align_source_sram_Q[30+:2];
                the_selected_insert_source = insert_source_sram_Q[30+:2];
                the_selected_delete_source = delete_source_sram_Q[30+:2];
            end
            16: begin
                the_selected_align_source = align_source_sram_Q[32+:2];
                the_selected_insert_source = insert_source_sram_Q[32+:2];
                the_selected_delete_source = delete_source_sram_Q[32+:2];
            end
            17: begin
                the_selected_align_source = align_source_sram_Q[34+:2];
                the_selected_insert_source = insert_source_sram_Q[34+:2];
                the_selected_delete_source = delete_source_sram_Q[34+:2];
            end
            18: begin
                the_selected_align_source = align_source_sram_Q[36+:2];
                the_selected_insert_source = insert_source_sram_Q[36+:2];
                the_selected_delete_source = delete_source_sram_Q[36+:2];
            end
            19: begin
                the_selected_align_source = align_source_sram_Q[38+:2];
                the_selected_insert_source = insert_source_sram_Q[38+:2];
                the_selected_delete_source = delete_source_sram_Q[38+:2];
            end
            20: begin
                the_selected_align_source = align_source_sram_Q[40+:2];
                the_selected_insert_source = insert_source_sram_Q[40+:2];
                the_selected_delete_source = delete_source_sram_Q[40+:2];
            end
            21: begin
                the_selected_align_source = align_source_sram_Q[42+:2];
                the_selected_insert_source = insert_source_sram_Q[42+:2];
                the_selected_delete_source = delete_source_sram_Q[42+:2];
            end
            22: begin
                the_selected_align_source = align_source_sram_Q[44+:2];
                the_selected_insert_source = insert_source_sram_Q[44+:2];
                the_selected_delete_source = delete_source_sram_Q[44+:2];
            end
            23: begin
                the_selected_align_source = align_source_sram_Q[46+:2];
                the_selected_insert_source = insert_source_sram_Q[46+:2];
                the_selected_delete_source = delete_source_sram_Q[46+:2];
            end
            24: begin
                the_selected_align_source = align_source_sram_Q[48+:2];
                the_selected_insert_source = insert_source_sram_Q[48+:2];
                the_selected_delete_source = delete_source_sram_Q[48+:2];
            end
            25: begin
                the_selected_align_source = align_source_sram_Q[50+:2];
                the_selected_insert_source = insert_source_sram_Q[50+:2];
                the_selected_delete_source = delete_source_sram_Q[50+:2];
            end
            26: begin
                the_selected_align_source = align_source_sram_Q[52+:2];
                the_selected_insert_source = insert_source_sram_Q[52+:2];
                the_selected_delete_source = delete_source_sram_Q[52+:2];
            end
            27: begin
                the_selected_align_source = align_source_sram_Q[54+:2];
                the_selected_insert_source = insert_source_sram_Q[54+:2];
                the_selected_delete_source = delete_source_sram_Q[54+:2];
            end
            28: begin
                the_selected_align_source = align_source_sram_Q[56+:2];
                the_selected_insert_source = insert_source_sram_Q[56+:2];
                the_selected_delete_source = delete_source_sram_Q[56+:2];
            end
            29: begin
                the_selected_align_source = align_source_sram_Q[58+:2];
                the_selected_insert_source = insert_source_sram_Q[58+:2];
                the_selected_delete_source = delete_source_sram_Q[58+:2];
            end
            30: begin
                the_selected_align_source = align_source_sram_Q[60+:2];
                the_selected_insert_source = insert_source_sram_Q[60+:2];
                the_selected_delete_source = delete_source_sram_Q[60+:2];
            end
            31: begin
                the_selected_align_source = align_source_sram_Q[62+:2];
                the_selected_insert_source = insert_source_sram_Q[62+:2];
                the_selected_delete_source = delete_source_sram_Q[62+:2];
            end
            32: begin
                the_selected_align_source = align_source_sram_Q[64+:2];
                the_selected_insert_source = insert_source_sram_Q[64+:2];
                the_selected_delete_source = delete_source_sram_Q[64+:2];
            end
            33: begin
                the_selected_align_source = align_source_sram_Q[66+:2];
                the_selected_insert_source = insert_source_sram_Q[66+:2];
                the_selected_delete_source = delete_source_sram_Q[66+:2];
            end
            34: begin
                the_selected_align_source = align_source_sram_Q[68+:2];
                the_selected_insert_source = insert_source_sram_Q[68+:2];
                the_selected_delete_source = delete_source_sram_Q[68+:2];
            end
            35: begin
                the_selected_align_source = align_source_sram_Q[70+:2];
                the_selected_insert_source = insert_source_sram_Q[70+:2];
                the_selected_delete_source = delete_source_sram_Q[70+:2];
            end
            36: begin
                the_selected_align_source = align_source_sram_Q[72+:2];
                the_selected_insert_source = insert_source_sram_Q[72+:2];
                the_selected_delete_source = delete_source_sram_Q[72+:2];
            end
            37: begin
                the_selected_align_source = align_source_sram_Q[74+:2];
                the_selected_insert_source = insert_source_sram_Q[74+:2];
                the_selected_delete_source = delete_source_sram_Q[74+:2];
            end
            38: begin
                the_selected_align_source = align_source_sram_Q[76+:2];
                the_selected_insert_source = insert_source_sram_Q[76+:2];
                the_selected_delete_source = delete_source_sram_Q[76+:2];
            end
            39: begin
                the_selected_align_source = align_source_sram_Q[78+:2];
                the_selected_insert_source = insert_source_sram_Q[78+:2];
                the_selected_delete_source = delete_source_sram_Q[78+:2];
            end
            40: begin
                the_selected_align_source = align_source_sram_Q[80+:2];
                the_selected_insert_source = insert_source_sram_Q[80+:2];
                the_selected_delete_source = delete_source_sram_Q[80+:2];
            end
            41: begin
                the_selected_align_source = align_source_sram_Q[82+:2];
                the_selected_insert_source = insert_source_sram_Q[82+:2];
                the_selected_delete_source = delete_source_sram_Q[82+:2];
            end
            42: begin
                the_selected_align_source = align_source_sram_Q[84+:2];
                the_selected_insert_source = insert_source_sram_Q[84+:2];
                the_selected_delete_source = delete_source_sram_Q[84+:2];
            end
            43: begin
                the_selected_align_source = align_source_sram_Q[86+:2];
                the_selected_insert_source = insert_source_sram_Q[86+:2];
                the_selected_delete_source = delete_source_sram_Q[86+:2];
            end
            44: begin
                the_selected_align_source = align_source_sram_Q[88+:2];
                the_selected_insert_source = insert_source_sram_Q[88+:2];
                the_selected_delete_source = delete_source_sram_Q[88+:2];
            end
            45: begin
                the_selected_align_source = align_source_sram_Q[90+:2];
                the_selected_insert_source = insert_source_sram_Q[90+:2];
                the_selected_delete_source = delete_source_sram_Q[90+:2];
            end
            46: begin
                the_selected_align_source = align_source_sram_Q[92+:2];
                the_selected_insert_source = insert_source_sram_Q[92+:2];
                the_selected_delete_source = delete_source_sram_Q[92+:2];
            end
            47: begin
                the_selected_align_source = align_source_sram_Q[94+:2];
                the_selected_insert_source = insert_source_sram_Q[94+:2];
                the_selected_delete_source = delete_source_sram_Q[94+:2];
            end
            48: begin
                the_selected_align_source = align_source_sram_Q[96+:2];
                the_selected_insert_source = insert_source_sram_Q[96+:2];
                the_selected_delete_source = delete_source_sram_Q[96+:2];
            end
            49: begin
                the_selected_align_source = align_source_sram_Q[98+:2];
                the_selected_insert_source = insert_source_sram_Q[98+:2];
                the_selected_delete_source = delete_source_sram_Q[98+:2];
            end
            50: begin
                the_selected_align_source = align_source_sram_Q[100+:2];
                the_selected_insert_source = insert_source_sram_Q[100+:2];
                the_selected_delete_source = delete_source_sram_Q[100+:2];
            end
            51: begin
                the_selected_align_source = align_source_sram_Q[102+:2];
                the_selected_insert_source = insert_source_sram_Q[102+:2];
                the_selected_delete_source = delete_source_sram_Q[102+:2];
            end
            52: begin
                the_selected_align_source = align_source_sram_Q[104+:2];
                the_selected_insert_source = insert_source_sram_Q[104+:2];
                the_selected_delete_source = delete_source_sram_Q[104+:2];
            end
            53: begin
                the_selected_align_source = align_source_sram_Q[106+:2];
                the_selected_insert_source = insert_source_sram_Q[106+:2];
                the_selected_delete_source = delete_source_sram_Q[106+:2];
            end
            54: begin
                the_selected_align_source = align_source_sram_Q[108+:2];
                the_selected_insert_source = insert_source_sram_Q[108+:2];
                the_selected_delete_source = delete_source_sram_Q[108+:2];
            end
            55: begin
                the_selected_align_source = align_source_sram_Q[110+:2];
                the_selected_insert_source = insert_source_sram_Q[110+:2];
                the_selected_delete_source = delete_source_sram_Q[110+:2];
            end
            56: begin
                the_selected_align_source = align_source_sram_Q[112+:2];
                the_selected_insert_source = insert_source_sram_Q[112+:2];
                the_selected_delete_source = delete_source_sram_Q[112+:2];
            end
            57: begin
                the_selected_align_source = align_source_sram_Q[114+:2];
                the_selected_insert_source = insert_source_sram_Q[114+:2];
                the_selected_delete_source = delete_source_sram_Q[114+:2];
            end
            58: begin
                the_selected_align_source = align_source_sram_Q[116+:2];
                the_selected_insert_source = insert_source_sram_Q[116+:2];
                the_selected_delete_source = delete_source_sram_Q[116+:2];
            end
            59: begin
                the_selected_align_source = align_source_sram_Q[118+:2];
                the_selected_insert_source = insert_source_sram_Q[118+:2];
                the_selected_delete_source = delete_source_sram_Q[118+:2];
            end
            60: begin
                the_selected_align_source = align_source_sram_Q[120+:2];
                the_selected_insert_source = insert_source_sram_Q[120+:2];
                the_selected_delete_source = delete_source_sram_Q[120+:2];
            end
            61: begin
                the_selected_align_source = align_source_sram_Q[122+:2];
                the_selected_insert_source = insert_source_sram_Q[122+:2];
                the_selected_delete_source = delete_source_sram_Q[122+:2];
            end
            62: begin
                the_selected_align_source = align_source_sram_Q[124+:2];
                the_selected_insert_source = insert_source_sram_Q[124+:2];
                the_selected_delete_source = delete_source_sram_Q[124+:2];
            end
            63: begin
                the_selected_align_source = align_source_sram_Q[126+:2];
                the_selected_insert_source = insert_source_sram_Q[126+:2];
                the_selected_delete_source = delete_source_sram_Q[126+:2];
            end
            64: begin
                the_selected_align_source = align_source_sram_Q[128+:2];
                the_selected_insert_source = insert_source_sram_Q[128+:2];
                the_selected_delete_source = delete_source_sram_Q[128+:2];
            end
            65: begin
                the_selected_align_source = align_source_sram_Q[130+:2];
                the_selected_insert_source = insert_source_sram_Q[130+:2];
                the_selected_delete_source = delete_source_sram_Q[130+:2];
            end
            66: begin
                the_selected_align_source = align_source_sram_Q[132+:2];
                the_selected_insert_source = insert_source_sram_Q[132+:2];
                the_selected_delete_source = delete_source_sram_Q[132+:2];
            end
            67: begin
                the_selected_align_source = align_source_sram_Q[134+:2];
                the_selected_insert_source = insert_source_sram_Q[134+:2];
                the_selected_delete_source = delete_source_sram_Q[134+:2];
            end
            68: begin
                the_selected_align_source = align_source_sram_Q[136+:2];
                the_selected_insert_source = insert_source_sram_Q[136+:2];
                the_selected_delete_source = delete_source_sram_Q[136+:2];
            end
            69: begin
                the_selected_align_source = align_source_sram_Q[138+:2];
                the_selected_insert_source = insert_source_sram_Q[138+:2];
                the_selected_delete_source = delete_source_sram_Q[138+:2];
            end
            70: begin
                the_selected_align_source = align_source_sram_Q[140+:2];
                the_selected_insert_source = insert_source_sram_Q[140+:2];
                the_selected_delete_source = delete_source_sram_Q[140+:2];
            end
            71: begin
                the_selected_align_source = align_source_sram_Q[142+:2];
                the_selected_insert_source = insert_source_sram_Q[142+:2];
                the_selected_delete_source = delete_source_sram_Q[142+:2];
            end
            72: begin
                the_selected_align_source = align_source_sram_Q[144+:2];
                the_selected_insert_source = insert_source_sram_Q[144+:2];
                the_selected_delete_source = delete_source_sram_Q[144+:2];
            end
            73: begin
                the_selected_align_source = align_source_sram_Q[146+:2];
                the_selected_insert_source = insert_source_sram_Q[146+:2];
                the_selected_delete_source = delete_source_sram_Q[146+:2];
            end
            74: begin
                the_selected_align_source = align_source_sram_Q[148+:2];
                the_selected_insert_source = insert_source_sram_Q[148+:2];
                the_selected_delete_source = delete_source_sram_Q[148+:2];
            end
            75: begin
                the_selected_align_source = align_source_sram_Q[150+:2];
                the_selected_insert_source = insert_source_sram_Q[150+:2];
                the_selected_delete_source = delete_source_sram_Q[150+:2];
            end
            76: begin
                the_selected_align_source = align_source_sram_Q[152+:2];
                the_selected_insert_source = insert_source_sram_Q[152+:2];
                the_selected_delete_source = delete_source_sram_Q[152+:2];
            end
            77: begin
                the_selected_align_source = align_source_sram_Q[154+:2];
                the_selected_insert_source = insert_source_sram_Q[154+:2];
                the_selected_delete_source = delete_source_sram_Q[154+:2];
            end
            78: begin
                the_selected_align_source = align_source_sram_Q[156+:2];
                the_selected_insert_source = insert_source_sram_Q[156+:2];
                the_selected_delete_source = delete_source_sram_Q[156+:2];
            end
            79: begin
                the_selected_align_source = align_source_sram_Q[158+:2];
                the_selected_insert_source = insert_source_sram_Q[158+:2];
                the_selected_delete_source = delete_source_sram_Q[158+:2];
            end
            80: begin
                the_selected_align_source = align_source_sram_Q[160+:2];
                the_selected_insert_source = insert_source_sram_Q[160+:2];
                the_selected_delete_source = delete_source_sram_Q[160+:2];
            end
            81: begin
                the_selected_align_source = align_source_sram_Q[162+:2];
                the_selected_insert_source = insert_source_sram_Q[162+:2];
                the_selected_delete_source = delete_source_sram_Q[162+:2];
            end
            82: begin
                the_selected_align_source = align_source_sram_Q[164+:2];
                the_selected_insert_source = insert_source_sram_Q[164+:2];
                the_selected_delete_source = delete_source_sram_Q[164+:2];
            end
            83: begin
                the_selected_align_source = align_source_sram_Q[166+:2];
                the_selected_insert_source = insert_source_sram_Q[166+:2];
                the_selected_delete_source = delete_source_sram_Q[166+:2];
            end
            84: begin
                the_selected_align_source = align_source_sram_Q[168+:2];
                the_selected_insert_source = insert_source_sram_Q[168+:2];
                the_selected_delete_source = delete_source_sram_Q[168+:2];
            end
            85: begin
                the_selected_align_source = align_source_sram_Q[170+:2];
                the_selected_insert_source = insert_source_sram_Q[170+:2];
                the_selected_delete_source = delete_source_sram_Q[170+:2];
            end
            86: begin
                the_selected_align_source = align_source_sram_Q[172+:2];
                the_selected_insert_source = insert_source_sram_Q[172+:2];
                the_selected_delete_source = delete_source_sram_Q[172+:2];
            end
            87: begin
                the_selected_align_source = align_source_sram_Q[174+:2];
                the_selected_insert_source = insert_source_sram_Q[174+:2];
                the_selected_delete_source = delete_source_sram_Q[174+:2];
            end
            88: begin
                the_selected_align_source = align_source_sram_Q[176+:2];
                the_selected_insert_source = insert_source_sram_Q[176+:2];
                the_selected_delete_source = delete_source_sram_Q[176+:2];
            end
            89: begin
                the_selected_align_source = align_source_sram_Q[178+:2];
                the_selected_insert_source = insert_source_sram_Q[178+:2];
                the_selected_delete_source = delete_source_sram_Q[178+:2];
            end
            90: begin
                the_selected_align_source = align_source_sram_Q[180+:2];
                the_selected_insert_source = insert_source_sram_Q[180+:2];
                the_selected_delete_source = delete_source_sram_Q[180+:2];
            end
            91: begin
                the_selected_align_source = align_source_sram_Q[182+:2];
                the_selected_insert_source = insert_source_sram_Q[182+:2];
                the_selected_delete_source = delete_source_sram_Q[182+:2];
            end
            92: begin
                the_selected_align_source = align_source_sram_Q[184+:2];
                the_selected_insert_source = insert_source_sram_Q[184+:2];
                the_selected_delete_source = delete_source_sram_Q[184+:2];
            end
            93: begin
                the_selected_align_source = align_source_sram_Q[186+:2];
                the_selected_insert_source = insert_source_sram_Q[186+:2];
                the_selected_delete_source = delete_source_sram_Q[186+:2];
            end
            94: begin
                the_selected_align_source = align_source_sram_Q[188+:2];
                the_selected_insert_source = insert_source_sram_Q[188+:2];
                the_selected_delete_source = delete_source_sram_Q[188+:2];
            end
            95: begin
                the_selected_align_source = align_source_sram_Q[190+:2];
                the_selected_insert_source = insert_source_sram_Q[190+:2];
                the_selected_delete_source = delete_source_sram_Q[190+:2];
            end
            96: begin
                the_selected_align_source = align_source_sram_Q[192+:2];
                the_selected_insert_source = insert_source_sram_Q[192+:2];
                the_selected_delete_source = delete_source_sram_Q[192+:2];
            end
            97: begin
                the_selected_align_source = align_source_sram_Q[194+:2];
                the_selected_insert_source = insert_source_sram_Q[194+:2];
                the_selected_delete_source = delete_source_sram_Q[194+:2];
            end
            98: begin
                the_selected_align_source = align_source_sram_Q[196+:2];
                the_selected_insert_source = insert_source_sram_Q[196+:2];
                the_selected_delete_source = delete_source_sram_Q[196+:2];
            end
            99: begin
                the_selected_align_source = align_source_sram_Q[198+:2];
                the_selected_insert_source = insert_source_sram_Q[198+:2];
                the_selected_delete_source = delete_source_sram_Q[198+:2];
            end
            100: begin
                the_selected_align_source = align_source_sram_Q[200+:2];
                the_selected_insert_source = insert_source_sram_Q[200+:2];
                the_selected_delete_source = delete_source_sram_Q[200+:2];
            end
            101: begin
                the_selected_align_source = align_source_sram_Q[202+:2];
                the_selected_insert_source = insert_source_sram_Q[202+:2];
                the_selected_delete_source = delete_source_sram_Q[202+:2];
            end
            102: begin
                the_selected_align_source = align_source_sram_Q[204+:2];
                the_selected_insert_source = insert_source_sram_Q[204+:2];
                the_selected_delete_source = delete_source_sram_Q[204+:2];
            end
            103: begin
                the_selected_align_source = align_source_sram_Q[206+:2];
                the_selected_insert_source = insert_source_sram_Q[206+:2];
                the_selected_delete_source = delete_source_sram_Q[206+:2];
            end
            104: begin
                the_selected_align_source = align_source_sram_Q[208+:2];
                the_selected_insert_source = insert_source_sram_Q[208+:2];
                the_selected_delete_source = delete_source_sram_Q[208+:2];
            end
            105: begin
                the_selected_align_source = align_source_sram_Q[210+:2];
                the_selected_insert_source = insert_source_sram_Q[210+:2];
                the_selected_delete_source = delete_source_sram_Q[210+:2];
            end
            106: begin
                the_selected_align_source = align_source_sram_Q[212+:2];
                the_selected_insert_source = insert_source_sram_Q[212+:2];
                the_selected_delete_source = delete_source_sram_Q[212+:2];
            end
            107: begin
                the_selected_align_source = align_source_sram_Q[214+:2];
                the_selected_insert_source = insert_source_sram_Q[214+:2];
                the_selected_delete_source = delete_source_sram_Q[214+:2];
            end
            108: begin
                the_selected_align_source = align_source_sram_Q[216+:2];
                the_selected_insert_source = insert_source_sram_Q[216+:2];
                the_selected_delete_source = delete_source_sram_Q[216+:2];
            end
            109: begin
                the_selected_align_source = align_source_sram_Q[218+:2];
                the_selected_insert_source = insert_source_sram_Q[218+:2];
                the_selected_delete_source = delete_source_sram_Q[218+:2];
            end
            110: begin
                the_selected_align_source = align_source_sram_Q[220+:2];
                the_selected_insert_source = insert_source_sram_Q[220+:2];
                the_selected_delete_source = delete_source_sram_Q[220+:2];
            end
            111: begin
                the_selected_align_source = align_source_sram_Q[222+:2];
                the_selected_insert_source = insert_source_sram_Q[222+:2];
                the_selected_delete_source = delete_source_sram_Q[222+:2];
            end
            112: begin
                the_selected_align_source = align_source_sram_Q[224+:2];
                the_selected_insert_source = insert_source_sram_Q[224+:2];
                the_selected_delete_source = delete_source_sram_Q[224+:2];
            end
            113: begin
                the_selected_align_source = align_source_sram_Q[226+:2];
                the_selected_insert_source = insert_source_sram_Q[226+:2];
                the_selected_delete_source = delete_source_sram_Q[226+:2];
            end
            114: begin
                the_selected_align_source = align_source_sram_Q[228+:2];
                the_selected_insert_source = insert_source_sram_Q[228+:2];
                the_selected_delete_source = delete_source_sram_Q[228+:2];
            end
            115: begin
                the_selected_align_source = align_source_sram_Q[230+:2];
                the_selected_insert_source = insert_source_sram_Q[230+:2];
                the_selected_delete_source = delete_source_sram_Q[230+:2];
            end
            116: begin
                the_selected_align_source = align_source_sram_Q[232+:2];
                the_selected_insert_source = insert_source_sram_Q[232+:2];
                the_selected_delete_source = delete_source_sram_Q[232+:2];
            end
            117: begin
                the_selected_align_source = align_source_sram_Q[234+:2];
                the_selected_insert_source = insert_source_sram_Q[234+:2];
                the_selected_delete_source = delete_source_sram_Q[234+:2];
            end
            118: begin
                the_selected_align_source = align_source_sram_Q[236+:2];
                the_selected_insert_source = insert_source_sram_Q[236+:2];
                the_selected_delete_source = delete_source_sram_Q[236+:2];
            end
            119: begin
                the_selected_align_source = align_source_sram_Q[238+:2];
                the_selected_insert_source = insert_source_sram_Q[238+:2];
                the_selected_delete_source = delete_source_sram_Q[238+:2];
            end
            120: begin
                the_selected_align_source = align_source_sram_Q[240+:2];
                the_selected_insert_source = insert_source_sram_Q[240+:2];
                the_selected_delete_source = delete_source_sram_Q[240+:2];
            end
            121: begin
                the_selected_align_source = align_source_sram_Q[242+:2];
                the_selected_insert_source = insert_source_sram_Q[242+:2];
                the_selected_delete_source = delete_source_sram_Q[242+:2];
            end
            122: begin
                the_selected_align_source = align_source_sram_Q[244+:2];
                the_selected_insert_source = insert_source_sram_Q[244+:2];
                the_selected_delete_source = delete_source_sram_Q[244+:2];
            end
            123: begin
                the_selected_align_source = align_source_sram_Q[246+:2];
                the_selected_insert_source = insert_source_sram_Q[246+:2];
                the_selected_delete_source = delete_source_sram_Q[246+:2];
            end
            124: begin
                the_selected_align_source = align_source_sram_Q[248+:2];
                the_selected_insert_source = insert_source_sram_Q[248+:2];
                the_selected_delete_source = delete_source_sram_Q[248+:2];
            end
            125: begin
                the_selected_align_source = align_source_sram_Q[250+:2];
                the_selected_insert_source = insert_source_sram_Q[250+:2];
                the_selected_delete_source = delete_source_sram_Q[250+:2];
            end
            126: begin
                the_selected_align_source = align_source_sram_Q[252+:2];
                the_selected_insert_source = insert_source_sram_Q[252+:2];
                the_selected_delete_source = delete_source_sram_Q[252+:2];
            end
            127: begin
                the_selected_align_source = align_source_sram_Q[254+:2];
                the_selected_insert_source = insert_source_sram_Q[254+:2];
                the_selected_delete_source = delete_source_sram_Q[254+:2];
            end
            128: begin
                the_selected_align_source = align_source_sram_Q[256+:2];
                the_selected_insert_source = insert_source_sram_Q[256+:2];
                the_selected_delete_source = delete_source_sram_Q[256+:2];
            end
            129: begin
                the_selected_align_source = align_source_sram_Q[258+:2];
                the_selected_insert_source = insert_source_sram_Q[258+:2];
                the_selected_delete_source = delete_source_sram_Q[258+:2];
            end
            130: begin
                the_selected_align_source = align_source_sram_Q[260+:2];
                the_selected_insert_source = insert_source_sram_Q[260+:2];
                the_selected_delete_source = delete_source_sram_Q[260+:2];
            end
            131: begin
                the_selected_align_source = align_source_sram_Q[262+:2];
                the_selected_insert_source = insert_source_sram_Q[262+:2];
                the_selected_delete_source = delete_source_sram_Q[262+:2];
            end
            132: begin
                the_selected_align_source = align_source_sram_Q[264+:2];
                the_selected_insert_source = insert_source_sram_Q[264+:2];
                the_selected_delete_source = delete_source_sram_Q[264+:2];
            end
            133: begin
                the_selected_align_source = align_source_sram_Q[266+:2];
                the_selected_insert_source = insert_source_sram_Q[266+:2];
                the_selected_delete_source = delete_source_sram_Q[266+:2];
            end
            134: begin
                the_selected_align_source = align_source_sram_Q[268+:2];
                the_selected_insert_source = insert_source_sram_Q[268+:2];
                the_selected_delete_source = delete_source_sram_Q[268+:2];
            end
            135: begin
                the_selected_align_source = align_source_sram_Q[270+:2];
                the_selected_insert_source = insert_source_sram_Q[270+:2];
                the_selected_delete_source = delete_source_sram_Q[270+:2];
            end
            136: begin
                the_selected_align_source = align_source_sram_Q[272+:2];
                the_selected_insert_source = insert_source_sram_Q[272+:2];
                the_selected_delete_source = delete_source_sram_Q[272+:2];
            end
            137: begin
                the_selected_align_source = align_source_sram_Q[274+:2];
                the_selected_insert_source = insert_source_sram_Q[274+:2];
                the_selected_delete_source = delete_source_sram_Q[274+:2];
            end
            138: begin
                the_selected_align_source = align_source_sram_Q[276+:2];
                the_selected_insert_source = insert_source_sram_Q[276+:2];
                the_selected_delete_source = delete_source_sram_Q[276+:2];
            end
            139: begin
                the_selected_align_source = align_source_sram_Q[278+:2];
                the_selected_insert_source = insert_source_sram_Q[278+:2];
                the_selected_delete_source = delete_source_sram_Q[278+:2];
            end
            140: begin
                the_selected_align_source = align_source_sram_Q[280+:2];
                the_selected_insert_source = insert_source_sram_Q[280+:2];
                the_selected_delete_source = delete_source_sram_Q[280+:2];
            end
            141: begin
                the_selected_align_source = align_source_sram_Q[282+:2];
                the_selected_insert_source = insert_source_sram_Q[282+:2];
                the_selected_delete_source = delete_source_sram_Q[282+:2];
            end
            142: begin
                the_selected_align_source = align_source_sram_Q[284+:2];
                the_selected_insert_source = insert_source_sram_Q[284+:2];
                the_selected_delete_source = delete_source_sram_Q[284+:2];
            end
            143: begin
                the_selected_align_source = align_source_sram_Q[286+:2];
                the_selected_insert_source = insert_source_sram_Q[286+:2];
                the_selected_delete_source = delete_source_sram_Q[286+:2];
            end
            144: begin
                the_selected_align_source = align_source_sram_Q[288+:2];
                the_selected_insert_source = insert_source_sram_Q[288+:2];
                the_selected_delete_source = delete_source_sram_Q[288+:2];
            end
            145: begin
                the_selected_align_source = align_source_sram_Q[290+:2];
                the_selected_insert_source = insert_source_sram_Q[290+:2];
                the_selected_delete_source = delete_source_sram_Q[290+:2];
            end
            146: begin
                the_selected_align_source = align_source_sram_Q[292+:2];
                the_selected_insert_source = insert_source_sram_Q[292+:2];
                the_selected_delete_source = delete_source_sram_Q[292+:2];
            end
            147: begin
                the_selected_align_source = align_source_sram_Q[294+:2];
                the_selected_insert_source = insert_source_sram_Q[294+:2];
                the_selected_delete_source = delete_source_sram_Q[294+:2];
            end
            148: begin
                the_selected_align_source = align_source_sram_Q[296+:2];
                the_selected_insert_source = insert_source_sram_Q[296+:2];
                the_selected_delete_source = delete_source_sram_Q[296+:2];
            end
            149: begin
                the_selected_align_source = align_source_sram_Q[298+:2];
                the_selected_insert_source = insert_source_sram_Q[298+:2];
                the_selected_delete_source = delete_source_sram_Q[298+:2];
            end
            150: begin
                the_selected_align_source = align_source_sram_Q[300+:2];
                the_selected_insert_source = insert_source_sram_Q[300+:2];
                the_selected_delete_source = delete_source_sram_Q[300+:2];
            end
            151: begin
                the_selected_align_source = align_source_sram_Q[302+:2];
                the_selected_insert_source = insert_source_sram_Q[302+:2];
                the_selected_delete_source = delete_source_sram_Q[302+:2];
            end
            152: begin
                the_selected_align_source = align_source_sram_Q[304+:2];
                the_selected_insert_source = insert_source_sram_Q[304+:2];
                the_selected_delete_source = delete_source_sram_Q[304+:2];
            end
            153: begin
                the_selected_align_source = align_source_sram_Q[306+:2];
                the_selected_insert_source = insert_source_sram_Q[306+:2];
                the_selected_delete_source = delete_source_sram_Q[306+:2];
            end
            154: begin
                the_selected_align_source = align_source_sram_Q[308+:2];
                the_selected_insert_source = insert_source_sram_Q[308+:2];
                the_selected_delete_source = delete_source_sram_Q[308+:2];
            end
            155: begin
                the_selected_align_source = align_source_sram_Q[310+:2];
                the_selected_insert_source = insert_source_sram_Q[310+:2];
                the_selected_delete_source = delete_source_sram_Q[310+:2];
            end
            156: begin
                the_selected_align_source = align_source_sram_Q[312+:2];
                the_selected_insert_source = insert_source_sram_Q[312+:2];
                the_selected_delete_source = delete_source_sram_Q[312+:2];
            end
            157: begin
                the_selected_align_source = align_source_sram_Q[314+:2];
                the_selected_insert_source = insert_source_sram_Q[314+:2];
                the_selected_delete_source = delete_source_sram_Q[314+:2];
            end
            158: begin
                the_selected_align_source = align_source_sram_Q[316+:2];
                the_selected_insert_source = insert_source_sram_Q[316+:2];
                the_selected_delete_source = delete_source_sram_Q[316+:2];
            end
            159: begin
                the_selected_align_source = align_source_sram_Q[318+:2];
                the_selected_insert_source = insert_source_sram_Q[318+:2];
                the_selected_delete_source = delete_source_sram_Q[318+:2];
            end
            160: begin
                the_selected_align_source = align_source_sram_Q[320+:2];
                the_selected_insert_source = insert_source_sram_Q[320+:2];
                the_selected_delete_source = delete_source_sram_Q[320+:2];
            end
            161: begin
                the_selected_align_source = align_source_sram_Q[322+:2];
                the_selected_insert_source = insert_source_sram_Q[322+:2];
                the_selected_delete_source = delete_source_sram_Q[322+:2];
            end
            162: begin
                the_selected_align_source = align_source_sram_Q[324+:2];
                the_selected_insert_source = insert_source_sram_Q[324+:2];
                the_selected_delete_source = delete_source_sram_Q[324+:2];
            end
            163: begin
                the_selected_align_source = align_source_sram_Q[326+:2];
                the_selected_insert_source = insert_source_sram_Q[326+:2];
                the_selected_delete_source = delete_source_sram_Q[326+:2];
            end
            164: begin
                the_selected_align_source = align_source_sram_Q[328+:2];
                the_selected_insert_source = insert_source_sram_Q[328+:2];
                the_selected_delete_source = delete_source_sram_Q[328+:2];
            end
            165: begin
                the_selected_align_source = align_source_sram_Q[330+:2];
                the_selected_insert_source = insert_source_sram_Q[330+:2];
                the_selected_delete_source = delete_source_sram_Q[330+:2];
            end
            166: begin
                the_selected_align_source = align_source_sram_Q[332+:2];
                the_selected_insert_source = insert_source_sram_Q[332+:2];
                the_selected_delete_source = delete_source_sram_Q[332+:2];
            end
            167: begin
                the_selected_align_source = align_source_sram_Q[334+:2];
                the_selected_insert_source = insert_source_sram_Q[334+:2];
                the_selected_delete_source = delete_source_sram_Q[334+:2];
            end
            168: begin
                the_selected_align_source = align_source_sram_Q[336+:2];
                the_selected_insert_source = insert_source_sram_Q[336+:2];
                the_selected_delete_source = delete_source_sram_Q[336+:2];
            end
            169: begin
                the_selected_align_source = align_source_sram_Q[338+:2];
                the_selected_insert_source = insert_source_sram_Q[338+:2];
                the_selected_delete_source = delete_source_sram_Q[338+:2];
            end
            170: begin
                the_selected_align_source = align_source_sram_Q[340+:2];
                the_selected_insert_source = insert_source_sram_Q[340+:2];
                the_selected_delete_source = delete_source_sram_Q[340+:2];
            end
            171: begin
                the_selected_align_source = align_source_sram_Q[342+:2];
                the_selected_insert_source = insert_source_sram_Q[342+:2];
                the_selected_delete_source = delete_source_sram_Q[342+:2];
            end
            172: begin
                the_selected_align_source = align_source_sram_Q[344+:2];
                the_selected_insert_source = insert_source_sram_Q[344+:2];
                the_selected_delete_source = delete_source_sram_Q[344+:2];
            end
            173: begin
                the_selected_align_source = align_source_sram_Q[346+:2];
                the_selected_insert_source = insert_source_sram_Q[346+:2];
                the_selected_delete_source = delete_source_sram_Q[346+:2];
            end
            174: begin
                the_selected_align_source = align_source_sram_Q[348+:2];
                the_selected_insert_source = insert_source_sram_Q[348+:2];
                the_selected_delete_source = delete_source_sram_Q[348+:2];
            end
            175: begin
                the_selected_align_source = align_source_sram_Q[350+:2];
                the_selected_insert_source = insert_source_sram_Q[350+:2];
                the_selected_delete_source = delete_source_sram_Q[350+:2];
            end
            176: begin
                the_selected_align_source = align_source_sram_Q[352+:2];
                the_selected_insert_source = insert_source_sram_Q[352+:2];
                the_selected_delete_source = delete_source_sram_Q[352+:2];
            end
            177: begin
                the_selected_align_source = align_source_sram_Q[354+:2];
                the_selected_insert_source = insert_source_sram_Q[354+:2];
                the_selected_delete_source = delete_source_sram_Q[354+:2];
            end
            178: begin
                the_selected_align_source = align_source_sram_Q[356+:2];
                the_selected_insert_source = insert_source_sram_Q[356+:2];
                the_selected_delete_source = delete_source_sram_Q[356+:2];
            end
            179: begin
                the_selected_align_source = align_source_sram_Q[358+:2];
                the_selected_insert_source = insert_source_sram_Q[358+:2];
                the_selected_delete_source = delete_source_sram_Q[358+:2];
            end
            180: begin
                the_selected_align_source = align_source_sram_Q[360+:2];
                the_selected_insert_source = insert_source_sram_Q[360+:2];
                the_selected_delete_source = delete_source_sram_Q[360+:2];
            end
            181: begin
                the_selected_align_source = align_source_sram_Q[362+:2];
                the_selected_insert_source = insert_source_sram_Q[362+:2];
                the_selected_delete_source = delete_source_sram_Q[362+:2];
            end
            182: begin
                the_selected_align_source = align_source_sram_Q[364+:2];
                the_selected_insert_source = insert_source_sram_Q[364+:2];
                the_selected_delete_source = delete_source_sram_Q[364+:2];
            end
            183: begin
                the_selected_align_source = align_source_sram_Q[366+:2];
                the_selected_insert_source = insert_source_sram_Q[366+:2];
                the_selected_delete_source = delete_source_sram_Q[366+:2];
            end
            184: begin
                the_selected_align_source = align_source_sram_Q[368+:2];
                the_selected_insert_source = insert_source_sram_Q[368+:2];
                the_selected_delete_source = delete_source_sram_Q[368+:2];
            end
            185: begin
                the_selected_align_source = align_source_sram_Q[370+:2];
                the_selected_insert_source = insert_source_sram_Q[370+:2];
                the_selected_delete_source = delete_source_sram_Q[370+:2];
            end
            186: begin
                the_selected_align_source = align_source_sram_Q[372+:2];
                the_selected_insert_source = insert_source_sram_Q[372+:2];
                the_selected_delete_source = delete_source_sram_Q[372+:2];
            end
            187: begin
                the_selected_align_source = align_source_sram_Q[374+:2];
                the_selected_insert_source = insert_source_sram_Q[374+:2];
                the_selected_delete_source = delete_source_sram_Q[374+:2];
            end
            188: begin
                the_selected_align_source = align_source_sram_Q[376+:2];
                the_selected_insert_source = insert_source_sram_Q[376+:2];
                the_selected_delete_source = delete_source_sram_Q[376+:2];
            end
            189: begin
                the_selected_align_source = align_source_sram_Q[378+:2];
                the_selected_insert_source = insert_source_sram_Q[378+:2];
                the_selected_delete_source = delete_source_sram_Q[378+:2];
            end
            190: begin
                the_selected_align_source = align_source_sram_Q[380+:2];
                the_selected_insert_source = insert_source_sram_Q[380+:2];
                the_selected_delete_source = delete_source_sram_Q[380+:2];
            end
            191: begin
                the_selected_align_source = align_source_sram_Q[382+:2];
                the_selected_insert_source = insert_source_sram_Q[382+:2];
                the_selected_delete_source = delete_source_sram_Q[382+:2];
            end
            192: begin
                the_selected_align_source = align_source_sram_Q[384+:2];
                the_selected_insert_source = insert_source_sram_Q[384+:2];
                the_selected_delete_source = delete_source_sram_Q[384+:2];
            end
            193: begin
                the_selected_align_source = align_source_sram_Q[386+:2];
                the_selected_insert_source = insert_source_sram_Q[386+:2];
                the_selected_delete_source = delete_source_sram_Q[386+:2];
            end
            194: begin
                the_selected_align_source = align_source_sram_Q[388+:2];
                the_selected_insert_source = insert_source_sram_Q[388+:2];
                the_selected_delete_source = delete_source_sram_Q[388+:2];
            end
            195: begin
                the_selected_align_source = align_source_sram_Q[390+:2];
                the_selected_insert_source = insert_source_sram_Q[390+:2];
                the_selected_delete_source = delete_source_sram_Q[390+:2];
            end
            196: begin
                the_selected_align_source = align_source_sram_Q[392+:2];
                the_selected_insert_source = insert_source_sram_Q[392+:2];
                the_selected_delete_source = delete_source_sram_Q[392+:2];
            end
            197: begin
                the_selected_align_source = align_source_sram_Q[394+:2];
                the_selected_insert_source = insert_source_sram_Q[394+:2];
                the_selected_delete_source = delete_source_sram_Q[394+:2];
            end
            198: begin
                the_selected_align_source = align_source_sram_Q[396+:2];
                the_selected_insert_source = insert_source_sram_Q[396+:2];
                the_selected_delete_source = delete_source_sram_Q[396+:2];
            end
            199: begin
                the_selected_align_source = align_source_sram_Q[398+:2];
                the_selected_insert_source = insert_source_sram_Q[398+:2];
                the_selected_delete_source = delete_source_sram_Q[398+:2];
            end
            200: begin
                the_selected_align_source = align_source_sram_Q[400+:2];
                the_selected_insert_source = insert_source_sram_Q[400+:2];
                the_selected_delete_source = delete_source_sram_Q[400+:2];
            end
            201: begin
                the_selected_align_source = align_source_sram_Q[402+:2];
                the_selected_insert_source = insert_source_sram_Q[402+:2];
                the_selected_delete_source = delete_source_sram_Q[402+:2];
            end
            202: begin
                the_selected_align_source = align_source_sram_Q[404+:2];
                the_selected_insert_source = insert_source_sram_Q[404+:2];
                the_selected_delete_source = delete_source_sram_Q[404+:2];
            end
            203: begin
                the_selected_align_source = align_source_sram_Q[406+:2];
                the_selected_insert_source = insert_source_sram_Q[406+:2];
                the_selected_delete_source = delete_source_sram_Q[406+:2];
            end
            204: begin
                the_selected_align_source = align_source_sram_Q[408+:2];
                the_selected_insert_source = insert_source_sram_Q[408+:2];
                the_selected_delete_source = delete_source_sram_Q[408+:2];
            end
            205: begin
                the_selected_align_source = align_source_sram_Q[410+:2];
                the_selected_insert_source = insert_source_sram_Q[410+:2];
                the_selected_delete_source = delete_source_sram_Q[410+:2];
            end
            206: begin
                the_selected_align_source = align_source_sram_Q[412+:2];
                the_selected_insert_source = insert_source_sram_Q[412+:2];
                the_selected_delete_source = delete_source_sram_Q[412+:2];
            end
            207: begin
                the_selected_align_source = align_source_sram_Q[414+:2];
                the_selected_insert_source = insert_source_sram_Q[414+:2];
                the_selected_delete_source = delete_source_sram_Q[414+:2];
            end
            208: begin
                the_selected_align_source = align_source_sram_Q[416+:2];
                the_selected_insert_source = insert_source_sram_Q[416+:2];
                the_selected_delete_source = delete_source_sram_Q[416+:2];
            end
            209: begin
                the_selected_align_source = align_source_sram_Q[418+:2];
                the_selected_insert_source = insert_source_sram_Q[418+:2];
                the_selected_delete_source = delete_source_sram_Q[418+:2];
            end
            210: begin
                the_selected_align_source = align_source_sram_Q[420+:2];
                the_selected_insert_source = insert_source_sram_Q[420+:2];
                the_selected_delete_source = delete_source_sram_Q[420+:2];
            end
            211: begin
                the_selected_align_source = align_source_sram_Q[422+:2];
                the_selected_insert_source = insert_source_sram_Q[422+:2];
                the_selected_delete_source = delete_source_sram_Q[422+:2];
            end
            212: begin
                the_selected_align_source = align_source_sram_Q[424+:2];
                the_selected_insert_source = insert_source_sram_Q[424+:2];
                the_selected_delete_source = delete_source_sram_Q[424+:2];
            end
            213: begin
                the_selected_align_source = align_source_sram_Q[426+:2];
                the_selected_insert_source = insert_source_sram_Q[426+:2];
                the_selected_delete_source = delete_source_sram_Q[426+:2];
            end
            214: begin
                the_selected_align_source = align_source_sram_Q[428+:2];
                the_selected_insert_source = insert_source_sram_Q[428+:2];
                the_selected_delete_source = delete_source_sram_Q[428+:2];
            end
            215: begin
                the_selected_align_source = align_source_sram_Q[430+:2];
                the_selected_insert_source = insert_source_sram_Q[430+:2];
                the_selected_delete_source = delete_source_sram_Q[430+:2];
            end
            216: begin
                the_selected_align_source = align_source_sram_Q[432+:2];
                the_selected_insert_source = insert_source_sram_Q[432+:2];
                the_selected_delete_source = delete_source_sram_Q[432+:2];
            end
            217: begin
                the_selected_align_source = align_source_sram_Q[434+:2];
                the_selected_insert_source = insert_source_sram_Q[434+:2];
                the_selected_delete_source = delete_source_sram_Q[434+:2];
            end
            218: begin
                the_selected_align_source = align_source_sram_Q[436+:2];
                the_selected_insert_source = insert_source_sram_Q[436+:2];
                the_selected_delete_source = delete_source_sram_Q[436+:2];
            end
            219: begin
                the_selected_align_source = align_source_sram_Q[438+:2];
                the_selected_insert_source = insert_source_sram_Q[438+:2];
                the_selected_delete_source = delete_source_sram_Q[438+:2];
            end
            220: begin
                the_selected_align_source = align_source_sram_Q[440+:2];
                the_selected_insert_source = insert_source_sram_Q[440+:2];
                the_selected_delete_source = delete_source_sram_Q[440+:2];
            end
            221: begin
                the_selected_align_source = align_source_sram_Q[442+:2];
                the_selected_insert_source = insert_source_sram_Q[442+:2];
                the_selected_delete_source = delete_source_sram_Q[442+:2];
            end
            222: begin
                the_selected_align_source = align_source_sram_Q[444+:2];
                the_selected_insert_source = insert_source_sram_Q[444+:2];
                the_selected_delete_source = delete_source_sram_Q[444+:2];
            end
            223: begin
                the_selected_align_source = align_source_sram_Q[446+:2];
                the_selected_insert_source = insert_source_sram_Q[446+:2];
                the_selected_delete_source = delete_source_sram_Q[446+:2];
            end
            224: begin
                the_selected_align_source = align_source_sram_Q[448+:2];
                the_selected_insert_source = insert_source_sram_Q[448+:2];
                the_selected_delete_source = delete_source_sram_Q[448+:2];
            end
            225: begin
                the_selected_align_source = align_source_sram_Q[450+:2];
                the_selected_insert_source = insert_source_sram_Q[450+:2];
                the_selected_delete_source = delete_source_sram_Q[450+:2];
            end
            226: begin
                the_selected_align_source = align_source_sram_Q[452+:2];
                the_selected_insert_source = insert_source_sram_Q[452+:2];
                the_selected_delete_source = delete_source_sram_Q[452+:2];
            end
            227: begin
                the_selected_align_source = align_source_sram_Q[454+:2];
                the_selected_insert_source = insert_source_sram_Q[454+:2];
                the_selected_delete_source = delete_source_sram_Q[454+:2];
            end
            228: begin
                the_selected_align_source = align_source_sram_Q[456+:2];
                the_selected_insert_source = insert_source_sram_Q[456+:2];
                the_selected_delete_source = delete_source_sram_Q[456+:2];
            end
            229: begin
                the_selected_align_source = align_source_sram_Q[458+:2];
                the_selected_insert_source = insert_source_sram_Q[458+:2];
                the_selected_delete_source = delete_source_sram_Q[458+:2];
            end
            230: begin
                the_selected_align_source = align_source_sram_Q[460+:2];
                the_selected_insert_source = insert_source_sram_Q[460+:2];
                the_selected_delete_source = delete_source_sram_Q[460+:2];
            end
            231: begin
                the_selected_align_source = align_source_sram_Q[462+:2];
                the_selected_insert_source = insert_source_sram_Q[462+:2];
                the_selected_delete_source = delete_source_sram_Q[462+:2];
            end
            232: begin
                the_selected_align_source = align_source_sram_Q[464+:2];
                the_selected_insert_source = insert_source_sram_Q[464+:2];
                the_selected_delete_source = delete_source_sram_Q[464+:2];
            end
            233: begin
                the_selected_align_source = align_source_sram_Q[466+:2];
                the_selected_insert_source = insert_source_sram_Q[466+:2];
                the_selected_delete_source = delete_source_sram_Q[466+:2];
            end
            234: begin
                the_selected_align_source = align_source_sram_Q[468+:2];
                the_selected_insert_source = insert_source_sram_Q[468+:2];
                the_selected_delete_source = delete_source_sram_Q[468+:2];
            end
            235: begin
                the_selected_align_source = align_source_sram_Q[470+:2];
                the_selected_insert_source = insert_source_sram_Q[470+:2];
                the_selected_delete_source = delete_source_sram_Q[470+:2];
            end
            236: begin
                the_selected_align_source = align_source_sram_Q[472+:2];
                the_selected_insert_source = insert_source_sram_Q[472+:2];
                the_selected_delete_source = delete_source_sram_Q[472+:2];
            end
            237: begin
                the_selected_align_source = align_source_sram_Q[474+:2];
                the_selected_insert_source = insert_source_sram_Q[474+:2];
                the_selected_delete_source = delete_source_sram_Q[474+:2];
            end
            238: begin
                the_selected_align_source = align_source_sram_Q[476+:2];
                the_selected_insert_source = insert_source_sram_Q[476+:2];
                the_selected_delete_source = delete_source_sram_Q[476+:2];
            end
            239: begin
                the_selected_align_source = align_source_sram_Q[478+:2];
                the_selected_insert_source = insert_source_sram_Q[478+:2];
                the_selected_delete_source = delete_source_sram_Q[478+:2];
            end
            240: begin
                the_selected_align_source = align_source_sram_Q[480+:2];
                the_selected_insert_source = insert_source_sram_Q[480+:2];
                the_selected_delete_source = delete_source_sram_Q[480+:2];
            end
            241: begin
                the_selected_align_source = align_source_sram_Q[482+:2];
                the_selected_insert_source = insert_source_sram_Q[482+:2];
                the_selected_delete_source = delete_source_sram_Q[482+:2];
            end
            242: begin
                the_selected_align_source = align_source_sram_Q[484+:2];
                the_selected_insert_source = insert_source_sram_Q[484+:2];
                the_selected_delete_source = delete_source_sram_Q[484+:2];
            end
            243: begin
                the_selected_align_source = align_source_sram_Q[486+:2];
                the_selected_insert_source = insert_source_sram_Q[486+:2];
                the_selected_delete_source = delete_source_sram_Q[486+:2];
            end
            244: begin
                the_selected_align_source = align_source_sram_Q[488+:2];
                the_selected_insert_source = insert_source_sram_Q[488+:2];
                the_selected_delete_source = delete_source_sram_Q[488+:2];
            end
            245: begin
                the_selected_align_source = align_source_sram_Q[490+:2];
                the_selected_insert_source = insert_source_sram_Q[490+:2];
                the_selected_delete_source = delete_source_sram_Q[490+:2];
            end
            246: begin
                the_selected_align_source = align_source_sram_Q[492+:2];
                the_selected_insert_source = insert_source_sram_Q[492+:2];
                the_selected_delete_source = delete_source_sram_Q[492+:2];
            end
            247: begin
                the_selected_align_source = align_source_sram_Q[494+:2];
                the_selected_insert_source = insert_source_sram_Q[494+:2];
                the_selected_delete_source = delete_source_sram_Q[494+:2];
            end
            248: begin
                the_selected_align_source = align_source_sram_Q[496+:2];
                the_selected_insert_source = insert_source_sram_Q[496+:2];
                the_selected_delete_source = delete_source_sram_Q[496+:2];
            end
            249: begin
                the_selected_align_source = align_source_sram_Q[498+:2];
                the_selected_insert_source = insert_source_sram_Q[498+:2];
                the_selected_delete_source = delete_source_sram_Q[498+:2];
            end
            250: begin
                the_selected_align_source = align_source_sram_Q[500+:2];
                the_selected_insert_source = insert_source_sram_Q[500+:2];
                the_selected_delete_source = delete_source_sram_Q[500+:2];
            end
            251: begin
                the_selected_align_source = align_source_sram_Q[502+:2];
                the_selected_insert_source = insert_source_sram_Q[502+:2];
                the_selected_delete_source = delete_source_sram_Q[502+:2];
            end
            252: begin
                the_selected_align_source = align_source_sram_Q[504+:2];
                the_selected_insert_source = insert_source_sram_Q[504+:2];
                the_selected_delete_source = delete_source_sram_Q[504+:2];
            end
            253: begin
                the_selected_align_source = align_source_sram_Q[506+:2];
                the_selected_insert_source = insert_source_sram_Q[506+:2];
                the_selected_delete_source = delete_source_sram_Q[506+:2];
            end
            254: begin
                the_selected_align_source = align_source_sram_Q[508+:2];
                the_selected_insert_source = insert_source_sram_Q[508+:2];
                the_selected_delete_source = delete_source_sram_Q[508+:2];
            end
            255: begin
                the_selected_align_source = align_source_sram_Q[510+:2];
                the_selected_insert_source = insert_source_sram_Q[510+:2];
                the_selected_delete_source = delete_source_sram_Q[510+:2];
            end
            256: begin
                the_selected_align_source = align_source_sram_Q[512+:2];
                the_selected_insert_source = insert_source_sram_Q[512+:2];
                the_selected_delete_source = delete_source_sram_Q[512+:2];
            end
            257: begin
                the_selected_align_source = align_source_sram_Q[514+:2];
                the_selected_insert_source = insert_source_sram_Q[514+:2];
                the_selected_delete_source = delete_source_sram_Q[514+:2];
            end
            258: begin
                the_selected_align_source = align_source_sram_Q[516+:2];
                the_selected_insert_source = insert_source_sram_Q[516+:2];
                the_selected_delete_source = delete_source_sram_Q[516+:2];
            end
            259: begin
                the_selected_align_source = align_source_sram_Q[518+:2];
                the_selected_insert_source = insert_source_sram_Q[518+:2];
                the_selected_delete_source = delete_source_sram_Q[518+:2];
            end
            260: begin
                the_selected_align_source = align_source_sram_Q[520+:2];
                the_selected_insert_source = insert_source_sram_Q[520+:2];
                the_selected_delete_source = delete_source_sram_Q[520+:2];
            end
            261: begin
                the_selected_align_source = align_source_sram_Q[522+:2];
                the_selected_insert_source = insert_source_sram_Q[522+:2];
                the_selected_delete_source = delete_source_sram_Q[522+:2];
            end
            262: begin
                the_selected_align_source = align_source_sram_Q[524+:2];
                the_selected_insert_source = insert_source_sram_Q[524+:2];
                the_selected_delete_source = delete_source_sram_Q[524+:2];
            end
            263: begin
                the_selected_align_source = align_source_sram_Q[526+:2];
                the_selected_insert_source = insert_source_sram_Q[526+:2];
                the_selected_delete_source = delete_source_sram_Q[526+:2];
            end
            264: begin
                the_selected_align_source = align_source_sram_Q[528+:2];
                the_selected_insert_source = insert_source_sram_Q[528+:2];
                the_selected_delete_source = delete_source_sram_Q[528+:2];
            end
            265: begin
                the_selected_align_source = align_source_sram_Q[530+:2];
                the_selected_insert_source = insert_source_sram_Q[530+:2];
                the_selected_delete_source = delete_source_sram_Q[530+:2];
            end
            266: begin
                the_selected_align_source = align_source_sram_Q[532+:2];
                the_selected_insert_source = insert_source_sram_Q[532+:2];
                the_selected_delete_source = delete_source_sram_Q[532+:2];
            end
            267: begin
                the_selected_align_source = align_source_sram_Q[534+:2];
                the_selected_insert_source = insert_source_sram_Q[534+:2];
                the_selected_delete_source = delete_source_sram_Q[534+:2];
            end
            268: begin
                the_selected_align_source = align_source_sram_Q[536+:2];
                the_selected_insert_source = insert_source_sram_Q[536+:2];
                the_selected_delete_source = delete_source_sram_Q[536+:2];
            end
            269: begin
                the_selected_align_source = align_source_sram_Q[538+:2];
                the_selected_insert_source = insert_source_sram_Q[538+:2];
                the_selected_delete_source = delete_source_sram_Q[538+:2];
            end
            270: begin
                the_selected_align_source = align_source_sram_Q[540+:2];
                the_selected_insert_source = insert_source_sram_Q[540+:2];
                the_selected_delete_source = delete_source_sram_Q[540+:2];
            end
            271: begin
                the_selected_align_source = align_source_sram_Q[542+:2];
                the_selected_insert_source = insert_source_sram_Q[542+:2];
                the_selected_delete_source = delete_source_sram_Q[542+:2];
            end
            272: begin
                the_selected_align_source = align_source_sram_Q[544+:2];
                the_selected_insert_source = insert_source_sram_Q[544+:2];
                the_selected_delete_source = delete_source_sram_Q[544+:2];
            end
            273: begin
                the_selected_align_source = align_source_sram_Q[546+:2];
                the_selected_insert_source = insert_source_sram_Q[546+:2];
                the_selected_delete_source = delete_source_sram_Q[546+:2];
            end
            274: begin
                the_selected_align_source = align_source_sram_Q[548+:2];
                the_selected_insert_source = insert_source_sram_Q[548+:2];
                the_selected_delete_source = delete_source_sram_Q[548+:2];
            end
            275: begin
                the_selected_align_source = align_source_sram_Q[550+:2];
                the_selected_insert_source = insert_source_sram_Q[550+:2];
                the_selected_delete_source = delete_source_sram_Q[550+:2];
            end
            276: begin
                the_selected_align_source = align_source_sram_Q[552+:2];
                the_selected_insert_source = insert_source_sram_Q[552+:2];
                the_selected_delete_source = delete_source_sram_Q[552+:2];
            end
            277: begin
                the_selected_align_source = align_source_sram_Q[554+:2];
                the_selected_insert_source = insert_source_sram_Q[554+:2];
                the_selected_delete_source = delete_source_sram_Q[554+:2];
            end
            278: begin
                the_selected_align_source = align_source_sram_Q[556+:2];
                the_selected_insert_source = insert_source_sram_Q[556+:2];
                the_selected_delete_source = delete_source_sram_Q[556+:2];
            end
            279: begin
                the_selected_align_source = align_source_sram_Q[558+:2];
                the_selected_insert_source = insert_source_sram_Q[558+:2];
                the_selected_delete_source = delete_source_sram_Q[558+:2];
            end
            280: begin
                the_selected_align_source = align_source_sram_Q[560+:2];
                the_selected_insert_source = insert_source_sram_Q[560+:2];
                the_selected_delete_source = delete_source_sram_Q[560+:2];
            end
            281: begin
                the_selected_align_source = align_source_sram_Q[562+:2];
                the_selected_insert_source = insert_source_sram_Q[562+:2];
                the_selected_delete_source = delete_source_sram_Q[562+:2];
            end
            282: begin
                the_selected_align_source = align_source_sram_Q[564+:2];
                the_selected_insert_source = insert_source_sram_Q[564+:2];
                the_selected_delete_source = delete_source_sram_Q[564+:2];
            end
            283: begin
                the_selected_align_source = align_source_sram_Q[566+:2];
                the_selected_insert_source = insert_source_sram_Q[566+:2];
                the_selected_delete_source = delete_source_sram_Q[566+:2];
            end
            284: begin
                the_selected_align_source = align_source_sram_Q[568+:2];
                the_selected_insert_source = insert_source_sram_Q[568+:2];
                the_selected_delete_source = delete_source_sram_Q[568+:2];
            end
            285: begin
                the_selected_align_source = align_source_sram_Q[570+:2];
                the_selected_insert_source = insert_source_sram_Q[570+:2];
                the_selected_delete_source = delete_source_sram_Q[570+:2];
            end
            286: begin
                the_selected_align_source = align_source_sram_Q[572+:2];
                the_selected_insert_source = insert_source_sram_Q[572+:2];
                the_selected_delete_source = delete_source_sram_Q[572+:2];
            end
            287: begin
                the_selected_align_source = align_source_sram_Q[574+:2];
                the_selected_insert_source = insert_source_sram_Q[574+:2];
                the_selected_delete_source = delete_source_sram_Q[574+:2];
            end
            288: begin
                the_selected_align_source = align_source_sram_Q[576+:2];
                the_selected_insert_source = insert_source_sram_Q[576+:2];
                the_selected_delete_source = delete_source_sram_Q[576+:2];
            end
            289: begin
                the_selected_align_source = align_source_sram_Q[578+:2];
                the_selected_insert_source = insert_source_sram_Q[578+:2];
                the_selected_delete_source = delete_source_sram_Q[578+:2];
            end
            290: begin
                the_selected_align_source = align_source_sram_Q[580+:2];
                the_selected_insert_source = insert_source_sram_Q[580+:2];
                the_selected_delete_source = delete_source_sram_Q[580+:2];
            end
            291: begin
                the_selected_align_source = align_source_sram_Q[582+:2];
                the_selected_insert_source = insert_source_sram_Q[582+:2];
                the_selected_delete_source = delete_source_sram_Q[582+:2];
            end
            292: begin
                the_selected_align_source = align_source_sram_Q[584+:2];
                the_selected_insert_source = insert_source_sram_Q[584+:2];
                the_selected_delete_source = delete_source_sram_Q[584+:2];
            end
            293: begin
                the_selected_align_source = align_source_sram_Q[586+:2];
                the_selected_insert_source = insert_source_sram_Q[586+:2];
                the_selected_delete_source = delete_source_sram_Q[586+:2];
            end
            294: begin
                the_selected_align_source = align_source_sram_Q[588+:2];
                the_selected_insert_source = insert_source_sram_Q[588+:2];
                the_selected_delete_source = delete_source_sram_Q[588+:2];
            end
            295: begin
                the_selected_align_source = align_source_sram_Q[590+:2];
                the_selected_insert_source = insert_source_sram_Q[590+:2];
                the_selected_delete_source = delete_source_sram_Q[590+:2];
            end
            296: begin
                the_selected_align_source = align_source_sram_Q[592+:2];
                the_selected_insert_source = insert_source_sram_Q[592+:2];
                the_selected_delete_source = delete_source_sram_Q[592+:2];
            end
            297: begin
                the_selected_align_source = align_source_sram_Q[594+:2];
                the_selected_insert_source = insert_source_sram_Q[594+:2];
                the_selected_delete_source = delete_source_sram_Q[594+:2];
            end
            298: begin
                the_selected_align_source = align_source_sram_Q[596+:2];
                the_selected_insert_source = insert_source_sram_Q[596+:2];
                the_selected_delete_source = delete_source_sram_Q[596+:2];
            end
            299: begin
                the_selected_align_source = align_source_sram_Q[598+:2];
                the_selected_insert_source = insert_source_sram_Q[598+:2];
                the_selected_delete_source = delete_source_sram_Q[598+:2];
            end
            300: begin
                the_selected_align_source = align_source_sram_Q[600+:2];
                the_selected_insert_source = insert_source_sram_Q[600+:2];
                the_selected_delete_source = delete_source_sram_Q[600+:2];
            end
            301: begin
                the_selected_align_source = align_source_sram_Q[602+:2];
                the_selected_insert_source = insert_source_sram_Q[602+:2];
                the_selected_delete_source = delete_source_sram_Q[602+:2];
            end
            302: begin
                the_selected_align_source = align_source_sram_Q[604+:2];
                the_selected_insert_source = insert_source_sram_Q[604+:2];
                the_selected_delete_source = delete_source_sram_Q[604+:2];
            end
            303: begin
                the_selected_align_source = align_source_sram_Q[606+:2];
                the_selected_insert_source = insert_source_sram_Q[606+:2];
                the_selected_delete_source = delete_source_sram_Q[606+:2];
            end
            304: begin
                the_selected_align_source = align_source_sram_Q[608+:2];
                the_selected_insert_source = insert_source_sram_Q[608+:2];
                the_selected_delete_source = delete_source_sram_Q[608+:2];
            end
            305: begin
                the_selected_align_source = align_source_sram_Q[610+:2];
                the_selected_insert_source = insert_source_sram_Q[610+:2];
                the_selected_delete_source = delete_source_sram_Q[610+:2];
            end
            306: begin
                the_selected_align_source = align_source_sram_Q[612+:2];
                the_selected_insert_source = insert_source_sram_Q[612+:2];
                the_selected_delete_source = delete_source_sram_Q[612+:2];
            end
            307: begin
                the_selected_align_source = align_source_sram_Q[614+:2];
                the_selected_insert_source = insert_source_sram_Q[614+:2];
                the_selected_delete_source = delete_source_sram_Q[614+:2];
            end
            308: begin
                the_selected_align_source = align_source_sram_Q[616+:2];
                the_selected_insert_source = insert_source_sram_Q[616+:2];
                the_selected_delete_source = delete_source_sram_Q[616+:2];
            end
            309: begin
                the_selected_align_source = align_source_sram_Q[618+:2];
                the_selected_insert_source = insert_source_sram_Q[618+:2];
                the_selected_delete_source = delete_source_sram_Q[618+:2];
            end
            310: begin
                the_selected_align_source = align_source_sram_Q[620+:2];
                the_selected_insert_source = insert_source_sram_Q[620+:2];
                the_selected_delete_source = delete_source_sram_Q[620+:2];
            end
            311: begin
                the_selected_align_source = align_source_sram_Q[622+:2];
                the_selected_insert_source = insert_source_sram_Q[622+:2];
                the_selected_delete_source = delete_source_sram_Q[622+:2];
            end
            312: begin
                the_selected_align_source = align_source_sram_Q[624+:2];
                the_selected_insert_source = insert_source_sram_Q[624+:2];
                the_selected_delete_source = delete_source_sram_Q[624+:2];
            end
            313: begin
                the_selected_align_source = align_source_sram_Q[626+:2];
                the_selected_insert_source = insert_source_sram_Q[626+:2];
                the_selected_delete_source = delete_source_sram_Q[626+:2];
            end
            314: begin
                the_selected_align_source = align_source_sram_Q[628+:2];
                the_selected_insert_source = insert_source_sram_Q[628+:2];
                the_selected_delete_source = delete_source_sram_Q[628+:2];
            end
            315: begin
                the_selected_align_source = align_source_sram_Q[630+:2];
                the_selected_insert_source = insert_source_sram_Q[630+:2];
                the_selected_delete_source = delete_source_sram_Q[630+:2];
            end
            316: begin
                the_selected_align_source = align_source_sram_Q[632+:2];
                the_selected_insert_source = insert_source_sram_Q[632+:2];
                the_selected_delete_source = delete_source_sram_Q[632+:2];
            end
            317: begin
                the_selected_align_source = align_source_sram_Q[634+:2];
                the_selected_insert_source = insert_source_sram_Q[634+:2];
                the_selected_delete_source = delete_source_sram_Q[634+:2];
            end
            318: begin
                the_selected_align_source = align_source_sram_Q[636+:2];
                the_selected_insert_source = insert_source_sram_Q[636+:2];
                the_selected_delete_source = delete_source_sram_Q[636+:2];
            end
            319: begin
                the_selected_align_source = align_source_sram_Q[638+:2];
                the_selected_insert_source = insert_source_sram_Q[638+:2];
                the_selected_delete_source = delete_source_sram_Q[638+:2];
            end
            320: begin
                the_selected_align_source = align_source_sram_Q[640+:2];
                the_selected_insert_source = insert_source_sram_Q[640+:2];
                the_selected_delete_source = delete_source_sram_Q[640+:2];
            end
            321: begin
                the_selected_align_source = align_source_sram_Q[642+:2];
                the_selected_insert_source = insert_source_sram_Q[642+:2];
                the_selected_delete_source = delete_source_sram_Q[642+:2];
            end
            322: begin
                the_selected_align_source = align_source_sram_Q[644+:2];
                the_selected_insert_source = insert_source_sram_Q[644+:2];
                the_selected_delete_source = delete_source_sram_Q[644+:2];
            end
            323: begin
                the_selected_align_source = align_source_sram_Q[646+:2];
                the_selected_insert_source = insert_source_sram_Q[646+:2];
                the_selected_delete_source = delete_source_sram_Q[646+:2];
            end
            324: begin
                the_selected_align_source = align_source_sram_Q[648+:2];
                the_selected_insert_source = insert_source_sram_Q[648+:2];
                the_selected_delete_source = delete_source_sram_Q[648+:2];
            end
            325: begin
                the_selected_align_source = align_source_sram_Q[650+:2];
                the_selected_insert_source = insert_source_sram_Q[650+:2];
                the_selected_delete_source = delete_source_sram_Q[650+:2];
            end
            326: begin
                the_selected_align_source = align_source_sram_Q[652+:2];
                the_selected_insert_source = insert_source_sram_Q[652+:2];
                the_selected_delete_source = delete_source_sram_Q[652+:2];
            end
            327: begin
                the_selected_align_source = align_source_sram_Q[654+:2];
                the_selected_insert_source = insert_source_sram_Q[654+:2];
                the_selected_delete_source = delete_source_sram_Q[654+:2];
            end
            328: begin
                the_selected_align_source = align_source_sram_Q[656+:2];
                the_selected_insert_source = insert_source_sram_Q[656+:2];
                the_selected_delete_source = delete_source_sram_Q[656+:2];
            end
            329: begin
                the_selected_align_source = align_source_sram_Q[658+:2];
                the_selected_insert_source = insert_source_sram_Q[658+:2];
                the_selected_delete_source = delete_source_sram_Q[658+:2];
            end
            330: begin
                the_selected_align_source = align_source_sram_Q[660+:2];
                the_selected_insert_source = insert_source_sram_Q[660+:2];
                the_selected_delete_source = delete_source_sram_Q[660+:2];
            end
            331: begin
                the_selected_align_source = align_source_sram_Q[662+:2];
                the_selected_insert_source = insert_source_sram_Q[662+:2];
                the_selected_delete_source = delete_source_sram_Q[662+:2];
            end
            332: begin
                the_selected_align_source = align_source_sram_Q[664+:2];
                the_selected_insert_source = insert_source_sram_Q[664+:2];
                the_selected_delete_source = delete_source_sram_Q[664+:2];
            end
            333: begin
                the_selected_align_source = align_source_sram_Q[666+:2];
                the_selected_insert_source = insert_source_sram_Q[666+:2];
                the_selected_delete_source = delete_source_sram_Q[666+:2];
            end
            334: begin
                the_selected_align_source = align_source_sram_Q[668+:2];
                the_selected_insert_source = insert_source_sram_Q[668+:2];
                the_selected_delete_source = delete_source_sram_Q[668+:2];
            end
            335: begin
                the_selected_align_source = align_source_sram_Q[670+:2];
                the_selected_insert_source = insert_source_sram_Q[670+:2];
                the_selected_delete_source = delete_source_sram_Q[670+:2];
            end
            336: begin
                the_selected_align_source = align_source_sram_Q[672+:2];
                the_selected_insert_source = insert_source_sram_Q[672+:2];
                the_selected_delete_source = delete_source_sram_Q[672+:2];
            end
            337: begin
                the_selected_align_source = align_source_sram_Q[674+:2];
                the_selected_insert_source = insert_source_sram_Q[674+:2];
                the_selected_delete_source = delete_source_sram_Q[674+:2];
            end
            338: begin
                the_selected_align_source = align_source_sram_Q[676+:2];
                the_selected_insert_source = insert_source_sram_Q[676+:2];
                the_selected_delete_source = delete_source_sram_Q[676+:2];
            end
            339: begin
                the_selected_align_source = align_source_sram_Q[678+:2];
                the_selected_insert_source = insert_source_sram_Q[678+:2];
                the_selected_delete_source = delete_source_sram_Q[678+:2];
            end
            340: begin
                the_selected_align_source = align_source_sram_Q[680+:2];
                the_selected_insert_source = insert_source_sram_Q[680+:2];
                the_selected_delete_source = delete_source_sram_Q[680+:2];
            end
            341: begin
                the_selected_align_source = align_source_sram_Q[682+:2];
                the_selected_insert_source = insert_source_sram_Q[682+:2];
                the_selected_delete_source = delete_source_sram_Q[682+:2];
            end
            342: begin
                the_selected_align_source = align_source_sram_Q[684+:2];
                the_selected_insert_source = insert_source_sram_Q[684+:2];
                the_selected_delete_source = delete_source_sram_Q[684+:2];
            end
            343: begin
                the_selected_align_source = align_source_sram_Q[686+:2];
                the_selected_insert_source = insert_source_sram_Q[686+:2];
                the_selected_delete_source = delete_source_sram_Q[686+:2];
            end
            344: begin
                the_selected_align_source = align_source_sram_Q[688+:2];
                the_selected_insert_source = insert_source_sram_Q[688+:2];
                the_selected_delete_source = delete_source_sram_Q[688+:2];
            end
            345: begin
                the_selected_align_source = align_source_sram_Q[690+:2];
                the_selected_insert_source = insert_source_sram_Q[690+:2];
                the_selected_delete_source = delete_source_sram_Q[690+:2];
            end
            346: begin
                the_selected_align_source = align_source_sram_Q[692+:2];
                the_selected_insert_source = insert_source_sram_Q[692+:2];
                the_selected_delete_source = delete_source_sram_Q[692+:2];
            end
            347: begin
                the_selected_align_source = align_source_sram_Q[694+:2];
                the_selected_insert_source = insert_source_sram_Q[694+:2];
                the_selected_delete_source = delete_source_sram_Q[694+:2];
            end
            348: begin
                the_selected_align_source = align_source_sram_Q[696+:2];
                the_selected_insert_source = insert_source_sram_Q[696+:2];
                the_selected_delete_source = delete_source_sram_Q[696+:2];
            end
            349: begin
                the_selected_align_source = align_source_sram_Q[698+:2];
                the_selected_insert_source = insert_source_sram_Q[698+:2];
                the_selected_delete_source = delete_source_sram_Q[698+:2];
            end
            350: begin
                the_selected_align_source = align_source_sram_Q[700+:2];
                the_selected_insert_source = insert_source_sram_Q[700+:2];
                the_selected_delete_source = delete_source_sram_Q[700+:2];
            end
            351: begin
                the_selected_align_source = align_source_sram_Q[702+:2];
                the_selected_insert_source = insert_source_sram_Q[702+:2];
                the_selected_delete_source = delete_source_sram_Q[702+:2];
            end
            352: begin
                the_selected_align_source = align_source_sram_Q[704+:2];
                the_selected_insert_source = insert_source_sram_Q[704+:2];
                the_selected_delete_source = delete_source_sram_Q[704+:2];
            end
            353: begin
                the_selected_align_source = align_source_sram_Q[706+:2];
                the_selected_insert_source = insert_source_sram_Q[706+:2];
                the_selected_delete_source = delete_source_sram_Q[706+:2];
            end
            354: begin
                the_selected_align_source = align_source_sram_Q[708+:2];
                the_selected_insert_source = insert_source_sram_Q[708+:2];
                the_selected_delete_source = delete_source_sram_Q[708+:2];
            end
            355: begin
                the_selected_align_source = align_source_sram_Q[710+:2];
                the_selected_insert_source = insert_source_sram_Q[710+:2];
                the_selected_delete_source = delete_source_sram_Q[710+:2];
            end
            356: begin
                the_selected_align_source = align_source_sram_Q[712+:2];
                the_selected_insert_source = insert_source_sram_Q[712+:2];
                the_selected_delete_source = delete_source_sram_Q[712+:2];
            end
            357: begin
                the_selected_align_source = align_source_sram_Q[714+:2];
                the_selected_insert_source = insert_source_sram_Q[714+:2];
                the_selected_delete_source = delete_source_sram_Q[714+:2];
            end
            358: begin
                the_selected_align_source = align_source_sram_Q[716+:2];
                the_selected_insert_source = insert_source_sram_Q[716+:2];
                the_selected_delete_source = delete_source_sram_Q[716+:2];
            end
            359: begin
                the_selected_align_source = align_source_sram_Q[718+:2];
                the_selected_insert_source = insert_source_sram_Q[718+:2];
                the_selected_delete_source = delete_source_sram_Q[718+:2];
            end
            360: begin
                the_selected_align_source = align_source_sram_Q[720+:2];
                the_selected_insert_source = insert_source_sram_Q[720+:2];
                the_selected_delete_source = delete_source_sram_Q[720+:2];
            end
            361: begin
                the_selected_align_source = align_source_sram_Q[722+:2];
                the_selected_insert_source = insert_source_sram_Q[722+:2];
                the_selected_delete_source = delete_source_sram_Q[722+:2];
            end
            362: begin
                the_selected_align_source = align_source_sram_Q[724+:2];
                the_selected_insert_source = insert_source_sram_Q[724+:2];
                the_selected_delete_source = delete_source_sram_Q[724+:2];
            end
            363: begin
                the_selected_align_source = align_source_sram_Q[726+:2];
                the_selected_insert_source = insert_source_sram_Q[726+:2];
                the_selected_delete_source = delete_source_sram_Q[726+:2];
            end
            364: begin
                the_selected_align_source = align_source_sram_Q[728+:2];
                the_selected_insert_source = insert_source_sram_Q[728+:2];
                the_selected_delete_source = delete_source_sram_Q[728+:2];
            end
            365: begin
                the_selected_align_source = align_source_sram_Q[730+:2];
                the_selected_insert_source = insert_source_sram_Q[730+:2];
                the_selected_delete_source = delete_source_sram_Q[730+:2];
            end
            366: begin
                the_selected_align_source = align_source_sram_Q[732+:2];
                the_selected_insert_source = insert_source_sram_Q[732+:2];
                the_selected_delete_source = delete_source_sram_Q[732+:2];
            end
            367: begin
                the_selected_align_source = align_source_sram_Q[734+:2];
                the_selected_insert_source = insert_source_sram_Q[734+:2];
                the_selected_delete_source = delete_source_sram_Q[734+:2];
            end
            368: begin
                the_selected_align_source = align_source_sram_Q[736+:2];
                the_selected_insert_source = insert_source_sram_Q[736+:2];
                the_selected_delete_source = delete_source_sram_Q[736+:2];
            end
            369: begin
                the_selected_align_source = align_source_sram_Q[738+:2];
                the_selected_insert_source = insert_source_sram_Q[738+:2];
                the_selected_delete_source = delete_source_sram_Q[738+:2];
            end
            370: begin
                the_selected_align_source = align_source_sram_Q[740+:2];
                the_selected_insert_source = insert_source_sram_Q[740+:2];
                the_selected_delete_source = delete_source_sram_Q[740+:2];
            end
            371: begin
                the_selected_align_source = align_source_sram_Q[742+:2];
                the_selected_insert_source = insert_source_sram_Q[742+:2];
                the_selected_delete_source = delete_source_sram_Q[742+:2];
            end
            372: begin
                the_selected_align_source = align_source_sram_Q[744+:2];
                the_selected_insert_source = insert_source_sram_Q[744+:2];
                the_selected_delete_source = delete_source_sram_Q[744+:2];
            end
            373: begin
                the_selected_align_source = align_source_sram_Q[746+:2];
                the_selected_insert_source = insert_source_sram_Q[746+:2];
                the_selected_delete_source = delete_source_sram_Q[746+:2];
            end
            374: begin
                the_selected_align_source = align_source_sram_Q[748+:2];
                the_selected_insert_source = insert_source_sram_Q[748+:2];
                the_selected_delete_source = delete_source_sram_Q[748+:2];
            end
            375: begin
                the_selected_align_source = align_source_sram_Q[750+:2];
                the_selected_insert_source = insert_source_sram_Q[750+:2];
                the_selected_delete_source = delete_source_sram_Q[750+:2];
            end
            376: begin
                the_selected_align_source = align_source_sram_Q[752+:2];
                the_selected_insert_source = insert_source_sram_Q[752+:2];
                the_selected_delete_source = delete_source_sram_Q[752+:2];
            end
            377: begin
                the_selected_align_source = align_source_sram_Q[754+:2];
                the_selected_insert_source = insert_source_sram_Q[754+:2];
                the_selected_delete_source = delete_source_sram_Q[754+:2];
            end
            378: begin
                the_selected_align_source = align_source_sram_Q[756+:2];
                the_selected_insert_source = insert_source_sram_Q[756+:2];
                the_selected_delete_source = delete_source_sram_Q[756+:2];
            end
            379: begin
                the_selected_align_source = align_source_sram_Q[758+:2];
                the_selected_insert_source = insert_source_sram_Q[758+:2];
                the_selected_delete_source = delete_source_sram_Q[758+:2];
            end
            380: begin
                the_selected_align_source = align_source_sram_Q[760+:2];
                the_selected_insert_source = insert_source_sram_Q[760+:2];
                the_selected_delete_source = delete_source_sram_Q[760+:2];
            end
            381: begin
                the_selected_align_source = align_source_sram_Q[762+:2];
                the_selected_insert_source = insert_source_sram_Q[762+:2];
                the_selected_delete_source = delete_source_sram_Q[762+:2];
            end
            382: begin
                the_selected_align_source = align_source_sram_Q[764+:2];
                the_selected_insert_source = insert_source_sram_Q[764+:2];
                the_selected_delete_source = delete_source_sram_Q[764+:2];
            end
            383: begin
                the_selected_align_source = align_source_sram_Q[766+:2];
                the_selected_insert_source = insert_source_sram_Q[766+:2];
                the_selected_delete_source = delete_source_sram_Q[766+:2];
            end
            384: begin
                the_selected_align_source = align_source_sram_Q[768+:2];
                the_selected_insert_source = insert_source_sram_Q[768+:2];
                the_selected_delete_source = delete_source_sram_Q[768+:2];
            end
            385: begin
                the_selected_align_source = align_source_sram_Q[770+:2];
                the_selected_insert_source = insert_source_sram_Q[770+:2];
                the_selected_delete_source = delete_source_sram_Q[770+:2];
            end
            386: begin
                the_selected_align_source = align_source_sram_Q[772+:2];
                the_selected_insert_source = insert_source_sram_Q[772+:2];
                the_selected_delete_source = delete_source_sram_Q[772+:2];
            end
            387: begin
                the_selected_align_source = align_source_sram_Q[774+:2];
                the_selected_insert_source = insert_source_sram_Q[774+:2];
                the_selected_delete_source = delete_source_sram_Q[774+:2];
            end
            388: begin
                the_selected_align_source = align_source_sram_Q[776+:2];
                the_selected_insert_source = insert_source_sram_Q[776+:2];
                the_selected_delete_source = delete_source_sram_Q[776+:2];
            end
            389: begin
                the_selected_align_source = align_source_sram_Q[778+:2];
                the_selected_insert_source = insert_source_sram_Q[778+:2];
                the_selected_delete_source = delete_source_sram_Q[778+:2];
            end
            390: begin
                the_selected_align_source = align_source_sram_Q[780+:2];
                the_selected_insert_source = insert_source_sram_Q[780+:2];
                the_selected_delete_source = delete_source_sram_Q[780+:2];
            end
            391: begin
                the_selected_align_source = align_source_sram_Q[782+:2];
                the_selected_insert_source = insert_source_sram_Q[782+:2];
                the_selected_delete_source = delete_source_sram_Q[782+:2];
            end
            392: begin
                the_selected_align_source = align_source_sram_Q[784+:2];
                the_selected_insert_source = insert_source_sram_Q[784+:2];
                the_selected_delete_source = delete_source_sram_Q[784+:2];
            end
            393: begin
                the_selected_align_source = align_source_sram_Q[786+:2];
                the_selected_insert_source = insert_source_sram_Q[786+:2];
                the_selected_delete_source = delete_source_sram_Q[786+:2];
            end
            394: begin
                the_selected_align_source = align_source_sram_Q[788+:2];
                the_selected_insert_source = insert_source_sram_Q[788+:2];
                the_selected_delete_source = delete_source_sram_Q[788+:2];
            end
            395: begin
                the_selected_align_source = align_source_sram_Q[790+:2];
                the_selected_insert_source = insert_source_sram_Q[790+:2];
                the_selected_delete_source = delete_source_sram_Q[790+:2];
            end
            396: begin
                the_selected_align_source = align_source_sram_Q[792+:2];
                the_selected_insert_source = insert_source_sram_Q[792+:2];
                the_selected_delete_source = delete_source_sram_Q[792+:2];
            end
            397: begin
                the_selected_align_source = align_source_sram_Q[794+:2];
                the_selected_insert_source = insert_source_sram_Q[794+:2];
                the_selected_delete_source = delete_source_sram_Q[794+:2];
            end
            398: begin
                the_selected_align_source = align_source_sram_Q[796+:2];
                the_selected_insert_source = insert_source_sram_Q[796+:2];
                the_selected_delete_source = delete_source_sram_Q[796+:2];
            end
            399: begin
                the_selected_align_source = align_source_sram_Q[798+:2];
                the_selected_insert_source = insert_source_sram_Q[798+:2];
                the_selected_delete_source = delete_source_sram_Q[798+:2];
            end
        endcase
    end

    



    // select last source from REF/ALt buffer
    reg [1:0] the_last_REF_source;
    reg [1:0] the_last_ALT_source;
    always@(*) begin
        the_last_REF_source = 0;
        case(var_length)
            8'd1:   the_last_REF_source = REF_buffer[239-:2];
            8'd2:   the_last_REF_source = REF_buffer[237-:2];
            8'd3:   the_last_REF_source = REF_buffer[235-:2];
            8'd4:   the_last_REF_source = REF_buffer[233-:2];
            8'd5:   the_last_REF_source = REF_buffer[231-:2];
            8'd6:   the_last_REF_source = REF_buffer[229-:2];
            8'd7:   the_last_REF_source = REF_buffer[227-:2];
            8'd8:   the_last_REF_source = REF_buffer[225-:2];
            8'd9:   the_last_REF_source = REF_buffer[223-:2];
            8'd10:  the_last_REF_source = REF_buffer[221-:2];
            8'd11:  the_last_REF_source = REF_buffer[219-:2];
            8'd12:  the_last_REF_source = REF_buffer[217-:2];
            8'd13:  the_last_REF_source = REF_buffer[215-:2];
            8'd14:  the_last_REF_source = REF_buffer[213-:2];
            8'd15:  the_last_REF_source = REF_buffer[211-:2];
            8'd16:  the_last_REF_source = REF_buffer[209-:2];
            8'd17:  the_last_REF_source = REF_buffer[207-:2];
            8'd18:  the_last_REF_source = REF_buffer[205-:2];
            8'd19:  the_last_REF_source = REF_buffer[203-:2];
            8'd20:  the_last_REF_source = REF_buffer[201-:2];
            8'd21:  the_last_REF_source = REF_buffer[199-:2];
            8'd22:  the_last_REF_source = REF_buffer[197-:2];
            8'd23:  the_last_REF_source = REF_buffer[195-:2];
            8'd24:  the_last_REF_source = REF_buffer[193-:2];
            8'd25:  the_last_REF_source = REF_buffer[191-:2];
            8'd26:  the_last_REF_source = REF_buffer[189-:2];
            8'd27:  the_last_REF_source = REF_buffer[187-:2];
            8'd28:  the_last_REF_source = REF_buffer[185-:2];
            8'd29:  the_last_REF_source = REF_buffer[183-:2];
            8'd30:  the_last_REF_source = REF_buffer[181-:2];
            8'd31:  the_last_REF_source = REF_buffer[179-:2];
            8'd32:  the_last_REF_source = REF_buffer[177-:2];
            8'd33:  the_last_REF_source = REF_buffer[175-:2];
            8'd34:  the_last_REF_source = REF_buffer[173-:2];
            8'd35:  the_last_REF_source = REF_buffer[171-:2];
            8'd36:  the_last_REF_source = REF_buffer[169-:2];
            8'd37:  the_last_REF_source = REF_buffer[167-:2];
            8'd38:  the_last_REF_source = REF_buffer[165-:2];
            8'd39:  the_last_REF_source = REF_buffer[163-:2];
            8'd40:  the_last_REF_source = REF_buffer[161-:2];
            8'd41:  the_last_REF_source = REF_buffer[159-:2];
            8'd42:  the_last_REF_source = REF_buffer[157-:2];
            8'd43:  the_last_REF_source = REF_buffer[155-:2];
            8'd44:  the_last_REF_source = REF_buffer[153-:2];
            8'd45:  the_last_REF_source = REF_buffer[151-:2];
            8'd46:  the_last_REF_source = REF_buffer[149-:2];
            8'd47:  the_last_REF_source = REF_buffer[147-:2];
            8'd48:  the_last_REF_source = REF_buffer[145-:2];
            8'd49:  the_last_REF_source = REF_buffer[143-:2];
            8'd50:  the_last_REF_source = REF_buffer[141-:2];
            8'd51:  the_last_REF_source = REF_buffer[139-:2];
            8'd52:  the_last_REF_source = REF_buffer[137-:2];
            8'd53:  the_last_REF_source = REF_buffer[135-:2];
            8'd54:  the_last_REF_source = REF_buffer[133-:2];
            8'd55:  the_last_REF_source = REF_buffer[131-:2];
            8'd56:  the_last_REF_source = REF_buffer[129-:2];
            8'd57:  the_last_REF_source = REF_buffer[127-:2];
            8'd58:  the_last_REF_source = REF_buffer[125-:2];
            8'd59:  the_last_REF_source = REF_buffer[123-:2];
            8'd60:  the_last_REF_source = REF_buffer[121-:2];
            8'd61:  the_last_REF_source = REF_buffer[119-:2];
            8'd62:  the_last_REF_source = REF_buffer[117-:2];
            8'd63:  the_last_REF_source = REF_buffer[115-:2];
            8'd64:  the_last_REF_source = REF_buffer[113-:2];
            8'd65:  the_last_REF_source = REF_buffer[111-:2];
            8'd66:  the_last_REF_source = REF_buffer[109-:2];
            8'd67:  the_last_REF_source = REF_buffer[107-:2];
            8'd68:  the_last_REF_source = REF_buffer[105-:2];
            8'd69:  the_last_REF_source = REF_buffer[103-:2];
            8'd70:  the_last_REF_source = REF_buffer[101-:2];
            8'd71:  the_last_REF_source = REF_buffer[99-:2];
            8'd72:  the_last_REF_source = REF_buffer[97-:2];
            8'd73:  the_last_REF_source = REF_buffer[95-:2];
            8'd74:  the_last_REF_source = REF_buffer[93-:2];
            8'd75:  the_last_REF_source = REF_buffer[91-:2];
            8'd76:  the_last_REF_source = REF_buffer[89-:2];
            8'd77:  the_last_REF_source = REF_buffer[87-:2];
            8'd78:  the_last_REF_source = REF_buffer[85-:2];
            8'd79:  the_last_REF_source = REF_buffer[83-:2];
            8'd80:  the_last_REF_source = REF_buffer[81-:2];
            8'd81:  the_last_REF_source = REF_buffer[79-:2];
            8'd82:  the_last_REF_source = REF_buffer[77-:2];
            8'd83:  the_last_REF_source = REF_buffer[75-:2];
            8'd84:  the_last_REF_source = REF_buffer[73-:2];
            8'd85:  the_last_REF_source = REF_buffer[71-:2];
            8'd86:  the_last_REF_source = REF_buffer[69-:2];
            8'd87:  the_last_REF_source = REF_buffer[67-:2];
            8'd88:  the_last_REF_source = REF_buffer[65-:2];
            8'd89:  the_last_REF_source = REF_buffer[63-:2];
            8'd90:  the_last_REF_source = REF_buffer[61-:2];
            8'd91:  the_last_REF_source = REF_buffer[59-:2];
            8'd92:  the_last_REF_source = REF_buffer[57-:2];
            8'd93:  the_last_REF_source = REF_buffer[55-:2];
            8'd94:  the_last_REF_source = REF_buffer[53-:2];
            8'd95:  the_last_REF_source = REF_buffer[51-:2];
            8'd96:  the_last_REF_source = REF_buffer[49-:2];
            8'd97:  the_last_REF_source = REF_buffer[47-:2];
            8'd98:  the_last_REF_source = REF_buffer[45-:2];
            8'd99:  the_last_REF_source = REF_buffer[43-:2];
            8'd100: the_last_REF_source = REF_buffer[41-:2];
            8'd101: the_last_REF_source = REF_buffer[39-:2];
            8'd102: the_last_REF_source = REF_buffer[37-:2];
            8'd103: the_last_REF_source = REF_buffer[35-:2];
            8'd104: the_last_REF_source = REF_buffer[33-:2];
            8'd105: the_last_REF_source = REF_buffer[31-:2];
            8'd106: the_last_REF_source = REF_buffer[29-:2];
            8'd107: the_last_REF_source = REF_buffer[27-:2];
            8'd108: the_last_REF_source = REF_buffer[25-:2];
            8'd109: the_last_REF_source = REF_buffer[23-:2];
            8'd110: the_last_REF_source = REF_buffer[21-:2];
            8'd111: the_last_REF_source = REF_buffer[19-:2];
            8'd112: the_last_REF_source = REF_buffer[17-:2];
            8'd113: the_last_REF_source = REF_buffer[15-:2];
            8'd114: the_last_REF_source = REF_buffer[13-:2];
            8'd115: the_last_REF_source = REF_buffer[11-:2];
            8'd116: the_last_REF_source = REF_buffer[9-:2];
            8'd117: the_last_REF_source = REF_buffer[7-:2];
            8'd118: the_last_REF_source = REF_buffer[5-:2];
            8'd119: the_last_REF_source = REF_buffer[3-:2];
            8'd120: the_last_REF_source = REF_buffer[1-:2];
            default:the_last_REF_source = REF_buffer[1-:2];
            // 'd121: the_last_REF_source = REF_buffer[15-:2];
            // 'd122: the_last_REF_source = REF_buffer[13-:2];
            // 'd123: the_last_REF_source = REF_buffer[11-:2];
            // 'd124: the_last_REF_source = REF_buffer[9-:2];
            // 'd125: the_last_REF_source = REF_buffer[7-:2];
            // 'd126: the_last_REF_source = REF_buffer[5-:2];
            // 'd127: the_last_REF_source = REF_buffer[3-:2];
            // 'd128: the_last_REF_source = REF_buffer[1-:2];
            //1+127: the_last_REF_source = REF_buffer[1-:2];
        endcase

        the_last_ALT_source = 0;
        case(var_length)
            8'd1:  the_last_ALT_source = ALT_buffer[239-:2];
            8'd2:  the_last_ALT_source = ALT_buffer[237-:2];
            8'd3:  the_last_ALT_source = ALT_buffer[235-:2];
            8'd4:  the_last_ALT_source = ALT_buffer[233-:2];
            8'd5:  the_last_ALT_source = ALT_buffer[231-:2];
            8'd6:  the_last_ALT_source = ALT_buffer[229-:2];
            8'd7:  the_last_ALT_source = ALT_buffer[227-:2];
            8'd8:  the_last_ALT_source = ALT_buffer[225-:2];
            8'd9:  the_last_ALT_source = ALT_buffer[223-:2];
            8'd10: the_last_ALT_source = ALT_buffer[221-:2];
            8'd11: the_last_ALT_source = ALT_buffer[219-:2];
            8'd12: the_last_ALT_source = ALT_buffer[217-:2];
            8'd13: the_last_ALT_source = ALT_buffer[215-:2];
            8'd14: the_last_ALT_source = ALT_buffer[213-:2];
            8'd15: the_last_ALT_source = ALT_buffer[211-:2];
            8'd16: the_last_ALT_source = ALT_buffer[209-:2];
            8'd17: the_last_ALT_source = ALT_buffer[207-:2];
            8'd18: the_last_ALT_source = ALT_buffer[205-:2];
            8'd19: the_last_ALT_source = ALT_buffer[203-:2];
            8'd20: the_last_ALT_source = ALT_buffer[201-:2];
            8'd21: the_last_ALT_source = ALT_buffer[199-:2];
            8'd22: the_last_ALT_source = ALT_buffer[197-:2];
            8'd23: the_last_ALT_source = ALT_buffer[195-:2];
            8'd24: the_last_ALT_source = ALT_buffer[193-:2];
            8'd25: the_last_ALT_source = ALT_buffer[191-:2];
            8'd26: the_last_ALT_source = ALT_buffer[189-:2];
            8'd27: the_last_ALT_source = ALT_buffer[187-:2];
            8'd28: the_last_ALT_source = ALT_buffer[185-:2];
            8'd29: the_last_ALT_source = ALT_buffer[183-:2];
            8'd30: the_last_ALT_source = ALT_buffer[181-:2];
            8'd31: the_last_ALT_source = ALT_buffer[179-:2];
            8'd32: the_last_ALT_source = ALT_buffer[177-:2];
            8'd33: the_last_ALT_source = ALT_buffer[175-:2];
            8'd34: the_last_ALT_source = ALT_buffer[173-:2];
            8'd35: the_last_ALT_source = ALT_buffer[171-:2];
            8'd36: the_last_ALT_source = ALT_buffer[169-:2];
            8'd37: the_last_ALT_source = ALT_buffer[167-:2];
            8'd38: the_last_ALT_source = ALT_buffer[165-:2];
            8'd39: the_last_ALT_source = ALT_buffer[163-:2];
            8'd40: the_last_ALT_source = ALT_buffer[161-:2];
            8'd41: the_last_ALT_source = ALT_buffer[159-:2];
            8'd42: the_last_ALT_source = ALT_buffer[157-:2];
            8'd43: the_last_ALT_source = ALT_buffer[155-:2];
            8'd44: the_last_ALT_source = ALT_buffer[153-:2];
            8'd45: the_last_ALT_source = ALT_buffer[151-:2];
            8'd46: the_last_ALT_source = ALT_buffer[149-:2];
            8'd47: the_last_ALT_source = ALT_buffer[147-:2];
            8'd48: the_last_ALT_source = ALT_buffer[145-:2];
            8'd49: the_last_ALT_source = ALT_buffer[143-:2];
            8'd50: the_last_ALT_source = ALT_buffer[141-:2];
            8'd51: the_last_ALT_source = ALT_buffer[139-:2];
            8'd52: the_last_ALT_source = ALT_buffer[137-:2];
            8'd53: the_last_ALT_source = ALT_buffer[135-:2];
            8'd54: the_last_ALT_source = ALT_buffer[133-:2];
            8'd55: the_last_ALT_source = ALT_buffer[131-:2];
            8'd56: the_last_ALT_source = ALT_buffer[129-:2];
            8'd57: the_last_ALT_source = ALT_buffer[127-:2];
            8'd58: the_last_ALT_source = ALT_buffer[125-:2];
            8'd59: the_last_ALT_source = ALT_buffer[123-:2];
            8'd60: the_last_ALT_source = ALT_buffer[121-:2];
            8'd61: the_last_ALT_source = ALT_buffer[119-:2];
            8'd62: the_last_ALT_source = ALT_buffer[117-:2];
            8'd63: the_last_ALT_source = ALT_buffer[115-:2];
            8'd64: the_last_ALT_source = ALT_buffer[113-:2];
            8'd65: the_last_ALT_source = ALT_buffer[111-:2];
            8'd66: the_last_ALT_source = ALT_buffer[109-:2];
            8'd67: the_last_ALT_source = ALT_buffer[107-:2];
            8'd68: the_last_ALT_source = ALT_buffer[105-:2];
            8'd69: the_last_ALT_source = ALT_buffer[103-:2];
            8'd70: the_last_ALT_source = ALT_buffer[101-:2];
            8'd71: the_last_ALT_source = ALT_buffer[99-:2];
            8'd72: the_last_ALT_source = ALT_buffer[97-:2];
            8'd73: the_last_ALT_source = ALT_buffer[95-:2];
            8'd74: the_last_ALT_source = ALT_buffer[93-:2];
            8'd75: the_last_ALT_source = ALT_buffer[91-:2];
            8'd76: the_last_ALT_source = ALT_buffer[89-:2];
            8'd77: the_last_ALT_source = ALT_buffer[87-:2];
            8'd78: the_last_ALT_source = ALT_buffer[85-:2];
            8'd79: the_last_ALT_source = ALT_buffer[83-:2];
            8'd80: the_last_ALT_source = ALT_buffer[81-:2];
            8'd81: the_last_ALT_source = ALT_buffer[79-:2];
            8'd82: the_last_ALT_source = ALT_buffer[77-:2];
            8'd83: the_last_ALT_source = ALT_buffer[75-:2];
            8'd84: the_last_ALT_source = ALT_buffer[73-:2];
            8'd85: the_last_ALT_source = ALT_buffer[71-:2];
            8'd86: the_last_ALT_source = ALT_buffer[69-:2];
            8'd87: the_last_ALT_source = ALT_buffer[67-:2];
            8'd88: the_last_ALT_source = ALT_buffer[65-:2];
            8'd89: the_last_ALT_source = ALT_buffer[63-:2];
            8'd90: the_last_ALT_source = ALT_buffer[61-:2];
            8'd91: the_last_ALT_source = ALT_buffer[59-:2];
            8'd92: the_last_ALT_source = ALT_buffer[57-:2];
            8'd93: the_last_ALT_source =  ALT_buffer[55-:2];
            8'd94: the_last_ALT_source =  ALT_buffer[53-:2];
            8'd95: the_last_ALT_source =  ALT_buffer[51-:2];
            8'd96: the_last_ALT_source =  ALT_buffer[49-:2];
            8'd97: the_last_ALT_source =  ALT_buffer[47-:2];
            8'd98: the_last_ALT_source =  ALT_buffer[45-:2];
            8'd99: the_last_ALT_source =  ALT_buffer[43-:2];
            8'd100:the_last_ALT_source =  ALT_buffer[41-:2];
            8'd101: the_last_ALT_source = ALT_buffer[39-:2];
            8'd102: the_last_ALT_source = ALT_buffer[37-:2];
            8'd103: the_last_ALT_source = ALT_buffer[35-:2];
            8'd104: the_last_ALT_source = ALT_buffer[33-:2];
            8'd105: the_last_ALT_source = ALT_buffer[31-:2];
            8'd106: the_last_ALT_source = ALT_buffer[29-:2];
            8'd107: the_last_ALT_source = ALT_buffer[27-:2];
            8'd108: the_last_ALT_source = ALT_buffer[25-:2];
            8'd109: the_last_ALT_source = ALT_buffer[23-:2];
            8'd110: the_last_ALT_source = ALT_buffer[21-:2];
            8'd111: the_last_ALT_source = ALT_buffer[19-:2];
            8'd112: the_last_ALT_source = ALT_buffer[17-:2];
            8'd113: the_last_ALT_source = ALT_buffer[15-:2];
            8'd114: the_last_ALT_source = ALT_buffer[13-:2];
            8'd115: the_last_ALT_source = ALT_buffer[11-:2];
            8'd116: the_last_ALT_source = ALT_buffer[9-:2];
            8'd117: the_last_ALT_source = ALT_buffer[7-:2];
            8'd118: the_last_ALT_source = ALT_buffer[5-:2];
            8'd119: the_last_ALT_source = ALT_buffer[3-:2];
            8'd120: the_last_ALT_source = ALT_buffer[1-:2];
            default:the_last_ALT_source = ALT_buffer[1-:2];
            // 8'd121: the_last_ALT_source = ALT_buffer[15-:2];
            // 8'd122: the_last_ALT_source = ALT_buffer[13-:2];
            // 8'd123: the_last_ALT_source = ALT_buffer[11-:2];
            // 8'd124: the_last_ALT_source = ALT_buffer[9-:2];
            // 8'd125: the_last_ALT_source = ALT_buffer[7-:2];
            // 8'd126: the_last_ALT_source = ALT_buffer[5-:2];
            // 8'd127: the_last_ALT_source = ALT_buffer[3-:2];
            // 8'd128: the_last_ALT_source = ALT_buffer[1-:2];
            //127: the_last_ALT_source = ALT_buffer[1-:2];
        endcase
    end

    
    wire A_base_equal_to_last_ALT =  (the_chosen_A_base == the_last_ALT_source);
    wire B_base_equal_to_last_REF =  (the_chosen_B_base == the_last_REF_source);
    
    wire INSERTION_normalizable     = (the_score_source==2) & (current_var==1) & A_base_equal_to_last_ALT;
    wire DELETION_normalizable      = (the_score_source==2) & (current_var==3) & B_base_equal_to_last_REF;
    
    wire base_pair_mismatch         = (the_chosen_A_base != the_chosen_B_base);
    wire INSERTION_determination    = (current_var==1) & (~A_base_equal_to_last_ALT);
    wire DELETION_determination     = (current_var==3) & (~B_base_equal_to_last_REF);






    //////////////////////////// state control ////////////////////////////
    always@(*) begin
        state_n = state;
        case(state)
            S_idle:             state_n = (i_valid) ? S_input : state;
            S_input:            state_n = S_calculate;
            S_calculate:        state_n = (counter == seq_A_length + seq_B_length - 1) ? S_select_highest : state;
            S_select_highest:   state_n = (counter == seq_B_length - 1) ? S_backtrace_and_output : state;
            S_backtrace_and_output: begin
                if (((the_score_source==0) | (the_score_source==2 & (row==0 | column==0)) | (the_score_source==1 & row==0) | (the_score_source==3 & column==3)) & i_ready & sram_Q_valid)
                    state_n = S_done;
            end
            S_done: state_n = (i_ready) ? S_idle : state;
        endcase
    end





    ///////////////////// main design ///////////////////
    always@(*) begin
        sequence_A_n       = sequence_A;
        sequence_B_n       = sequence_B;
        seq_A_length_n     = seq_A_length;
        seq_B_length_n     = seq_B_length;
        var_haplotype_ID_n = var_haplotype_ID;
        counter_n                                                               = counter;
        for (i=0;i<`REF_MAX_LENGTH;i=i+1) sequence_A_valid_n[i]                 = sequence_A_valid[i];
        for (i=0;i<`HAP_MAX_LENGTH;i=i+1) sequence_B_valid_n[i]                 = sequence_B_valid[i];
        sequence_A_shifter_n                                                    = sequence_A_shifter;
        highest_score_n                                                         = highest_score;
        column_n                                                                = column;
        row_n                                                                   = row;
        the_score_source_n                                                      = the_score_source;
        last_score_source_n                                                     = last_score_source;
        for (i=0;i<`HAP_MAX_LENGTH;i=i+1) row_highest_scores_n[i]               = row_highest_scores [i];
        for (i=0;i<`HAP_MAX_LENGTH;i=i+1) row_highest_columns_n[i]              = row_highest_columns[i];
        for (i=0;i<`HAP_MAX_LENGTH;i=i+1) row_highest_sources_n[i]              = row_highest_sources[i];
        the_top_PE_align_score_d_n                                              = the_top_PE_align_score_d;
        the_top_PE_insert_score_d_n                                             = the_top_PE_insert_score_d;
        the_top_PE_delete_score_d_n                                             = the_top_PE_delete_score_d;
        the_top_PE_align_score_dd_n                                             = the_top_PE_align_score_dd;
        the_top_PE_insert_score_dd_n                                            = the_top_PE_insert_score_dd;
        the_top_PE_delete_score_dd_n                                            = the_top_PE_delete_score_dd;
        for (i=0;i<`HAP_MAX_LENGTH;i=i+1) PE_align_score_d_n  [i]               = PE_align_score_d [i];
        for (i=0;i<`HAP_MAX_LENGTH;i=i+1) PE_insert_score_d_n [i]               = PE_insert_score_d [i];
        for (i=0;i<`HAP_MAX_LENGTH;i=i+1) PE_delete_score_d_n [i]               = PE_delete_score_d [i];
        for (i=0;i<`HAP_MAX_LENGTH;i=i+1) PE_align_score_dd_n [i]               = PE_align_score_dd [i];
        for (i=0;i<`HAP_MAX_LENGTH;i=i+1) PE_insert_score_dd_n[i]               = PE_insert_score_dd [i];
        for (i=0;i<`HAP_MAX_LENGTH;i=i+1) PE_delete_score_dd_n[i]               = PE_delete_score_dd [i];
        sram_Q_valid_counter_n                                                  = sram_Q_valid_counter;
        var_length_n                                                            = var_length;
        REF_buffer_n                                                            = REF_buffer;
        ALT_buffer_n                                                            = ALT_buffer;
        current_var_n                                                           = current_var;
        //////////////////////////////////////////// sram control /////////////////////////////////////////////
        align_source_sram_WEN   = 0;
        align_source_sram_ADDR  = 0;
        insert_source_sram_WEN  = 0;
        insert_source_sram_ADDR = 0;
        delete_source_sram_WEN  = 0;
        delete_source_sram_ADDR = 0;
        //////////////////////////////////////////// output ports ////////////////////////////////////////////
        o_ready                 = 0;
        o_var_haplotype_ID      = var_haplotype_ID;
        
        o_valid_n               = 0;
        o_done_n                = 0;
        o_var_local_location_n  = 0;
        o_var_type_n            = 0;
        o_var_REF_n             = 0;
        o_var_ALT_n             = 0;
        o_var_length_n          = 0;

        case(state)
            S_idle: begin
                // registers
                sequence_A_n                            = (i_valid) ? i_sequence_A :  0;
                sequence_B_n                            = (i_valid) ? i_sequence_B :  0;
                seq_A_length_n                          = (i_valid) ? i_seq_A_length :  0;
                seq_B_length_n                          = (i_valid) ? i_seq_B_length :  0;
                var_haplotype_ID_n                      = (i_valid) ? i_var_haplotype_ID :  0;
                counter_n                                                       = 0;
                for (i=0;i<`REF_MAX_LENGTH;i=i+1) sequence_A_valid_n[i]         = 0;
                for (i=0;i<`HAP_MAX_LENGTH;i=i+1) sequence_B_valid_n[i]         = 0;
                // for (i=0;i<`REF_MAX_LENGTH;i=i+1) sequence_A_valid_shifter_n[i] = 0;
                sequence_A_shifter_n                                            = 0;
                highest_score_n                                                 = MOST_NEGATIVE;
                column_n                                                        = 0;
                row_n                                                           = 0;
                the_score_source_n                                              = 0;
                last_score_source_n                                             = 0;
                for (i=0;i<`HAP_MAX_LENGTH;i=i+1) row_highest_scores_n[i]       = 0;
                for (i=0;i<`HAP_MAX_LENGTH;i=i+1) row_highest_columns_n[i]      = 0;
                for (i=0;i<`HAP_MAX_LENGTH;i=i+1) row_highest_sources_n[i]      = 0;
                the_top_PE_align_score_d_n                                      = 0;
                the_top_PE_insert_score_d_n                                     = 0;
                the_top_PE_delete_score_d_n                                     = 0;
                the_top_PE_align_score_dd_n                                     = 0;
                the_top_PE_insert_score_dd_n                                    = 0;
                the_top_PE_delete_score_dd_n                                    = 0;
                for (i=0;i<`HAP_MAX_LENGTH;i=i+1) PE_align_score_d_n  [i]       = 0;
                for (i=0;i<`HAP_MAX_LENGTH;i=i+1) PE_insert_score_d_n [i]       = 0;
                for (i=0;i<`HAP_MAX_LENGTH;i=i+1) PE_delete_score_d_n [i]       = 0;
                for (i=0;i<`HAP_MAX_LENGTH;i=i+1) PE_align_score_dd_n [i]       = 0;
                for (i=0;i<`HAP_MAX_LENGTH;i=i+1) PE_insert_score_dd_n[i]       = 0;
                for (i=0;i<`HAP_MAX_LENGTH;i=i+1) PE_delete_score_dd_n[i]       = 0;
                sram_Q_valid_counter_n                                          = 0;
                var_length_n                                                    = 0;
                REF_buffer_n                                                    = 0;
                ALT_buffer_n                                                    = 0;
                current_var_n                                                   = 0;

                
                // output ports 
                o_ready = 1;
            end

            S_input: begin
                sequence_A_shifter_n                                            = sequence_A;
                for (i=0;i<`REF_MAX_LENGTH;i=i+1) sequence_A_valid_n[i]         = (i < seq_A_length) ? 1 : 0;
                for (i=0;i<`HAP_MAX_LENGTH;i=i+1) sequence_B_valid_n[i]         = (i < seq_B_length) ? 1 : 0;
                // for (i=0;i<`REF_MAX_LENGTH;i=i+1) sequence_A_valid_shifter_n[i] = (i < seq_A_length) ? 1 : 0;
            end

            S_calculate:
            begin
                counter_n = (counter == seq_A_length + seq_B_length - 1) ? 0 : counter + 1;

                // sequence A shifting control 
                sequence_A_shifter_n = sequence_A_shifter << 2;
                // sequence_A_valid_shifter_n[`REF_MAX_LENGTH-1] = 0;
                // for (i=0;i<`REF_MAX_LENGTH-1;i=i+1) sequence_A_valid_shifter_n[i]  = sequence_A_valid_shifter_n[i+1];
                
                ///////////////////////////// PE array input scores conrtol ///////////////////////////
                for (i=0;i<`HAP_MAX_LENGTH;i=i+1) PE_align_score_d_n  [i]        = PE_align_score   [i];
                for (i=0;i<`HAP_MAX_LENGTH;i=i+1) PE_insert_score_d_n [i]        = PE_insert_score  [i];
                for (i=0;i<`HAP_MAX_LENGTH;i=i+1) PE_delete_score_d_n [i]        = PE_delete_score  [i];
                for (i=0;i<`HAP_MAX_LENGTH;i=i+1) PE_align_score_dd_n [i]        = PE_align_score_d [i];
                for (i=0;i<`HAP_MAX_LENGTH;i=i+1) PE_insert_score_dd_n[i]        = PE_insert_score_d[i];
                for (i=0;i<`HAP_MAX_LENGTH;i=i+1) PE_delete_score_dd_n[i]        = PE_delete_score_d[i];

                
                // highest score conrtol
                for (i=0;i<`HAP_MAX_LENGTH;i=i+1) begin
                    if ( PE_score_buff[i] > row_highest_scores[i] ) begin
                        row_highest_scores_n[i]   = PE_score_buff[i];
                        row_highest_columns_n[i]  = counter - i - 1;
                        row_highest_sources_n[i]  = PE_source_buff[i];
                    end
                end
                
                ///////////// sram control //////////////
                align_source_sram_WEN   = counter < (seq_A_length + seq_B_length - 1);
                insert_source_sram_WEN  = counter < (seq_A_length + seq_B_length - 1);
                delete_source_sram_WEN  = counter < (seq_A_length + seq_B_length - 1);
                align_source_sram_ADDR  = counter;
                insert_source_sram_ADDR = counter;
                delete_source_sram_ADDR = counter;
            end


            S_select_highest: begin
                counter_n = (counter == seq_B_length - 1) ? 0 : counter + 1;

                for (i=0;i<`HAP_MAX_LENGTH-1;i=i+1) begin
                    row_highest_scores_n[i]   = row_highest_scores[i+1] ;
                    row_highest_columns_n[i]  = row_highest_columns[i+1];
                    row_highest_sources_n[i]  = row_highest_sources[i+1];
                end
                row_highest_scores_n [`HAP_MAX_LENGTH-1]  = 0;
                row_highest_columns_n[`HAP_MAX_LENGTH-1]  = 0;
                row_highest_sources_n[`HAP_MAX_LENGTH-1]  = 0;

                if (row_highest_scores[0] > highest_score) begin
                    highest_score_n = row_highest_scores[0];
                    column_n            = row_highest_columns[0];
                    row_n               = counter;
                    the_score_source_n  = row_highest_sources[0];
                end

            end

            S_backtrace_and_output:
            begin
                align_source_sram_ADDR  = row + column;
                insert_source_sram_ADDR = row + column;
                delete_source_sram_ADDR = row + column;

                if (i_ready) begin
                    sram_Q_valid_counter_n = (sram_Q_valid_counter==2) ? 0 : sram_Q_valid_counter + 1;
                    
                    if (sram_Q_valid) begin
                        
                        the_score_source_n = the_query_source;
                        last_score_source_n = the_score_source;

                        row_n       = row - (the_score_source==1 | the_score_source==2);
                        column_n    = column - (the_score_source==3 | the_score_source==2);
                        
                        ALT_buffer_n = ((the_score_source==1 | INSERTION_normalizable) && (var_length<`MAX_ALLELE_LENGTH-1)) ? {the_chosen_B_base, ALT_buffer[(2*`MAX_ALLELE_LENGTH-1)-:(2*`MAX_ALLELE_LENGTH-2)]} : ALT_buffer;
                        REF_buffer_n = ((the_score_source==3 | DELETION_normalizable)  && (var_length<`MAX_ALLELE_LENGTH-1)) ? {the_chosen_A_base, REF_buffer[(2*`MAX_ALLELE_LENGTH-1)-:(2*`MAX_ALLELE_LENGTH-2)]} : REF_buffer;
                        

                        o_valid_n  = (the_score_source == 2) && (base_pair_mismatch | INSERTION_determination | DELETION_determination);
                        

                        if (o_valid_n) var_length_n = 0;
                        else  var_length_n =  (var_length < `MAX_ALLELE_LENGTH-1) ? var_length + (the_score_source==1 | the_score_source==3) : var_length;

                        current_var_n = current_var;
                        if (o_valid_n) current_var_n = 0;
                        else begin
                            case(the_score_source)
                            1: current_var_n = 1;
                            3: current_var_n = 3;
                            endcase
                        end
                        
                        if (o_valid_n) begin
                            o_var_local_location_n  = column;
                            o_var_type_n            = (the_score_source==2 & base_pair_mismatch & ~|current_var) ? 2 : current_var;
                            o_var_REF_n             = {the_chosen_A_base, REF_buffer[2*`MAX_ALLELE_LENGTH-1-:(2*(`MAX_ALLELE_LENGTH-1))]};
                            o_var_ALT_n             = {the_chosen_B_base, ALT_buffer[2*`MAX_ALLELE_LENGTH-1-:(2*(`MAX_ALLELE_LENGTH-1))]};
                            o_var_length_n          = var_length + 1;
                        end
                            
                    end
                end
            end

            S_done: begin
                o_valid_n = 1;
                o_done_n = 1;
            end
        endcase
    end

    /////////////////////////////// main ////////////////////////////
    always@(posedge clk) begin
        if (!rst_n) begin
            state                      <= S_idle;
            counter                    <= 0;
            sequence_A                 <= 0;
            sequence_B                 <= 0;
            seq_A_length               <= 0;
            seq_B_length               <= 0;
            for (i=0;i<`REF_MAX_LENGTH;i=i+1) sequence_A_valid[i] <= 0;
            for (i=0;i<`HAP_MAX_LENGTH;i=i+1) sequence_B_valid[i] <= 0;
            sequence_A_shifter         <= 0;
            var_haplotype_ID           <= 0;
            highest_score              <= MOST_NEGATIVE;
            column                     <= 0;
            row                        <= 0;
            the_score_source           <= 0;
            last_score_source          <= 0;
            for (i=0;i<`HAP_MAX_LENGTH;i=i+1) row_highest_scores[i]  <= 0;
            for (i=0;i<`HAP_MAX_LENGTH;i=i+1) row_highest_columns[i] <= 0;
            for (i=0;i<`HAP_MAX_LENGTH;i=i+1) row_highest_sources[i] <= 0; 
            the_top_PE_align_score_d   <= 0;
            the_top_PE_insert_score_d  <= 0;
            the_top_PE_delete_score_d  <= 0;
            the_top_PE_align_score_dd  <= 0;
            the_top_PE_insert_score_dd <= 0;
            the_top_PE_delete_score_dd <= 0;
            for (i=0;i<`HAP_MAX_LENGTH;i=i+1) PE_score_buff[i] <= 0;
            for (i=0;i<`HAP_MAX_LENGTH;i=i+1) PE_align_score_d  [i] <= 0;
            for (i=0;i<`HAP_MAX_LENGTH;i=i+1) PE_insert_score_d [i] <= 0;
            for (i=0;i<`HAP_MAX_LENGTH;i=i+1) PE_delete_score_d [i] <= 0;
            for (i=0;i<`HAP_MAX_LENGTH;i=i+1) PE_align_score_dd [i] <= 0;
            for (i=0;i<`HAP_MAX_LENGTH;i=i+1) PE_insert_score_dd[i] <= 0;
            for (i=0;i<`HAP_MAX_LENGTH;i=i+1) PE_delete_score_dd[i] <= 0;

            for (i=0;i<`HAP_MAX_LENGTH;i=i+1) PE_source_buff[i] <= 0;

            sram_Q_valid_counter <= 0;
            var_length <= 0;
            REF_buffer <= 0;
            ALT_buffer <= 0;
            current_var <= 0;

            o_valid               <= 0;
            o_done                <= 0;
            o_var_local_location  <= 0;
            o_var_type            <= 0;
            o_var_REF             <= 0;
            o_var_ALT             <= 0;
            o_var_length          <= 0;
        end else begin
            state                      <= state_n;
            counter                    <= counter_n;
            sequence_A                 <= sequence_A_n;
            sequence_B                 <= sequence_B_n;
            seq_A_length               <= seq_A_length_n;
            seq_B_length               <= seq_B_length_n;
            for (i=0;i<`REF_MAX_LENGTH;i=i+1) sequence_A_valid[i] <= sequence_A_valid_n[i];
            for (i=0;i<`HAP_MAX_LENGTH;i=i+1) sequence_B_valid[i] <= sequence_B_valid_n[i];
            sequence_A_shifter         <= sequence_A_shifter_n;
            var_haplotype_ID           <= var_haplotype_ID_n;
            highest_score              <= highest_score_n;
            column                     <= column_n;
            row                        <= row_n;
            the_score_source           <= the_score_source_n;
            last_score_source          <= last_score_source_n;
            for (i=0;i<`HAP_MAX_LENGTH;i=i+1) row_highest_scores[i]  <= row_highest_scores_n [i];
            for (i=0;i<`HAP_MAX_LENGTH;i=i+1) row_highest_columns[i] <= row_highest_columns_n[i];
            for (i=0;i<`HAP_MAX_LENGTH;i=i+1) row_highest_sources[i] <= row_highest_sources_n[i];
            the_top_PE_align_score_d   <= the_top_PE_align_score_d_n;
            the_top_PE_insert_score_d  <= the_top_PE_insert_score_d_n;
            the_top_PE_delete_score_d  <= the_top_PE_delete_score_d_n;
            the_top_PE_align_score_dd  <= the_top_PE_align_score_dd_n;
            the_top_PE_insert_score_dd <= the_top_PE_insert_score_dd_n;
            the_top_PE_delete_score_dd <= the_top_PE_delete_score_dd_n;
            for (i=0;i<`HAP_MAX_LENGTH;i=i+1) PE_score_buff[i] <= PE_score_buff_n[i];
            for (i=0;i<`HAP_MAX_LENGTH;i=i+1) PE_align_score_d  [i] <= PE_align_score_d_n   [i];
            for (i=0;i<`HAP_MAX_LENGTH;i=i+1) PE_insert_score_d [i] <= PE_insert_score_d_n  [i];
            for (i=0;i<`HAP_MAX_LENGTH;i=i+1) PE_delete_score_d [i] <= PE_delete_score_d_n  [i];
            for (i=0;i<`HAP_MAX_LENGTH;i=i+1) PE_align_score_dd [i] <= PE_align_score_dd_n  [i];
            for (i=0;i<`HAP_MAX_LENGTH;i=i+1) PE_insert_score_dd[i] <= PE_insert_score_dd_n [i];
            for (i=0;i<`HAP_MAX_LENGTH;i=i+1) PE_delete_score_dd[i] <= PE_delete_score_dd_n [i];

            for (i=0;i<`HAP_MAX_LENGTH;i=i+1) PE_source_buff[i] <= PE_source_buff_n[i];
            
            sram_Q_valid_counter <= sram_Q_valid_counter_n;
            var_length <= var_length_n;
            REF_buffer <= REF_buffer_n;
            ALT_buffer <= ALT_buffer_n;
            current_var <= current_var_n;

            o_valid                 <=  o_valid_n;
            o_done                  <=  o_done_n;
            o_var_local_location    <=  o_var_local_location_n;
            o_var_type              <=  o_var_type_n;
            o_var_REF               <=  o_var_REF_n;
            o_var_ALT               <=  o_var_ALT_n;
            o_var_length            <=  o_var_length_n;
        end
    end

endmodule

module DP_var_PE_single(
    ///////////////////////////////////// basics /////////////////////////////////////
    input                                   clk,
    input                                   rst_n,


    ///////////////////////////////////// I/Os //////////////////////////////////////
    input                                   i_A_base_valid,
    input                                   i_B_base_valid,
    input [1:0]                             i_A_base,          // reference one.   Mapping: reference sequence
    input [1:0]                             i_B_base,          // query one.       Mapping: short-read

    input signed [`DP_SW_SCORE_BITWIDTH-1:0]   i_align_top_score,
    input signed [`DP_SW_SCORE_BITWIDTH-1:0]   i_align_diagonal_score,
    input signed [`DP_SW_SCORE_BITWIDTH-1:0]   i_align_left_score,
    input signed [`DP_SW_SCORE_BITWIDTH-1:0]   i_insert_top_score,
    input signed [`DP_SW_SCORE_BITWIDTH-1:0]   i_insert_diagonal_score,
    input signed [`DP_SW_SCORE_BITWIDTH-1:0]   i_insert_left_score,
    input signed [`DP_SW_SCORE_BITWIDTH-1:0]   i_delete_diagonal_score,
    input signed [`DP_SW_SCORE_BITWIDTH-1:0]   i_delete_left_score,

    output signed [`DP_SW_SCORE_BITWIDTH-1:0]  o_align_score,
    output signed [`DP_SW_SCORE_BITWIDTH-1:0]  o_insert_score,
    output signed [`DP_SW_SCORE_BITWIDTH-1:0]  o_delete_score,
    output [1:0]                            o_align_score_source,
    output [1:0]                            o_insert_score_source,
    output [1:0]                            o_delete_score_source,
    output [1:0]                            o_the_score_source,
    output signed [`DP_SW_SCORE_BITWIDTH-1:0]  o_the_score,

    output reg                              o_last_A_base_valid,
    output reg [1:0]                        o_last_A_base
);






always@(posedge clk) begin
    if (!rst_n) begin
        o_last_A_base_valid <= 0;
        o_last_A_base       <= 0;
    end else begin
        o_last_A_base_valid <= i_A_base_valid;
        o_last_A_base       <= i_A_base;
    end
end


DP_var_ALU u_ALU(
    ///////////////////////////////////// I/Os //////////////////////////////////////
    .i_A_base_valid                 (i_A_base_valid),
    .i_B_base_valid                 (i_B_base_valid),
    .i_A_base                       (i_A_base),
    .i_B_base                       (i_B_base),
    .i_align_top_score              (i_align_top_score),
    .i_align_diagonal_score         (i_align_diagonal_score),
    .i_align_left_score             (i_align_left_score),
    .i_insert_top_score             (i_insert_top_score),
    .i_insert_diagonal_score        (i_insert_diagonal_score),
    .i_insert_left_score            (i_insert_left_score),
    .i_delete_diagonal_score        (i_delete_diagonal_score),
    .i_delete_left_score            (i_delete_left_score),
    .o_align_score                  (o_align_score),
    .o_insert_score                 (o_insert_score),
    .o_delete_score                 (o_delete_score),
    .o_align_score_source           (o_align_score_source),
    .o_insert_score_source          (o_insert_score_source),
    .o_delete_score_source          (o_delete_score_source),
    .o_the_score_source             (o_the_score_source),
    .o_the_score                    (o_the_score)
);

endmodule

module DP_var_Top(
    /////////////////////////////////////// Basics /////////////////////////////////////
    input                                       clk,
    input                                       rst_n,
    
    ////////////////////////////////////// Variant Calling I/Os ////////////////////////////////////// 
    output                                      o_var_ready,
    input                                       i_var_valid,
    input [2*`REF_MAX_LENGTH-1:0]               i_var_sequence_A,       // reference one.   Variant Calling: reference sequence 
    input [2*`HAP_MAX_LENGTH-1:0]               i_var_sequence_B,       // query one.       Variant Calling: haplotype
    input [$clog2(`REF_MAX_LENGTH):0]           i_var_seq_A_length,     // 0~512 (1-based)
    input [$clog2(`HAP_MAX_LENGTH):0]           i_var_seq_B_length,     // 0~512 (1-based)
    input [$clog2(`MAX_HAPLOTYPE_AMOUNT)-1:0]   i_var_haplotype_ID,     // only Variant Calling
    
    input                                       i_var_ready,
    output                                      o_var_valid,
    output                                      o_var_done,
    output signed [`DP_SW_SCORE_BITWIDTH-1:0]   o_var_alignment_score,  // Variant Calling: SW score
    output [$clog2(`REF_MAX_LENGTH)-1:0]        o_var_local_location,   // only Variant Calling
    output [1:0]                                o_var_type,             // only Variant Calling
    output [2*`MAX_ALLELE_LENGTH-1:0]           o_var_REF,              // only Variant Calling
    output [2*`MAX_ALLELE_LENGTH-1:0]           o_var_ALT,              // only Variant Calling
    output [$clog2(`MAX_ALLELE_LENGTH):0]       o_var_length,           // only Variant Calling (1-based)
    output [$clog2(`MAX_HAPLOTYPE_AMOUNT)-1:0]  o_var_haplotype_ID      // only Variant Calling
   
   
);
    integer i, j, k;
    genvar gv;













    DP_var_Array_single u_DP_Array_single(
        /////////////////////////////////////// Basics /////////////////////////////////////
        .clk                        (clk   ),
        .rst_n                      (rst_n ),
        
        ///////////////////////////////////// Constant Parameters //////////////////////////////////
        // .CONST_MATCH_SCORE          (CONST_MATCH_SCORE      ),
        // .CONST_MISMATCH_SCORE       (CONST_MISMATCH_SCORE   ),
        // .CONST_GAP_OPEN             (CONST_GAP_OPEN         ),
        // .CONST_GAP_EXTEND           (CONST_GAP_EXTEND       ),
    
        ////////////////////////////////////// Mapping I/Os ////////////////////////////////////// 
        .o_ready                    (o_var_ready            ),
        .i_valid                    (i_var_valid            ),
        .i_sequence_A               (i_var_sequence_A       ),    // reference one.   Mapping: reference sequence
        .i_sequence_B               (i_var_sequence_B       ),    // query one.       Mapping: short-read
        .i_seq_A_length             (i_var_seq_A_length     ),    // 0~512 (1-based)
        .i_seq_B_length             (i_var_seq_B_length     ),    // 0~512 (1-based)
        .i_var_haplotype_ID         (i_var_haplotype_ID     ),    // only Variant Calling
        // ----------------------------------------------------------------------
        .i_ready                    (i_var_ready            ),
        .o_valid                    (o_var_valid            ),
        .o_alignment_score          (o_var_alignment_score  ),    // Mapping: SW score
        .o_done                     (o_var_done             ),    //
        .o_var_local_location       (o_var_local_location   ),    // only Variant Calling
        .o_var_type                 (o_var_type             ),    // only Variant Calling
        .o_var_REF                  (o_var_REF              ),    // only Variant Calling
        .o_var_ALT                  (o_var_ALT              ),    // only Variant Calling
        .o_var_length               (o_var_length           ),    // only Variant Calling (1-based)
        .o_var_haplotype_ID         (o_var_haplotype_ID     )    // only Variant Calling
    );    

endmodule


module Change_2_fpt (
    input					                        clk,
    input					                        rst_n,
    input                                           manual_rst_n,

    // input channel
    output                                          int2fpt_ready,
	input					                        start_change_2_fpt,
    input  signed [`DP_PAIRHMM_SCORE_BITWIDTH:0]    input_likelihood,

    // output channel
    input                                           ready_for_fpt,
    output                                          change_2_fpt_done,
	output signed [31:0]	                        likelihood_fpt
);

	parameter IDLE				= 3'd0;
	parameter LOOK_8_BIT    	= 3'd1;
	parameter LOOK_4_BIT        = 3'd2;
    parameter LOOK_2_BIT        = 3'd3;
	parameter SHIFTED       	= 3'd4;
    parameter DONE              = 3'd5;

    reg [2:0]   state, state_n;

    reg		    sign_part, sign_part_n;
	reg [7:0]	exp_part, exp_part_n;
	reg [22:0]	mat_part, mat_part_n;

    reg         change_2_fpt_done_n;

    wire [`DP_PAIRHMM_SCORE_BITWIDTH:0] abs_input_likelihood;
	wire [`DP_PAIRHMM_SCORE_BITWIDTH:0] pos_input_likelihood;

	assign pos_input_likelihood = (-input_likelihood);
	assign abs_input_likelihood = input_likelihood[16] ? pos_input_likelihood : input_likelihood;
    
    // Output
    assign likelihood_fpt = {sign_part, exp_part, mat_part};
    assign int2fpt_ready = (state == IDLE);
    assign change_2_fpt_done = (state == DONE);

    always@(*) begin
        sign_part_n         = sign_part;
        exp_part_n          = exp_part;
        mat_part_n          = mat_part;
        state_n				= state;


        if (!manual_rst_n) begin
            sign_part_n         = 0;
            exp_part_n          = 0;
            mat_part_n          = 0;
            state_n				= IDLE;
        end else begin
            case(state)
                IDLE: begin // 0
                    if (start_change_2_fpt) begin
                        sign_part_n = input_likelihood[16];
                        exp_part_n = 8'd133;    // 127+6
                        mat_part_n = {abs_input_likelihood[15:0], 7'd0};
                        state_n = LOOK_8_BIT;
                    end
                end

                LOOK_8_BIT: begin // 1
                    if (mat_part [22:15] == 0) begin
                        exp_part_n = exp_part - 8;
                        mat_part_n = mat_part << 8;
                    end
                    state_n = LOOK_4_BIT;
                end

                LOOK_4_BIT: begin // 2
                    if (mat_part [22:19] == 0) begin
                        exp_part_n = exp_part - 4;
                        mat_part_n = mat_part << 4;
                    end
                    state_n = LOOK_2_BIT;
                end

                LOOK_2_BIT: begin // 3
                    if (mat_part [22:21] == 0) begin
                        exp_part_n = exp_part - 2;
                        mat_part_n = mat_part << 2;
                    end
                    state_n = SHIFTED;
                end

                SHIFTED: begin // 4
                    if (mat_part[22]) begin // 10 or 11
                        exp_part_n = exp_part - 1;
                        mat_part_n = mat_part << 1;
                    end else begin // 01
                        exp_part_n = exp_part - 2;
                        mat_part_n = mat_part << 2;
                    end

                    state_n = DONE;
                end

                DONE: begin
                    state_n = (ready_for_fpt) ? IDLE : state;
                end
            endcase
        end
        
    end

	always@(posedge clk) begin
		if (!rst_n) begin
            state               <= IDLE;
            sign_part           <= 1'b0;
            exp_part            <= 8'd0;
            mat_part            <= 23'd0;
        end else begin
            state               <= state_n;
            sign_part           <= sign_part_n;
            exp_part            <= exp_part_n;
            mat_part            <= mat_part_n;
		end
	end
endmodule
//----------------
// NTU DCS: updated by YenLung (20201012)
//----------------
module Find_max_likelihood (
// basic IOs
    input                       clk,
    input                       rst_n,
    input                       manual_rst_n,

    // global constant
    
    // input signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0]   CONST_min_max_likelihood,
    
    // local constant
    input [`MAX_HAPLOTYPE_AMOUNT-1:0]               haplotype_amount_in_region_1hot,
                /* new 20201011 */
    input  [$clog2(`MAX_VAR_AMOUNT):0]              event_amount_in_region,
    input  [`VAR_BEGIN-1:0]                         event_begin_0,
    input  [`VAR_BEGIN-1:0]                         event_begin_1,
    input  [`VAR_BEGIN-1:0]                         event_begin_2,
    input  [`VAR_BEGIN-1:0]                         event_begin_3,
    input  [`VAR_BEGIN-1:0]                         event_begin_4,
    input  [`VAR_BEGIN-1:0]                         event_begin_5,
    input  [`VAR_BEGIN-1:0]                         event_begin_6,
    input  [`VAR_BEGIN-1:0]                         event_begin_7,
    input  [2*`MAX_VAR_AMOUNT-1:0]                  event_var2hot_0,
    input  [2*`MAX_VAR_AMOUNT-1:0]                  event_var2hot_1,
    input  [2*`MAX_VAR_AMOUNT-1:0]                  event_var2hot_2,
    input  [2*`MAX_VAR_AMOUNT-1:0]                  event_var2hot_3,
    input  [2*`MAX_VAR_AMOUNT-1:0]                  event_var2hot_4,
    input  [2*`MAX_VAR_AMOUNT-1:0]                  event_var2hot_5,
    input  [2*`MAX_VAR_AMOUNT-1:0]                  event_var2hot_6,
    input  [2*`MAX_VAR_AMOUNT-1:0]                  event_var2hot_7,
    input  [`MAX_HAPLOTYPE_AMOUNT-1:0]              unsorted_var_hap1hot_0,
    input  [`MAX_HAPLOTYPE_AMOUNT-1:0]              unsorted_var_hap1hot_1,
    input  [`MAX_HAPLOTYPE_AMOUNT-1:0]              unsorted_var_hap1hot_2,
    input  [`MAX_HAPLOTYPE_AMOUNT-1:0]              unsorted_var_hap1hot_3,
    input  [`MAX_HAPLOTYPE_AMOUNT-1:0]              unsorted_var_hap1hot_4,
    input  [`MAX_HAPLOTYPE_AMOUNT-1:0]              unsorted_var_hap1hot_5,
    input  [`MAX_HAPLOTYPE_AMOUNT-1:0]              unsorted_var_hap1hot_6,
    input  [`MAX_HAPLOTYPE_AMOUNT-1:0]              unsorted_var_hap1hot_7,




// input data valid control
    output reg                                      o_find_max_idle,
    input                                           i_region_valid,

    output  reg                                     o_find_max_busy,
    output  reg                                     o_find_max_ready,
    input                                           i_rx_one_read_done,
    input                                           i_rx_invalid_read,
    input signed [`DP_PAIRHMM_SCORE_BITWIDTH:0]     i_cap_log_likelihood,
    
    input                                           i_rx_region_done,

// Accsess VAR_SRAM
    input [`VAR_SRAM_BIT_PER_WORD-1:0]              Q_VAR_SRAM,
    output reg [$clog2(`VAR_SRAM_WORD_AMOUNT)-1:0]  A_VAR_SRAM,

// Access GEN_SRAM
    input [`GENO_SRAM_BIT_PER_WORD-1:0]             Q_GEN_SRAM, // likelihoods
    output reg [$clog2(`GENO_SRAM_WORD_AMOUNT)-1:0] A_GEN_SRAM,

// from Cal_PL
    input                                           i_PL_ready,
    output reg                                      o_event_row_likelihood_valid,
    output reg [2:0]                                o_event_ID,
    output reg [`VAR_BEGIN-1:0]                     o_event_begin,
    output reg [15:0]                               o_event_variant_2hot,
    output reg [ 7:0]                               o_event_variant_1hot,
    output reg                                      o_event_star_flag,
    output reg [`DP_PAIRHMM_SCORE_BITWIDTH:0]       o_ref_log_likelihood,
    output reg [`DP_PAIRHMM_SCORE_BITWIDTH:0]       o_alt_0_log_likelihood,
    output reg [`DP_PAIRHMM_SCORE_BITWIDTH:0]       o_alt_1_log_likelihood,
    output reg [`DP_PAIRHMM_SCORE_BITWIDTH:0]       o_alt_2_log_likelihood,
    output reg [`DP_PAIRHMM_SCORE_BITWIDTH:0]       o_alt_3_log_likelihood,
    output reg [`DP_PAIRHMM_SCORE_BITWIDTH:0]       o_alt_4_log_likelihood,
    output reg [`DP_PAIRHMM_SCORE_BITWIDTH:0]       o_alt_5_log_likelihood,
    output reg [`DP_PAIRHMM_SCORE_BITWIDTH:0]       o_alt_6_log_likelihood,
    output reg [`DP_PAIRHMM_SCORE_BITWIDTH:0]       o_alt_7_log_likelihood,
    output reg [`DP_PAIRHMM_SCORE_BITWIDTH:0]       o_star_log_likelihood,

    output reg                                      o_find_max_region_done,
    input                                           i_PL_region_done,


    output reg [4:0]   state
);
    integer i;

    // constant wire
    wire signed [`DP_PAIRHMM_SCORE_BITWIDTH:0] MINIMUM_LOG_LIKELIHOOD = {1'b1, {(`DP_PAIRHMM_SCORE_BITWIDTH){1'b0}}};


    // Finite State Machine
    localparam  S_IDLE                      = 5'd0,
                S_WAIT_NEXT_ROW             = 5'd1,
                S_LOAD_EVENT                = 5'd2,
                S_LOAD_VARIANT              = 5'd3,
            // alternative haplotype likelihoods selection
                S_READ_VAR_SRAM             = 5'd4,
                S_SELECT_HAP                = 5'd5,
                S_EXCLUDE_HAPS              = 5'd6,
                S_LOAD_HAP_ID               = 5'd7,
                S_READ_LIKELIHOOD_SRAM      = 5'd8,
                S_COMPARE                   = 5'd10,
            // reference haplotype likelihoods selection
                S_LOAD_REF_HAP_ID           = 5'd11,
                S_READ_REF_LIKELIHOOD_SRAM  = 5'd12,
                S_COMPARE_REF               = 5'd14,
            // likelihoods filtering
                S_CHECK_THRESHOLD           = 5'd15,
                S_CHECK_CAP                 = 5'd16,
                S_OUTPUT_2_CAL_PL           = 5'd17,
                S_REGION_DONE               = 5'd18;

    // control signals
    reg [4:0]    state_n;
    reg [1:0]   latency_count, latency_count_n;
    
    // registers
    reg [31:0]                                  read_count, read_count_n;

    reg [4:0]                                   event_ID, event_ID_n;
    reg [`VAR_BEGIN-1:0]                        event_begin, event_begin_n;

    reg [15:0]                                  fixed_variant_2hot, fixed_variant_2hot_n;
    reg [15:0]                                  variant_2hot, variant_2hot_n;
    reg                                         star_flag, star_flag_n;
    reg [3:0]                                   variant_ID, variant_ID_n;
    reg [3:0]                                   unsorted_variant_ID, unsorted_variant_ID_n;

    reg [`MAX_HAPLOTYPE_AMOUNT-1:0]             hap_1hot,       hap_1hot_n;
    reg [`MAX_HAPLOTYPE_AMOUNT-1:0]             ref_hap_1hot,   ref_hap_1hot_n;
    reg [$clog2(`MAX_HAPLOTYPE_AMOUNT):0]       hap_ID,         hap_ID_n;

    // read likelihood SRAM
    reg signed [`DP_PAIRHMM_SCORE_BITWIDTH:0] read_likelihood, read_likelihood_n;

    reg signed [`DP_PAIRHMM_SCORE_BITWIDTH:0]   cap_log_likelihood, cap_log_likelihood_n;
    reg signed [`DP_PAIRHMM_SCORE_BITWIDTH:0]   alt_log_likelihoods[0:7], alt_log_likelihoods_n[0:7];
    reg signed [`DP_PAIRHMM_SCORE_BITWIDTH:0]   star_log_likelihood, star_log_likelihood_n;
    reg signed [`DP_PAIRHMM_SCORE_BITWIDTH:0]   ref_log_likelihood, ref_log_likelihood_n;





    

    


    // Finite state machine
    always@(*) begin
        state_n = state;
        if (!manual_rst_n) state_n = S_IDLE;
        else begin
            case(state)
                S_IDLE:                     state_n = (i_region_valid) ? S_WAIT_NEXT_ROW : state;
                S_WAIT_NEXT_ROW:            state_n = (i_rx_region_done) ? S_REGION_DONE : ((i_rx_one_read_done && ~i_rx_invalid_read) ? S_LOAD_EVENT : state);
                S_LOAD_EVENT:               state_n = (event_ID == event_amount_in_region) ? S_WAIT_NEXT_ROW : S_LOAD_VARIANT;
                S_LOAD_VARIANT: begin
                    if (variant_2hot[1]) state_n = S_READ_VAR_SRAM;
                    else                 state_n = (|variant_2hot) ? state : S_LOAD_REF_HAP_ID;
                end
                S_READ_VAR_SRAM:            state_n = (latency_count == `SRAM_LATENCY) ? S_SELECT_HAP : state;
                S_SELECT_HAP:               state_n = S_EXCLUDE_HAPS;
                S_EXCLUDE_HAPS:             state_n = S_LOAD_HAP_ID;
                S_LOAD_HAP_ID: begin
                    if (hap_1hot[0]) state_n = S_READ_LIKELIHOOD_SRAM;
                    else             state_n = (|hap_1hot) ? state : S_LOAD_VARIANT;
                end
                S_READ_LIKELIHOOD_SRAM:     state_n = (latency_count == `SRAM_LATENCY) ? S_COMPARE : state;
                S_COMPARE:                  state_n = S_LOAD_HAP_ID;
                // reference likelihood handling
                S_LOAD_REF_HAP_ID:  begin
                    if (ref_hap_1hot[0]) state_n = S_READ_REF_LIKELIHOOD_SRAM;
                    else                 state_n = (|ref_hap_1hot) ? state : S_CHECK_CAP; //S_CHECK_THRESHOLD;
                end
                S_READ_REF_LIKELIHOOD_SRAM: state_n = (latency_count == `SRAM_LATENCY) ? S_COMPARE_REF : state;
                S_COMPARE_REF:              state_n = S_LOAD_REF_HAP_ID;
                // likelihoods filtering
                // S_CHECK_THRESHOLD:          state_n = (max_likelihood_smaller_than_threshold) ? S_WAIT_NEXT_ROW : S_CHECK_CAP;
                S_CHECK_CAP:                state_n = S_OUTPUT_2_CAL_PL;
                S_OUTPUT_2_CAL_PL:          state_n = (i_PL_ready) ? S_LOAD_EVENT : state;
                S_REGION_DONE:              state_n = (i_PL_region_done) ? S_IDLE : state;
            endcase
        end
    end

    // registers control
    always@(*) begin


        latency_count_n = latency_count;
        if (!manual_rst_n || state == S_IDLE) latency_count_n = 0;
        else if (state == S_READ_VAR_SRAM || state == S_READ_LIKELIHOOD_SRAM || state == S_READ_REF_LIKELIHOOD_SRAM) latency_count_n = (latency_count == `SRAM_LATENCY) ? 0 : latency_count + 1;


        read_count_n = read_count;
        if (!manual_rst_n || state == S_IDLE || state == S_REGION_DONE) read_count_n = 0;
        else if (state == S_WAIT_NEXT_ROW && i_rx_invalid_read) read_count_n = read_count + 1;
        else if (state == S_LOAD_EVENT && event_ID == event_amount_in_region) read_count_n = read_count + 1;



        event_ID_n = event_ID;
        if (!manual_rst_n || state == S_IDLE || state == S_REGION_DONE) event_ID_n = 0;
        else if (state == S_OUTPUT_2_CAL_PL && i_PL_ready) event_ID_n = event_ID + 1;
        else if (state == S_LOAD_EVENT && event_ID == event_amount_in_region) event_ID_n = 0;


        
        fixed_variant_2hot_n = fixed_variant_2hot;
        event_begin_n = event_begin;
        if (!manual_rst_n || state == S_IDLE || state == S_WAIT_NEXT_ROW) begin
            fixed_variant_2hot_n = 0;
            event_begin_n = 0;
        end else if (state == S_LOAD_EVENT) begin
            case (event_ID)
                0: fixed_variant_2hot_n = event_var2hot_0;
                1: fixed_variant_2hot_n = event_var2hot_1;
                2: fixed_variant_2hot_n = event_var2hot_2;
                3: fixed_variant_2hot_n = event_var2hot_3;
                4: fixed_variant_2hot_n = event_var2hot_4;
                5: fixed_variant_2hot_n = event_var2hot_5;
                6: fixed_variant_2hot_n = event_var2hot_6;
                7: fixed_variant_2hot_n = event_var2hot_7;
            endcase

            case (event_ID)
                0: event_begin_n = event_begin_0;
                1: event_begin_n = event_begin_1;
                2: event_begin_n = event_begin_2;
                3: event_begin_n = event_begin_3;
                4: event_begin_n = event_begin_4;
                5: event_begin_n = event_begin_5;
                6: event_begin_n = event_begin_6;
                7: event_begin_n = event_begin_7;
            endcase
        end



        variant_2hot_n = variant_2hot;
        if (!manual_rst_n || state == S_IDLE || state == S_WAIT_NEXT_ROW) begin
            variant_2hot_n = 0;
        end else if (state == S_LOAD_EVENT) begin
            case (event_ID)
                0: variant_2hot_n = event_var2hot_0;
                1: variant_2hot_n = event_var2hot_1;
                2: variant_2hot_n = event_var2hot_2;
                3: variant_2hot_n = event_var2hot_3;
                4: variant_2hot_n = event_var2hot_4;
                5: variant_2hot_n = event_var2hot_5;
                6: variant_2hot_n = event_var2hot_6;
                7: variant_2hot_n = event_var2hot_7;
            endcase
        end else if (state == S_LOAD_VARIANT)
            variant_2hot_n = (variant_2hot[1]) ? variant_2hot : variant_2hot >> 2;
        else if (state == S_LOAD_HAP_ID && ~|hap_1hot)
            variant_2hot_n = variant_2hot >> 2;




        star_flag_n = star_flag;
        if (!manual_rst_n || state == S_IDLE || state == S_WAIT_NEXT_ROW || state == S_LOAD_EVENT) begin
            star_flag_n = 0;
        end else if (state == S_LOAD_VARIANT) star_flag_n = star_flag | variant_2hot[0];


        variant_ID_n   = variant_ID;
        if (!manual_rst_n || state == S_IDLE || state == S_LOAD_EVENT) variant_ID_n = 0;
        else if (state == S_LOAD_VARIANT) begin
            if (~|variant_2hot) variant_ID_n = 0;
            else variant_ID_n = variant_ID + (!variant_2hot[1]);
        end 
        else if (state == S_LOAD_HAP_ID && ~|hap_1hot) variant_ID_n = variant_ID + 1;



        unsorted_variant_ID_n = unsorted_variant_ID;
        if (!manual_rst_n || state == S_IDLE || state == S_SELECT_HAP) unsorted_variant_ID_n = 0;
        else if (state == S_READ_VAR_SRAM && latency_count == `SRAM_LATENCY) unsorted_variant_ID_n =  Q_VAR_SRAM[0+:`VAR_ID];


        
        
        hap_1hot_n = hap_1hot;
        if (!manual_rst_n || state == S_IDLE) hap_1hot_n = 0;
        else if (state == S_SELECT_HAP) begin
            case(unsorted_variant_ID)
                0: hap_1hot_n = unsorted_var_hap1hot_0;
                1: hap_1hot_n = unsorted_var_hap1hot_1;
                2: hap_1hot_n = unsorted_var_hap1hot_2;
                3: hap_1hot_n = unsorted_var_hap1hot_3;
                4: hap_1hot_n = unsorted_var_hap1hot_4;
                5: hap_1hot_n = unsorted_var_hap1hot_5;
                6: hap_1hot_n = unsorted_var_hap1hot_6;
                7: hap_1hot_n = unsorted_var_hap1hot_7;
            endcase
        end 
        else if (state == S_LOAD_HAP_ID) hap_1hot_n = hap_1hot >> 1;


        
        
        hap_ID_n = hap_ID;
        if (!manual_rst_n || state == S_IDLE || state == S_LOAD_VARIANT) hap_ID_n = 0;
        else if (state == S_LOAD_HAP_ID) hap_ID_n = (hap_1hot[0]) ? hap_ID : hap_ID + 1;
        else if (state == S_LOAD_REF_HAP_ID) hap_ID_n = (ref_hap_1hot[0]) ? hap_ID : hap_ID + 1;
        else if (state == S_COMPARE || state == S_COMPARE_REF) hap_ID_n = hap_ID + 1;



        
        ref_hap_1hot_n = ref_hap_1hot;
        if (!manual_rst_n || state == S_IDLE || state == S_LOAD_EVENT) ref_hap_1hot_n = haplotype_amount_in_region_1hot;
        else if (state == S_EXCLUDE_HAPS) ref_hap_1hot_n = ref_hap_1hot & (~hap_1hot);
        else if (state == S_LOAD_REF_HAP_ID) ref_hap_1hot_n = ref_hap_1hot >> 1;



        read_likelihood_n =  read_likelihood;
        if (!manual_rst_n || state == S_IDLE || state == S_COMPARE) read_likelihood_n = 0;
        else if (state == S_READ_LIKELIHOOD_SRAM || state == S_READ_REF_LIKELIHOOD_SRAM) read_likelihood_n = $signed(Q_GEN_SRAM);

        cap_log_likelihood_n = cap_log_likelihood;
        if (!manual_rst_n || state == S_IDLE) cap_log_likelihood_n = 0;
        else if (state == S_WAIT_NEXT_ROW) cap_log_likelihood_n = (i_rx_one_read_done) ? i_cap_log_likelihood : 0;


        for (i=0;i<8;i=i+1) alt_log_likelihoods_n[i] = alt_log_likelihoods[i]; // initialized with minimum
        star_log_likelihood_n = star_log_likelihood;
        if (!manual_rst_n || state == S_IDLE || state == S_LOAD_EVENT) begin
            for (i=0;i<8;i=i+1) alt_log_likelihoods_n[i] = MINIMUM_LOG_LIKELIHOOD; // initialized with minimum
            star_log_likelihood_n = MINIMUM_LOG_LIKELIHOOD;
        end else if (state == S_COMPARE) begin
            if (variant_ID == 0 && ~variant_2hot[0]) alt_log_likelihoods_n[0] = (read_likelihood > alt_log_likelihoods[0]) ? read_likelihood : alt_log_likelihoods[0];
            if (variant_ID == 1 && ~variant_2hot[0]) alt_log_likelihoods_n[1] = (read_likelihood > alt_log_likelihoods[1]) ? read_likelihood : alt_log_likelihoods[1];
            if (variant_ID == 2 && ~variant_2hot[0]) alt_log_likelihoods_n[2] = (read_likelihood > alt_log_likelihoods[2]) ? read_likelihood : alt_log_likelihoods[2];
            if (variant_ID == 3 && ~variant_2hot[0]) alt_log_likelihoods_n[3] = (read_likelihood > alt_log_likelihoods[3]) ? read_likelihood : alt_log_likelihoods[3];
            if (variant_ID == 4 && ~variant_2hot[0]) alt_log_likelihoods_n[4] = (read_likelihood > alt_log_likelihoods[4]) ? read_likelihood : alt_log_likelihoods[4];
            if (variant_ID == 5 && ~variant_2hot[0]) alt_log_likelihoods_n[5] = (read_likelihood > alt_log_likelihoods[5]) ? read_likelihood : alt_log_likelihoods[5];
            if (variant_ID == 6 && ~variant_2hot[0]) alt_log_likelihoods_n[6] = (read_likelihood > alt_log_likelihoods[6]) ? read_likelihood : alt_log_likelihoods[6];
            if (variant_ID == 7 && ~variant_2hot[0]) alt_log_likelihoods_n[7] = (read_likelihood > alt_log_likelihoods[7]) ? read_likelihood : alt_log_likelihoods[7];

            if (variant_2hot[0]) star_log_likelihood_n = (read_likelihood > star_log_likelihood) ? read_likelihood : star_log_likelihood;
        end else if (state == S_CHECK_CAP) begin
            alt_log_likelihoods_n[0] = (alt_log_likelihoods[0] < cap_log_likelihood) ? cap_log_likelihood : alt_log_likelihoods[0];
            alt_log_likelihoods_n[1] = (alt_log_likelihoods[1] < cap_log_likelihood) ? cap_log_likelihood : alt_log_likelihoods[1];
            alt_log_likelihoods_n[2] = (alt_log_likelihoods[2] < cap_log_likelihood) ? cap_log_likelihood : alt_log_likelihoods[2];
            alt_log_likelihoods_n[3] = (alt_log_likelihoods[3] < cap_log_likelihood) ? cap_log_likelihood : alt_log_likelihoods[3];
            alt_log_likelihoods_n[4] = (alt_log_likelihoods[4] < cap_log_likelihood) ? cap_log_likelihood : alt_log_likelihoods[4];
            alt_log_likelihoods_n[5] = (alt_log_likelihoods[5] < cap_log_likelihood) ? cap_log_likelihood : alt_log_likelihoods[5];
            alt_log_likelihoods_n[6] = (alt_log_likelihoods[6] < cap_log_likelihood) ? cap_log_likelihood : alt_log_likelihoods[6];
            alt_log_likelihoods_n[7] = (alt_log_likelihoods[7] < cap_log_likelihood) ? cap_log_likelihood : alt_log_likelihoods[7];

            star_log_likelihood_n = (star_log_likelihood < cap_log_likelihood) ? cap_log_likelihood : star_log_likelihood;
        end

        
        ref_log_likelihood_n = ref_log_likelihood;
        if (!manual_rst_n || state == S_IDLE || state == S_LOAD_VARIANT) ref_log_likelihood_n = MINIMUM_LOG_LIKELIHOOD;
        else if (state == S_COMPARE_REF) ref_log_likelihood_n = (read_likelihood > ref_log_likelihood) ? read_likelihood : ref_log_likelihood;
        else if (state == S_CHECK_CAP) ref_log_likelihood_n = (ref_log_likelihood < cap_log_likelihood) ? cap_log_likelihood : ref_log_likelihood;
    end



    // output reg control
    always@(*) begin
        o_find_max_idle = (state == S_IDLE);

        o_find_max_ready = (state == S_WAIT_NEXT_ROW);

        o_find_max_busy = ~o_find_max_ready;


        // Accsess VAR_SRAM
        A_VAR_SRAM = variant_ID;


        // Access GEN_SRAM
        A_GEN_SRAM = hap_ID;


        // from Cal_PL
        o_event_row_likelihood_valid = (state == S_OUTPUT_2_CAL_PL);
        o_event_ID = event_ID;
        o_event_begin = event_begin;

        o_event_variant_2hot = fixed_variant_2hot;

        o_event_variant_1hot = {(fixed_variant_2hot[15] & ~fixed_variant_2hot[14]),
                                (fixed_variant_2hot[13] & ~fixed_variant_2hot[12]),
                                (fixed_variant_2hot[11] & ~fixed_variant_2hot[10]),
                                (fixed_variant_2hot[9] & ~fixed_variant_2hot[8]),
                                (fixed_variant_2hot[7] & ~fixed_variant_2hot[6]),
                                (fixed_variant_2hot[5] & ~fixed_variant_2hot[4]),
                                (fixed_variant_2hot[3] & ~fixed_variant_2hot[2]),
                                (fixed_variant_2hot[1] & ~fixed_variant_2hot[0])};
        o_event_star_flag = star_flag;
        
        o_ref_log_likelihood   = ref_log_likelihood;
        o_alt_0_log_likelihood = alt_log_likelihoods[0];
        o_alt_1_log_likelihood = alt_log_likelihoods[1];
        o_alt_2_log_likelihood = alt_log_likelihoods[2];
        o_alt_3_log_likelihood = alt_log_likelihoods[3];
        o_alt_4_log_likelihood = alt_log_likelihoods[4];
        o_alt_5_log_likelihood = alt_log_likelihoods[5];
        o_alt_6_log_likelihood = alt_log_likelihoods[6];
        o_alt_7_log_likelihood = alt_log_likelihoods[7];
        o_star_log_likelihood = star_log_likelihood;

        o_find_max_region_done = (state == S_REGION_DONE);
    end








    // always@(posedge clk or negedge rst_n) begin
    always@(posedge clk ) begin
        if (!rst_n) begin
            state                   <= S_IDLE;
            latency_count           <= 0;
            read_count              <= 0;
            event_ID                <= 0;
            event_begin             <= 0;
            fixed_variant_2hot      <= 0;
            variant_2hot            <= 0;
            star_flag               <= 0;
            variant_ID              <= 0;
            unsorted_variant_ID     <= 0;
            hap_1hot                <= 0;
            ref_hap_1hot            <= 0;
            hap_ID                  <= 0;
            read_likelihood         <= 0;
            cap_log_likelihood      <= 0;
            for (i=0;i<8;i=i+1) alt_log_likelihoods[i] <= MINIMUM_LOG_LIKELIHOOD;
            star_log_likelihood     <= MINIMUM_LOG_LIKELIHOOD;//star_log_likelihood_n;
            ref_log_likelihood      <= MINIMUM_LOG_LIKELIHOOD;
        end else begin
            state                   <= state_n;
            latency_count           <= latency_count_n;
            read_count              <= read_count_n;
            event_ID                <= event_ID_n;
            event_begin             <= event_begin_n;
            fixed_variant_2hot      <= fixed_variant_2hot_n;
            variant_2hot            <= variant_2hot_n;
            star_flag               <= star_flag_n;
            variant_ID              <= variant_ID_n;
            unsorted_variant_ID     <= unsorted_variant_ID_n;
            hap_1hot                <= hap_1hot_n;
            ref_hap_1hot            <= ref_hap_1hot_n;
            hap_ID                  <= hap_ID_n;
            read_likelihood         <= read_likelihood_n;
            cap_log_likelihood      <= cap_log_likelihood_n;
            for (i=0;i<8;i=i+1) alt_log_likelihoods[i] <= alt_log_likelihoods_n[i];
            star_log_likelihood     <= star_log_likelihood_n;
            ref_log_likelihood      <= ref_log_likelihood_n;
        end
        
    end


endmodule

module FP_Comp (
	input  [31:0]			    data_a,
    input  [31:0]               data_b,

    output reg                  a_greater_than_b
);

    wire [7:0]      Ea, Eb;
    wire [22:0]     Fa, Fb;
    wire            signa, signb;
    reg             zero_a, zero_b;
    wire            sign_is_different;

    assign signa = data_a[31];
    assign signb = data_b[31];
    assign Ea = data_a[30:23];
    assign Eb = data_b[30:23];
    assign Fa = data_a[22:0];
    assign Fb = data_b[22:0];

    assign sign_is_different = (signa && !zero_a) ^ (signb && !zero_b);

    // If a and b is zero
    always@(*) begin
        zero_a = 1'b0;
        if (Ea == 0) begin
            zero_a = (Fa == 0)? 1'b1 : 1'b0;
        end
        
        zero_b = 1'b0;
        if (Eb == 0) begin
            zero_b = (Fb == 0)? 1'b1 : 1'b0;
        end
    end

    // Decide which is greater
    always@(*) begin
        // Zero input
        if (zero_a && zero_b) begin
            a_greater_than_b = 1'b0;
        end
        else if (zero_a) begin
            if (signb == 0) a_greater_than_b = 1'b0;
            else a_greater_than_b = 1'b1;
        end
        else if (zero_b) begin
            if (signa == 0) a_greater_than_b = 1'b1;
            else a_greater_than_b = 1'b0;
        end
        // Normal input
        else if (sign_is_different) begin
            if (signa == 0) a_greater_than_b = 1'b1;
            else a_greater_than_b = 1'b0;
        end
        else if (Ea != Eb) begin
            if ((!signa && Ea>Eb) || (signa && Ea<Eb)) a_greater_than_b = 1'b1;
            else a_greater_than_b = 1'b0;
        end
        else begin
            if ((!signa && Fa>Fb) || (signa && Fa<Fb)) a_greater_than_b = 1'b1;
            else a_greater_than_b = 1'b0;
        end
    end

endmodule
module Genotyping(
    input 					                        clk,
    input 					                        rst_n,
    input					                        manual_rst_n,
// global memory map
    input [63:0]                                    CONST_var_event_amount_addr,
    input [63:0]                                    CONST_var_info_addr,
    input [63:0]                                    CONST_event_info_addr,
// global constant
    input [8:0] 			                        CONST_read_length,
    input [9:0] 			                        CONST_active_region_length,
    input [`DP_PAIRHMM_SCORE_BITWIDTH-1:0]          CONST_max_likelihood_difference,
    input [`DP_PAIRHMM_SCORE_BITWIDTH-1:0]          CONST_min_max_likelihood,
// region constant
    input [$clog2(`READ_SRAM_WORD_AMOUNT):0]         read_amount_in_region,
    input [$clog2(`MAX_HAPLOTYPE_AMOUNT):0]          haplotype_amount_in_region,
    input [`MAX_HAPLOTYPE_AMOUNT-1:0]                haplotype_amount_in_region_1hot,
    input [31:0]                                     location_bias,
    input [9:0]                                      var_location_min,
    input [9:0]                                      var_location_max,
    input [$clog2(`MAX_VAR_AMOUNT):0]                event_amount_in_region,
    input [`VAR_BEGIN-1:0]                           event_begin_0,
    input [`VAR_BEGIN-1:0]                           event_begin_1,
    input [`VAR_BEGIN-1:0]                           event_begin_2,
    input [`VAR_BEGIN-1:0]                           event_begin_3,
    input [`VAR_BEGIN-1:0]                           event_begin_4,
    input [`VAR_BEGIN-1:0]                           event_begin_5,
    input [`VAR_BEGIN-1:0]                           event_begin_6,
    input [`VAR_BEGIN-1:0]                           event_begin_7,
    input [2*`MAX_VAR_AMOUNT-1:0]                    event_var2hot_0,
    input [2*`MAX_VAR_AMOUNT-1:0]                    event_var2hot_1,
    input [2*`MAX_VAR_AMOUNT-1:0]                    event_var2hot_2,
    input [2*`MAX_VAR_AMOUNT-1:0]                    event_var2hot_3,
    input [2*`MAX_VAR_AMOUNT-1:0]                    event_var2hot_4,
    input [2*`MAX_VAR_AMOUNT-1:0]                    event_var2hot_5,
    input [2*`MAX_VAR_AMOUNT-1:0]                    event_var2hot_6,
    input [2*`MAX_VAR_AMOUNT-1:0]                    event_var2hot_7,
    input [`MAX_HAPLOTYPE_AMOUNT-1:0]                unsorted_var_hap1hot_0,
    input [`MAX_HAPLOTYPE_AMOUNT-1:0]                unsorted_var_hap1hot_1,
    input [`MAX_HAPLOTYPE_AMOUNT-1:0]                unsorted_var_hap1hot_2,
    input [`MAX_HAPLOTYPE_AMOUNT-1:0]                unsorted_var_hap1hot_3,
    input [`MAX_HAPLOTYPE_AMOUNT-1:0]                unsorted_var_hap1hot_4,
    input [`MAX_HAPLOTYPE_AMOUNT-1:0]                unsorted_var_hap1hot_5,
    input [`MAX_HAPLOTYPE_AMOUNT-1:0]                unsorted_var_hap1hot_6,
    input [`MAX_HAPLOTYPE_AMOUNT-1:0]                unsorted_var_hap1hot_7,
    input [$clog2(`MAX_VAR_AMOUNT):0]			     variant_amount_in_region,       // (1-based)
// Access SRAM 
    input [`READ_SRAM_BIT_PER_WORD-1:0]			    Q_READ_SRAM,
    output[$clog2(`READ_SRAM_WORD_AMOUNT)-1:0]      A_READ_SRAM,
    input [`HAP_SRAM_BIT_PER_WORD-1:0]			    Q_HAP_SRAM,
    output[$clog2(`HAP_SRAM_WORD_AMOUNT)-1:0]       A_HAP_SRAM,
    input [`VAR_SRAM_BIT_PER_WORD-1:0]			    Q_VAR_SRAM,
    output[$clog2(`VAR_SRAM_WORD_AMOUNT)-1:0]       A_VAR_SRAM,
// AXI bus IO
    output     [63:0]                               axi_awaddr,
    output     [7:0]                                axi_awlen,
    input                                           axi_awready,
    output                                          axi_awvalid,
    output     [511:0]                              axi_wdata,
    output     [63:0]                               axi_wstrb,
    output                                          axi_wlast,
    input                                           axi_wready,
    output                                          axi_wvalid,
    output                                          axi_bready,
    input                                           axi_bvalid,
// Floating point unit
    output [31:0]                                   FP_addsub_data_a,
    output [31:0]                                   FP_addsub_data_b,
    output                                          FP_addsub_op,
    input  [31:0]                                   FP_addsub_result,
    output [31:0]                                   FP_mult_data_a,
    output [31:0]                                   FP_mult_data_b,
    input  [31:0]                                   FP_mult_result,
    output [31:0]                                   FP_exp_data_a,
    input  [31:0]                                   FP_exp_result_a,
    output [31:0]                                   FP_exp_data_b,
    input  [31:0]                                   FP_exp_result_b,
    output [31:0]                                   FP_log_data,
    input  [31:0]                                   FP_log_result,
// region control
    input                                           i_region_valid,         // Represent we can start calculating this region
    output    				                        o_region_done,          // Meaning calculation for this region is finished
    output     [31:0]                               o_var_event_amount_write_amount,
    output     [31:0]                               o_var_info_write_amount,
    output     [31:0]                               o_event_info_write_amount,
    output reg [2:0]                                state,
    
    output [3:0] state_tx,
    output [2:0] state_rx,
    output [4:0] state_find_max,
    output [4:0] state_PL_CTRL,
    output [3:0] state_o2dram
    // input                                           i_region_check
);

    
    localparam  S_IDLE              = 3'd0,
                S_CHECK             = 3'd1,
                S_ACTIVATE_O2DRAM   = 3'd2,
                S_WAIT_O2DRAM_READY = 3'd3,
                S_ACTIVATE_ALL      = 3'd4,
                S_WAIT              = 3'd5,
                S_REGION_DONE       = 3'd6;
    reg [2:0]  state_n;



    wire acivate_signal = (state == S_ACTIVATE_ALL);

// Tx IOs
    wire                                            o_tx_invalid_read;
    wire                                            o_tx_region_done;
    
// DP_geno_Top IOs
    wire                                            DP_o_geno_ready;
    wire                                            DP_i_geno_valid;
    wire        [2*`HAP_MAX_LENGTH-1:0]             DP_i_geno_sequence_A;
    wire        [2*`READ_MAX_LENGTH-1:0]            DP_i_geno_sequence_B;
    wire        [2*`READ_MAX_LENGTH-1:0]            DP_i_geno_sequence_B_qualities;
    wire        [$clog2(`HAP_MAX_LENGTH):0]         DP_i_geno_seq_A_length;
    wire        [$clog2(`GENO_SRAM_WORD_AMOUNT)-1:0]DP_i_geno_address_ID;
    wire                                            DP_i_geno_ready;
    wire                                            DP_o_geno_valid;
    wire signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0]    DP_o_geno_alignment_score;
    wire        [$clog2(`GENO_SRAM_WORD_AMOUNT)-1:0]DP_o_geno_address_ID;


// Rx IOs
    wire [$clog2(`READ_SRAM_WORD_AMOUNT):0]         o_rx_read_count;
    wire                                            o_rx_ready_for_DP;
    wire                                            o_rx_one_read_done;
    wire                                            o_rx_invalid_read;
    wire [`DP_PAIRHMM_SCORE_BITWIDTH:0]             o_cap_log_likelihood;

    wire                                            o_rx_region_done;
    // Receiver to SRAM
    wire  [$clog2(`GENO_SRAM_WORD_AMOUNT)-1:0]       Rx_GEN_SRAM_A;
    wire  [`GENO_SRAM_BIT_PER_WORD-1:0]              Rx_GEN_SRAM_D;
    wire                                             Rx_GEN_SRAM_W;

    

/*   NEED TO BE CONTROLED   */
// GEN_SRAM_0
    wire [$clog2(`GENO_SRAM_WORD_AMOUNT)-1:0]       GEN_SRAM_0_A;
    wire [`GENO_SRAM_BIT_PER_WORD-1:0]              GEN_SRAM_0_D;
    wire                                            GEN_SRAM_0_WEN;
    wire [`GENO_SRAM_BIT_PER_WORD-1:0]              GEN_SRAM_0_Q;
// GEN_SRAM_1
    wire  [$clog2(`GENO_SRAM_WORD_AMOUNT)-1:0]      GEN_SRAM_1_A;
    wire  [`GENO_SRAM_BIT_PER_WORD-1:0]             GEN_SRAM_1_D;
    wire                                            GEN_SRAM_1_WEN;
    wire  [`GENO_SRAM_BIT_PER_WORD-1:0]             GEN_SRAM_1_Q;

// find_max IOs
    wire                                        o_find_max_idle;
    wire                                        o_find_max_busy;
    wire                                        o_find_max_ready;
    
    wire [$clog2(`VAR_SRAM_WORD_AMOUNT)-1:0]    find_max_A_VAR_SRAM;

    wire [$clog2(`GENO_SRAM_WORD_AMOUNT)-1:0]   find_max_A_GEN_SRAM;
    wire [`GENO_SRAM_BIT_PER_WORD-1:0]          find_max_Q_GEN_SRAM;
    
    wire                                        o_event_row_likelihood_valid;
    wire [2:0]                                  o_event_ID;
    wire [`VAR_BEGIN-1:0]                       o_event_begin;
    wire [15:0]                                 o_event_variant_2hot;
    wire [ 7:0]                                 o_event_variant_1hot;
    wire                                        o_event_star_flag;
    wire [`DP_PAIRHMM_SCORE_BITWIDTH:0]         o_ref_log_likelihood;
    wire [`DP_PAIRHMM_SCORE_BITWIDTH:0]         o_alt_0_log_likelihood;
    wire [`DP_PAIRHMM_SCORE_BITWIDTH:0]         o_alt_1_log_likelihood;
    wire [`DP_PAIRHMM_SCORE_BITWIDTH:0]         o_alt_2_log_likelihood;
    wire [`DP_PAIRHMM_SCORE_BITWIDTH:0]         o_alt_3_log_likelihood;
    wire [`DP_PAIRHMM_SCORE_BITWIDTH:0]         o_alt_4_log_likelihood;
    wire [`DP_PAIRHMM_SCORE_BITWIDTH:0]         o_alt_5_log_likelihood;
    wire [`DP_PAIRHMM_SCORE_BITWIDTH:0]         o_alt_6_log_likelihood;
    wire [`DP_PAIRHMM_SCORE_BITWIDTH:0]         o_alt_7_log_likelihood;
    wire [`DP_PAIRHMM_SCORE_BITWIDTH:0]         o_star_log_likelihood;
    wire                                        o_find_max_region_done;

    
// PL_CTRL IOs
    // from find max (date: 20201016)
    wire                                          o_PL_ready;
    
    // to Output_2_Dram
    wire                                          PL_o_event_data_valid;
    wire     [`VAR_BEGIN-1:0]                     PL_o_event_begin;
    wire     [(`MAX_VAR_AMOUNT+1)-1:0]            PL_o_event_alt1hot;
    wire     [`MAX_GT_AMOUNT*32-1:0]              PL_o_event_PLs;
    // global output
    wire                                          o_PL_region_done;

   
// Output_2_Dram IOs
    wire activate_o2dram;
    // VAR_SRAM needed to be control
    wire  [$clog2(`VAR_SRAM_WORD_AMOUNT)-1:0]   o2dram_A_VAR_SRAM;
    // region singals
    wire                                        o_o2dram_ready;
    // global output channel
    wire                                        o_o2dram_region_done;
    



    

    always@(*) begin
        state_n = state;
        if (!manual_rst_n) state_n = S_IDLE;
        else begin
            case(state)
                S_IDLE:                 state_n = i_region_valid ? S_CHECK : state;
                S_CHECK:                state_n = (|variant_amount_in_region) ? S_ACTIVATE_O2DRAM : S_REGION_DONE;
                S_ACTIVATE_O2DRAM:      state_n = S_WAIT_O2DRAM_READY;
                S_WAIT_O2DRAM_READY:    state_n = (o_o2dram_ready) ? S_ACTIVATE_ALL : state;
                S_ACTIVATE_ALL:         state_n = S_WAIT;
                S_WAIT:                 state_n = (o_o2dram_region_done) ? S_REGION_DONE : state;
                S_REGION_DONE:          state_n = S_IDLE; //(i_region_check) ? S_IDLE : state;
            endcase
        end
    end





// wire assignment
    // VAR_SRAM output 
    assign A_VAR_SRAM = (state == S_WAIT) ? find_max_A_VAR_SRAM : o2dram_A_VAR_SRAM;
    // GEN_SRAM_0
    assign GEN_SRAM_0_A    = (o_rx_read_count[0]) ? find_max_A_GEN_SRAM : Rx_GEN_SRAM_A;
    assign GEN_SRAM_0_D    = (o_rx_read_count[0]) ? 0                   : Rx_GEN_SRAM_D;
    assign GEN_SRAM_0_WEN  = (o_rx_read_count[0]) ? 0                   : Rx_GEN_SRAM_W;
    // GEN_SRAM_1
    assign GEN_SRAM_1_A    = (o_rx_read_count[0]) ? Rx_GEN_SRAM_A : find_max_A_GEN_SRAM;
    assign GEN_SRAM_1_D    = (o_rx_read_count[0]) ? Rx_GEN_SRAM_D : 0;
    assign GEN_SRAM_1_WEN  = (o_rx_read_count[0]) ? Rx_GEN_SRAM_W : 0;

    assign find_max_Q_GEN_SRAM = (o_rx_read_count[0]) ? GEN_SRAM_0_Q : GEN_SRAM_1_Q;
    
    assign activate_o2dram = (state == S_ACTIVATE_O2DRAM);
    assign o_region_done = (state == S_REGION_DONE);


// submodules
    Transmitter u_Transmitter(
        .clk                            (clk),
        .rst_n                          (rst_n),
        .manual_rst_n                   (manual_rst_n),
        .CONST_read_length              (CONST_read_length), 
        .read_amount_in_region          (read_amount_in_region),
        .haplotype_amount_in_region     (haplotype_amount_in_region),
        .location_bias                  (location_bias),
        .var_location_min               (var_location_min),
        .var_location_max               (var_location_max),
        .i_region_valid                 (acivate_signal),
        .i_rx_one_read_done             (o_rx_one_read_done),
        .i_rx_region_done               (o_rx_region_done),
        .i_find_max_ready               (o_find_max_ready),
        .Q_READ_SRAM                    (Q_READ_SRAM),
        .A_READ_SRAM                    (A_READ_SRAM),
        .Q_HAP_SRAM                     (Q_HAP_SRAM),
        .A_HAP_SRAM                     (A_HAP_SRAM),
        .DW_i_geno_ready                (DP_o_geno_ready),
        .DW_o_geno_valid                (DP_i_geno_valid),
        .DW_o_geno_sequence_A           (DP_i_geno_sequence_A),
        .DW_o_geno_sequence_B           (DP_i_geno_sequence_B),
        .DW_o_geno_sequence_B_qualities (DP_i_geno_sequence_B_qualities),
        .DW_o_geno_seq_A_length         (DP_i_geno_seq_A_length),
        .DW_o_geno_address_ID           (DP_i_geno_address_ID),
        .o_tx_invalid_read              (o_tx_invalid_read),
        .o_tx_region_done               (o_tx_region_done),
        .state                          (state_tx)
    );
    DP_geno_Top u_DP_geno_Top(
        .clk                            (clk),
        .rst_n                          (rst_n),
        .o_geno_ready                   (DP_o_geno_ready),
        .i_geno_valid                   (DP_i_geno_valid),
        .i_geno_sequence_A              (DP_i_geno_sequence_A),
        .i_geno_sequence_B              (DP_i_geno_sequence_B),
        .i_geno_sequence_B_qualities    (DP_i_geno_sequence_B_qualities),
        .i_geno_seq_A_length            (DP_i_geno_seq_A_length),
        .i_geno_seq_B_length            (CONST_read_length),
        .i_geno_address_ID              (DP_i_geno_address_ID),
        .i_geno_ready                   (o_rx_ready_for_DP),
        .o_geno_valid                   (DP_o_geno_valid),
        .o_geno_alignment_score         (DP_o_geno_alignment_score),
        .o_geno_address_ID              (DP_o_geno_address_ID)
    );
    Receiver u_Receiver(
        .clk                            (clk                            ),
        .rst_n                          (rst_n                          ),
        .manual_rst_n                   (manual_rst_n                   ),
        .CONST_max_likelihood_difference(CONST_max_likelihood_difference),
        .CONST_min_max_likelihood       (CONST_min_max_likelihood       ),
        .read_amount_in_region          (read_amount_in_region          ),
        .haplotype_amount_in_region     (haplotype_amount_in_region     ),
        .i_region_valid                 (acivate_signal                 ),
        .i_tx_invalid_read              (o_tx_invalid_read              ),
        .o_rx_read_count                (o_rx_read_count                ),
        .i_find_max_ready               (o_find_max_ready               ),
        .i_find_max_region_done         (o_find_max_region_done         ),
        .o_rx_ready_for_DP              (o_rx_ready_for_DP              ),
        .DW_i_geno_valid                (DP_o_geno_valid                ),
        .DW_i_geno_alignment_score      (DP_o_geno_alignment_score      ),
        .DW_i_geno_address_ID           (DP_o_geno_address_ID          ),
        .W_GEN_SRAM                     (Rx_GEN_SRAM_W                  ),
        .A_GEN_SRAM                     (Rx_GEN_SRAM_A                  ),
        .D_GEN_SRAM                     (Rx_GEN_SRAM_D                  ),
        .o_rx_one_read_done             (o_rx_one_read_done             ),
        .o_rx_invalid_read              (o_rx_invalid_read              ),
        .o_cap_log_likelihood           (o_cap_log_likelihood           ),
        .o_rx_region_done               (o_rx_region_done               ),
        .state                          (state_rx)
    );
    GATK_Gen_SRAM u_GEN_SRAM_0(
        .clka                            (clk                ),
        // .rst_n                          (rst_n              ),
        .addra                        (GEN_SRAM_0_A       ),
        .dina                           (GEN_SRAM_0_D       ),
        .wea                           (GEN_SRAM_0_WEN     ),
        .douta                              (GEN_SRAM_0_Q       )
    );
    GATK_Gen_SRAM u_GEN_SRAM_1(
        .clka                            (clk                ),
        // .rst_n                          (rst_n              ),
        .addra                        (GEN_SRAM_1_A       ),
        .dina                           (GEN_SRAM_1_D       ),
        .wea                           (GEN_SRAM_1_WEN     ),
        .douta                              (GEN_SRAM_1_Q       )
    );
    Find_max_likelihood u_Find_max_likelihood(
        .clk                                (clk                                    ),
        .rst_n                              (rst_n                                  ),
        .manual_rst_n                       (manual_rst_n                           ),
        
        .haplotype_amount_in_region_1hot    (haplotype_amount_in_region_1hot        ),
        .event_amount_in_region             (event_amount_in_region                 ),
        .event_begin_0                      (event_begin_0                          ),
        .event_begin_1                      (event_begin_1                          ),
        .event_begin_2                      (event_begin_2                          ),
        .event_begin_3                      (event_begin_3                          ),
        .event_begin_4                      (event_begin_4                          ),
        .event_begin_5                      (event_begin_5                          ),
        .event_begin_6                      (event_begin_6                          ),
        .event_begin_7                      (event_begin_7                          ),
        .event_var2hot_0                    (event_var2hot_0                        ),
        .event_var2hot_1                    (event_var2hot_1                        ),
        .event_var2hot_2                    (event_var2hot_2                        ),
        .event_var2hot_3                    (event_var2hot_3                        ),
        .event_var2hot_4                    (event_var2hot_4                        ),
        .event_var2hot_5                    (event_var2hot_5                        ),
        .event_var2hot_6                    (event_var2hot_6                        ),
        .event_var2hot_7                    (event_var2hot_7                        ),
        .unsorted_var_hap1hot_0             (unsorted_var_hap1hot_0                 ),
        .unsorted_var_hap1hot_1             (unsorted_var_hap1hot_1                 ),
        .unsorted_var_hap1hot_2             (unsorted_var_hap1hot_2                 ),
        .unsorted_var_hap1hot_3             (unsorted_var_hap1hot_3                 ),
        .unsorted_var_hap1hot_4             (unsorted_var_hap1hot_4                 ),
        .unsorted_var_hap1hot_5             (unsorted_var_hap1hot_5                 ),
        .unsorted_var_hap1hot_6             (unsorted_var_hap1hot_6                 ),
        .unsorted_var_hap1hot_7             (unsorted_var_hap1hot_7                 ),
        // input data valid control
        .o_find_max_idle                    (o_find_max_idle                        ),
        .i_region_valid                     (acivate_signal                         ),
        .i_rx_one_read_done                 (o_rx_one_read_done                     ),
        .i_rx_invalid_read                  (o_rx_invalid_read                      ),
        .i_cap_log_likelihood               (o_cap_log_likelihood                   ),
        .o_find_max_busy                    (o_find_max_busy                        ),
        .o_find_max_ready                   (o_find_max_ready                       ),
        .i_rx_region_done                   (o_rx_region_done                       ),
        .Q_VAR_SRAM                         (Q_VAR_SRAM                             ),
        .A_VAR_SRAM                         (find_max_A_VAR_SRAM                    ),
        .Q_GEN_SRAM                         (find_max_Q_GEN_SRAM                    ),
        .A_GEN_SRAM                         (find_max_A_GEN_SRAM                    ),
        .i_PL_ready                         (o_PL_ready                             ),
        .o_event_row_likelihood_valid       (o_event_row_likelihood_valid           ),
        .o_event_ID                         (o_event_ID                             ),
        .o_event_begin                      (o_event_begin                          ),
        .o_event_variant_2hot               (o_event_variant_2hot                   ),
        .o_event_variant_1hot               (o_event_variant_1hot                   ),
        .o_event_star_flag                  (o_event_star_flag                      ),
        .o_ref_log_likelihood               (o_ref_log_likelihood                   ),
        .o_alt_0_log_likelihood             (o_alt_0_log_likelihood                 ),
        .o_alt_1_log_likelihood             (o_alt_1_log_likelihood                 ),
        .o_alt_2_log_likelihood             (o_alt_2_log_likelihood                 ),
        .o_alt_3_log_likelihood             (o_alt_3_log_likelihood                 ),
        .o_alt_4_log_likelihood             (o_alt_4_log_likelihood                 ),
        .o_alt_5_log_likelihood             (o_alt_5_log_likelihood                 ),
        .o_alt_6_log_likelihood             (o_alt_6_log_likelihood                 ),
        .o_alt_7_log_likelihood             (o_alt_7_log_likelihood                 ),
        .o_star_log_likelihood              (o_star_log_likelihood                  ),
        .o_find_max_region_done             (o_find_max_region_done                 ),
        .i_PL_region_done                   (o_PL_region_done                       ),
        .state                              (state_find_max)
    );
    PL_CTRL u_PL_CTRL(
        .clk                                (clk                                    ),
        .rst_n                              (rst_n                                  ),
        .manual_rst_n                       (manual_rst_n                           ),
        .read_amount_in_region              (read_amount_in_region                  ),
        .event_amount_in_region             (event_amount_in_region                 ),
        .event_begin_0                      (event_begin_0                          ),
        .event_begin_1                      (event_begin_1                          ),
        .event_begin_2                      (event_begin_2                          ),
        .event_begin_3                      (event_begin_3                          ),
        .event_begin_4                      (event_begin_4                          ),
        .event_begin_5                      (event_begin_5                          ),
        .event_begin_6                      (event_begin_6                          ),
        .event_begin_7                      (event_begin_7                          ),
        .i_region_valid                     (acivate_signal                         ),
        .o_PL_ready                         (o_PL_ready                             ),
        .i_find_max_region_done             (o_find_max_region_done                 ),
        .i_event_row_likelihood_valid       (o_event_row_likelihood_valid           ),
        .i_event_ID                         (o_event_ID                             ),
        .i_event_begin                      (o_event_begin                          ),
        .i_event_variant_1hot               (o_event_variant_1hot                   ),
        .i_event_star_flag                  (o_event_star_flag                      ),
        .i_ref_log_likelihood               (o_ref_log_likelihood                   ),
        .i_alt_0_log_likelihood             (o_alt_0_log_likelihood                 ),
        .i_alt_1_log_likelihood             (o_alt_1_log_likelihood                 ),
        .i_alt_2_log_likelihood             (o_alt_2_log_likelihood                 ),
        .i_alt_3_log_likelihood             (o_alt_3_log_likelihood                 ),
        .i_alt_4_log_likelihood             (o_alt_4_log_likelihood                 ),
        .i_alt_5_log_likelihood             (o_alt_5_log_likelihood                 ),
        .i_alt_6_log_likelihood             (o_alt_6_log_likelihood                 ),
        .i_alt_7_log_likelihood             (o_alt_7_log_likelihood                 ),
        .i_star_log_likelihood              (o_star_log_likelihood                  ),
        // to Output_2_Dram
        .i_o2dram_ready                     (o_o2dram_ready                         ),
        .o_event_data_valid                 (PL_o_event_data_valid                  ),
        .o_event_begin                      (PL_o_event_begin                       ),
        .o_event_alt1hot                    (PL_o_event_alt1hot                     ),
        .o_event_PLs                        (PL_o_event_PLs                         ),
        // Floating point unit
        .FP_addsub_data_a                   (FP_addsub_data_a                       ),
        .FP_addsub_data_b                   (FP_addsub_data_b                       ),
        .FP_addsub_op                       (FP_addsub_op                           ),
        .FP_addsub_result                   (FP_addsub_result                       ),
        .FP_mult_data_a                     (FP_mult_data_a                         ),
        .FP_mult_data_b                     (FP_mult_data_b                         ),
        .FP_mult_result                     (FP_mult_result                         ),
        .FP_exp_data_a                      (FP_exp_data_a                          ),
        .FP_exp_result_a                    (FP_exp_result_a                        ),
        .FP_exp_data_b                      (FP_exp_data_b                          ),
        .FP_exp_result_b                    (FP_exp_result_b                        ),
        .FP_log_data                        (FP_log_data                            ),
        .FP_log_result                      (FP_log_result                          ),
        // global outputs
        .o_PL_region_done                   (o_PL_region_done                       ),
        .i_o2dram_region_done               (o_o2dram_region_done                   ),

        .state (state_PL_CTRL)
    );
    Output_2_Dram u_Output_2_Dram(
        .clk                                (clk                                            ),
        .rst_n                              (rst_n                                          ),
        .manual_rst_n                       (manual_rst_n                                   ),
        // global address
        .CONST_var_event_amount_addr        (CONST_var_event_amount_addr                    ),
        .CONST_var_info_addr                (CONST_var_info_addr                            ),
        .CONST_event_info_addr              (CONST_event_info_addr                          ),
        // global constant
        .location_bias                      (location_bias                                  ),
        .variant_amount_in_region           (variant_amount_in_region                       ),
        .event_amount_in_region             (event_amount_in_region                         ),
        // sram control
        .Q_VAR_SRAM                         (Q_VAR_SRAM                                     ),
        .A_VAR_SRAM                         (o2dram_A_VAR_SRAM                              ),
        // global input channel
        .i_region_valid                     (activate_o2dram                                ),
        .o_o2dram_ready                     (o_o2dram_ready                                 ),
        // input channel: from Cal_PL
        .i_event_data_valid                 (PL_o_event_data_valid                          ),
        .i_event_begin                      (PL_o_event_begin                               ),
        .i_event_alt1hot                    (PL_o_event_alt1hot                             ),
        .i_event_PLs                        (PL_o_event_PLs                                 ),
        // avalon bus IO
        .axi_awaddr                       (axi_awaddr                                   ),
        .axi_awlen                        (axi_awlen                                    ),
        .axi_awready                      (axi_awready                                  ),
        .axi_awvalid                      (axi_awvalid                                  ),
        .axi_wdata                        (axi_wdata                                    ),
        .axi_wstrb                        (axi_wstrb                                    ),
        .axi_wlast                        (axi_wlast                                    ),
        .axi_wready                       (axi_wready                                   ),
        .axi_wvalid                       (axi_wvalid                                   ),
        .axi_bready                       (axi_bready                                   ),
        .axi_bvalid                       (axi_bvalid                                   ),
        // global output channel
        .o_o2dram_region_done               (o_o2dram_region_done                           ),
        .o_var_event_amount_write_amount    (o_var_event_amount_write_amount                ),
        .o_var_info_write_amount            (o_var_info_write_amount                        ),
        .o_event_info_write_amount          (o_event_info_write_amount                      ),

        .i_o2dram_region_done_check         (state==S_WAIT                                  ),
        .state (state_o2dram)
    );


    


    // always@(posedge clk or negedge rst_n) begin
    always@(posedge clk ) begin
        if (!rst_n)     state <= S_IDLE;
        else            state <= state_n;
    end


endmodule





module Output_2_Dram (
    input                                           clk,
    input                                           rst_n,
    input                                           manual_rst_n,
    // global constant  
    input [63:0]                                    CONST_var_event_amount_addr,
    input [63:0]                                    CONST_var_info_addr,
    input [63:0]                                    CONST_event_info_addr,

    input [31:0]                                    location_bias,
    input [$clog2(`MAX_VAR_AMOUNT):0]               variant_amount_in_region, // 4 bits
    input [$clog2(`MAX_VAR_AMOUNT):0]               event_amount_in_region,   // 4 bits
    // sram control
    input       [`VAR_SRAM_BIT_PER_WORD-1:0]        Q_VAR_SRAM, // 280 bits
    output reg  [$clog2(`VAR_SRAM_WORD_AMOUNT)-1:0] A_VAR_SRAM,
    // global input channel
    input                                           i_region_valid,
    output reg                                      o_o2dram_ready,
    // input channel: from Cal_PL
    input                                           i_event_data_valid,
    input [`VAR_BEGIN-1:0]                          i_event_begin,
    input [(`MAX_VAR_AMOUNT+1)-1:0]                 i_event_alt1hot,
    input [`MAX_GT_AMOUNT*32-1:0]                   i_event_PLs,
    
    // AXI bus IO
    output reg [63:0]                               axi_awaddr,
    output reg [7:0]                                axi_awlen,
    input                                           axi_awready,
    output reg                                      axi_awvalid,
    output reg [511:0]                              axi_wdata,
    output reg [63:0]                               axi_wstrb,
    output reg                                      axi_wlast,
    input                                           axi_wready,
    output reg                                      axi_wvalid,
    output reg                                      axi_bready,
    input                                           axi_bvalid,

    // global output channel
    output reg                                      o_o2dram_region_done,

    output reg [31:0]                               o_var_event_amount_write_amount,
    output reg [31:0]                               o_var_info_write_amount,
    output reg [31:0]                               o_event_info_write_amount,

    input                                           i_o2dram_region_done_check,

    output reg [3:0]                       state

); 


    localparam  S_IDLE              = 4'd0,
                S_READ_DATA_AMOUNT  = 4'd1,
                S_DATA_AMOUNT_WADDR = 4'd2,
                S_DATA_AMOUNT_WDATA = 4'd3,
                S_READ_VARIANT      = 4'd4,
                S_VARIANT_WADDR     = 4'd5,
                S_VARIANT_WDATA     = 4'd6,
                S_WAIT_EVENT        = 4'd7,
                S_INPUT_EVENT_DATA  = 4'd8,
                S_EVENT_WADDR       = 4'd9,
                S_EVENT_WDATA       = 4'd10,
                S_REGION_DONE       = 4'd11;

    reg [3:0]                       state_n;
    reg [1:0]                       sram_rw_count,          sram_rw_count_n;
    reg [4:0]                       burstcount,             burstcount_n;
    reg [$clog2(`MAX_VAR_AMOUNT):0] write_variant_count,    write_variant_count_n;
    reg [$clog2(`MAX_VAR_AMOUNT):0] write_event_count,      write_event_count_n;


    
    // input data registers
    reg [                   31:0]   event_begin, event_begin_n;
    reg [(`MAX_VAR_AMOUNT+1)-1:0]   event_alt1hot, event_alt1hot_n; // 9 bits
    reg [  `MAX_GT_AMOUNT*32-1:0]   event_PLs, event_PLs_n;

    // write vcf data control registers
    reg [63:0]                      var_event_amount_write_mask,    var_event_amount_write_mask_n;
    reg [63:0]                      var_info_write_mask,            var_info_write_mask_n;

    reg [31:0]                      var_event_amount_write_amount,  var_event_amount_write_amount_n;
    reg [31:0]                      var_info_write_amount,          var_info_write_amount_n;
    reg [31:0]                      event_info_write_amount,        event_info_write_amount_n;

    // write data buffer
    reg [512*3-1:0]                 write_data_buffer, write_data_buffer_n;
    


    wire [255:0] var_info = {Q_VAR_SRAM[`VAR_SRAM_BIT_PER_WORD-1-`VAR_BEGIN:`VAR_ID], 4'd0};

    always@(*) begin
        state_n = state;
        if (!manual_rst_n)state_n = S_IDLE;
        else begin
            case(state)
                S_IDLE:                 state_n = (i_region_valid) ? S_READ_DATA_AMOUNT : state;
                S_READ_DATA_AMOUNT:     state_n = S_DATA_AMOUNT_WADDR;
                S_DATA_AMOUNT_WADDR:    state_n = (axi_awready) ? S_DATA_AMOUNT_WDATA : state;
                S_DATA_AMOUNT_WDATA:    state_n = (axi_wready) ? S_READ_VARIANT : state;
                S_READ_VARIANT:         state_n = (sram_rw_count == 2) ? S_VARIANT_WADDR : state;
                S_VARIANT_WADDR:        state_n = (axi_awready) ? S_VARIANT_WDATA : state;
                S_VARIANT_WDATA: begin
                    if (axi_wready) begin
                        if (write_variant_count == variant_amount_in_region - 1) state_n = S_WAIT_EVENT;
                        else state_n = S_READ_VARIANT;
                    end
                end
                S_WAIT_EVENT: begin
                    if (write_event_count == event_amount_in_region) state_n = S_REGION_DONE;
                    else state_n = (i_event_data_valid) ? S_INPUT_EVENT_DATA : state;
                end
                S_INPUT_EVENT_DATA: state_n = S_EVENT_WADDR;
                S_EVENT_WADDR:      state_n = axi_awready ? S_EVENT_WDATA : state;
                S_EVENT_WDATA:      state_n = (axi_wready && ~|burstcount) ? S_WAIT_EVENT : state;
                S_REGION_DONE:      state_n = (i_o2dram_region_done_check) ? S_IDLE : state;
            endcase
        end
    end


    always @(*) begin
        sram_rw_count_n = sram_rw_count;
        if (!manual_rst_n || state==S_IDLE) sram_rw_count_n = 0;
        else if (state == S_READ_VARIANT) sram_rw_count_n = (sram_rw_count == 2) ? 0 : sram_rw_count + 1;


        
        write_variant_count_n = write_variant_count;
        if (!manual_rst_n || state==S_IDLE) write_variant_count_n = 0;
        else if (state == S_VARIANT_WDATA) write_variant_count_n = write_variant_count + axi_wready;


        write_event_count_n = write_event_count;
        if (!manual_rst_n || state==S_IDLE) write_event_count_n = 0;
        else if (state == S_EVENT_WDATA) write_event_count_n = write_event_count + (axi_wready && ~|burstcount);

        
        
        
        
        
        event_begin_n           = event_begin;
        event_alt1hot_n         = event_alt1hot;
        event_PLs_n             = event_PLs;
        if (!manual_rst_n || state == S_IDLE) begin
            event_begin_n           = 0;
            event_alt1hot_n         = 0;
            event_PLs_n             = 0;
        end else if (state == S_WAIT_EVENT && i_event_data_valid) begin
            event_begin_n           = i_event_begin + location_bias;
            event_alt1hot_n         = i_event_alt1hot;
            event_PLs_n             = i_event_PLs;
        end

        
        burstcount_n = burstcount;
        if (!manual_rst_n || state == S_IDLE) burstcount_n = 0;
        else if (state == S_EVENT_WADDR) burstcount_n = 2;
        else if (state == S_EVENT_WDATA && axi_wready) burstcount_n = burstcount - (|burstcount);
        
        var_event_amount_write_mask_n = var_event_amount_write_mask;
        if (!manual_rst_n) var_event_amount_write_mask_n ={62'd0, 2'b11};
        else if (state==S_DATA_AMOUNT_WDATA && axi_wready) var_event_amount_write_mask_n = {var_event_amount_write_mask[61:0], var_event_amount_write_mask[63:62]};

        var_info_write_mask_n = var_info_write_mask;
        if (!manual_rst_n) var_info_write_mask_n = {32'd0, 32'hFFFFFFFF};
        else if (state == S_VARIANT_WDATA && axi_wready) var_info_write_mask_n = {var_info_write_mask[31:0], var_info_write_mask[63:32]};

        write_data_buffer_n = write_data_buffer;
        if (!manual_rst_n || state == S_IDLE || state == S_WAIT_EVENT) begin
            write_data_buffer_n = 0;
        end else if (state == S_READ_DATA_AMOUNT) begin 
            case(var_event_amount_write_amount[4:0])
                5'd0 : write_data_buffer_n[16*0  +:16] = {4'd0, variant_amount_in_region, 4'd0, event_amount_in_region};
                5'd1 : write_data_buffer_n[16*1  +:16] = {4'd0, variant_amount_in_region, 4'd0, event_amount_in_region};
                5'd2 : write_data_buffer_n[16*2  +:16] = {4'd0, variant_amount_in_region, 4'd0, event_amount_in_region};
                5'd3 : write_data_buffer_n[16*3  +:16] = {4'd0, variant_amount_in_region, 4'd0, event_amount_in_region};
                5'd4 : write_data_buffer_n[16*4  +:16] = {4'd0, variant_amount_in_region, 4'd0, event_amount_in_region};
                5'd5 : write_data_buffer_n[16*5  +:16] = {4'd0, variant_amount_in_region, 4'd0, event_amount_in_region};
                5'd6 : write_data_buffer_n[16*6  +:16] = {4'd0, variant_amount_in_region, 4'd0, event_amount_in_region};
                5'd7 : write_data_buffer_n[16*7  +:16] = {4'd0, variant_amount_in_region, 4'd0, event_amount_in_region};
                5'd8 : write_data_buffer_n[16*8  +:16] = {4'd0, variant_amount_in_region, 4'd0, event_amount_in_region};
                5'd9 : write_data_buffer_n[16*9  +:16] = {4'd0, variant_amount_in_region, 4'd0, event_amount_in_region};
                5'd10: write_data_buffer_n[16*10 +:16] = {4'd0, variant_amount_in_region, 4'd0, event_amount_in_region};
                5'd11: write_data_buffer_n[16*11 +:16] = {4'd0, variant_amount_in_region, 4'd0, event_amount_in_region};
                5'd12: write_data_buffer_n[16*12 +:16] = {4'd0, variant_amount_in_region, 4'd0, event_amount_in_region};
                5'd13: write_data_buffer_n[16*13 +:16] = {4'd0, variant_amount_in_region, 4'd0, event_amount_in_region};
                5'd14: write_data_buffer_n[16*14 +:16] = {4'd0, variant_amount_in_region, 4'd0, event_amount_in_region};
                5'd15: write_data_buffer_n[16*15 +:16] = {4'd0, variant_amount_in_region, 4'd0, event_amount_in_region};
                5'd16: write_data_buffer_n[16*16 +:16] = {4'd0, variant_amount_in_region, 4'd0, event_amount_in_region};
                5'd17: write_data_buffer_n[16*17 +:16] = {4'd0, variant_amount_in_region, 4'd0, event_amount_in_region};
                5'd18: write_data_buffer_n[16*18 +:16] = {4'd0, variant_amount_in_region, 4'd0, event_amount_in_region};
                5'd19: write_data_buffer_n[16*19 +:16] = {4'd0, variant_amount_in_region, 4'd0, event_amount_in_region};
                5'd20: write_data_buffer_n[16*20 +:16] = {4'd0, variant_amount_in_region, 4'd0, event_amount_in_region};
                5'd21: write_data_buffer_n[16*21 +:16] = {4'd0, variant_amount_in_region, 4'd0, event_amount_in_region};
                5'd22: write_data_buffer_n[16*22 +:16] = {4'd0, variant_amount_in_region, 4'd0, event_amount_in_region};
                5'd23: write_data_buffer_n[16*23 +:16] = {4'd0, variant_amount_in_region, 4'd0, event_amount_in_region};
                5'd24: write_data_buffer_n[16*24 +:16] = {4'd0, variant_amount_in_region, 4'd0, event_amount_in_region};
                5'd25: write_data_buffer_n[16*25 +:16] = {4'd0, variant_amount_in_region, 4'd0, event_amount_in_region};
                5'd26: write_data_buffer_n[16*26 +:16] = {4'd0, variant_amount_in_region, 4'd0, event_amount_in_region};
                5'd27: write_data_buffer_n[16*27 +:16] = {4'd0, variant_amount_in_region, 4'd0, event_amount_in_region};
                5'd28: write_data_buffer_n[16*28 +:16] = {4'd0, variant_amount_in_region, 4'd0, event_amount_in_region};
                5'd29: write_data_buffer_n[16*29 +:16] = {4'd0, variant_amount_in_region, 4'd0, event_amount_in_region};
                5'd30: write_data_buffer_n[16*30 +:16] = {4'd0, variant_amount_in_region, 4'd0, event_amount_in_region};
                5'd31: write_data_buffer_n[16*31 +:16] = {4'd0, variant_amount_in_region, 4'd0, event_amount_in_region};
            endcase
        end else if (state == S_READ_VARIANT && sram_rw_count == 2) begin
            write_data_buffer_n[511:0] = (var_info_write_amount[0]) ? {var_info, 256'd0} : {256'd0, var_info};
        end else if (state == S_INPUT_EVENT_DATA) begin
            write_data_buffer_n = { event_begin[31:0],      // 32bits 
                                    55'd0, event_alt1hot,   // 55 + 9 = 64 bits
                                    event_PLs};             // 45*32 = 1440
        end else if (state == S_EVENT_WDATA && axi_wready) begin
            write_data_buffer_n = write_data_buffer >> 512;
        end

        var_event_amount_write_amount_n = var_event_amount_write_amount;
        if (!manual_rst_n) var_event_amount_write_amount_n = 0;
        else if (state == S_DATA_AMOUNT_WDATA && axi_wready) var_event_amount_write_amount_n = var_event_amount_write_amount + 1;
        
        var_info_write_amount_n = var_info_write_amount;
        if (!manual_rst_n) var_info_write_amount_n =0;
        else if (state == S_VARIANT_WDATA && axi_wready) var_info_write_amount_n = var_info_write_amount + 1;

        event_info_write_amount_n = event_info_write_amount;
        if (!manual_rst_n) event_info_write_amount_n = 0;
        else if (state == S_EVENT_WDATA && axi_wready && ~|burstcount) event_info_write_amount_n = event_info_write_amount + 1;
    end

    wire [63:0] region_var_event_amount_addr = var_event_amount_write_amount << 1;
    wire [63:0] region_var_info_addr = var_info_write_amount << 5;
    wire [63:0] region_event_info_addr = (event_info_write_amount << 6) + (event_info_write_amount << 7);

    // output ports control
    always @(*) begin
        // sram IO
        A_VAR_SRAM = write_variant_count;


        // AXI bus IO
        axi_awaddr = 0;
        if (state == S_DATA_AMOUNT_WADDR)   axi_awaddr = CONST_var_event_amount_addr + {region_var_event_amount_addr[63:6], 6'd0};
        else if (state == S_VARIANT_WADDR)  axi_awaddr = CONST_var_info_addr + {region_var_info_addr[63:6], 6'd0};
        else if (state == S_EVENT_WADDR)    axi_awaddr = CONST_event_info_addr + {region_event_info_addr[63:6], 6'd0};
        axi_awlen = (state == S_EVENT_WADDR) ? 2 : 0;
        axi_awvalid = (state == S_DATA_AMOUNT_WADDR) || (state == S_VARIANT_WADDR) || (state == S_EVENT_WADDR);
        axi_wdata = write_data_buffer[511:0];
        axi_wstrb = 64'd0;
        if (state == S_DATA_AMOUNT_WDATA)   axi_wstrb   = var_event_amount_write_mask;
        else if (state == S_VARIANT_WDATA)  axi_wstrb   = var_info_write_mask;
        else if (state == S_EVENT_WDATA)    axi_wstrb   = 64'hffff_ffff_ffff_ffff;
        axi_wlast = (~|burstcount); // burstcount == 0
        axi_wvalid = (state == S_DATA_AMOUNT_WDATA) || (state == S_VARIANT_WDATA) || (state == S_EVENT_WDATA);
        axi_bready = 1;


        // ready signal
        o_o2dram_ready  = (state == S_WAIT_EVENT);

        // o2dram output data
        o_o2dram_region_done            = (state == S_REGION_DONE);
        o_var_event_amount_write_amount = var_event_amount_write_amount;
        o_var_info_write_amount         = var_info_write_amount;
        o_event_info_write_amount       = event_info_write_amount;
    end


    // always@(posedge clk or negedge rst_n) begin
    always@(posedge clk ) begin
        if (!rst_n) begin
            state                           <= S_IDLE;
            sram_rw_count                   <= 0;
            write_variant_count             <= 0;
            write_event_count               <= 0;
            burstcount                      <= 0;
            event_begin                     <= 0;
            event_alt1hot                   <= 0;
            event_PLs                       <= 0;
            write_data_buffer               <= 0;
            var_event_amount_write_mask     <= 64'b11;
            var_info_write_mask             <= 64'hFFFF_FFFF;
            var_event_amount_write_amount   <= 0;
            var_info_write_amount           <= 0;
            event_info_write_amount         <= 0;
        end else begin
            state                           <= state_n;
            sram_rw_count                   <= sram_rw_count_n;
            write_variant_count             <= write_variant_count_n;
            write_event_count               <= write_event_count_n;
            burstcount                      <= burstcount_n;
            event_begin                     <= event_begin_n;
            event_alt1hot                   <= event_alt1hot_n;
            event_PLs                       <= event_PLs_n;
            write_data_buffer               <= write_data_buffer_n;
            var_event_amount_write_mask     <= var_event_amount_write_mask_n;
            var_info_write_mask             <= var_info_write_mask_n;
            var_event_amount_write_amount   <= var_event_amount_write_amount_n;
            var_info_write_amount           <= var_info_write_amount_n;
            event_info_write_amount         <= event_info_write_amount_n;
        end
    end
endmodule




//----------------
// NTU DCS
//----------------
module PL_ALU (
    input                                       clk,
    input                                       rst_n,
    input                                       manual_rst_n,
    
    // from find max (date: 20201016)
    output reg                                  o_PL_ready,
    input                                       i_GT_valid,
    input  [`DP_PAIRHMM_SCORE_BITWIDTH-1:0]     i_int_a_log_likelihood,
    input  [`DP_PAIRHMM_SCORE_BITWIDTH-1:0]     i_int_b_log_likelihood,
    input  [31:0]                               i_float_a_log_likelihood,
    input  [31:0]                               i_float_b_log_likelihood,

    input                                       i_PL_CTRL_ready,
    output reg                                  o_PL_valid,
    output reg [31:0]                           o_PL_value,

    // Floating point unit
    /* ADD SUB (latency: `FP_ADDSUB_LATENCY) */
    output reg  [31:0]      FP_addsub_data_a,
    output reg  [31:0]      FP_addsub_data_b,
    output reg              FP_addsub_op, // (+, -) = (1, 0) 
    input       [31:0]      FP_addsub_result, 
    /* 10^(x) (latency: `FP_EXP10_LATENCY) */
    output reg  [31:0]      FP_exp_data_a,
    input       [31:0]      FP_exp_result_a,
    output reg  [31:0]      FP_exp_data_b,
    input       [31:0]      FP_exp_result_b,
    /* LOG_10 (latency: `FP_LOG10_LATENCY) */
    output reg  [31:0]      FP_log_data,
    input       [31:0]      FP_log_result
); 

    integer i, j, k;

    // Parameter
    localparam FP_10            = 32'b0100_0001_0010_0000_0000_0000_0000_0000; // 10
    localparam FP_LOWER_BOUND   = 32'b1100_0010_0001_0011_1110_0000_1001_0100; // -36.9693145751953125
    localparam FXP_LOWER_BOUND  = 17'b10110110000100000; // -36.96875
    localparam LOG10_2          = 32'h3e9a_209b; // 0.3010300099849700927734375

    // Finite State Machine
    localparam  S_IDLE          = 3'd0,
                S_CHECK_EQUAL   = 3'd1,
                S_TAKE_EXP      = 3'd2,
                S_EXP_SUM       = 3'd3,
                S_TAKE_LOG      = 3'd4,
                S_ADD_LOG2      = 3'd5,
                S_OUTPUT        = 3'd6;

    reg [2:0]   state, state_n; 
    reg [7:0]   latency_count, latency_count_n;
    
    reg signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0] int_a_log_likelihood, int_a_log_likelihood_n;
    reg signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0] int_b_log_likelihood, int_b_log_likelihood_n;

    reg [31:0]  float_a_log_likelihood, float_a_log_likelihood_n;
    reg [31:0]  float_b_log_likelihood, float_b_log_likelihood_n;


    reg [31:0] float_result, float_result_n;

    wire exp_valid = (latency_count == `FP_EXP10_LATENCY);
    wire sum_valid = (latency_count == `FP_ADDSUB_LATENCY);
    wire log_valid = (latency_count == `FP_LOG10_LATENCY);
    


    always@(*) begin
        state_n = state;
        if (!manual_rst_n) state_n = S_IDLE;
        else begin
            case(state)
                S_IDLE:         state_n = (i_GT_valid) ? S_CHECK_EQUAL : state;
                S_CHECK_EQUAL:  state_n = (int_a_log_likelihood == int_b_log_likelihood) ? S_ADD_LOG2 : S_TAKE_EXP;
                S_TAKE_EXP:     state_n = (exp_valid) ? S_EXP_SUM : state;
                S_EXP_SUM:      state_n = (sum_valid) ? S_TAKE_LOG : state;
                S_TAKE_LOG:     state_n = (log_valid) ? S_OUTPUT : state;
                S_ADD_LOG2:     state_n = (sum_valid) ? S_OUTPUT : state;
                S_OUTPUT:       state_n = (i_PL_CTRL_ready) ? S_IDLE : state;
            endcase
        end
    end




    always@(*) begin
        latency_count_n = latency_count;
        if (!manual_rst_n || state == S_IDLE) latency_count_n = 0;
        else if (state == S_TAKE_EXP)   latency_count_n = (exp_valid) ? 0 : latency_count + 1;
        else if (state == S_EXP_SUM)    latency_count_n = (sum_valid) ? 0 : latency_count + 1;
        else if (state == S_TAKE_LOG)   latency_count_n = (log_valid) ? 0 : latency_count + 1;
        else if (state == S_ADD_LOG2)   latency_count_n = (sum_valid) ? 0 : latency_count + 1;



        
    
        int_a_log_likelihood_n = int_a_log_likelihood;
        int_b_log_likelihood_n = int_b_log_likelihood;
        if (!manual_rst_n) begin
            int_a_log_likelihood_n = 0;
            int_b_log_likelihood_n = 0;
        end else if (state == S_IDLE) begin
            int_a_log_likelihood_n = (i_GT_valid) ? i_int_a_log_likelihood : 0;
            int_b_log_likelihood_n = (i_GT_valid) ? i_int_b_log_likelihood : 0;
        end




        float_a_log_likelihood_n = float_a_log_likelihood;
        float_b_log_likelihood_n = float_b_log_likelihood;
        if (!manual_rst_n) begin
            float_a_log_likelihood_n = 0;
            float_b_log_likelihood_n = 0;
        end else if (state == S_IDLE) begin
            float_a_log_likelihood_n = (i_GT_valid) ? i_float_a_log_likelihood : 0;
            float_b_log_likelihood_n = (i_GT_valid) ? i_float_b_log_likelihood : 0;
        end else if (state == S_TAKE_EXP && latency_count == `FP_EXP10_LATENCY) begin
            float_a_log_likelihood_n = FP_exp_result_a;
            float_b_log_likelihood_n = FP_exp_result_b;
        end




        float_result_n = float_result;
        if (!manual_rst_n || state == S_IDLE) float_result_n = 0;
        else if (state == S_EXP_SUM  && sum_valid) float_result_n = FP_addsub_result;
        else if (state == S_TAKE_LOG && log_valid) float_result_n = FP_log_result;
        else if (state == S_ADD_LOG2 && sum_valid) float_result_n = FP_addsub_result;
    end




    always@(*) begin
        // from find max (date: 20201016)
        o_PL_ready = (state == S_IDLE);
        o_PL_valid = (state == S_OUTPUT);
        o_PL_value = float_result;


        // Floating point unit
        /* ADD SUB (latency: `FP_ADDSUB_LATENCY) */
        FP_addsub_data_a = float_a_log_likelihood;
        FP_addsub_data_b = (state == S_ADD_LOG2) ? LOG10_2 : float_b_log_likelihood;
        FP_addsub_op = 0;   // (+, -) = (0, 1) 


        /* 10^(x) (latency: `FP_EXP10_LATENCY) */
        FP_exp_data_a = float_a_log_likelihood;
        FP_exp_data_b = float_b_log_likelihood;


        /* LOG_10 (latency: `FP_LOG10_LATENCY) */
        FP_log_data = float_result;
    end



    // always@(posedge clk or negedge rst_n) begin
    always@(posedge clk) begin
        if (!rst_n) begin
            state                   <= S_IDLE;
            latency_count           <= 0;
            int_a_log_likelihood    <= 0;
            int_b_log_likelihood    <= 0;
            float_a_log_likelihood  <= 0;
            float_b_log_likelihood  <= 0;
            float_result            <= 0;    
        end else begin
            state                   <= state_n;
            latency_count           <= latency_count_n;
            int_a_log_likelihood    <= int_a_log_likelihood_n;
            int_b_log_likelihood    <= int_b_log_likelihood_n;
            float_a_log_likelihood  <= float_a_log_likelihood_n;
            float_b_log_likelihood  <= float_b_log_likelihood_n;
            float_result            <= float_result_n;    
        end
        
    end






endmodule
//----------------
// NTU DCS
//----------------
module PL_CTRL (
    input                                           clk,
    input                                           rst_n,
    input                                           manual_rst_n,
// local constant
    input      [$clog2(`READ_SRAM_WORD_AMOUNT):0]   read_amount_in_region,
    input      [       $clog2(`MAX_VAR_AMOUNT):0]   event_amount_in_region,
    input      [                  `VAR_BEGIN-1:0]   event_begin_0,
    input      [                  `VAR_BEGIN-1:0]   event_begin_1,
    input      [                  `VAR_BEGIN-1:0]   event_begin_2,
    input      [                  `VAR_BEGIN-1:0]   event_begin_3,
    input      [                  `VAR_BEGIN-1:0]   event_begin_4,
    input      [                  `VAR_BEGIN-1:0]   event_begin_5,
    input      [                  `VAR_BEGIN-1:0]   event_begin_6,
    input      [                  `VAR_BEGIN-1:0]   event_begin_7,
// activate signal
    input                                           i_region_valid,
// from find max (date: 20201016)
    output reg                                      o_PL_ready,
    input                                           i_find_max_region_done,
    input                                           i_event_row_likelihood_valid,
    input      [                             2:0]   i_event_ID,
    input      [                  `VAR_BEGIN-1:0]   i_event_begin,
    input      [                             7:0]   i_event_variant_1hot,
    input                                           i_event_star_flag,
    input      [    `DP_PAIRHMM_SCORE_BITWIDTH:0]   i_ref_log_likelihood,
    input      [    `DP_PAIRHMM_SCORE_BITWIDTH:0]   i_alt_0_log_likelihood,
    input      [    `DP_PAIRHMM_SCORE_BITWIDTH:0]   i_alt_1_log_likelihood,
    input      [    `DP_PAIRHMM_SCORE_BITWIDTH:0]   i_alt_2_log_likelihood,
    input      [    `DP_PAIRHMM_SCORE_BITWIDTH:0]   i_alt_3_log_likelihood,
    input      [    `DP_PAIRHMM_SCORE_BITWIDTH:0]   i_alt_4_log_likelihood,
    input      [    `DP_PAIRHMM_SCORE_BITWIDTH:0]   i_alt_5_log_likelihood,
    input      [    `DP_PAIRHMM_SCORE_BITWIDTH:0]   i_alt_6_log_likelihood,
    input      [    `DP_PAIRHMM_SCORE_BITWIDTH:0]   i_alt_7_log_likelihood,
    input      [    `DP_PAIRHMM_SCORE_BITWIDTH:0]   i_star_log_likelihood,
// to Output_2_Dram
    input                                           i_o2dram_ready,
    output reg                                      o_event_data_valid,
    output reg [                  `VAR_BEGIN-1:0]   o_event_begin,
    output reg [         (`MAX_VAR_AMOUNT+1)-1:0]   o_event_alt1hot, // 9 bits
    output reg [           `MAX_GT_AMOUNT*32-1:0]   o_event_PLs,
// Floating point unit
    output reg [                            31:0]   FP_addsub_data_a,
    output reg [                            31:0]   FP_addsub_data_b,
    output reg                                      FP_addsub_op,
    input      [                            31:0]   FP_addsub_result,
    output reg [                            31:0]   FP_mult_data_a,
    output reg [                            31:0]   FP_mult_data_b,
    input      [                            31:0]   FP_mult_result,
    output reg [                            31:0]   FP_exp_data_a,
    input      [                            31:0]   FP_exp_result_a,
    output reg [                            31:0]   FP_exp_data_b,
    input      [                            31:0]   FP_exp_result_b,
    output reg [                            31:0]   FP_log_data,
    input      [                            31:0]   FP_log_result,
// region finish handshake
    output reg                                      o_PL_region_done,
    input                                           i_o2dram_region_done,
    
    output reg [4:0]   state
);
    integer i, j, k;
    genvar gv;

    // Parameter
    parameter FP_M10            = 32'hC120_0000; // -10
    parameter MAX_FP            = 32'h7f7f_ffff;

    // calculate event PLs
    localparam  S_IDLE          = 5'd0,
                S_RESET_SRAM    = 5'd1,
                S_WAIT_INPUT    = 5'd2, // wait event alleles likelihoods, update addr bias
                S_CALL_INT2FPT  = 5'd3,
                S_WAIT_INT2FPT  = 5'd4,
                S_GET_A         = 5'd5, // get allele A and PL ID bias
                S_GET_B         = 5'd6, // get allele B and PL ID
                S_CALL_PL       = 5'd7, // read SRAM at the same time
                S_WAIT_PL       = 5'd8, // read SRAM at the same time
                S_ACCUM         = 5'd9,
                S_WRITE_SRAM    = 5'd10;
    
    // after all reads are calculated: x(-10) and find minimum
    localparam  SS_SELECT_EVENT = 5'd11,
                SS_SELECT_GT    = 5'd12,
                SS_READ_SRAM    = 5'd13,
                SS_MULT_M10     = 5'd14,
                SS_FIND_MIN_PL  = 5'd15;
    
    // after minimum are found
    localparam  SSS_SELECT_GT   = 5'd16,
                SSS_NORM        = 5'd17,
                SSS_CALL_O2DRAM = 5'd18,
                SSS_REGION_DONE = 5'd19;


    reg [4:0]    state_n;
    reg [4:0]   latency_count, latency_count_n;
    reg [5:0]   event_addr_bias, event_addr_bias_n;
    reg [8:0]   addr, addr_n;
    reg [3:0]   event_ID, event_ID_n;

    // input data processing registers {ref, star, alt_0, alt_1, ... alt_7}
    reg signed [`DP_PAIRHMM_SCORE_BITWIDTH:0] int_allele_log_likelihood  [0:(`ALTERNATIVE_AMOUNT+2)-1], int_allele_log_likelihood_n  [0:(`ALTERNATIVE_AMOUNT+2)-1];
    reg        [                        31:0] float_allele_log_likelihood[0:(`ALTERNATIVE_AMOUNT+2)-1], float_allele_log_likelihood_n[0:(`ALTERNATIVE_AMOUNT+2)-1];

    reg [  (`ALTERNATIVE_AMOUNT+1)-1:0]  event_alt_1hot[0:`EVENT_AMOUNT-1], event_alt_1hot_n[0:`EVENT_AMOUNT-1]; // {star, alternatives}
    reg [  (`ALTERNATIVE_AMOUNT+2)-1:0]  A_allele_1hot, A_allele_1hot_n; // [ref x1] + [alt x8] + [star x1] = 10 bits
    reg [  (`ALTERNATIVE_AMOUNT+2)-1:0]  B_allele_1hot, B_allele_1hot_n; // [ref x1] + [alt x8] + [star x1] = 10 bits
    reg [                          3:0]  allele_a_ID, allele_a_ID_n;
    reg [                          3:0]  allele_b_ID, allele_b_ID_n;

    reg [5:0]      GT_amounts[0:`EVENT_AMOUNT-1], GT_amounts_n[0:`EVENT_AMOUNT-1];
    reg [5:0]      GT_amount, GT_amount_n;
    
    reg [31:0]  PL_result, PL_result_n;
    
    reg [5:0]   GT_count, GT_count_n;
    reg [31:0]  min_PL, min_PL_n;
    
    // normalization data registers
    reg [`MAX_GT_AMOUNT*32-1:0]  event_PLs, event_PLs_n;

    /**** sub module IO ****/
    // PL_SRAM
    reg  [$clog2(`PL_SRAM_WORD_AMOUNT)-1:0]   PL_SRAM_A;
    reg  [`PL_SRAM_BIT_PER_WORD-1:0]          PL_SRAM_D;
    reg                                       PL_SRAM_WEN;
    wire [`PL_SRAM_BIT_PER_WORD-1:0]          PL_SRAM_Q;
    // Change_2_fpt
    wire                i2f_start_change_2_fpt = (state == S_CALL_INT2FPT);
    wire                i2f_int2fpt_ready    [0:(`ALTERNATIVE_AMOUNT+2)-1];
    wire                i2f_change_2_fpt_done[0:(`ALTERNATIVE_AMOUNT+2)-1];
	wire signed [31:0]  i2f_likelihood_fpt   [0:(`ALTERNATIVE_AMOUNT+2)-1];
    // PL_ALU IO ports
    wire                                    ALU_o_PL_ready;
    reg                                     ALU_i_GT_valid;
    reg  [`DP_PAIRHMM_SCORE_BITWIDTH-1:0]   ALU_i_int_a_log_likelihood;
    reg  [`DP_PAIRHMM_SCORE_BITWIDTH-1:0]   ALU_i_int_b_log_likelihood;
    reg  [                          31:0]   ALU_i_float_a_log_likelihood;
    reg  [                          31:0]   ALU_i_float_b_log_likelihood;
    reg                                     ALU_i_PL_CTRL_ready;
    wire                                    ALU_o_PL_valid;
    wire [                          31:0]   ALU_o_PL_value;
    // Floating point unit
    wire  [31:0]      ALU_FP_addsub_data_a;
    wire  [31:0]      ALU_FP_addsub_data_b;
    wire              ALU_FP_addsub_op;
    reg   [31:0]      ALU_FP_addsub_result;
    wire  [31:0]      ALU_FP_exp_data_a;
    reg   [31:0]      ALU_FP_exp_result_a;
    wire  [31:0]      ALU_FP_exp_data_b;
    reg   [31:0]      ALU_FP_exp_result_b;
    wire  [31:0]      ALU_FP_log_data;
    reg   [31:0]      ALU_FP_log_result;

    // for finding minimum PL to normailize PLs
    reg [31:0]  fp_comp_data_a;
    reg [31:0]  fp_comp_data_b;
    wire        fp_comp_a_greater_than_b;
    
    
    reg [`VAR_BEGIN-1:0]   o_event_begin_n;
    
    
    
    
    
    
    
    GATK_PL_SRAM u_PL_SRAM(
        .clka      (clk),
        .addra    (PL_SRAM_A),
        .dina       (PL_SRAM_D),
        .wea       (PL_SRAM_WEN),
        .douta          (PL_SRAM_Q)
    );
    generate
        for (gv=0;gv<`ALTERNATIVE_AMOUNT+2;gv=gv+1) begin: int2fpt
            Change_2_fpt u_i2f(
                .clk                (clk                            ),
                .rst_n              (rst_n                          ),
                .manual_rst_n       (manual_rst_n                   ),
                .int2fpt_ready      (i2f_int2fpt_ready[gv]          ),
                .start_change_2_fpt (i2f_start_change_2_fpt         ),
                .input_likelihood   (int_allele_log_likelihood[gv]  ),
                .ready_for_fpt      (state == S_WAIT_INT2FPT        ),
                .change_2_fpt_done  (i2f_change_2_fpt_done[gv]      ),
                .likelihood_fpt     (i2f_likelihood_fpt[gv]         )
            );
        end
    endgenerate
    PL_ALU u_PL_ALU(
        .clk                        (clk),
        .rst_n                      (rst_n),
        .manual_rst_n               (manual_rst_n),
        // from find max (date: 20201016)
        .o_PL_ready                 (ALU_o_PL_ready),
        .i_GT_valid                 (ALU_i_GT_valid),
        .i_int_a_log_likelihood     (ALU_i_int_a_log_likelihood),
        .i_int_b_log_likelihood     (ALU_i_int_b_log_likelihood),
        .i_float_a_log_likelihood   (ALU_i_float_a_log_likelihood),
        .i_float_b_log_likelihood   (ALU_i_float_b_log_likelihood),
        .i_PL_CTRL_ready            (ALU_i_PL_CTRL_ready),
        .o_PL_valid                 (ALU_o_PL_valid),
        .o_PL_value                 (ALU_o_PL_value),
        // Floating point unit
        .FP_addsub_data_a           (ALU_FP_addsub_data_a),
        .FP_addsub_data_b           (ALU_FP_addsub_data_b),
        .FP_addsub_op               (ALU_FP_addsub_op),
        .FP_addsub_result           (ALU_FP_addsub_result),
        .FP_exp_data_a              (ALU_FP_exp_data_a),
        .FP_exp_result_a            (ALU_FP_exp_result_a),
        .FP_exp_data_b              (ALU_FP_exp_data_b),
        .FP_exp_result_b            (ALU_FP_exp_result_b),
        .FP_log_data                (ALU_FP_log_data),
        .FP_log_result              (ALU_FP_log_result)
    );
    FP_Comp u_FP_Comp(
        .data_a                     (fp_comp_data_a),
        .data_b                     (fp_comp_data_b),
        .a_greater_than_b           (fp_comp_a_greater_than_b)
    );












    // finite state machine
    always@(*) begin
        state_n = state;
        if (!manual_rst_n) state_n = S_IDLE;
        else begin
            case(state)
                S_IDLE:             state_n = (i_region_valid) ? S_RESET_SRAM : state;
                S_RESET_SRAM:       state_n = (addr == 287) ? S_WAIT_INPUT : state;

                // wait next event's alleles likelihoods
                S_WAIT_INPUT: begin
                    if (i_find_max_region_done) state_n = SS_SELECT_EVENT;
                    else state_n = (i_event_row_likelihood_valid) ? S_CALL_INT2FPT : state;
                end

                // convert int log to float log
                S_CALL_INT2FPT:     state_n = (i2f_int2fpt_ready[0]) ? S_WAIT_INT2FPT : state;
                S_WAIT_INT2FPT:     state_n = (i2f_change_2_fpt_done[0]) ? S_GET_A : state;

                // fetch allele pairs likelihoods
                S_GET_A: begin
                    if (~|A_allele_1hot) state_n = S_WAIT_INPUT;
                    else state_n = (A_allele_1hot[0]) ? S_GET_B : state;
                end
                S_GET_B: begin
                    if (~|B_allele_1hot) state_n = S_GET_A;
                    else state_n = (B_allele_1hot[0]) ? S_CALL_PL : state;
                end

                // calculate genotype PL value
                S_CALL_PL:          state_n = (ALU_o_PL_ready) ? S_WAIT_PL : state;
                S_WAIT_PL:          state_n = (ALU_o_PL_valid) ? S_ACCUM : state;
                S_ACCUM:            state_n = (latency_count == `FP_ADDSUB_LATENCY) ? S_WRITE_SRAM : state;
                S_WRITE_SRAM:       state_n = S_GET_B;

                // all read-to-hap likelihoods are calculated, *-10, find minimum PL
                SS_SELECT_EVENT:    state_n = (event_ID == event_amount_in_region) ? SSS_REGION_DONE : SS_SELECT_GT;
                SS_SELECT_GT:       state_n = (GT_count == GT_amount) ? SSS_SELECT_GT : SS_READ_SRAM;
                SS_READ_SRAM:       state_n = (latency_count == `SRAM_LATENCY) ? SS_MULT_M10 : state;
                SS_MULT_M10:        state_n = (latency_count == `FP_MULT_LATENCY) ? SS_FIND_MIN_PL : state;
                SS_FIND_MIN_PL:     state_n = SS_SELECT_GT;

                // normalize PL by subtracting min PL
                SSS_SELECT_GT:      state_n = (GT_count == GT_amount) ? SSS_CALL_O2DRAM : SSS_NORM;
                SSS_NORM:           state_n = (latency_count == `FP_ADDSUB_LATENCY) ? SSS_SELECT_GT : state;
                SSS_CALL_O2DRAM:    state_n = (i_o2dram_ready) ? SS_SELECT_EVENT : state;
                SSS_REGION_DONE:    state_n = (i_o2dram_region_done) ? S_IDLE : state;
            endcase
        end
    end


    always@(*) begin
        
        // o_event_begin_n = o_event_begin;
        // if (!manual_rst_n || state == S_IDLE) o_event_begin_n = 0;
        // else if (state == S_WAIT_INPUT && i_event_row_likelihood_valid) o_event_begin_n = i_event_begin;

        // input data processing registers
        for (i=0;i<`ALTERNATIVE_AMOUNT+2;i=i+1) int_allele_log_likelihood_n[i] = int_allele_log_likelihood[i];
        if (!manual_rst_n || state == S_IDLE) for (i=0;i<`ALTERNATIVE_AMOUNT+2;i=i+1) int_allele_log_likelihood_n[i] = 0;
        else if (state == S_WAIT_INPUT) begin
            int_allele_log_likelihood_n[0] = (i_event_row_likelihood_valid) ? i_ref_log_likelihood   : 0;
            int_allele_log_likelihood_n[1] = (i_event_row_likelihood_valid) ? i_alt_0_log_likelihood : 0;
            int_allele_log_likelihood_n[2] = (i_event_row_likelihood_valid) ? i_alt_1_log_likelihood : 0;
            int_allele_log_likelihood_n[3] = (i_event_row_likelihood_valid) ? i_alt_2_log_likelihood : 0;
            int_allele_log_likelihood_n[4] = (i_event_row_likelihood_valid) ? i_alt_3_log_likelihood : 0;
            int_allele_log_likelihood_n[5] = (i_event_row_likelihood_valid) ? i_alt_4_log_likelihood : 0;
            int_allele_log_likelihood_n[6] = (i_event_row_likelihood_valid) ? i_alt_5_log_likelihood : 0;
            int_allele_log_likelihood_n[7] = (i_event_row_likelihood_valid) ? i_alt_6_log_likelihood : 0;
            int_allele_log_likelihood_n[8] = (i_event_row_likelihood_valid) ? i_alt_7_log_likelihood : 0;
            int_allele_log_likelihood_n[9] = (i_event_row_likelihood_valid) ? i_star_log_likelihood  : 0;
        end


        for (i=0;i<`ALTERNATIVE_AMOUNT+2;i=i+1) float_allele_log_likelihood_n[i] = float_allele_log_likelihood[i];
        if (!manual_rst_n || state == S_IDLE) for (i=0;i<`ALTERNATIVE_AMOUNT+2;i=i+1) float_allele_log_likelihood_n[i] = 0;
        else if (state == S_WAIT_INT2FPT && i2f_change_2_fpt_done[0]) begin
            float_allele_log_likelihood_n[0] = i2f_likelihood_fpt[0]; // the reference type
            float_allele_log_likelihood_n[1] = i2f_likelihood_fpt[1];
            float_allele_log_likelihood_n[2] = i2f_likelihood_fpt[2];
            float_allele_log_likelihood_n[3] = i2f_likelihood_fpt[3];
            float_allele_log_likelihood_n[4] = i2f_likelihood_fpt[4];
            float_allele_log_likelihood_n[5] = i2f_likelihood_fpt[5];
            float_allele_log_likelihood_n[6] = i2f_likelihood_fpt[6];
            float_allele_log_likelihood_n[7] = i2f_likelihood_fpt[7];
            float_allele_log_likelihood_n[8] = i2f_likelihood_fpt[8];
            float_allele_log_likelihood_n[9] = i2f_likelihood_fpt[9]; // the star type
        end


        event_addr_bias_n = event_addr_bias;
        if (!manual_rst_n || state == S_IDLE) event_addr_bias_n = 0;
        else if (state == S_WAIT_INPUT && i_event_row_likelihood_valid) event_addr_bias_n = `MAX_GT_AMOUNT*i_event_ID;
        else if (state == SS_SELECT_EVENT) event_addr_bias_n = `MAX_GT_AMOUNT*event_ID;

        latency_count_n = latency_count;
        if (!manual_rst_n || state == S_IDLE) latency_count_n = 0;
        else if (state == S_RESET_SRAM || state == SS_READ_SRAM) latency_count_n = (latency_count == `SRAM_LATENCY) ? 0 : latency_count + 1;
        else if (state == S_ACCUM || state == SSS_NORM) latency_count_n = (latency_count == `FP_ADDSUB_LATENCY) ? 0 : latency_count + 1;
        else if (state == SS_MULT_M10) latency_count_n = (latency_count == `FP_MULT_LATENCY) ? 0 : latency_count + 1;



        addr_n = addr;
        if (!manual_rst_n || state == S_IDLE)                               addr_n = 0;
        else if (state == S_RESET_SRAM)                                     addr_n = (addr == `PL_SRAM_WORD_AMOUNT-1) ? 0 : addr + 1;
        else if (state == S_WAIT_INPUT && i_event_row_likelihood_valid)     addr_n = `MAX_GT_AMOUNT*i_event_ID;
        else if (state == S_WRITE_SRAM)                                     addr_n = addr + 1;
        else if (state == SS_SELECT_EVENT)                                  addr_n = `MAX_GT_AMOUNT*event_ID;
        else if (state == SS_READ_SRAM && latency_count == `SRAM_LATENCY)   addr_n = addr + 1;
        



        for (i=0;i<`EVENT_AMOUNT;i=i+1) event_alt_1hot_n[i] = event_alt_1hot[i];
        A_allele_1hot_n = A_allele_1hot;
        if (!manual_rst_n || state == S_IDLE) begin
            A_allele_1hot_n = 0;
            for (i=0;i<`EVENT_AMOUNT;i=i+1) event_alt_1hot_n [i] = 0;
        end else if (state == S_WAIT_INPUT) begin
            A_allele_1hot_n = (i_event_row_likelihood_valid) ? {i_event_star_flag, i_event_variant_1hot, 1'b1} : 0;
            if (i_event_row_likelihood_valid) begin
                case(i_event_ID)
                    0: event_alt_1hot_n[0] = {i_event_star_flag, i_event_variant_1hot};
                    1: event_alt_1hot_n[1] = {i_event_star_flag, i_event_variant_1hot};
                    2: event_alt_1hot_n[2] = {i_event_star_flag, i_event_variant_1hot};
                    3: event_alt_1hot_n[3] = {i_event_star_flag, i_event_variant_1hot};
                    4: event_alt_1hot_n[4] = {i_event_star_flag, i_event_variant_1hot};
                    5: event_alt_1hot_n[5] = {i_event_star_flag, i_event_variant_1hot};
                    6: event_alt_1hot_n[6] = {i_event_star_flag, i_event_variant_1hot};
                    7: event_alt_1hot_n[7] = {i_event_star_flag, i_event_variant_1hot};
                endcase
            end

        end else if (state == S_GET_A) 
            A_allele_1hot_n = A_allele_1hot >> 1;

        
        
        allele_a_ID_n = allele_a_ID;
        if (!manual_rst_n || state == S_IDLE || state == S_WAIT_INPUT)
            allele_a_ID_n = 0;
        else if (state == S_GET_A)
            allele_a_ID_n = (A_allele_1hot[0]) ? allele_a_ID : allele_a_ID + 1;
        else if (state == S_GET_B && ~|B_allele_1hot)
            allele_a_ID_n = allele_a_ID + 1;

        
        
        
        B_allele_1hot_n = B_allele_1hot;
        if (!manual_rst_n || state == S_IDLE || state == S_WAIT_INPUT)
            B_allele_1hot_n = 0;
        else if (state == S_GET_A)
            B_allele_1hot_n = (A_allele_1hot[0]) ? A_allele_1hot : 0;
        else if (state == S_GET_B)
            B_allele_1hot_n = B_allele_1hot >> 1;

        
        
        allele_b_ID_n = allele_b_ID;
        if (!manual_rst_n || state == S_IDLE || state == S_WAIT_INPUT)
            allele_b_ID_n = 0;
        else if (state == S_GET_A)
            allele_b_ID_n = (A_allele_1hot[0]) ? allele_a_ID : 0;
        else if (state == S_GET_B)
            allele_b_ID_n = (B_allele_1hot[0]) ? allele_b_ID : allele_b_ID + 1;
        else if (state == S_WRITE_SRAM)
            allele_b_ID_n = allele_b_ID + 1;

        
        
        
        
        event_ID_n = event_ID;
        if (!manual_rst_n || state == S_IDLE)
            event_ID_n = 0;
        else if (state == S_WAIT_INPUT)
            event_ID_n = (i_event_row_likelihood_valid) ? i_event_ID : 0;
        else if (state == SSS_CALL_O2DRAM && i_o2dram_ready)
            event_ID_n = event_ID + 1;


        
        PL_result_n = PL_result;
        if (!manual_rst_n || state == S_IDLE) PL_result_n = 0;
        else if (state == S_WAIT_PL && ALU_o_PL_valid) PL_result_n = ALU_o_PL_value;
        else if (state == S_ACCUM && latency_count == `FP_ADDSUB_LATENCY) PL_result_n = FP_addsub_result;
        else if (state == SS_READ_SRAM && latency_count == `SRAM_LATENCY) PL_result_n = PL_SRAM_Q;
        else if (state == SS_MULT_M10 && latency_count == `FP_MULT_LATENCY) PL_result_n = FP_mult_result;



        
        
        for (i=0;i<`EVENT_AMOUNT;i=i+1) GT_amounts_n[i] = GT_amounts[i];
        if (!manual_rst_n || state == S_IDLE) 
            for (i=0;i<`EVENT_AMOUNT;i=i+1) GT_amounts_n[i] = 0;
        else if (state == S_WAIT_INPUT && i_event_row_likelihood_valid)
            for (i=0;i<`EVENT_AMOUNT;i=i+1) GT_amounts_n[i] = (i_event_ID == i) ? 0 : GT_amounts[i];
        else if (state == S_GET_B && B_allele_1hot[0])
            for (i=0;i<`EVENT_AMOUNT;i=i+1) GT_amounts_n[i] = (event_ID == i) ? (GT_amounts[i] + 1) : GT_amounts[i];
            

        
        
        GT_amount_n = GT_amount;
        if (!manual_rst_n || state == S_IDLE) GT_amount_n = 0;
        else if (state == SS_SELECT_EVENT) GT_amount_n = GT_amounts[event_ID];


        




        GT_count_n = GT_count;
        if (!manual_rst_n || state ==S_IDLE) GT_count_n = 0;
        else if (state == SS_SELECT_GT || state == SSS_SELECT_GT) GT_count_n = (GT_count == GT_amount) ? 0 : GT_count + 1;

        
        min_PL_n = min_PL;
        if (!manual_rst_n || state == S_IDLE || state == SSS_CALL_O2DRAM) min_PL_n = MAX_FP;
        else if (state == SS_FIND_MIN_PL && fp_comp_a_greater_than_b) min_PL_n = PL_result; 


        event_PLs_n = event_PLs;
        if (!manual_rst_n || state == S_IDLE || state == SS_SELECT_EVENT)   event_PLs_n = 0;
        else if (state == SS_MULT_M10 && latency_count == `FP_MULT_LATENCY) event_PLs_n = {event_PLs, FP_mult_result};
        // else if (state == SSS_SELECT_GT && GT_count != GT_amount)           event_PLs_n = {event_PLs[31:0], event_PLs[`MAX_GT_AMOUNT*32-1:32]};
        else if (state == SSS_NORM && latency_count == `FP_ADDSUB_LATENCY)  event_PLs_n = {FP_addsub_result, event_PLs[`MAX_GT_AMOUNT*32-1:32]};
    end


    always@(*) begin
        // PL_SRAM
        PL_SRAM_A = addr;
        PL_SRAM_D = PL_result;
        PL_SRAM_WEN = (state == S_RESET_SRAM || state == S_WRITE_SRAM);



        /**** submodule output ports control ****/
        // PL_ALU IO ports
        ALU_i_GT_valid = (state == S_CALL_PL);
        ALU_i_int_a_log_likelihood = 0;
        ALU_i_int_b_log_likelihood = 0;
        ALU_i_float_a_log_likelihood = 0;
        ALU_i_float_b_log_likelihood = 0;
        if (state == S_CALL_PL) begin
            case(allele_a_ID)
                0: begin
                    ALU_i_int_a_log_likelihood      = int_allele_log_likelihood  [0];
                    ALU_i_float_a_log_likelihood    = float_allele_log_likelihood[0];
                end
                1: begin
                    ALU_i_int_a_log_likelihood      = int_allele_log_likelihood  [1];
                    ALU_i_float_a_log_likelihood    = float_allele_log_likelihood[1];
                end
                2: begin
                    ALU_i_int_a_log_likelihood      = int_allele_log_likelihood  [2];
                    ALU_i_float_a_log_likelihood    = float_allele_log_likelihood[2];
                end
                3: begin
                    ALU_i_int_a_log_likelihood      = int_allele_log_likelihood  [3];
                    ALU_i_float_a_log_likelihood    = float_allele_log_likelihood[3];
                end
                4: begin
                    ALU_i_int_a_log_likelihood      = int_allele_log_likelihood  [4];
                    ALU_i_float_a_log_likelihood    = float_allele_log_likelihood[4];
                end
                5: begin
                    ALU_i_int_a_log_likelihood      = int_allele_log_likelihood  [5];
                    ALU_i_float_a_log_likelihood    = float_allele_log_likelihood[5];
                end
                6: begin
                    ALU_i_int_a_log_likelihood      = int_allele_log_likelihood  [6];
                    ALU_i_float_a_log_likelihood    = float_allele_log_likelihood[6];
                end
                7: begin
                    ALU_i_int_a_log_likelihood      = int_allele_log_likelihood  [7];
                    ALU_i_float_a_log_likelihood    = float_allele_log_likelihood[7];
                end
                8: begin
                    ALU_i_int_a_log_likelihood      = int_allele_log_likelihood  [8];
                    ALU_i_float_a_log_likelihood    = float_allele_log_likelihood[8];
                end
                9: begin
                    ALU_i_int_a_log_likelihood      = int_allele_log_likelihood  [9];
                    ALU_i_float_a_log_likelihood    = float_allele_log_likelihood[9];
                end
            endcase


            case(allele_b_ID)
                0: begin
                    ALU_i_int_b_log_likelihood      = int_allele_log_likelihood  [0];
                    ALU_i_float_b_log_likelihood    = float_allele_log_likelihood[0];
                end
                1: begin
                    ALU_i_int_b_log_likelihood      = int_allele_log_likelihood  [1];
                    ALU_i_float_b_log_likelihood    = float_allele_log_likelihood[1];
                end
                2: begin
                    ALU_i_int_b_log_likelihood      = int_allele_log_likelihood  [2];
                    ALU_i_float_b_log_likelihood    = float_allele_log_likelihood[2];
                end
                3: begin
                    ALU_i_int_b_log_likelihood      = int_allele_log_likelihood  [3];
                    ALU_i_float_b_log_likelihood    = float_allele_log_likelihood[3];
                end
                4: begin
                    ALU_i_int_b_log_likelihood      = int_allele_log_likelihood  [4];
                    ALU_i_float_b_log_likelihood    = float_allele_log_likelihood[4];
                end
                5: begin
                    ALU_i_int_b_log_likelihood      = int_allele_log_likelihood  [5];
                    ALU_i_float_b_log_likelihood    = float_allele_log_likelihood[5];
                end
                6: begin
                    ALU_i_int_b_log_likelihood      = int_allele_log_likelihood  [6];
                    ALU_i_float_b_log_likelihood    = float_allele_log_likelihood[6];
                end
                7: begin
                    ALU_i_int_b_log_likelihood      = int_allele_log_likelihood  [7];
                    ALU_i_float_b_log_likelihood    = float_allele_log_likelihood[7];
                end
                8: begin
                    ALU_i_int_b_log_likelihood      = int_allele_log_likelihood  [8];
                    ALU_i_float_b_log_likelihood    = float_allele_log_likelihood[8];
                end
                9: begin
                    ALU_i_int_b_log_likelihood      = int_allele_log_likelihood  [9];
                    ALU_i_float_b_log_likelihood    = float_allele_log_likelihood[9];
                end
            endcase

        end
        ALU_i_PL_CTRL_ready = (state == S_WAIT_PL);

        
        ALU_FP_addsub_result    = FP_addsub_result;
        ALU_FP_exp_result_a     = FP_exp_result_a;
        ALU_FP_exp_result_b     = FP_exp_result_b;
        ALU_FP_log_result       = FP_log_result;


        // for finding minimum PL to normailize PLs
        fp_comp_data_a = min_PL;
        fp_comp_data_b = PL_result;







        /***** module output ports *****/
        // from find max (date: 20201016)
        o_PL_ready = (state == S_WAIT_INPUT);

        // to Output_2_Dram
        o_event_data_valid      = 0;
        o_event_alt1hot         = 0;
        o_event_PLs             = 0;
        o_event_begin = 0;
        if (state == SSS_CALL_O2DRAM) begin
            o_event_data_valid = 1;

            case(event_ID)
                0: begin 
                    o_event_alt1hot = event_alt_1hot[0];
                    o_event_begin = event_begin_0;
                end
                1: begin 
                    o_event_alt1hot = event_alt_1hot[1];
                    o_event_begin = event_begin_1;
                end
                2: begin 
                    o_event_alt1hot = event_alt_1hot[2];
                    o_event_begin = event_begin_2;
                end
                3: begin 
                    o_event_alt1hot = event_alt_1hot[3];
                    o_event_begin = event_begin_3;
                end
                4: begin 
                    o_event_alt1hot = event_alt_1hot[4];
                    o_event_begin = event_begin_4;
                end
                5: begin 
                    o_event_alt1hot = event_alt_1hot[5];
                    o_event_begin = event_begin_5;
                end
                6: begin 
                    o_event_alt1hot = event_alt_1hot[6];
                    o_event_begin = event_begin_6;
                end
                7: begin 
                    o_event_alt1hot = event_alt_1hot[7];
                    o_event_begin = event_begin_7;
                end
            endcase

            o_event_PLs         = event_PLs;
        end

        // Floating point unit
        FP_addsub_data_a    = 0;
        FP_addsub_data_b    = 0;
        FP_addsub_op        = 0;
        if (state == S_CALL_PL || state == S_WAIT_PL) begin
            FP_addsub_data_a    = ALU_FP_addsub_data_a;
            FP_addsub_data_b    = ALU_FP_addsub_data_b;
            FP_addsub_op        = ALU_FP_addsub_op;
        end else if (state == S_ACCUM) begin
            FP_addsub_data_a    = PL_result;
            FP_addsub_data_b    = PL_SRAM_Q;
            FP_addsub_op        = 0; // 0: add
        end else if (state == SSS_NORM) begin
            FP_addsub_data_a    = event_PLs[31:0];
            FP_addsub_data_b    = min_PL;
            FP_addsub_op        = 1; // 1: sub
        end

        FP_exp_data_a  = ALU_FP_exp_data_a;
        FP_exp_data_b  = ALU_FP_exp_data_b;
        FP_log_data    = ALU_FP_log_data;
        FP_mult_data_a = (state == SS_MULT_M10) ? FP_M10 : 0;
        FP_mult_data_b = (state == SS_MULT_M10) ? PL_result : 0;

        // to Genotyping
        o_PL_region_done = (state == SSS_REGION_DONE);



        
    end


    // D Flip-flop
    // always@(posedge clk or negedge rst_n) begin
    always@(posedge clk) begin
        if (!rst_n) begin
            state <= S_IDLE;
            latency_count <= 0;
            event_addr_bias <= 0;
            addr <= 0;
            event_ID <= 0;

            // input data processing registers
            for (i=0;i<`ALTERNATIVE_AMOUNT+2;i=i+1) int_allele_log_likelihood  [i] <= 0;
            for (i=0;i<`ALTERNATIVE_AMOUNT+2;i=i+1) float_allele_log_likelihood[i] <= 0;

            for (i=0;i<`EVENT_AMOUNT;i=i+1) event_alt_1hot[i] <= 0;
            A_allele_1hot <= 0;
            B_allele_1hot <= 0;
            allele_a_ID <= 0;
            allele_b_ID <= 0;

            for (i=0;i<`EVENT_AMOUNT;i=i+1) GT_amounts[i] <= 0;
            GT_amount <= 0;
            
            PL_result <= 0;
            
            GT_count <= 0;
            min_PL <= MAX_FP;
            
            // normalization data registers
            event_PLs <= 0;

            // o_event_begin <= 0;
        end else begin
            state <= state_n;
            latency_count <= latency_count_n;
            event_addr_bias <= event_addr_bias_n;
            addr <= addr_n;
            event_ID <= event_ID_n;

            // input data processing registers
            for (i=0;i<`ALTERNATIVE_AMOUNT+2;i=i+1) int_allele_log_likelihood  [i] <= int_allele_log_likelihood_n  [i];
            for (i=0;i<`ALTERNATIVE_AMOUNT+2;i=i+1) float_allele_log_likelihood[i] <= float_allele_log_likelihood_n[i];

            for (i=0;i<`EVENT_AMOUNT;i=i+1)  event_alt_1hot[i] <= event_alt_1hot_n[i];
            A_allele_1hot <= A_allele_1hot_n;
            B_allele_1hot <= B_allele_1hot_n;
            allele_a_ID <= allele_a_ID_n;
            allele_b_ID <= allele_b_ID_n;

            for (i=0;i<`EVENT_AMOUNT;i=i+1) GT_amounts[i] <= GT_amounts_n[i];
            GT_amount <= GT_amount_n;
            
            PL_result <= PL_result_n;
            
            GT_count <= GT_count_n;
            min_PL <= min_PL_n;
            
            // normalization data registers
            event_PLs <= event_PLs_n;

            // o_event_begin <= o_event_begin_n;
        end
    end
endmodule
//----------------
// NTU DCS
// Receiver receive the alignmnet results (likelihoods) from pairHMM module
// and write the likelihoods to GEN_SRAM for "Find_max_likelihood" module.
//----------------
module Receiver (
    input                                            clk,
    input                                            rst_n,
    input                                            manual_rst_n,

    input signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0]   CONST_max_likelihood_difference,
    input signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0]   CONST_min_max_likelihood,

    // local constant
    input [$clog2(`READ_SRAM_WORD_AMOUNT):0]        read_amount_in_region,
    input [$clog2(`MAX_HAPLOTYPE_AMOUNT):0]         haplotype_amount_in_region,

    // global input/output
    input                                           i_region_valid,
    input                                           i_tx_invalid_read,
    output reg [$clog2(`READ_SRAM_WORD_AMOUNT):0]   o_rx_read_count,

    // From Genotyping Top
    input                                           i_find_max_ready,
    input                                           i_find_max_region_done,

    // Dynamic Programming
    output reg                                      o_rx_ready_for_DP,
    input                                           DW_i_geno_valid,
    input signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0]   DW_i_geno_alignment_score,
    input [$clog2(`GENO_SRAM_WORD_AMOUNT)-1:0]      DW_i_geno_address_ID,

    // Write Data to Genotype SRAM
    output reg                                      W_GEN_SRAM,
    output reg [$clog2(`GENO_SRAM_WORD_AMOUNT)-1:0] A_GEN_SRAM,
    output reg [`GENO_SRAM_BIT_PER_WORD-1:0]        D_GEN_SRAM,

    output reg                                      o_rx_one_read_done,
    output reg                                      o_rx_invalid_read,
    output reg signed [`DP_PAIRHMM_SCORE_BITWIDTH:0]o_cap_log_likelihood,
    output reg                                      o_rx_region_done,

    output reg [2:0]                                   state
);

    wire signed [`DP_PAIRHMM_SCORE_BITWIDTH:0] MINIMUM_LOG_LIKELIHOOD = {1'b1, {(`DP_PAIRHMM_SCORE_BITWIDTH){1'b0}}};
    wire signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0] THE_BIAS_SCORE = {1'b0, {(`DP_PAIRHMM_SCORE_BITWIDTH-1){1'b1}}};

    localparam  S_IDLE              = 3'd0,
                S_WAIT_LIKELIHOOD   = 3'd1,
                S_COMPARE           = 3'd2,
                S_WRITE_SRAM        = 3'd3,
                S_CHECK_HAP         = 3'd4,
                S_ONE_READ_DONE     = 3'd5,
                S_CHECK_READ        = 3'd6,
                S_REGION_DONE       = 3'd7;


    // Register
    reg [2:0]                                   state_n;
    reg                                         rx_invalid_read, rx_invalid_read_n;
    reg [$clog2(`READ_SRAM_WORD_AMOUNT):0]      read_count, read_count_n;
    reg [$clog2(`MAX_HAPLOTYPE_AMOUNT):0]       haplotype_count, haplotype_count_n;
    reg signed [`DP_PAIRHMM_SCORE_BITWIDTH:0]   likelihood, likelihood_n;
    reg [$clog2(`GENO_SRAM_WORD_AMOUNT)-1:0]    haplotype_ID, haplotype_ID_n;
    reg signed [`DP_PAIRHMM_SCORE_BITWIDTH:0]   row_max_log_likelihood, row_max_log_likelihood_n;



    wire less_than_min_max = row_max_log_likelihood < CONST_min_max_likelihood;

    always@(*) begin
        state_n = state;
        if (!manual_rst_n) state_n = S_IDLE;
        else begin
            case(state)
                S_IDLE:             state_n = (i_region_valid) ? S_WAIT_LIKELIHOOD : state;
                S_WAIT_LIKELIHOOD:  state_n = (i_tx_invalid_read) ? S_ONE_READ_DONE : ((DW_i_geno_valid) ? S_COMPARE : state);
                S_COMPARE:          state_n = S_WRITE_SRAM;
                S_WRITE_SRAM:       state_n = S_CHECK_HAP;
                S_CHECK_HAP:        state_n = (haplotype_count == haplotype_amount_in_region) ? S_ONE_READ_DONE : S_WAIT_LIKELIHOOD;
                S_ONE_READ_DONE:    state_n = (i_find_max_ready) ? S_CHECK_READ : state;
                S_CHECK_READ:       state_n = (read_count == read_amount_in_region) ? S_REGION_DONE : S_WAIT_LIKELIHOOD;
                S_REGION_DONE:      state_n = (i_find_max_region_done) ? S_IDLE : state;
            endcase
        end
    end
    



    // registers control
    always@(*) begin

        rx_invalid_read_n = rx_invalid_read;
        if (!manual_rst_n || state == S_IDLE || state == S_CHECK_READ) rx_invalid_read_n = 0;
        else if (state == S_WAIT_LIKELIHOOD) rx_invalid_read_n = i_tx_invalid_read;


        read_count_n = read_count;
        if (!manual_rst_n || state == S_IDLE) read_count_n = 0;
        else if (state == S_ONE_READ_DONE && i_find_max_ready) read_count_n = read_count + 1;


        haplotype_count_n = haplotype_count;
        if (!manual_rst_n || state == S_IDLE || state == S_CHECK_READ) haplotype_count_n = 0;
        else if (state == S_WRITE_SRAM) haplotype_count_n = haplotype_count + 1;

        haplotype_ID_n = haplotype_ID;
        likelihood_n = likelihood;
        if (!manual_rst_n || state == S_IDLE || state == S_WRITE_SRAM) begin
            haplotype_ID_n = 0;
            likelihood_n = 0;
        end else if (state == S_WAIT_LIKELIHOOD && DW_i_geno_valid) begin
            haplotype_ID_n = DW_i_geno_address_ID;
            likelihood_n = DW_i_geno_alignment_score - THE_BIAS_SCORE;
        end


        row_max_log_likelihood_n = row_max_log_likelihood;
        if (!manual_rst_n || state == S_IDLE || (state == S_ONE_READ_DONE && i_find_max_ready))  row_max_log_likelihood_n = MINIMUM_LOG_LIKELIHOOD;
        else if (state == S_COMPARE) row_max_log_likelihood_n = (likelihood > row_max_log_likelihood) ? likelihood : row_max_log_likelihood;
    end


    // output port control
    always@(*) begin
        o_rx_read_count = read_count;

        o_rx_invalid_read = (state == S_ONE_READ_DONE) && (rx_invalid_read || less_than_min_max);

        o_cap_log_likelihood = (state == S_ONE_READ_DONE) ? (row_max_log_likelihood - CONST_max_likelihood_difference) : 0;

        // Dynamic Programming
        o_rx_ready_for_DP = (state == S_WAIT_LIKELIHOOD);

        // Write Data to Genotype SRAM
        W_GEN_SRAM = (state == S_WRITE_SRAM);
        A_GEN_SRAM = haplotype_ID;
        D_GEN_SRAM = likelihood;

        o_rx_one_read_done = (state == S_ONE_READ_DONE);
        o_rx_region_done = (state == S_REGION_DONE);
    end




    // D Flip-flop
    // always@(posedge clk or negedge rst_n) begin
    always@(posedge clk ) begin
        if (!rst_n) begin
            state           <= S_IDLE;
            rx_invalid_read <= 0;
            read_count      <= 0;
            haplotype_count <= 0;
            likelihood      <= 0;
            haplotype_ID    <= 0;
            row_max_log_likelihood <= MINIMUM_LOG_LIKELIHOOD;
        end else begin
            state           <= state_n;
            rx_invalid_read <= rx_invalid_read_n;
            read_count      <= read_count_n;
            haplotype_count <= haplotype_count_n;
            likelihood      <= likelihood_n;
            haplotype_ID    <= haplotype_ID_n;
            row_max_log_likelihood <= row_max_log_likelihood_n;
        end
    end


endmodule

//----------------
// NTU DCS
// Transmitter read short-reads and haplotypes from SRAM and transmit data
// to pairHMM module.
//----------------
module Transmitter (
    input                                           clk,
    input                                           rst_n,
    input                                           manual_rst_n,

    // global constants
    input [8:0]                                     CONST_read_length, 

    // local constants
    input [$clog2(`READ_SRAM_WORD_AMOUNT):0]        read_amount_in_region,         
    input [$clog2(`MAX_HAPLOTYPE_AMOUNT):0]         haplotype_amount_in_region,
    input [31:0]                                    location_bias,
    input [9:0]                                     var_location_min,
    input [9:0]                                     var_location_max,

    input                                           i_region_valid,
    input                                           i_rx_one_read_done,
    input                                           i_rx_region_done,
    input                                           i_find_max_ready, 

    // Accsess SRAM
    input       [`READ_SRAM_BIT_PER_WORD-1:0]           Q_READ_SRAM,
    output reg  [$clog2(`READ_SRAM_WORD_AMOUNT)-1:0]    A_READ_SRAM,
    input       [`HAP_SRAM_BIT_PER_WORD-1:0]            Q_HAP_SRAM,
    output reg  [$clog2(`HAP_SRAM_WORD_AMOUNT)-1:0]     A_HAP_SRAM,

    // Dynamic Programming
    input                                           DW_i_geno_ready,                    // Meaning that DP has recieved data
    output reg                                      DW_o_geno_valid,                    // When the Data is arrived, i_geno_valid = 1
    output reg [2*`HAP_MAX_LENGTH-1:0]              DW_o_geno_sequence_A,               // Reference: Haplotype
    output reg [2*`READ_MAX_LENGTH-1:0]             DW_o_geno_sequence_B,               // Query: Short-read
    output reg [2*`READ_MAX_LENGTH-1:0]             DW_o_geno_sequence_B_qualities,     // Read Quality
    output reg [$clog2(`HAP_MAX_LENGTH):0]          DW_o_geno_seq_A_length,             // Haplotype Length [0~512 (1-based)]
    output reg [$clog2(`GENO_SRAM_WORD_AMOUNT)-1:0] DW_o_geno_address_ID,               // Address for Genotype SRAM
    
    output reg                                      o_tx_invalid_read,
    output reg                                      o_tx_region_done,
    output reg [3:0]                                   state
    
);


    localparam  S_IDLE              = 4'd0,
                S_READ_READ_SRAM    = 4'd1,
                S_CHECK_READ        = 4'd2,
                S_READ_HAP_SRAM     = 4'd3,
                S_CALL_DP           = 4'd4,
                S_CHECK_HAP         = 4'd5,
                S_ONE_READ_DONE     = 4'd6,
                S_REGION_DONE       = 4'd7;

    // Register
    reg [3:0]                                   state_n;
    reg [2:0]                                   sram_rw_count, sram_rw_count_n;
    reg [$clog2(`READ_SRAM_WORD_AMOUNT):0]      read_count, read_count_n;
    reg [$clog2(`MAX_HAPLOTYPE_AMOUNT):0]       haplotype_count, haplotype_count_n;
    reg [2*`HAP_MAX_LENGTH-1:0]                 haplotype, haplotype_n;
    reg [31:0]                                  read_location, read_location_n;
    reg [2*`READ_MAX_LENGTH-1:0]                read, read_n;
    reg [2*`READ_MAX_LENGTH-1:0]                read_quality, read_quality_n;
    reg [$clog2(`HAP_MAX_LENGTH):0]             haplotype_length, haplotype_length_n;
    



    wire [31:0]     var_loc_min_calib = location_bias + var_location_min - `SKIP_READ_BASE_MARGIN;
    wire [31:0]     var_loc_max_calib = location_bias + var_location_max + `SKIP_READ_BASE_MARGIN;


    wire            skip_lower = (read_location + CONST_read_length < var_loc_min_calib);
    wire            skip_upper = (read_location > var_loc_max_calib);
    
    wire            invalid_read = skip_lower || skip_upper;

    


    always@(*) begin
        state_n = state;
        if (!manual_rst_n) state_n = S_IDLE;
        else begin
            case(state)
                S_IDLE:             state_n = (i_region_valid) ? S_READ_READ_SRAM : state;
                S_READ_READ_SRAM:   state_n = (sram_rw_count == `SRAM_LATENCY) ? S_CHECK_READ : state;
                S_CHECK_READ:       state_n = (invalid_read) ? S_ONE_READ_DONE : S_READ_HAP_SRAM;
                S_READ_HAP_SRAM:    state_n = (sram_rw_count == `SRAM_LATENCY) ? S_CALL_DP : state;
                S_CALL_DP:          state_n = (DW_i_geno_ready) ? S_CHECK_HAP : state;
                S_CHECK_HAP:        state_n = (haplotype_count == haplotype_amount_in_region) ? S_ONE_READ_DONE : S_READ_HAP_SRAM;
                S_ONE_READ_DONE: begin
                    if (i_rx_one_read_done && i_find_max_ready) begin
                        state_n = (read_count == read_amount_in_region - 1) ? S_REGION_DONE : S_READ_READ_SRAM;
                    end
                end
                S_REGION_DONE:      state_n = (i_rx_region_done) ? S_IDLE : state;
            endcase
        end
    end


    


    always@(*) begin
        sram_rw_count_n = sram_rw_count;
        if (!manual_rst_n || state == S_IDLE) sram_rw_count_n = 0;
        else if (state == S_READ_READ_SRAM || state == S_READ_HAP_SRAM) sram_rw_count_n = (sram_rw_count == `SRAM_LATENCY) ? 0 :sram_rw_count + 1;


        
        read_location_n = read_location;
        read_n          = read;
        read_quality_n  = read_quality;
        if (!manual_rst_n || state == S_IDLE) begin
            read_location_n = 0;
            read_n          = 0;
            read_quality_n  = 0;
        end else if (state == S_READ_READ_SRAM && sram_rw_count == `SRAM_LATENCY) begin
            read_location_n = Q_READ_SRAM[512+:32];
            read_n          = Q_READ_SRAM[1023-:(2*`READ_MAX_LENGTH)]; // READ_MAX_LENGTH = 150
            read_quality_n  = Q_READ_SRAM[511-:(2*`READ_MAX_LENGTH)];
        end

        
        
        read_count_n    = read_count;
        if (!manual_rst_n || state == S_IDLE) read_count_n = 0;
        else if (state == S_ONE_READ_DONE && i_rx_one_read_done && i_find_max_ready) read_count_n = read_count + 1;


        

        haplotype_count_n   = haplotype_count;
        haplotype_n         = haplotype;
        haplotype_length_n  = haplotype_length;
        if (!manual_rst_n || state == S_IDLE || state == S_READ_READ_SRAM) begin
            haplotype_count_n   = 0;
            haplotype_n         = 0;
            haplotype_length_n  = 0;
        end else if (state == S_READ_HAP_SRAM && sram_rw_count == `SRAM_LATENCY) begin
            haplotype_n         = Q_HAP_SRAM[(`HAP_SRAM_BIT_PER_WORD-1)-:(2*`HAP_MAX_LENGTH)];
            haplotype_length_n  = Q_HAP_SRAM[$clog2(`HAP_MAX_LENGTH):0];
        end else if (state == S_CALL_DP && DW_i_geno_ready) begin
            haplotype_count_n = haplotype_count + 1;
        end

        
    end


    // output control
    always@(*) begin
        // Accsess SRAM
        A_READ_SRAM = read_count + 1;
        A_HAP_SRAM  = haplotype_count;

        // Dynamic Programming
        DW_o_geno_valid                 = (state == S_CALL_DP);
        DW_o_geno_sequence_A            = haplotype;
        DW_o_geno_sequence_B            = read;
        DW_o_geno_sequence_B_qualities  = read_quality;
        DW_o_geno_seq_A_length          = haplotype_length;
        DW_o_geno_address_ID            = haplotype_count;
        
        o_tx_invalid_read  = (state == S_ONE_READ_DONE) && (skip_lower | skip_upper);
        o_tx_region_done   = (state == S_REGION_DONE);
    end



    // D Flip-flop
    // always@(posedge clk or negedge rst_n) begin
    always@(posedge clk ) begin
        if (!rst_n) begin
            state             <= S_IDLE;
            sram_rw_count     <= 0;
            read_count        <= 0;
            haplotype_count   <= 0;
            haplotype         <= 0;
            read_location     <= 0;
            read              <= 0;
            read_quality      <= 0;
            haplotype_length  <= 0;
        end else begin
            state              <= state_n;
            sram_rw_count      <= sram_rw_count_n;
            read_count         <= read_count_n;
            haplotype_count    <= haplotype_count_n;
            haplotype          <= haplotype_n;
            read_location      <= read_location_n;
            read               <= read_n;
            read_quality       <= read_quality_n;
            haplotype_length   <= haplotype_length_n;
        end
    end


endmodule
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

endmodule//----------------
// NTU DCS
// Yen-Lung Chen
//----------------
// insertion and deletion are both dased on query sequency

module DP_geno_ALU(

    ///////////////////////////////////// I/Os //////////////////////////////////////
    input                                   i_A_base_valid,
    input                                   i_B_base_valid,
    input [1:0]                             i_A_base,          // reference one.   Mapping: reference sequence
    input [1:0]                             i_B_base,          // query one.       Mapping: short-read
    input [1:0]                             i_B_base_quality,  // quantized read quality score

    input signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0]   i_align_top_score,
    input signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0]   i_align_diagonal_score,
    input signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0]   i_align_left_score,
    input signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0]   i_insert_top_score,
    input signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0]   i_insert_diagonal_score,
    input signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0]   i_insert_left_score,
    input signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0]   i_delete_diagonal_score,
    input signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0]   i_delete_left_score,

    output signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0]  o_align_score,
    output signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0]  o_insert_score,
    output signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0]  o_delete_score,
    
    output signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0]  o_the_score
    
);

localparam signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0] MOST_NEGATIVE = {1'b1, {(`DP_PAIRHMM_SCORE_BITWIDTH-1){1'b0}}};

//-----------
// DESIGN
//-----------
wire o_valid = i_A_base_valid & i_B_base_valid;

// ---------------------- align score ----------------------
reg signed [`CONST_MATCH_BITWIDTH-1:0] the_match_prior;
always@(*) begin
	case(i_B_base_quality)
	2'd0: the_match_prior = `CONST_BQ0_MATCH_SCORE;
	2'd1: the_match_prior = `CONST_BQ1_MATCH_SCORE;
	2'd2: the_match_prior = `CONST_BQ2_MATCH_SCORE;
	2'd3: the_match_prior = `CONST_BQ3_MATCH_SCORE;
	endcase
end

reg signed [`CONST_MISMATCH_BITWIDTH-1:0] the_mismatch_prior;
always@(*) begin
	case(i_B_base_quality)
	2'd0: the_mismatch_prior = `CONST_BQ0_MISMATCH_SCORE;
	2'd1: the_mismatch_prior = `CONST_BQ1_MISMATCH_SCORE;
	2'd2: the_mismatch_prior = `CONST_BQ2_MISMATCH_SCORE;
	2'd3: the_mismatch_prior = `CONST_BQ3_MISMATCH_SCORE;
	endcase
end

wire signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0] prior = (i_A_base == i_B_base) ? the_match_prior : the_mismatch_prior;

wire signed [`DP_PAIRHMM_SCORE_BITWIDTH:0] align_candidate_A_extended = i_align_diagonal_score + `CONST_M2M;

wire INDEL_tell = (i_insert_diagonal_score > i_delete_diagonal_score);

wire signed [`DP_PAIRHMM_SCORE_BITWIDTH:0] align_candidate_INDEL_sel = INDEL_tell ? i_insert_diagonal_score : i_delete_diagonal_score;
wire signed [`DP_PAIRHMM_SCORE_BITWIDTH:0] align_candidate_INDEL_extended = align_candidate_INDEL_sel + `CONST_I2M;

wire align_INDEL_greater_than_SNP = (align_candidate_INDEL_extended > align_candidate_A_extended);

wire signed [`DP_PAIRHMM_SCORE_BITWIDTH:0] pre_align_score_extended = align_INDEL_greater_than_SNP ? align_candidate_INDEL_extended : align_candidate_A_extended;

wire signed [`DP_PAIRHMM_SCORE_BITWIDTH:0] align_score_extended = pre_align_score_extended + prior;

assign o_align_score = (o_valid) ? ( (align_score_extended < MOST_NEGATIVE) ? MOST_NEGATIVE : align_score_extended ) : i_align_left_score;

// ---------------------- insert score ----------------------
wire signed [`DP_PAIRHMM_SCORE_BITWIDTH:0] insert_candidate_A_extended = i_align_top_score + `CONST_M2I; 
wire signed [`DP_PAIRHMM_SCORE_BITWIDTH:0] insert_candidate_I_extended = i_insert_top_score + `CONST_I2I;

wire insert_I_greater_than_A = (insert_candidate_I_extended > insert_candidate_A_extended);

wire signed [`DP_PAIRHMM_SCORE_BITWIDTH:0] insert_score_extended = (insert_I_greater_than_A) ? insert_candidate_I_extended :  insert_candidate_A_extended;

assign o_insert_score = (o_valid) ? ((insert_score_extended < MOST_NEGATIVE) ? MOST_NEGATIVE : insert_score_extended) : i_insert_left_score;

// ---------------------- delete score ----------------------
wire signed [`DP_PAIRHMM_SCORE_BITWIDTH:0] delete_candidate_A_extended = i_align_left_score + `CONST_M2I; 
wire signed [`DP_PAIRHMM_SCORE_BITWIDTH:0] delete_candidate_D_extended = i_delete_left_score + `CONST_I2I;

wire delete_D_greater_than_A = (delete_candidate_D_extended > delete_candidate_A_extended);

wire signed [`DP_PAIRHMM_SCORE_BITWIDTH:0] delete_score_extended = (delete_D_greater_than_A) ? delete_candidate_D_extended :  delete_candidate_A_extended;

assign o_delete_score = (o_valid) ? ( (delete_score_extended < MOST_NEGATIVE) ? MOST_NEGATIVE : delete_score_extended ) : i_delete_left_score;

wire signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0] delete_insert_sel = (o_delete_score > o_insert_score) ? o_delete_score : o_insert_score;
assign o_the_score = (delete_insert_sel > o_align_score) ? delete_insert_sel : o_align_score;

endmodule

/*
module DP_geno_Array_single(
    /////////////////////////////////////// Basics /////////////////////////////////////
    input                                       clk,
    input                                       rst_n,
   
    ////////////////////////////////////// Mapping I/Os ////////////////////////////////////// 
    output reg                              o_ready,
    input                                   i_valid,
    input [2*`HAP_MAX_LENGTH-1:0]           i_sequence_A,          // reference one.   Mapping: reference sequence
    input [2*`READ_MAX_LENGTH-1:0]          i_sequence_B,          // query one.       Mapping: short-read
    input [2*`READ_MAX_LENGTH-1:0]          i_sequence_B_qualities,    // quantized read quality score
    input [$clog2(`HAP_MAX_LENGTH):0]       i_seq_A_length,        // 0~512 (1-based)
    input [$clog2(`READ_MAX_LENGTH):0]      i_seq_B_length,        // 0~512 (1-based)
    input [$clog2(`GENO_SRAM_WORD_AMOUNT)-1:0]      i_geno_address_ID,             // only Genotyping
    input                                   i_ready,
    output reg                              o_valid,
    output reg signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0]      o_alignment_score,      // Mapping: SW score
    output reg [$clog2(`GENO_SRAM_WORD_AMOUNT)-1:0]                 o_geno_address_ID      // only Genotyping
);
    integer i, j, k, l;
    genvar gv;
    localparam  S_idle                  = 4'd0,
                S_input                 = 4'd1,
                S_calculate             = 4'd2,
                S_select_highest        = 4'd3,
                S_hold                  = 4'd4,
                S_output_score          = 4'd5,
                S_backtrace_and_output  = 4'd6,
                S_done                  = 4'd7;

    localparam MOST_NEGATIVE = {1'b1, {(`DP_PAIRHMM_SCORE_BITWIDTH-1){1'b0}}};
    localparam MOST_POSITIVE = {1'b0, {(`DP_PAIRHMM_SCORE_BITWIDTH-1){1'b1}}};










    ///////////////////////////// main registers ////////////////////////////////
    reg [3:0]                                           state, state_n;
    reg [$clog2(`HAP_MAX_LENGTH+`READ_MAX_LENGTH):0]    counter, counter_n;
    reg [2*`HAP_MAX_LENGTH-1:0]                         sequence_A, sequence_A_n;
    reg [2*`READ_MAX_LENGTH-1:0]                        sequence_B, sequence_B_n;
    reg [2*`READ_MAX_LENGTH-1:0]                        sequence_B_qualities, sequence_B_qualities_n;
    reg [$clog2(`HAP_MAX_LENGTH):0]                     seq_A_length, seq_A_length_n;
    reg [$clog2(`READ_MAX_LENGTH):0]                    seq_B_length, seq_B_length_n;
    reg [$clog2(`READ_MAX_LENGTH):0]                    shift_counter, shift_counter_n;
    reg                                                 sequence_A_valid[0:`HAP_MAX_LENGTH-1], sequence_A_valid_n[0:`HAP_MAX_LENGTH-1];
    reg                                                 sequence_B_valid[0:`READ_MAX_LENGTH-1], sequence_B_valid_n[0:`READ_MAX_LENGTH-1];
    reg                                                 sequence_A_valid_shifter[0:`HAP_MAX_LENGTH-1], sequence_A_valid_shifter_n[0:`HAP_MAX_LENGTH-1];
    reg [2*`HAP_MAX_LENGTH-1:0]                         sequence_A_shifter, sequence_A_shifter_n;
    reg [$clog2(`GENO_SRAM_WORD_AMOUNT)-1:0]            geno_address_ID, geno_address_ID_n;
    
    reg signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0]         PE_align_score_d  [0:`READ_MAX_LENGTH-1],   PE_align_score_d_n [0:`READ_MAX_LENGTH-1];
    reg signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0]         PE_insert_score_d [0:`READ_MAX_LENGTH-1],  PE_insert_score_d_n [0:`READ_MAX_LENGTH-1];
    reg signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0]         PE_delete_score_d [0:`READ_MAX_LENGTH-1],  PE_delete_score_d_n [0:`READ_MAX_LENGTH-1];
    reg signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0]         PE_align_score_dd [0:`READ_MAX_LENGTH-1],  PE_align_score_dd_n [0:`READ_MAX_LENGTH-1];
    reg signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0]         PE_insert_score_dd[0:`READ_MAX_LENGTH-1], PE_insert_score_dd_n [0:`READ_MAX_LENGTH-1];
    reg signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0]         PE_delete_score_dd[0:`READ_MAX_LENGTH-1], PE_delete_score_dd_n [0:`READ_MAX_LENGTH-1];
    
    reg [`READ_MAX_LENGTH*`DP_PAIRHMM_SCORE_BITWIDTH-1:0]  row_highest_score, row_highest_score_n;
    reg signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0]            split_row_highest_score[0:`READ_MAX_LENGTH-1];
    always@(*) begin 
        for (i=0;i<`READ_MAX_LENGTH;i=i+1) split_row_highest_score[i] = row_highest_score[i*`DP_PAIRHMM_SCORE_BITWIDTH+:`DP_PAIRHMM_SCORE_BITWIDTH];
    end





    //----------------------------------------------------------------------------------------
    wire                                            PE_valid                  [0:`READ_MAX_LENGTH-1];
    wire signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0]    PE_align_score            [0:`READ_MAX_LENGTH-1];
    wire signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0]    PE_insert_score           [0:`READ_MAX_LENGTH-1];
    wire signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0]    PE_delete_score           [0:`READ_MAX_LENGTH-1];

    wire signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0]    PE_the_score              [0:`READ_MAX_LENGTH-1];
    wire                                            PE_last_A_base_valid      [0:`READ_MAX_LENGTH-1];
    wire [1:0]                                      PE_last_A_base            [0:`READ_MAX_LENGTH-1];
    generate
        for (gv=0;gv<`READ_MAX_LENGTH;gv=gv+1) begin: PEs
            if (gv==0) begin
                DP_geno_PE_single u_PE_single(
                    ///////////////////////////////////// basics /////////////////////////////////////
                    .clk                        (clk),
                    .rst_n                      (rst_n),
                    ///////////////////////////////////// I/Os //////////////////////////////////////
                    .i_A_base_valid             (sequence_A_valid_shifter[0]),
                    .i_A_base                   (sequence_A_shifter[2*`HAP_MAX_LENGTH-1-:2]),
                    .i_B_base_valid             (sequence_B_valid[gv]),
                    .i_B_base                   (sequence_B[2*`READ_MAX_LENGTH-1-2*gv-:2]),
                    .i_B_base_quality           (sequence_B_qualities[2*`READ_MAX_LENGTH-1-2*gv-:2]),
                    
                    .i_align_top_score          (MOST_NEGATIVE),
                    .i_insert_top_score         (MOST_NEGATIVE),
                    
                    .i_align_diagonal_score     (MOST_NEGATIVE),
                    .i_insert_diagonal_score    (MOST_NEGATIVE),
                    .i_delete_diagonal_score    (MOST_POSITIVE),

                    .i_align_left_score         (PE_align_score_d[gv]),
                    .i_insert_left_score        (PE_insert_score_d[gv]),
                    .i_delete_left_score        (PE_delete_score_d[gv]),

                    .o_align_score              (PE_align_score[gv]),
                    .o_insert_score             (PE_insert_score[gv]),
                    .o_delete_score             (PE_delete_score[gv]),

                    .o_the_score                (PE_the_score[gv]),
                    .o_last_A_base_valid        (PE_last_A_base_valid[gv]),
                    .o_last_A_base              (PE_last_A_base[gv])
                );    
            end else begin
                DP_geno_PE_single u_PE_single(
                    ///////////////////////////////////// basics /////////////////////////////////////
                    .clk                        (clk),
                    .rst_n                      (rst_n),
                    ///////////////////////////////////// I/Os //////////////////////////////////////
                    .i_A_base_valid             (PE_last_A_base_valid[gv-1]),
                    .i_A_base                   (PE_last_A_base[gv-1]),
                    .i_B_base_valid             (sequence_B_valid[gv]),
                    .i_B_base                   (sequence_B[2*`READ_MAX_LENGTH-1-2*gv-:2]),
                    .i_B_base_quality           (sequence_B_qualities[2*`READ_MAX_LENGTH-1-2*gv-:2]),
                    
                    .i_align_top_score          (PE_align_score_d[gv-1]),
                    .i_insert_top_score         (PE_insert_score_d[gv-1]),
                    
                    .i_align_diagonal_score     (PE_align_score_dd[gv-1]),
                    .i_insert_diagonal_score    (PE_insert_score_dd[gv-1]),
                    .i_delete_diagonal_score    (PE_delete_score_dd[gv-1]),

                    .i_align_left_score         (PE_align_score_d[gv]),
                    .i_insert_left_score        (PE_insert_score_d[gv]),
                    .i_delete_left_score        (PE_delete_score_d[gv]),

                    .o_align_score              (PE_align_score[gv]),
                    .o_insert_score             (PE_insert_score[gv]),
                    .o_delete_score             (PE_delete_score[gv]),

                    .o_the_score                (PE_the_score[gv]),
                    .o_last_A_base_valid        (PE_last_A_base_valid[gv]),
                    .o_last_A_base              (PE_last_A_base[gv])
                );    
            end
            
            
        end
    endgenerate











    //////////////////////////// state control ////////////////////////////
    always@(*)
    begin
        state_n = state;
        case(state)
            S_idle:             state_n = (i_valid) ? S_input : state;

            S_input:            state_n = S_calculate;

            S_calculate:        state_n = (counter == seq_A_length + seq_B_length - 1) ? S_select_highest : state;

            S_select_highest:   state_n = (|shift_counter) ? state : S_output_score;

            S_output_score:     state_n = (i_ready) ? S_idle : state;
        endcase
    end





    ///////////////////// main design ///////////////////
    always@(*)
    begin
        //////////////////////////////////////////// registers ////////////////////////////////////////////
        counter_n                                                               = counter;
        sequence_A_n                                                            = sequence_A;
        sequence_B_n                                                            = sequence_B;
        sequence_B_qualities_n                                                  = sequence_B_qualities;
        seq_A_length_n                                                          = seq_A_length;
        seq_B_length_n                                                          = seq_B_length;
        shift_counter_n                                                         = shift_counter;
        for (i=0;i<`HAP_MAX_LENGTH;i=i+1) sequence_A_valid_n[i]                 = sequence_A_valid[i];
        for (i=0;i<`READ_MAX_LENGTH;i=i+1) sequence_B_valid_n[i]                = sequence_B_valid[i];
        for (i=0;i<`HAP_MAX_LENGTH;i=i+1) sequence_A_valid_shifter_n[i]         = sequence_A_valid_shifter[i];
        sequence_A_shifter_n                                                    = sequence_A_shifter;
        geno_address_ID_n                                                      = geno_address_ID;
 
        for (i=0;i<`READ_MAX_LENGTH;i=i+1) PE_align_score_d_n  [i]        = PE_align_score_d [i];
        for (i=0;i<`READ_MAX_LENGTH;i=i+1) PE_insert_score_d_n [i]        = PE_insert_score_d [i];
        for (i=0;i<`READ_MAX_LENGTH;i=i+1) PE_delete_score_d_n [i]        = PE_delete_score_d [i];
        for (i=0;i<`READ_MAX_LENGTH;i=i+1) PE_align_score_dd_n [i]        = PE_align_score_dd [i];
        for (i=0;i<`READ_MAX_LENGTH;i=i+1) PE_insert_score_dd_n[i]        = PE_insert_score_dd [i];
        for (i=0;i<`READ_MAX_LENGTH;i=i+1) PE_delete_score_dd_n[i]        = PE_delete_score_dd [i];
        
        row_highest_score_n = row_highest_score;
        



        //////////////////////////////////////////// output ports ////////////////////////////////////////////
        o_ready                 = 0;
        o_valid                 = 0;
        o_alignment_score       = 0;
        o_geno_address_ID      = geno_address_ID;





        case(state)
            S_idle:
            begin
                //////////////////////////////////////////// registers ////////////////////////////////////////////
                counter_n                                                               = 0;
                sequence_A_n                                                            = (i_valid) ? i_sequence_A : 0;
                sequence_B_n                                                            = (i_valid) ? i_sequence_B : 0;
                sequence_B_qualities_n                                                  = (i_valid) ? i_sequence_B_qualities : 0;
                seq_A_length_n                                                          = (i_valid) ? i_seq_A_length : 0;
                seq_B_length_n                                                          = (i_valid) ? i_seq_B_length : 0;
                shift_counter_n                                                         = 0;
                for (i=0;i<`HAP_MAX_LENGTH;i=i+1) sequence_A_valid_n[i]                 = 0;
                for (i=0;i<`READ_MAX_LENGTH;i=i+1) sequence_B_valid_n[i]                = 0;
                for (i=0;i<`HAP_MAX_LENGTH;i=i+1) sequence_A_valid_shifter_n[i]         = 0;
                sequence_A_shifter_n                                                    = (i_valid) ? i_sequence_A : 0;
                geno_address_ID_n                                                      = (i_valid) ? i_geno_address_ID : 0;
                
                

                for (i=0;i<`READ_MAX_LENGTH;i=i+1) PE_align_score_d_n  [i] = MOST_NEGATIVE;
                for (i=0;i<`READ_MAX_LENGTH;i=i+1) PE_insert_score_d_n [i] = MOST_NEGATIVE;
                for (i=0;i<`READ_MAX_LENGTH;i=i+1) PE_delete_score_d_n [i] = MOST_NEGATIVE;
                for (i=0;i<`READ_MAX_LENGTH;i=i+1) PE_align_score_dd_n [i] = MOST_NEGATIVE;
                for (i=0;i<`READ_MAX_LENGTH;i=i+1) PE_insert_score_dd_n[i] = MOST_NEGATIVE;
                for (i=0;i<`READ_MAX_LENGTH;i=i+1) PE_delete_score_dd_n[i] = MOST_NEGATIVE;

                for (i=0;i<`READ_MAX_LENGTH;i=i+1) row_highest_score_n[i*`DP_PAIRHMM_SCORE_BITWIDTH+:`DP_PAIRHMM_SCORE_BITWIDTH] = MOST_NEGATIVE;
                ///////////////////////////////// output ports ////////////////////////
                o_ready = 1;
            end

            S_input: begin
                //////////////////////////// registers assignmnet ////////////////////////////
                for (i=0;i<`HAP_MAX_LENGTH;i=i+1) sequence_A_valid_n[i]             = (i < seq_A_length) ? 1 : 0;
                for (i=0;i<`READ_MAX_LENGTH;i=i+1) sequence_B_valid_n[i]            = (i < seq_B_length) ? 1 : 0;
                for (i=0;i<`HAP_MAX_LENGTH;i=i+1) sequence_A_valid_shifter_n[i]     = (i < seq_A_length) ? 1 : 0;

                shift_counter_n = `READ_MAX_LENGTH - seq_B_length;
            end

            S_calculate: begin
                counter_n = (counter == seq_A_length + seq_B_length - 1)? 0 : counter + 1;

                ////////////////////// sequence A shifting control /////////////////
                sequence_A_shifter_n = sequence_A_shifter << 2;
                for (i=0;i<`HAP_MAX_LENGTH-1;i=i+1) sequence_A_valid_shifter_n[i]  = sequence_A_valid_shifter_n[i+1];
                sequence_A_valid_shifter_n[`HAP_MAX_LENGTH-1] = 0;

                for (i=0;i<`READ_MAX_LENGTH;i=i+1) PE_align_score_d_n  [i]        = PE_align_score   [i];
                for (i=0;i<`READ_MAX_LENGTH;i=i+1) PE_insert_score_d_n [i]        = PE_insert_score  [i];
                for (i=0;i<`READ_MAX_LENGTH;i=i+1) PE_delete_score_d_n [i]        = PE_delete_score  [i];
                for (i=0;i<`READ_MAX_LENGTH;i=i+1) PE_align_score_dd_n [i]        = PE_align_score_d [i];
                for (i=0;i<`READ_MAX_LENGTH;i=i+1) PE_insert_score_dd_n[i]        = PE_insert_score_d[i];
                for (i=0;i<`READ_MAX_LENGTH;i=i+1) PE_delete_score_dd_n[i]        = PE_delete_score_d[i];

                //////////////////////// highest score conrtol /////////////////////////
                for (i=0;i<`READ_MAX_LENGTH;i=i+1) row_highest_score_n[i*`DP_PAIRHMM_SCORE_BITWIDTH+:`DP_PAIRHMM_SCORE_BITWIDTH] = (PE_the_score[i] > split_row_highest_score[i]) ? PE_the_score[i] : split_row_highest_score[i];
            end
            
            S_select_highest: begin
                if (shift_counter[7]) begin
                    shift_counter_n[7] = 0;
                    row_highest_score_n = row_highest_score << (`DP_PAIRHMM_SCORE_BITWIDTH*128);
                end else if (shift_counter[6]) begin
                    shift_counter_n[6] = 0;
                    row_highest_score_n = row_highest_score << (`DP_PAIRHMM_SCORE_BITWIDTH*64);
                end else if (shift_counter[5]) begin
                    shift_counter_n[5] = 0;
                    row_highest_score_n = row_highest_score << (`DP_PAIRHMM_SCORE_BITWIDTH*32);
                end else if (shift_counter[4]) begin
                    shift_counter_n[4] = 0;
                    row_highest_score_n = row_highest_score << (`DP_PAIRHMM_SCORE_BITWIDTH*16);
                end else if (shift_counter[3]) begin
                    shift_counter_n[3] = 0;
                    row_highest_score_n = row_highest_score << (`DP_PAIRHMM_SCORE_BITWIDTH*8);
                end else if (shift_counter[2]) begin
                    shift_counter_n[2] = 0;
                    row_highest_score_n = row_highest_score << (`DP_PAIRHMM_SCORE_BITWIDTH*4);
                end else if (shift_counter[1]) begin
                    shift_counter_n[1] = 0;
                    row_highest_score_n = row_highest_score << (`DP_PAIRHMM_SCORE_BITWIDTH*2);
                end else if (shift_counter[0]) begin
                    shift_counter_n[0] = 0;
                    row_highest_score_n = row_highest_score << (`DP_PAIRHMM_SCORE_BITWIDTH);
                end 

            end

            S_output_score:
            begin
                o_valid             = 1;
                o_alignment_score   = row_highest_score[`READ_MAX_LENGTH*`DP_PAIRHMM_SCORE_BITWIDTH-1-:`DP_PAIRHMM_SCORE_BITWIDTH];
            end

            
        endcase
    end




    /////////////////////////////// main ////////////////////////////
    always@(posedge clk) begin
        if (!rst_n) begin
            state                                                                   <= S_idle;
            counter                                                                 <= 0;
            sequence_A                                                              <= 0;
            sequence_B                                                              <= 0;
            sequence_B_qualities                                                    <= 0;
            seq_A_length                                                            <= 0;
            seq_B_length                                                            <= 0;
            shift_counter                                                           <= 0;
            for (i=0;i<`HAP_MAX_LENGTH;i=i+1) sequence_A_valid[i]                   <= 0;
            for (i=0;i<`READ_MAX_LENGTH;i=i+1) sequence_B_valid[i]                  <= 0;
            for (i=0;i<`HAP_MAX_LENGTH;i=i+1) sequence_A_valid_shifter[i]           <= 0;
            sequence_A_shifter                                                      <= 0;
            geno_address_ID                                                        <= 0;
            for (i=0; i<`READ_MAX_LENGTH; i=i+1) PE_align_score_d  [i]              <= 0;
            for (i=0; i<`READ_MAX_LENGTH; i=i+1) PE_insert_score_d [i]              <= 0;
            for (i=0; i<`READ_MAX_LENGTH; i=i+1) PE_delete_score_d [i]              <= 0;
            for (i=0; i<`READ_MAX_LENGTH; i=i+1) PE_align_score_dd [i]              <= 0;
            for (i=0; i<`READ_MAX_LENGTH; i=i+1) PE_insert_score_dd[i]              <= 0;
            for (i=0; i<`READ_MAX_LENGTH; i=i+1) PE_delete_score_dd[i]              <= 0;
            for (i=0; i<`READ_MAX_LENGTH; i=i+1) row_highest_score[i*`DP_PAIRHMM_SCORE_BITWIDTH+:`DP_PAIRHMM_SCORE_BITWIDTH]<= MOST_NEGATIVE;

        end else begin
            state                                                                   <= state_n;
            counter                                                                 <= counter_n;
            sequence_A                                                              <= sequence_A_n;
            sequence_B                                                              <= sequence_B_n;
            sequence_B_qualities                                                    <= sequence_B_qualities_n;
            seq_A_length                                                            <= seq_A_length_n;
            seq_B_length                                                            <= seq_B_length_n;
            shift_counter                                                           <= shift_counter_n;
            sequence_A_shifter                                                      <= sequence_A_shifter_n;
            for (i=0;i<`HAP_MAX_LENGTH;i=i+1) sequence_A_valid[i]                   <= sequence_A_valid_n[i];
            for (i=0;i<`READ_MAX_LENGTH;i=i+1) sequence_B_valid[i]                  <= sequence_B_valid_n[i];
            for (i=0;i<`HAP_MAX_LENGTH;i=i+1) sequence_A_valid_shifter[i]           <= sequence_A_valid_shifter_n[i];
            geno_address_ID                                                        <= geno_address_ID_n;
            for (i=0;i<`READ_MAX_LENGTH;i=i+1) PE_align_score_d  [i]                <= PE_align_score_d_n    [i];
            for (i=0;i<`READ_MAX_LENGTH;i=i+1) PE_insert_score_d [i]                <= PE_insert_score_d_n   [i];
            for (i=0;i<`READ_MAX_LENGTH;i=i+1) PE_delete_score_d [i]                <= PE_delete_score_d_n   [i];
            for (i=0;i<`READ_MAX_LENGTH;i=i+1) PE_align_score_dd [i]                <= PE_align_score_dd_n   [i];
            for (i=0;i<`READ_MAX_LENGTH;i=i+1) PE_insert_score_dd[i]                <= PE_insert_score_dd_n  [i];
            for (i=0;i<`READ_MAX_LENGTH;i=i+1) PE_delete_score_dd[i]                <= PE_delete_score_dd_n  [i];
            row_highest_score                                                       <= row_highest_score_n;
        end
    end

endmodule

*/

module DP_geno_PE_single(
    ///////////////////////////////////// basics /////////////////////////////////////
    input                                   clk,
    input                                   rst_n,

    ///////////////////////////////////// I/Os //////////////////////////////////////
    input                                   i_A_base_valid,
    input                                   i_B_base_valid,
    input [1:0]                             i_A_base,          // reference one.   Mapping: reference sequence
    input [1:0]                             i_B_base,          // query one.       Mapping: short-read
    input [1:0]                             i_B_base_quality,  // quantized read quality score

    input signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0]   i_align_top_score,
    input signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0]   i_align_diagonal_score,
    input signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0]   i_align_left_score,
    input signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0]   i_insert_top_score,
    input signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0]   i_insert_diagonal_score,
    input signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0]   i_insert_left_score,
    input signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0]   i_delete_diagonal_score,
    input signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0]   i_delete_left_score,

    output signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0]  o_align_score,
    output signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0]  o_insert_score,
    output signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0]  o_delete_score,
    output signed [`DP_PAIRHMM_SCORE_BITWIDTH-1:0]  o_the_score,

    output reg                              o_last_A_base_valid,
    output reg [1:0]                        o_last_A_base
);






// always@(posedge clk or negedge rst_n) begin
always@(posedge clk) begin
    if (!rst_n) begin
        o_last_A_base_valid <= 0;
        o_last_A_base       <= 0;
    end else begin
        o_last_A_base_valid <= i_A_base_valid;
        o_last_A_base       <= i_A_base;
    end
end


DP_geno_ALU u_ALU(
    ///////////////////////////////////// I/Os //////////////////////////////////////
    .i_A_base_valid                 (i_A_base_valid),
    .i_B_base_valid                 (i_B_base_valid),
    .i_A_base                       (i_A_base),
    .i_B_base                       (i_B_base),
    .i_B_base_quality               (i_B_base_quality),
    .i_align_top_score              (i_align_top_score),
    .i_align_diagonal_score         (i_align_diagonal_score),
    .i_align_left_score             (i_align_left_score),
    .i_insert_top_score             (i_insert_top_score),
    .i_insert_diagonal_score        (i_insert_diagonal_score),
    .i_insert_left_score            (i_insert_left_score),
    .i_delete_diagonal_score        (i_delete_diagonal_score),
    .i_delete_left_score            (i_delete_left_score),
    .o_align_score                  (o_align_score),
    .o_insert_score                 (o_insert_score),
    .o_delete_score                 (o_delete_score),
    .o_the_score                    (o_the_score)
);

endmodule

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




//----------------
// NTU DCS
// Yen-Lung Chen
// 20210106
//----------------
// insertion and deletion are both dased on query sequency

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
    /*
        DP_geno_Array_single u_DP_fat_Array(
            /////////////////////////////////////// Basics /////////////////////////////////////
            .clk                        (clk   ),
            .rst_n                      (rst_n ),
        
            ////////////////////////////////////// Mapping I/Os ////////////////////////////////////// 
            .o_ready                    (),
            .i_valid                    (DP_i_valid               [gv]),
            .i_sequence_A               (DP_i_sequence_A          [gv]),    // reference one.   Mapping: reference sequence
            .i_sequence_B               (DP_i_sequence_B          [gv]),    // query one.       Mapping: short-read
            .i_sequence_B_qualities     (DP_i_sequence_B_qualities[gv]),    // quantized read quality score
            .i_seq_A_length             (DP_i_seq_A_length        [gv]),    // 0~512 (1-based)
            .i_seq_B_length             (DP_i_seq_B_length        [gv]),    // 0~512 (1-based)
            .i_geno_address_ID         (DP_i_geno_address_ID    [gv]),    // only Genotyping
            // ----------------------------------------------------------------------
            .i_ready                    (DP_i_ready               [gv]),
            .o_valid                    (),
            .o_alignment_score          (),    // Mapping: SW score
            .o_geno_address_ID          ()     // only Genotyping
        );
    */
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