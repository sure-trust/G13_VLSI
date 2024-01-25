module pad_cell(input IE,OE,A,PAD,
                   output Y);
  bufif0 g1(PAD,OE,A);
  bufif1 g2(Y,IE,PAD);
endmodule
