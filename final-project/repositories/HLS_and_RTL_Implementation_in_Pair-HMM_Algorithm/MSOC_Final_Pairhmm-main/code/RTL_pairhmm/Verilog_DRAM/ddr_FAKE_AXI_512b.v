
module ddr4_FAKE_AXI
   (
    input clk,
	input rst_n,

	input [63:0] 	ARADDR,
	input [7:0] 	ARLEN,
	output reg		ARREADY,
	input 			ARVALID,
	
	input [63:0] 	AWADDR,
	input [7:0] 	AWLEN,
	output reg		AWREADY,
	input 			AWVALID,
	
	input 			BREADY,
	output reg[1:0]	BRESP,		
	output reg		BVALID,
	
	output reg [511:0] 	RDATA,
	output reg		RLAST,
	input 			RREADY,
	output reg[1:0]	RRESP,		
	output reg		RVALID,
	
	input [511:0] 	WDATA,
	input 			WLAST,
	output reg		WREADY,
	input 			WVALID,
	input [63:0]	WSTRB,
	
	//Channel 1
	input [63:0] 	ARADDR1,
	input [7:0] 	ARLEN1,
	output reg		ARREADY1,
	input 			ARVALID1,

	output reg [511:0] 	RDATA1,
	output reg		RLAST1,
	input 			RREADY1,
	output reg[1:0]	RRESP1,		
	output reg		RVALID1,	
	
	//Channel 2
	input [63:0] 	ARADDR2,
	input [7:0] 	ARLEN2,
	output reg		ARREADY2,
	input 			ARVALID2,

	output reg [511:0] 	RDATA2,
	output reg		RLAST2,
	input 			RREADY2,
	output reg[1:0]	RRESP2,		
	output reg		RVALID2	
   );

	integer i;

	parameter		LATENCY			= 10;
   
	parameter		IDLE 			= 0,
					READ_WAIT		= 1,
					READ_DATA		= 2,
					WRITE_DATA		= 3,
					RESP			= 4,
					DELAY			= 5;

//   reg [7:0] mem[0:1048575];
//     reg [7:0] mem[0:268435455];

   reg [7:0] mem[0:536870911];
   //reg [7:0] mem[0:1073741823];
   
   //reg [7:0] mem[0:1041896760];
   //reg [7:0] mem[0:1048575];
   
   reg [7:0] len[0:1], len_w[0:1];
   reg [3:0] state[0:1], state_n[0:1];	//0: read, 1: write
   reg [7:0] counter[0:1], counter_n[0:1];
   reg [7:0] burstcount_reg[0:1], burstcount_n[0:1];
   reg [63:0] araddr_reg, araddr_n, awaddr_reg, awaddr_n;
  
   reg [7:0] len1, len1_w;
   reg [3:0] state1, state1_n;
   reg [7:0] counter1, counter1_n;
   reg [7:0] burstcount1_reg, burstcount1_n;
   reg [63:0] araddr1_reg, araddr1_n;
  
   reg [7:0] len2, len2_w;
   reg [3:0] state2, state2_n;
   reg [7:0] counter2, counter2_n;
   reg [7:0] burstcount2_reg, burstcount2_n;
   reg [63:0] araddr2_reg, araddr2_n; 
  
   reg err[0:1], err_n[0:1];
   reg err1, err1_n;
   reg err2, err2_n;
   
// initial begin
// 	$readmemh("../Testing_data/Combine_chr22_hewill_paired.txt", mem);
// end

`ifdef  PATTERN
	`define FILE_PATH `"/home/raid7_1/userd/d04027/GATK_Altera/Chr22_FPGA_test_```PATTERN.txt`"
`else
	`define FILE_PATH "/home/raid7_1/userd/d04027/GATK_Altera/Chr22_FPGA_test_16050000.txt"
`endif

initial begin
	$display("FILE_PATH: %0s", `FILE_PATH);
	$readmemh(`FILE_PATH, mem);
end

