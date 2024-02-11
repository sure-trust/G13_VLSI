module sdff(d,clk,r,si,se,so,q,f);
input d,si,clk,r,se;
output reg q,so;
wire f;
assign f=(se)?si:d;

always@(posedge clk)
begin
if(r==1)
q=1'b0;
else
q=f;
end
assign so=q;
endmodule

