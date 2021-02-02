

`timescale 1ns/100ps

`define DP_SCORE_BITWIDTH   16
`define MAX_LTAENCY 10000000


module TESTBED;

wire [63:0] DATA_AMOUNT_ADDR 	= 64'h0040000000;
wire [63:0] VAR_INFO_ADDR 		= 64'h0040000000 + 32*1024;
wire [63:0] EVENT_INFO_ADDR 	= 64'h0040000000 + 512*1024;

integer i, j;

parameter cycle			= 5.0;

reg clk, rst_n;
	// AXI
wire [63:0]		axi_m_araddr;
wire [7:0] 		axi_m_arlen;
wire 			axi_m_arready;
wire			axi_m_arvalid;
wire [63:0]		axi_m_awaddr;
wire [7:0] 		axi_m_awlen;
wire			axi_m_awready;
wire			axi_m_awvalid;
wire 			axi_m_bready;
wire 			axi_m_bvalid;
wire [511:0] 	axi_m_rdata;
wire 			axi_m_rready;
reg 			axi_m_rvalid;
wire [511:0] 	axi_m_wdata;
wire			axi_m_wlast;
wire 			axi_m_wready;
wire			axi_m_wvalid;
wire [63:0]		axi_m_wstrb;
 // AXI Lite
reg [31:0]		axil_araddr;
wire 			axil_arready;
reg				axil_arvalid;
reg [31:0]		axil_awaddr;
wire 			axil_awready;
reg				axil_awvalid;
reg				axil_bready;
wire 			axil_bvalid;
wire [31:0]		axil_rdata;
reg				axil_rready;
wire 			axil_rvalid;
reg [31:0]		axil_wdata;
wire 			axil_wready;
reg				axil_wvalid;




always #(cycle/2.0) clk = ~clk;

initial begin
	`ifdef RTL
		`ifdef TB
			$fsdbDumpfile("GATK_AXI_TB.fsdb");
			$fsdbDumpvars(1, TESTBED, "+all");
		`elsif GATK_PREPROCESS
			$fsdbDumpfile("GATK_AXI_GATK_PREPROCESS.fsdb");
			$fsdbDumpvars(1, TESTBED.top.GATK_preprocess, "+all");
		`elsif FETCH
			$fsdbDumpfile("GATK_AXI_FETCH.fsdb");
			$fsdbDumpvars(1, TESTBED.top.fetch_circuit, "+all");
		`elsif GAENOTYPING
			$fsdbDumpfile("GATK_AXI_GENOTYPING.fsdb");
			$fsdbDumpvars(0, TESTBED.top.genotyping, "+all");
		`elsif O2DRAM
			$fsdbDumpfile("GATK_AXI_O2DRAM.fsdb");
			$fsdbDumpvars(1, TESTBED.top.genotyping.u_Output_2_Dram, "+all");
		`elsif PL
			$fsdbDumpfile("GATK_AXI_PL.fsdb");
			$fsdbDumpvars(4, TESTBED.top.genotyping.u_PL_CTRL, "+all");
		`elsif DP_GENO
			$fsdbDumpfile("GATK_AXI_DP_GENO.fsdb");
			$fsdbDumpvars(0, TESTBED.top.genotyping.u_DP_geno_Top, "+all");
		`else
			$fsdbDumpfile("GATK_AXI_TOP.fsdb");
			$fsdbDumpvars(1, TESTBED.top, "+all");
		`endif
	`endif
end

reg [1023:0] ANS_MEM[0:511];
reg [1033:0] ANS_HAP[0:127];
reg [31:0] cc, correct, wrong, ref_wrong;
reg [31:0] cd;

reg [31:0] system_counter;




