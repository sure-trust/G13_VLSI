module halfadder_tb();
reg A,B;
wire S,C;

halfadder dut(.A(A),.B(B),.S(S),.C(C));
initial
begin
	A=0; B=0;
	#10;
	A=0; B=1;
	#10;
	A=1; B=0;
	#10;
	A=1; B=1;
	#10;
	$finish;
end
endmodule

