module sram_16X8(clk,wen,in,out,addr);
input wen;
input clk;
input [3:0] addr;
input [7:0] In;
output reg [7:0] Out;
reg [7:0] mem [0:15];
always @(posedge clk) begin
if(wen)
	mem[addr]<=in;
else
	out<=mem[addr];
	end
	endmodule
