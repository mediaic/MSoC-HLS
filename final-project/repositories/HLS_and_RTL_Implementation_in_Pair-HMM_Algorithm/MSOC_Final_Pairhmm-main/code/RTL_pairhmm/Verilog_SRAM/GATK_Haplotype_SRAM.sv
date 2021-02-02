// `define HAP_PATTERN


module GATK_Haplotype_SRAM(

clka,
douta, dina, addra, wea

);
integer i,j,k;
input clka;
input                                     wea;
input [$clog2(`HAP_SRAM_WORD_AMOUNT)-1:0] addra;
input [`HAP_SRAM_BIT_PER_WORD-1:0]        dina;
output reg [`HAP_SRAM_BIT_PER_WORD-1:0]   douta;

reg [`HAP_SRAM_BIT_PER_WORD-1:0] MEM[`HAP_SRAM_WORD_AMOUNT-1:0];

reg wren_reg;
reg [$clog2(`HAP_SRAM_WORD_AMOUNT)-1:0] address_reg;
reg [`HAP_SRAM_BIT_PER_WORD-1:0] data_reg;


`ifdef PATTERN_PATH
  `define FILE_NAME `"`PATTERN_PATH/haplotypes.bin`"
`else
  `define FILE_NAME "/home/raid7_1/userd/d07002/yenlung/ap_project/NGS_project/verilog/workspace/PATTERN/chr22:16135301-16135400/haplotypes.bin"
`endif



initial begin 
  for (i=0;i<`HAP_SRAM_WORD_AMOUNT;i=i+1) MEM[i] = {`HAP_SRAM_BIT_PER_WORD{1'b0}};
  $readmemb(`FILE_NAME,MEM);
end


always@(posedge clka) begin
	wren_reg	<= wea;
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