reg signed [`DP_SCORE_BITWIDTH-1:0] CONST_MATCH_SCORE        = 5;
reg signed [`DP_SCORE_BITWIDTH-1:0] CONST_MISMATCH_SCORE     = -5;
reg signed [`DP_SCORE_BITWIDTH-1:0] CONST_GAP_OPEN           = -30;
reg signed [`DP_SCORE_BITWIDTH-1:0] CONST_GAP_EXTEND         = -2;
reg signed [`DP_SCORE_BITWIDTH-1:0] CONST_M2M                = 0;
reg signed [`DP_SCORE_BITWIDTH-1:0] CONST_M2I                = -4096;
reg signed [`DP_SCORE_BITWIDTH-1:0] CONST_I2I                = -1024;
reg signed [`DP_SCORE_BITWIDTH-1:0] CONST_I2M                = -47;
reg signed [`DP_SCORE_BITWIDTH-1:0] CONST_BQ0_MATCH_SCORE    = -227; // lowest
reg signed [`DP_SCORE_BITWIDTH-1:0] CONST_BQ0_MISMATCH_SCORE = -896;
reg signed [`DP_SCORE_BITWIDTH-1:0] CONST_BQ1_MATCH_SCORE    = -18;
reg signed [`DP_SCORE_BITWIDTH-1:0] CONST_BQ1_MISMATCH_SCORE = -1920;
reg signed [`DP_SCORE_BITWIDTH-1:0] CONST_BQ2_MATCH_SCORE    = -2;
reg signed [`DP_SCORE_BITWIDTH-1:0] CONST_BQ2_MISMATCH_SCORE = -2944;
reg signed [`DP_SCORE_BITWIDTH-1:0] CONST_BQ3_MATCH_SCORE    = 0;
reg signed [`DP_SCORE_BITWIDTH-1:0] CONST_BQ3_MISMATCH_SCORE = -3968; // highest

integer file_var;
integer file_hap;
integer file_geno;

initial begin
	file_var = $fopen("var_out.txt", "w");
	file_hap = $fopen("hap_out.txt", "w");
	file_geno = $fopen("geno_out.txt", "w");
end

reg [9-1:0] var_pos = 0;
reg [2-1:0]  var_type = 0;
reg [1:0] first_base = 0;
reg [239:0] bases = 240'd0;
integer var_length = 0;
reg [3-1:0] var_ID = 0;

reg [1:0] ref_base, alt_base;
always@(posedge clk) begin
	if(top.variant_calling.W_VAR_SRAM && top.variant_calling.state==5) begin
		$display("An Variant is Detected.\n");
		var_pos 	= top.variant_calling.D_VAR_SRAM[263-:9];
		var_type 	= top.variant_calling.D_VAR_SRAM[263-9-:2];
		first_base 	= top.variant_calling.D_VAR_SRAM[263-9-2-:2];
		bases 		= top.variant_calling.D_VAR_SRAM[263-9-2-2-:240];
		var_length 	= top.variant_calling.D_VAR_SRAM[263-9-2-2-240-:8];
		var_ID 		= top.variant_calling.D_VAR_SRAM[263-9-2-2-240-8-:3];

		$fwrite(file_var, "Loc: %d\t", var_pos);
		$fwrite(file_var, "Type: %d\t", var_type);
		case (var_type)
			1: begin
				$fwrite(file_var, "Insertion: ");
				case(first_base)
					0:$fwrite(file_var, "A|");
					1:$fwrite(file_var, "C|");
					2:$fwrite(file_var, "G|");
					3:$fwrite(file_var, "T|");
				endcase
				for (i=0;i<var_length;i=i+1) begin
					alt_base = bases[239-2*i-:2];
					case(alt_base)
						0:$fwrite(file_var, "A");
						1:$fwrite(file_var, "C");
						2:$fwrite(file_var, "G");
						3:$fwrite(file_var, "T");
					endcase
				end
				$fwrite(file_var, "\t");
			end
			2: begin 
				$fwrite(file_var, "SNP: ");
				ref_base = first_base;
				alt_base = bases[239-:2];
				case(ref_base)
					0:$fwrite(file_var, "A|");
					1:$fwrite(file_var, "C|");
					2:$fwrite(file_var, "G|");
					3:$fwrite(file_var, "T|");
				endcase
				case(alt_base)
					0:$fwrite(file_var, "A\t");
					1:$fwrite(file_var, "C\t");
					2:$fwrite(file_var, "G\t");
					3:$fwrite(file_var, "T\t");
				endcase
			end
			3: begin
				$fwrite(file_var, "Deletion: ");
				
				for (i=0;i<var_length;i=i+1) begin
					ref_base = bases[239-2*i-:2];
					case(ref_base)
						0:$fwrite(file_var, "A");
						1:$fwrite(file_var, "C");
						2:$fwrite(file_var, "G");
						3:$fwrite(file_var, "T");
					endcase
				end
				alt_base = first_base;
				case(alt_base)
					0:$fwrite(file_var, "|A\t");
					1:$fwrite(file_var, "|C\t");
					2:$fwrite(file_var, "|G\t");
					3:$fwrite(file_var, "|T\t");
				endcase
			end
		endcase
		
		$fwrite(file_var, "Length: %0d\t", var_length);
		$fwrite(file_var, "ID: %0d\n\n", var_ID);
	end
