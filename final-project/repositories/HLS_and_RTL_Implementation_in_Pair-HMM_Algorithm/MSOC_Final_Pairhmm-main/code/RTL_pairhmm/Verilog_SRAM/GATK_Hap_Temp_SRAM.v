
module GATK_Hap_Temp_SRAM(

clka,
douta, dina, addra, wea

);

//{4'b transition, 10'b local region, 600'b haplotype}

input clka;
input wea;
input [$clog2(`HAP_TEMP_SRAM_WORD_AMOUNT)-1:0] addra;
input [`HAP_TEMP_SRAM_BIT_PER_WORD-1:0] dina;
output reg [`HAP_TEMP_SRAM_BIT_PER_WORD-1:0] douta;

reg [`HAP_TEMP_SRAM_BIT_PER_WORD-1:0] MEM[`HAP_TEMP_SRAM_WORD_AMOUNT-1:0];

reg wren_reg;
reg [$clog2(`HAP_TEMP_SRAM_WORD_AMOUNT)-1:0] address_reg;
reg [`HAP_TEMP_SRAM_BIT_PER_WORD-1:0] data_reg;

always@(posedge clka) begin
	wren_reg	<= wea;
	data_reg	<= dina;
	address_reg	<= addra;
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

