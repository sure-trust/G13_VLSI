module spr(data,clk,q,addr,wren);
input [7:0] data;
input [4:0] addr;
output  reg [7:0] q;
input clk,wren;

reg [7:0] mem[15:0];

always@(posedge clk)
begin
if(wren) 
mem[addr]<=data;
else
q<=mem[addr];
end

endmodule
