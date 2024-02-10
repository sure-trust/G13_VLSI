module halfadder(a,b,sum,carry);
input a,b;
output reg sum,carry;

always @(a,b)
   begin
     sum <= a^b;
     carry <=a&b;
   end
endmodule

module full_adder(A,B,C,SUM,CARRY);
input A,B,C;
output reg SUM,CARRY;

wire w1,w2,w3;

halfadder HA1(A,B,w1,w2);
halfadder HA2(C,w1,SUM,w3);
or O1(CARRY,w2,w3);

endmodule

