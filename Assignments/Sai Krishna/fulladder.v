module FA(a,b,c,sum,carry);
input a,b,c;
output wire sum,carry;
always@(*)
 begin
  sum = (a^b^c);
  carry = ((a&b)|(a&c)|(b&c));
 end
endmodule

