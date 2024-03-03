module dpr(CLK1,A1,D1,WEN1,Q1,CLK2,A2,D2,WEN2,Q2,);
input CLK1,CLK2;
input WEN1,WEN2;
input [7:0] D1,D2;
input [3:0] A1,A2;
output reg [7:0] Q1,Q2;
reg [7:0] memory[31:0];
always @ (posedge CLK1)
		begin
	if (WEN1)
	memory [A1]<=D1;
		else 
	Q1<=memory[A1];
		end
always @ (posedge CLK2)
		begin
	if (WEN2)
	memory [A2]<=D2;
		else 
	Q2<=memory[A2];
		end
endmodule

