module sram_16X8(clk,wen,in,out,addr);
input wen;
input clk;
input [7:0] addr;
input [7:0] in;
output reg [7:0] out;
reg [7:0] mem [0:15];
always @(posedge clk) begin
if(wen)
mem[addr]<=in;
else
	Out<=mem[addr];
	end
	endmodule
