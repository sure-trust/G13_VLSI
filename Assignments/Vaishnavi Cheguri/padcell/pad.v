module pad(pad,IE,OE,y);
input IE,OE,a;
inout pad;
output y;
bufif1 G0(y,pad,IE);
bufif1 G1(pad,a,OE);
endmodule
