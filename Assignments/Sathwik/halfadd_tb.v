`include "halfadd.v"
module halfadder_tb();
reg a,b;
wire S,C;
halfadder dut(.a(a),.b(b),.S(S),.C(C));
initial begin
     #5  a=1'b0;b=1'bo;
     #10 a=1'bo;b=1'b1;
     #10 a=1'b1;b=1'b0;
     #10 a=1'b1;b=1'b1;
end
endmodule 

