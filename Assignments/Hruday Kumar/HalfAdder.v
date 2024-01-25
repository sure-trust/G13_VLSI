module HA(A,B,Sum,Cout);
input A,B;
output reg Sum,Cout;
always @(*)
begin
Sum = A^B;
Cout = A&B;
end
endmodule
