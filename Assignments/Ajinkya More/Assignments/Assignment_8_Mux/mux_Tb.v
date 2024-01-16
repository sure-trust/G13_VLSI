module TB;
reg [7:0]D;
reg [2:0]S;
wire Y;
mux dut(.D(D),.S(S),.Y(Y));
always @(*)
begin
	$monitor("Time = %d , D=%d , S=%d , Y=%d ",$time,D,S,Y);
	D=$random;
	#10;
	S=$random;
	#10;
end
endmodule

