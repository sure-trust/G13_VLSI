module full_adder(A, B, Cin, Cout, Sum);
  input A,B,Cin;
  output reg Sum,Cout;
  always @(*)
    begin
    Sum=A^B^Cin;
    Cout=A&B|B&Cin|Cin&A;
  end 
endmodule
