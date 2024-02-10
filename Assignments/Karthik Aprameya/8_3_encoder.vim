module encoder(In,out);
  input [7:0] In;
  output reg out;
  initial begin
    case(In)
      1 : out=0;
      2 : out=1;
      4 : out=2;
      8 : out=3;
      16 : out=4;
      32 : out=5;
      64 : out=6;
      128 : out=7;
    endcase
  end
      endmodule
