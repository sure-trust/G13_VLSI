`include "mux_8x1.v"
module mux_8x1_tb;

reg [7:0] i;
reg [2:0] s;
wire out;
integer x;
mux_8x1 uut(
    .i(i),
    .s(s),
    .out(out)
);
initial 
	begin
	for (x=0; x<8; x=x+1)
	begin
	s=x;
	i[0]=1'b0; #10;
	i[0]=1'b1; #10;
	end
	$finish;
	end
endmodule