end

always@(posedge clk) begin
	if(top.variant_calling.o_valid) begin
		$fwrite(file_var, "region start: %0d\n", top.active_region_start_var);
		$fwrite(file_var, "region end: %0d\n", top.active_region_end_var);
		$fwrite(file_var, "haplotype amount: %0d\n",          top.variant_calling.CONST_haplotype_amount_in_region);
		$fwrite(file_var, "var_amount_in_region: %d\n",       top.variant_calling.o_variant_amount_in_region);
		$fwrite(file_var, "o_unsorted_var_hap1hot_0: %b\n",   top.variant_calling.o_unsorted_var_hap1hot_0);
		$fwrite(file_var, "o_unsorted_var_hap1hot_1: %b\n",   top.variant_calling.o_unsorted_var_hap1hot_1);
		$fwrite(file_var, "o_unsorted_var_hap1hot_2: %b\n",   top.variant_calling.o_unsorted_var_hap1hot_2);
		$fwrite(file_var, "o_unsorted_var_hap1hot_3: %b\n",   top.variant_calling.o_unsorted_var_hap1hot_3);
		$fwrite(file_var, "o_unsorted_var_hap1hot_4: %b\n",   top.variant_calling.o_unsorted_var_hap1hot_4);
		$fwrite(file_var, "o_unsorted_var_hap1hot_5: %b\n",   top.variant_calling.o_unsorted_var_hap1hot_5);
		$fwrite(file_var, "o_unsorted_var_hap1hot_6: %b\n",   top.variant_calling.o_unsorted_var_hap1hot_6);
		$fwrite(file_var, "o_unsorted_var_hap1hot_7: %b\n\n", top.variant_calling.o_unsorted_var_hap1hot_7);

		$fwrite(file_var, "o_event_amount_in_region: %d\n",   top.variant_calling.o_event_amount_in_region);
		$fwrite(file_var, "o_event_begin_0: %d\n",   top.variant_calling.o_event_begin_0);
		$fwrite(file_var, "o_event_begin_1: %d\n",   top.variant_calling.o_event_begin_1);
		$fwrite(file_var, "o_event_begin_2: %d\n",   top.variant_calling.o_event_begin_2);
		$fwrite(file_var, "o_event_begin_3: %d\n",   top.variant_calling.o_event_begin_3);
		$fwrite(file_var, "o_event_begin_4: %d\n",   top.variant_calling.o_event_begin_4);
		$fwrite(file_var, "o_event_begin_5: %d\n",   top.variant_calling.o_event_begin_5);
		$fwrite(file_var, "o_event_begin_6: %d\n",   top.variant_calling.o_event_begin_6);
		$fwrite(file_var, "o_event_begin_7: %d\n",   top.variant_calling.o_event_begin_7);
		$fwrite(file_var, "o_event_var2hot_0: %b\n",   top.variant_calling.o_event_var2hot_0);
		$fwrite(file_var, "o_event_var2hot_1: %b\n",   top.variant_calling.o_event_var2hot_1);
		$fwrite(file_var, "o_event_var2hot_2: %b\n",   top.variant_calling.o_event_var2hot_2);
		$fwrite(file_var, "o_event_var2hot_3: %b\n",   top.variant_calling.o_event_var2hot_3);
		$fwrite(file_var, "o_event_var2hot_4: %b\n",   top.variant_calling.o_event_var2hot_4);
		$fwrite(file_var, "o_event_var2hot_5: %b\n",   top.variant_calling.o_event_var2hot_5);
		$fwrite(file_var, "o_event_var2hot_6: %b\n",   top.variant_calling.o_event_var2hot_6);
		$fwrite(file_var, "o_event_var2hot_7: %b\n\n",   top.variant_calling.o_event_var2hot_7);

		$fwrite(file_var, "o_var_location_min: %d\n",   top.variant_calling.o_var_location_min);
		$fwrite(file_var, "o_var_location_max: %d\n\n",   top.variant_calling.o_var_location_max);
		$fwrite(file_var, "-------------------------------------------------------\n\n");
	end
