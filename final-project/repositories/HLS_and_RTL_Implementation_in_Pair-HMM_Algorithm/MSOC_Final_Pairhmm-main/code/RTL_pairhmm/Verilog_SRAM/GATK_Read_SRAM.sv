
module GATK_Read_SRAM(

clka,
douta, dina, addra, wea

);
integer i,j,k;
input                                       clka;
input                                       wea;
input [$clog2(`READ_SRAM_WORD_AMOUNT)-1:0]  addra;
input [`READ_SRAM_BIT_PER_WORD-1:0]         dina;
output reg [`READ_SRAM_BIT_PER_WORD-1:0]    douta;


reg [`READ_SRAM_BIT_PER_WORD-1:0] MEM[`READ_SRAM_WORD_AMOUNT-1:0];

reg wren_reg;
reg [$clog2(`READ_SRAM_WORD_AMOUNT)-1:0] address_reg;
reg [`READ_SRAM_BIT_PER_WORD-1:0] data_reg;


`ifdef PATTERN_PATH
  `define FILE_NAME `"`PATTERN_PATH/reads.hex`"
`else
  `define FILE_NAME "/home/raid7_1/userd/d07002/yenlung/ap_project/NGS_project/verilog/workspace/PATTERN/chr22:16135301-16135400/reads.hex"
`endif

initial begin 
  for (i=0;i<`READ_SRAM_WORD_AMOUNT;i=i+1) MEM[i] = {`READ_SRAM_BIT_PER_WORD{1'b0}};
  $readmemh(`FILE_NAME,MEM); 
end


always@(posedge clka) begin
	wren_reg 	<= wea;
	address_reg <= addra;
	data_reg	<= dina;
end


always@(posedge clka)
begin
   if(wren_reg) MEM[address_reg] <= data_reg;
end

always@(posedge clka)
begin
  if(!wren_reg) douta <= MEM[address_reg];
  else   douta <= 0;
end

endmodule

