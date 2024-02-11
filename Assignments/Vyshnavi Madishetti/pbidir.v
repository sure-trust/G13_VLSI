module pbidir(pad,ie,oe,y,a);
  input ie,oe,a;
  inout pad;
  output y;
  bufif1 b0(y,pad,ie);
  bufif1 b1(pad,a,oe);
endmodule