always@(*) begin
	state_n[0]				= state[0];	//read state
	ARREADY					= 0;
	counter_n[0]			= counter[0];
	burstcount_n[0]			= burstcount_reg[0];
	RVALID					= 0;
	RDATA					= 512'd0;
	RLAST					= 0;
	err_n[0]				= err[0];
	RRESP					= 0;
	
	case(state[0])
	IDLE: begin
		ARREADY				= 1;
		state_n[0]			= (ARREADY & ARVALID) ? DELAY : state[0];
		araddr_n			= (ARREADY & ARVALID) ? ARADDR : araddr_reg;
		burstcount_n[0]		= (ARREADY & ARVALID) ? ARLEN : burstcount_reg[0];
		err_n[0]			= (ARREADY & ARVALID) ? (ARADDR[5:0] != 6'b0) : err[0];
	end
	DELAY: begin
		state_n[0]			= (counter[0] == LATENCY) ? READ_DATA : state[0];
		counter_n[0]		= (counter[0] == LATENCY) ? 0 : counter[0] + 1;
	end
	READ_DATA: begin
		RVALID				= 1;
		RRESP				= err[0] ? 2 : 0;
		RLAST				= (counter[0] == burstcount_reg[0]);
		counter_n[0]		= RLAST ? 0 : (counter[0] + (RREADY & RVALID));
		state_n[0]			= (RREADY & RVALID & RLAST) ? IDLE : state[0];
		err_n[0]			= (RREADY & RVALID & RLAST) ? 0 : err[0];
		
		if(RREADY & RVALID) begin
			for(i=0;i<64;i=i+1) begin
				RDATA[(i*8)+:8]	= mem[araddr_reg+64*counter[0]+i];
			end
		end
	end
	endcase
end

always@(*) begin
	state_n[1]				= state[1]; //write state
	AWREADY					= 0;
	counter_n[1]			= counter[1];
	burstcount_n[1]			= burstcount_reg[1];
	WREADY					= 0;
	BVALID					= 0;
	BRESP					= 0;
	
	case(state[1])
	IDLE: begin
		AWREADY				= 1;
		state_n[1]			= (AWREADY & AWVALID) ? DELAY : state[1];
		awaddr_n			= (AWREADY & AWVALID) ? AWADDR : awaddr_reg;
		err_n[1]			= (AWREADY & AWVALID) ? (AWADDR[5:0] != 6'b0) : err[1];
	end
	DELAY: begin
		state_n[1]			= (counter[1] == LATENCY) ? WRITE_DATA : state[1];
		counter_n[1]		= (counter[1] == LATENCY) ? 0 : counter[1] + 1;
	end
	WRITE_DATA: begin
		WREADY				= 1;
		counter_n[1]		= counter[1] + (WREADY & WVALID);
		state_n[1]			= (WREADY & WVALID & WLAST) ? RESP : state[1];
		
		if(WREADY & WVALID) begin
			for(i=0;i<64;i=i+1) begin
				if (WSTRB[i]) begin
					mem[awaddr_reg+64*counter[1]+i] = WDATA[(i*8)+:8];
				end
			end
		end
	end
	RESP: begin
		BVALID				= 1;
		BRESP				= err[1] ? 2 : 0;
		err_n[1]			= (BREADY & BVALID) ? 0 : err[1];
		state_n[1]			= (BREADY & BVALID) ? IDLE : state[1];
		counter_n[1]		= 0;
	end
	endcase
end




always@(*) begin
	state1_n				= state1;	//read state
	ARREADY1				= 0;
	counter1_n				= counter1;
	burstcount1_n			= burstcount1_reg;
	RVALID1					= 0;
	RDATA1					= 512'd0;
	RLAST1					= 0;
	err1_n					= err1;
	RRESP1					= 0;
	
	case(state1)
	IDLE: begin
		ARREADY1			= 1;
		state1_n			= (ARREADY1 & ARVALID1) ? DELAY : state1;
		araddr1_n			= (ARREADY1 & ARVALID1) ? ARADDR1 : araddr1_reg;
		burstcount1_n		= (ARREADY1 & ARVALID1) ? ARLEN1 : burstcount1_reg;
		err1_n				= (ARREADY1 & ARVALID1) ? (ARADDR1[5:0] != 6'b0) : err1;
	end
	DELAY: begin
		state1_n			= (counter1 == LATENCY) ? READ_DATA : state1;
		counter1_n			= (counter1 == LATENCY) ? 0 : counter1 + 1;
	end
	READ_DATA: begin
		RVALID1				= 1;
		RRESP1				= err1 ? 2 : 0;
		RLAST1				= (counter1 == burstcount1_reg);
		counter1_n			= RLAST1 ? 0 : (counter1 + (RREADY1 & RVALID1));
		state1_n			= (RREADY1 & RVALID1 & RLAST1) ? IDLE : state1;
		err1_n				= (RREADY1 & RVALID1 & RLAST1) ? 0 : err1;
		
		if(RREADY1 & RVALID1) begin
			for(i=0;i<64;i=i+1) begin
				RDATA1[(i*8)+:8]	= mem[araddr1_reg+64*counter1+i];
			end
		end
	end
	endcase
end



always@(*) begin
	state2_n				= state2;	//read state
	ARREADY2				= 0;
	counter2_n				= counter2;
	burstcount2_n			= burstcount2_reg;
	RVALID2					= 0;
	RDATA2					= 512'd0;
	RLAST2					= 0;
	err2_n					= err2;
	RRESP2					= 0;
	
	case(state2)
	IDLE: begin
		ARREADY2			= 1;
		state2_n			= (ARREADY2 & ARVALID2) ? DELAY : state2;
		araddr2_n			= (ARREADY2 & ARVALID2) ? ARADDR2 : araddr2_reg;
		burstcount2_n		= (ARREADY2 & ARVALID2) ? ARLEN2 : burstcount2_reg;
		err2_n				= (ARREADY2 & ARVALID2) ? (ARADDR2[5:0] != 6'b0) : err2;
	end
	DELAY: begin
		state2_n			= (counter2 == LATENCY) ? READ_DATA : state2;
		counter2_n			= (counter2 == LATENCY) ? 0 : counter2 + 1;
	end
	READ_DATA: begin
		RVALID2				= 1;
		RRESP2				= err2 ? 2 : 0;
		RLAST2				= (counter2 == burstcount2_reg);
		counter2_n			= RLAST2 ? 0 : (counter2 + (RREADY2 & RVALID2));
		state2_n			= (RREADY2 & RVALID2 & RLAST2) ? IDLE : state2;
		err2_n				= (RREADY2 & RVALID2 & RLAST2) ? 0 : err2;
		
		if(RREADY2 & RVALID2) begin
			for(i=0;i<64;i=i+1) begin
				RDATA2[(i*8)+:8]	= mem[araddr2_reg+64*counter2+i];
			end
		end
	end
	endcase
end


always@(posedge clk) begin
	if(!rst_n) begin
		len[0]				<= 0;
		len[1]				<= 0;
		state[0]			<= 0;
		state[1]			<= 0;
		counter[0]			<= 0;
		counter[1]			<= 0;
		burstcount_reg[0]	<= 0;
		burstcount_reg[1]	<= 0;
		araddr_reg			<= 0;
		awaddr_reg			<= 0;
		err[0]				<= 0;
		err[1]				<= 0;
		
		len1				<= 0;
		state1				<= 0;
		counter1			<= 0;
		burstcount1_reg		<= 0;
		araddr1_reg			<= 0;
		err1				<= 0;
		
		len2				<= 0;
		state2				<= 0;
		counter2			<= 0;
		burstcount2_reg		<= 0;
		araddr2_reg			<= 0;
		err2				<= 0;
		
	end
	else begin
		len[0]				<= len_w[0];
		len[1]				<= len_w[1];
		state[0]			<= state_n[0];
		state[1]			<= state_n[1];
		counter[0]			<= counter_n[0];
		counter[1]			<= counter_n[1];	
		burstcount_reg[0]	<= burstcount_n[0];
		burstcount_reg[1]	<= burstcount_n[1];
		araddr_reg			<= araddr_n;
		awaddr_reg			<= awaddr_n;
		err[0]				<= err_n[0];
		err[1]				<= err_n[1];
		
		len1				<= len1_w;
		state1				<= state1_n;
		counter1			<= counter1_n;
		burstcount1_reg		<= burstcount1_n;
		araddr1_reg			<= araddr1_n;
		err1				<= err1_n;
		
		len2				<= len2_w;
		state2				<= state2_n;
		counter2			<= counter2_n;
		burstcount2_reg		<= burstcount2_n;
		araddr2_reg			<= araddr2_n;
		err2				<= err2_n;		
	end
end


endmodule
