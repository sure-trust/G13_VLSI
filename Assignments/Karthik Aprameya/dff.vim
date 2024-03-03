module serial_tb;
  reg [3:0] SI, D;
  reg SE, R, Clk;
  wire [3:0] Q;
  
  shift_reg dut (
    .D(D),
    .SE(SE),
    .SI(SI),
    .R(R),
    .Clk(Clk),
    .Q(Q)
  );

  initial begin
    R = 0; D = 1; SE = 1; SI = 0;
    #10;
    R = 1; D = 0; SE = 0; SI = 0;
    #10;
    R = 1; D = 3; SE = 0; SI = 5;
    #10;
    R = 1; D = 7; SE = 0; SI = 8;
    #10;
    R = 1; D = 14; SE = 1; SI = 8;
    #10;
    R = 1; D = 8; SE = 1; SI = 0;
    #10;
    R = 1; D = 1; SE = 0; SI = 0;
    #10;
    R = 1; D = 4; SE = 0; SI = 4;
    #10;
    R = 1; D = 12; SE = 1; SI = 0;
    #10;
    R = 1; D = 1; SE = 1; SI = 1;
    #10;

    $dumpfile("dump.vcd");
    $dumpvars();
    $finish;
  end

  always begin #5;Clk=1'b0;#5;Clk=1'b1;
    end
endmodule

