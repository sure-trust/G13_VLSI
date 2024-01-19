module tb;
reg [7:0]A;
reg [2:0]sel;
wire Y;
mux dut(.A(A),.sel(sel),.Y(Y));
always @(*)
begin
	$monitor("Time = %d , A=%d , sel=%d , Y=%d ",$time,A,sel,Y);
	A=$random;
	#10;
	sel=$random;
	#10;
end
endmodule
