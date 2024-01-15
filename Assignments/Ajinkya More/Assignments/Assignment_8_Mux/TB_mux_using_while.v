module tb;
reg [7:0]D;
reg [2:0]S;
wire Y;
integer x;
mux uut(.D(D),.S(S),.Y(Y));
initial begin
	x=0;
while(x<9)
begin
	S=x;
	i[x]=1'b0;
	#10;
	i[x]=1'b1;
	#10;
end
end
endmodule

