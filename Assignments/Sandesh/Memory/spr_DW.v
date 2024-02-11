module spr_16x8 (CLK, Din, A, WEN, Dout);
  input CLK, WEN;
  input [7:0] Din;
  input [3:0] A;
  output reg [7:0] Dout;

  reg [7:0] mem [15:0];

  always @(posedge CLK)
    begin
      if (WEN)
        mem[A] <= Din;
      else
        Dout <= mem[A];
    end
endmodule

