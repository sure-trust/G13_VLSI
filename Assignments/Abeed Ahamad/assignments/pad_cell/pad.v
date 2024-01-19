module PBIDIR(PAD,Y,A,IE,OE);
input A;
input IE,OE;
output Y;
inout PAD;
bufif1 g1(Y,PAD,IE);
bufif1 g2(PAD,A,OE);
endmodule


