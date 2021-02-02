
module GATK_Direction_SRAM(

clka,
douta, dina, addra, wea

);

input clka;
input wea;
input [`DIR_SRAM_ADDR_WIDTH-1:0] addra;
input [`DIR_SRAM_BIT_PER_WORD-1:0] dina;
output reg [`DIR_SRAM_BIT_PER_WORD-1:0] douta;

reg [`DIR_SRAM_BIT_PER_WORD-1:0] MEM[`DIR_SRAM_WORD_AMOUNT-1:0];

reg wren_reg;
reg [`DIR_SRAM_ADDR_WIDTH-1:0] address_reg;
reg [`DIR_SRAM_BIT_PER_WORD-1:0] data_reg;

always@(posedge clka) begin
	wren_reg	<= wea;
	address_reg	<= addra;
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

