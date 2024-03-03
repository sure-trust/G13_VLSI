module SRAM16_8(clk,d,a,wen,q);
input clk;
input wen;
input [7:0]d;
input [3:0]a;
output [7:0] reg q;
reg [7;0] mem [15:0];
always@(posedge clk)
begin
if (wen==1)
mem[a]<=d;
else
q<=mem[a];
end
endmodule
