`include "ha.v"
module ha_tb();
reg a,b;
wire s,c;
ha dut(.a(a),.b(b),.s(s),.c(c));
initial
begin
	#10 a=0;b=0;
	#10 a=0;b=1;
	#10 a=1;b=0;
	#10 a=1;b=1;
end
initial 
#100 $finish;
endmodule


