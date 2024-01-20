module fa_1(a,b,ci,s,co);
input a,b,ci;
output s,co;
assign s = (a^b)^ci;
assign co = (a&b)|(b&ci)|(ci&a);
endmodule

