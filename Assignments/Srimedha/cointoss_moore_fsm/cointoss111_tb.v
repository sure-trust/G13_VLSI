`include "moore_111.v"
module moore111_tb;
reg clk,rst;
reg x;
wire y;
moore111 dut(clk,rst,x,y);
always #5 clk=~clk;
initial begin
	clk=1;
	rst=1;
	x=1;
	#10;
	rst=0;
	x=1;
	#10;
	x=0;
	#10;
	x=1;
	#10;
	x=1;
	#10;
	x=1;
	#10;
	x=1;
	#10;
	x=0;
	#10;
	x=1;
        #10;
	$finish;
end
endmodule


