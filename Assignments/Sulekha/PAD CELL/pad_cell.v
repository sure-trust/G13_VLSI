// ASSIGNMENT 4 PAD CELL
module pad_rtl(A,IE,OE,PAD,Y);
inout PAD;
input A,IE,OE;
output Y;

// bufif1 g1(Y,PAD,IE);
// bufif1 g2(PAD,A,OE);
  
  assign Y=(IE==1 && OE==0)?PAD:1'bz;
  assign PAD=(IE==0 && OE==1)?A:1'bz;

endmodule
