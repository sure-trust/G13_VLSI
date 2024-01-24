module Full_adder(A,B,C,Sum,Carry);
input A,B,C;
output Sum,Carry;
assign Sum= A^B^C;
assign Carry= ((A&B)|(C&(A^B)));
endmodule

module Adder_16bit(a,b,c,sum,Cout);
parameter N=16
input [N-1:0]a,b;
input c;
output [N-1:0]sum;
output Cout;
wire [N-1:0]carry;
genvar i;
generate
for(i=0;i<N-1;i=i+1)
  begin: FullAdder
    Full_adder FA1(.A(a[i]),.B(b[i]),.C(c[i]),.Sum(sum[i]),.Carry(carry[i]));
  end
endgenerate

assign Cout=carry[N-1];
assign carry[0]=c;
endmodule



