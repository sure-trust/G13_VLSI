module PBIDIR(PAD,Y,A,IE,OE)
inout PAD;
output Y;
input A;
input IE,OE;
bufif1 g1(Y,PAD,IE);
bufif1 g2(PAD,A,OE);
endmodule
