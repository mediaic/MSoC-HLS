module GATK_Variant_SRAM(
    clka,
    douta,
    dina,
    addra,
    wea
);
    integer i,j,k;

    input clka;
    input                                     wea;
    input [$clog2(`VAR_SRAM_WORD_AMOUNT)-1:0] addra;
    input [`VAR_SRAM_BIT_PER_WORD-1:0]        dina;
    output reg [`VAR_SRAM_BIT_PER_WORD-1:0]   douta;

    reg [`VAR_SRAM_BIT_PER_WORD-1:0] MEM[0:`VAR_SRAM_WORD_AMOUNT-1];

    reg wren_reg;
    reg [$clog2(`VAR_SRAM_WORD_AMOUNT)-1:0] address_reg;
    reg [`VAR_SRAM_BIT_PER_WORD-1:0] data_reg;

initial begin 
    for (i=0;i<`VAR_SRAM_WORD_AMOUNT;i=i+1) MEM[i] = {`VAR_SRAM_BIT_PER_WORD{1'b0}};

`ifdef GENO
    $readmemb("/home/raid7_1/userd/d07002/yenlung/ap_project/NGS_project/verilog/workspace/PATTERN/chr22:16135301-16135400/variants.bin", MEM);
`endif

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

