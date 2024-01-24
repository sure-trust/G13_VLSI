module memory_16X8(Clk,wen,In,Out,Addr);
input wen;
input Clk;
input [7:0] Addr;
input [7:0] In;
output reg [7:0] Out;
reg [7:0] mem [0:15];
always @(posedge clk) begin
if(wen)
mem[Addr]<=In;
else
	Out<=mem[Addr];
	end
	endmodule
