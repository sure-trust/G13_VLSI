module FA(a,b,c,s,ca);
input a,b,c;
output reg s,ca;
always@(*)
 begin
  s = a^b^c;
  ca = (a&b)|(a&c)|(b&c);
 end
 endmodule
