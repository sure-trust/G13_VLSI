module mux_2x1(a, b, s, y);
output y;
input a, b, s;
assign Y=(s)?a:b;
endmodule
