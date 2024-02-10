module fulladder_tb();
  reg [2:0]A;
wire S,C;

  fulladder dut(.A(A),.S(S),.C(C));
  initial 
    begin
      A=3'b000;
      #10;
      A=3'b001;
      #10;
      A=3'b010;
      #10;
      A=3'b011;
      #10;
      A=3'b100;
      #10;
      A=3'b101;
      #10;
      A=3'b110;
      #10;
      A=3'b111;
      #10;
      $finish;
    end
endmodule
