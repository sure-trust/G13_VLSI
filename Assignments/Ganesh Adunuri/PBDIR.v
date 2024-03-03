module PBDIR(PAD,Y,A,IE,OE);
inout PAD;
input A;
input IE,OE;
output Y;
bufif1 g1(Y,PAD,IE);
bufif1 g2(PAD,A,OE);
endmodule
