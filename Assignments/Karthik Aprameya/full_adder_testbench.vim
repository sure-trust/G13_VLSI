module full_adder_tb;
  reg A,B,Cin;;
  reg Cout,Sum;
  full_adder dut(.A(A), .B(B), .Cin(Cin), .Cout(Cout), .Sum(Sum));
  initial
    begin
      A=0;B=0;Cin=0;
      #10;
      A=0;B=0;Cin=1;
      #10;
      A=0;B=1;Cin=0;
      #10;
       A=0;B=1;Cin=1;
      #10;
       A=1;B=0;Cin=0;
      #10;
       A=1;B=0;Cin=1;
      #10;
       A=1;B=1;Cin=0;
      #10;
       A=1;B=1;Cin=1;
      #10;
    end
  initial
  begin
    $dumpfile("dump.vcd");
    $dumpvars();
    end
endmodule
