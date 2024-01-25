`include "mux2to1.v"
module mux2to1_tb();
reg A,B,S;
wire Y;
mux2to1 dut(.A(A),.B(B),.S(S),.Y(Y));
initial
	begin
	A=0;B=0;S=0; #100;
	A=0;B=0;S=1; #100;
	A=0;B=1;S=0; #100;
	A=0;B=1;S=1; #100;
	A=1;B=0;S=0; #100;
	A=1;B=0;S=1; #100;
	A=1;B=1;S=0; #100;
	A=1;B=1;S=1; #100;
	$finish;
	end
endmodule
