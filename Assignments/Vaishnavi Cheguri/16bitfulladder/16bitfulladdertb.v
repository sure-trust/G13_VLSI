`include "16bitFA..v"

module 16bitFA_tb();
reg [15:0] a,b;
reg ci;
wire [15:0] s;
wire co;
16bitFA dut(a,b,ci,s,co);

initial begin
	$monitor("a=%d,b=%d,ci=%d,co=%d,s=%d", a,b,cic,s,co);
	a=16'b0000000000000000;
	b=16'b0000000000000000;
	ci=0;
	#10;
	a=16'b0000000000000001;
	b=16'b0000000000000001;
	ci=0;
	#10;
	a=16'b1111111111111111;
	b=16'b1111111111111111;
	ci=0;
	#10;
	a=16'b0000000000000000;
	b=16'b0000000000000000;
	ci=1;
	#10;
	a=16'b1111111111111111;
	b=16'b1111111111111111;
	ci=1;
	#10;
	$finish;
end
endmodule