end


integer var_amount = 0;
integer event_amount = 0;
integer var_count = 0;
integer event_count = 0;
// reg [1:0] first_base = 'd0;
// reg [239:0] bases = 240'd0;
// reg [7:0] var_length = 'd0;
integer burstcount = 0;
integer event_begin = 0;
reg [63:0] temp_waddr = 0;
reg [63:0] temp_byteenable = 0;
reg [511:0] temp_axi_data = 0;
reg [512*3-1:0] temp_PLs = 1536'd0;
reg [7:0] temp_burstcount = 0;
always@(posedge clk) begin
	if(top.genotyping.axi_awvalid && top.genotyping.axi_awready) begin
		$write("Genotyping wrtie DDR4[0x%16H]\n", top.genotyping.axi_awaddr);
		temp_waddr = top.genotyping.axi_awaddr;
		temp_burstcount = top.genotyping.axi_awlen;
		@(posedge clk);

		// catch AXI write data
		while (1) begin
			if (top.genotyping.axi_wvalid && top.genotyping.axi_wready) begin
				temp_axi_data = top.genotyping.axi_wdata;
				temp_byteenable = top.genotyping.axi_wstrb;
				$write("wstrb: %16H, wdata[%0d]: %128H\n", temp_byteenable, burstcount, temp_axi_data);

				while (!temp_byteenable[0]) begin
					temp_byteenable = temp_byteenable >> 1;
					temp_axi_data = temp_axi_data >> 8;
				end

				
				
				if (temp_waddr >= EVENT_INFO_ADDR) begin
					temp_PLs = {temp_axi_data, temp_PLs[1535-:1024]};
					
					if (top.genotyping.axi_wlast) begin
						$fwrite(file_geno, "event begin: %0d,\tevent var ID: %9b,\t", temp_PLs[1535-:32], temp_PLs[1535-32-55-:9]);
						$fwrite(file_geno, "events PL scores: ");
						for (i=0;i<45;i=i+1) begin
							$fwrite(file_geno, "%f\t", $bitstoshortreal(temp_PLs[1535-32-64-32*i-:32]));
						end
						$fwrite(file_geno, "\n");
						temp_PLs = 1536'd0;
					end
				end
				else if (temp_waddr >= VAR_INFO_ADDR) begin // write variant
					var_type 	= temp_axi_data[255-:2];
					first_base 	= temp_axi_data[253-:2];
					bases 		= temp_axi_data[251-:240];
					var_length 	= temp_axi_data[11-:8];

					if (var_type == 2'd1) begin
						$fwrite(file_geno, "Insertion,\t");
						ref_base = first_base;
						case(ref_base)
							0:$fwrite(file_geno, "A|");
							1:$fwrite(file_geno, "C|");
							2:$fwrite(file_geno, "G|");
							3:$fwrite(file_geno, "T|");
						endcase
						for (i=0;i<var_length;i=i+1) begin
							alt_base = bases[239-2*i-:2];
							case(alt_base)
								0:$fwrite(file_geno, "A");
								1:$fwrite(file_geno, "C");
								2:$fwrite(file_geno, "G");
								3:$fwrite(file_geno, "T");
							endcase
						end
						$fwrite(file_geno, "\tLength: %0d\n", var_length);
					end
					else if (var_type == 2) begin
						ref_base = first_base;
						alt_base = bases[239-:2];
						$fwrite(file_geno, "SNP,\t");
						case(ref_base)
							0:$fwrite(file_geno, "A|");
							1:$fwrite(file_geno, "C|");
							2:$fwrite(file_geno, "G|");
							3:$fwrite(file_geno, "T|");
						endcase
						case(alt_base)
							0:$fwrite(file_geno, "A");
							1:$fwrite(file_geno, "C");
							2:$fwrite(file_geno, "G");
							3:$fwrite(file_geno, "T");
						endcase
						$fwrite(file_geno, "\tLength: %0d\n", var_length);
					end
					else if (var_type == 3) begin
						$fwrite(file_geno, "Deletion,\t");
						for (i=0;i<var_length;i=i+1) begin
							ref_base = bases[239-2*i-:2];
							case(ref_base)
								0:$fwrite(file_geno, "A");
								1:$fwrite(file_geno, "C");
								2:$fwrite(file_geno, "G");
								3:$fwrite(file_geno, "T");
							endcase
						end
						alt_base = first_base;
						case(alt_base)
							0:$fwrite(file_geno, "|A");
							1:$fwrite(file_geno, "|C");
							2:$fwrite(file_geno, "|G");
							3:$fwrite(file_geno, "|T");
						endcase
						$fwrite(file_geno, "\tLength: %0d\n", var_length);
					end

					var_count = var_count + 1;

				end
				else if (temp_waddr >= DATA_AMOUNT_ADDR) begin
					var_amount = temp_axi_data[15:8];
					event_amount = temp_axi_data[7:0];
					$fwrite(file_geno, "\nvariant amount: %2d\tevent amount: %2d\n", var_amount, event_amount);
				end

				if (burstcount==temp_burstcount) begin
					burstcount = 0;
					@(posedge clk);
					break;
				end
				
				burstcount = burstcount + 1;
				
				
			end
			
			@(posedge clk);
		end
	end
end

always@(posedge clk) begin
	if(system_counter%1000 == 0) begin
		$display("Reach %d K cycles\n", system_counter/1000);
		system_counter = system_counter + 1;
	end
	else system_counter = system_counter + 1;
end

initial begin
	system_counter = 0;
	correct = 0;
	wrong = 0;
	cc = 0;
	cd = 0;
	clk = 0;
	rst_n = 1;
	
	
	axil_araddr		= 0;
	axil_arvalid	= 0;

	axil_awaddr		= 0;
	axil_awvalid	= 0;
	
	axil_rready		= 1;
	axil_wdata		= 0;
	axil_wvalid		= 0;

	axil_bready		= 1;
	
	@(negedge clk);
	@(negedge clk);
		rst_n = 0;
	@(negedge clk);
		rst_n = 1;
	@(negedge clk);
	@(negedge clk);
	@(negedge clk);
		
		
	for(i=24;i<=43;i=i+1) begin
		axil_awvalid = 1;
		axil_awaddr = i;
		while (1) begin
			if (axil_awready) begin
				@(negedge clk);
				break;
			end
			@(negedge clk);
		end
		axil_awvalid = 0;
		axil_awaddr = 0;

		//* assign AXI Lite write data
		axil_wvalid = 1;
		case(i)
			24: axil_wdata = `PATTERN; 		//start base
			25: axil_wdata = 148;			//read length
			26: axil_wdata = 300;			//active region legnth
			27: axil_wdata = 0;				//ref addr[63:32]
			28: axil_wdata = 0;				//ref addr[31:0]
			29: axil_wdata = 0;				//read addr[63:32]
			30: axil_wdata = 12826176;		//read addr[31:0]
			31: axil_wdata = 0;				//var addr[63:32]
			32: axil_wdata = 0;				//var addr[31:0]
			33: axil_wdata = 100;			//Padding bases (padding * 2 = overlap bases)
			34: axil_wdata = 10000;			//Total Read Number
			35: axil_wdata = 4096;			//max likelihood difference
			36: axil_wdata = `PATTERN + 30000 - 300;		//CONST_end_base // 16050321;
			37: axil_wdata = -8192;			//Pair HMM Likelihood threshold
			38: axil_wdata = DATA_AMOUNT_ADDR >> 32;
			39: axil_wdata = DATA_AMOUNT_ADDR;
			40: axil_wdata = VAR_INFO_ADDR >> 32;
			41: axil_wdata = VAR_INFO_ADDR;
			42: axil_wdata = EVENT_INFO_ADDR >> 32;
			43: axil_wdata = EVENT_INFO_ADDR;
		endcase

		//* wait write channel ready
		while (1) begin
			if (axil_wready) begin
				@(negedge clk);
				break;
			end
			@(negedge clk);
		end
		axil_wvalid = 0;
		axil_wdata = 0;
	end
		
	@(negedge clk)
	axil_awvalid = 1;
	axil_awaddr = 62;	// activate
	
	@(negedge clk)
	axil_awvalid = 0;
	axil_awaddr = 0;

	
	// #(200000*cycle);

	while (top.GATK_preprocess.state!=4) begin
		@(negedge clk);
	end

    $finish;

end

initial #(cycle*`MAX_LTAENCY) $finish;

ddr4_FAKE_AXI u_DRAM(
	.clk		(clk),
	.rst_n		(rst_n),
	//* main AXI
	.AWADDR		(axi_m_awaddr),
	.AWLEN		(axi_m_awlen),
	.AWREADY	(axi_m_awready),
	.AWVALID	(axi_m_awvalid),
	.ARADDR		(axi_m_araddr),
	.ARLEN		(axi_m_arlen),
	.ARREADY	(axi_m_arready),
	.ARVALID	(axi_m_arvalid),
	.BREADY		(axi_m_bready),
	.BRESP		(),
	.BVALID		(axi_m_bvalid),
	.RDATA		(axi_m_rdata),
	.RLAST		(),
	.RREADY		(axi_m_rready),
	.RRESP		(),
	.RVALID		(axi_m_rvalid),
	.WDATA		(axi_m_wdata),
	.WLAST		(axi_m_wlast),
	.WREADY		(axi_m_wready),
	.WVALID		(axi_m_wvalid),
	.WSTRB		(axi_m_wstrb),
	//*Channel 1
	.ARADDR1	(64'd0),
	.ARLEN1		(8'd0),
	.ARREADY1	(),
	.ARVALID1	(1'd0),
	.RDATA1		(),
	.RLAST1		(),
	.RREADY1	(1'd0),
	.RRESP1		(),
	.RVALID1	(),
	//*Channel 2
	.ARADDR2	(64'd0),
	.ARLEN2		(8'd0),
	.ARREADY2	(),
	.ARVALID2	(1'd0),
	.RDATA2		(),
	.RLAST2		(),
	.RREADY2	(1'd0),
	.RRESP2		(),
	.RVALID2	()
);


GATK_TOP top(
	.clk(clk),
	.rst_n(rst_n),

	.axi_m_araddr	(axi_m_araddr	),
	.axi_m_arlen	(axi_m_arlen	),
	.axi_m_arready	(axi_m_arready	),
	.axi_m_arvalid	(axi_m_arvalid	),
	.axi_m_awaddr	(axi_m_awaddr	),
	.axi_m_awlen	(axi_m_awlen	),
	.axi_m_awready	(axi_m_awready	),
	.axi_m_awvalid	(axi_m_awvalid	),
	.axi_m_bready	(axi_m_bready	),
	.axi_m_bvalid	(axi_m_bvalid	),
	.axi_m_rdata	(axi_m_rdata	),
	.axi_m_rready	(axi_m_rready	),
	.axi_m_rvalid	(axi_m_rvalid	),
	.axi_m_wdata	(axi_m_wdata	),
	.axi_m_wlast	(axi_m_wlast	),
	.axi_m_wready	(axi_m_wready	),
	.axi_m_wvalid	(axi_m_wvalid	),
	.axi_m_wstrb	(axi_m_wstrb	),
	.axil_araddr	(axil_araddr	),
	.axil_arready	(axil_arready	),
	.axil_arvalid	(axil_arvalid	),
	.axil_awaddr	(axil_awaddr	),
	.axil_awready	(axil_awready	),
	.axil_awvalid	(axil_awvalid	),
	.axil_bready	(axil_bready	),
	.axil_bvalid	(axil_bvalid	),
	.axil_rdata		(axil_rdata		),
	.axil_rready	(axil_rready	),
	.axil_rvalid	(axil_rvalid	),
	.axil_wdata		(axil_wdata		),
	.axil_wready	(axil_wready	),
	.axil_wvalid	(axil_wvalid	)
);




endmodule
	

