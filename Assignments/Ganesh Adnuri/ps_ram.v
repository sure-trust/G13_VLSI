module sp_ram(A,D,CLK,WEN,Q);
input CLK;
input [7:0] A;
input [3:0] D;
input WEN;
output [7:0] Q;
reg [7:0] mem [15:0];
always@(posedge CLK)
		begin
	if(WEN)
	mem[A] <=D;
	else (!WEN) <=D
	Q<=mem[A];
		end
endmodule
