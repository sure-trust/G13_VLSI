module sram16x8(clk,d,a,wen,q);       
input clk, wen;
input [7:0]d;      
input [3:0]a;
output reg [7:0]q;
reg [7:0][15:0]mem;
always@(posedge clk)
begin
	if (wen==1)
		mem[a]<=d;         // writing into the memory
	else 
		q<=mem[a];         // reading out off the memory 
end
endmodule

