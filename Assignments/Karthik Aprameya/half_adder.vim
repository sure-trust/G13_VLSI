half_adder
module half_adder(A, B, Cout, Sum);
  input A,B;
  output reg Sum,Cout;
  always @(*)
    begin
    Sum=A^B;
    Cout=A&B;
  end 
endmodule
