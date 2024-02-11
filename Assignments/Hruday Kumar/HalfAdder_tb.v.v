`include "HalfAdder.v"
module HalfAdder_tb();
reg A,B;
wire Sum,Cout;
HalfAdder dut(.A(A),.B(B),.Sum(Sum),.Cout(Cout));
initial begin
     #5  A=1'b0;B=1'bo;
     #10 A=1'bo;B=1'b1;
     #10 A=1'b1;B=1'b0;
     #10 A=1'b1;B=1'b1;
end
endmodule 

