module sdff(D,SI,SE,CLK,Q,SO,R);
input D,SI,SE,CLK;
output SO;
output reg Q;
always@(posedge clk)
begin
if (R==1)
  Q=0;
else
Q=(SE?SI:D);
end
assign  SO=Q
endmodule
