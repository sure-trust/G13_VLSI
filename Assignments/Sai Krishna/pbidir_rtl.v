module pbidir(PAD,Y,A,IE,OE);
inout PAD;
input A,IE,OE;
output Y;
bufif1 g1(Y,PAD,IE);
bufif0 g2(PAD,A,OE);
endmodule
