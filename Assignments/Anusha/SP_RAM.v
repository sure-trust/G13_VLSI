module SP_RAM_16x8 (D,CLK,ADR,WRE,Q);
input CLK,WRE;
input [7:0]D;
input [15:0]ADR;
output reg [7:0]Q;

reg [15:0] mem [7:0];

always @(posedge CLK)
 begin
  if (WRE)
    mem[ADR] <= D;
  else if(!WRE)
    Q <= mem[ADR];
 end
endmodule
  
