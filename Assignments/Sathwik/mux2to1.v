module mux2to1(A,B,S,Y);
input A,B,S;
output reg Y;
always @(*)
	begin
	if(S==0)
		Y=A;
	else
		Y=B;
end
endmodule
