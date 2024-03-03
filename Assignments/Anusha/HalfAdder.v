module halfadder(a,b,sum,carry);
input a,b;
output reg sum,carry;

always @(a,b)
  begin
    sum <=a^b;
    carry <=a&b;
  end
endmodule  



