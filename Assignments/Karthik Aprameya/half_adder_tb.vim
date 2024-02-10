module half_adder_tb;
  reg A,B;
  reg Cout,Sum;
  half_adder dut(.A(A), .B(B), .Cout(Cout), .Sum(Sum));
  initial
    begin
      A=0;B=0;
      #10;
      A=0;B=1;
      #10;
      A=1;B=0;
      #10;
      A=1;B=1;
    end
