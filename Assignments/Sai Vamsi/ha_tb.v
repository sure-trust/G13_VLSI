`include "ha_1.v"
module tb;
reg a,b;
wire s,c;
ha_1 dut(.a(a),.b(b),.s(s),.c(c));
initial begin
a=$random;
b=$random;
#1;
$display("time=%0t-a=%d,b=%d,s=%d,c=%d",$time,a,b,s,c);
end
endmodule

