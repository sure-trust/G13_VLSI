module dff(d,clk,r,q);
input d,clk,r;
output q;

always@(posedge clk)

begin
if(r==1)
q=1'b0;
else
q=d;
end
endmodule

