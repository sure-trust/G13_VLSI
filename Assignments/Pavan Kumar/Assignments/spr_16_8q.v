<<<<<<< HEAD
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

=======
module spr_16_8q(d,clk,q,a,wen);
input [7:0] d;
input [4:0] a;
output  reg [7:0] q;
input clk,wen;

reg [7:0] mem[15:0];

always@(posedge clk)
begin
if(wen==1)
mem[a]<=d;
else
q<=mem[a];
end

endmodule

>>>>>>> 3c2e907bbf82f92cca2cae619c53e66e0f59ff7d
