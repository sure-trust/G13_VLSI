module halfadder(a,b,S,C);
input a,b;
output reg S,C;
always @(*)
begin
Sum = a^b;
Cout = a&b;
end
endmodule
