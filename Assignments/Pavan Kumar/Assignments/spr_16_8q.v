module spr_16_8q(d,clk,q,a,wren);
input [7:0] d;
input [4:0] a;
output  reg [7:0] q;
input clk,wren;
reg [7:0] mem[15:0];
always@(posedge clk)
begin
if(wren==1)
mem[a]<=d;
else
q<=mem[a];
end

endmodule

