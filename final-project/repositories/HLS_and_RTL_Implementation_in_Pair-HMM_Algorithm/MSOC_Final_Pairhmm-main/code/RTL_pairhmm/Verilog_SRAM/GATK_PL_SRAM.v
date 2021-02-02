
module GATK_PL_SRAM(

clka,
douta, dina, addra, wea

);
integer i,j,k;
input                                       clka;
input                                       wea;
input [$clog2(`PL_SRAM_WORD_AMOUNT)-1:0]  addra;
input [`PL_SRAM_BIT_PER_WORD-1:0]         dina;
output reg [`PL_SRAM_BIT_PER_WORD-1:0]    douta;


reg [`PL_SRAM_BIT_PER_WORD-1:0] MEM[`PL_SRAM_WORD_AMOUNT-1:0];

reg wren_reg;
reg [$clog2(`PL_SRAM_WORD_AMOUNT)-1:0] address_reg;
reg [`PL_SRAM_BIT_PER_WORD-1:0] data_reg;

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

