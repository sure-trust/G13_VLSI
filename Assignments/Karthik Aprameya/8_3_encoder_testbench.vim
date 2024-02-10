module encoder_tb;
  reg [7:0] In;
  wire [2:0] out;
  encoder dut(.In(In), .out(out));
  initial begin
    In=1;
    #10;
     In=4;
    #10;
    In=8;
    #10;
     In=16;
    #10;
     In=32;
    #10;
     In=64;
    #10;
    In=128;
    #10;
  end
  initial
  begin
    $dumpfile("dump.vcd");
    $dumpvars();
    end
endmodule
 
