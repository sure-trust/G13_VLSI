module dff(d,rst,clk,q);
input d,clk,rst;
output q;
always @(posedge clk)
begin
if(rst)
1'b1:q<=1'b0;
1'b0:q<=d;
else
1'b0:q<=q;
1'b1:q<=d;
end
endmodule
