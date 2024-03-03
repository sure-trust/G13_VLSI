module spr_16x8(CLK,Addr,Data,WEN,Q);
  input CLK,WEN;
  input [3:0]Addr;
  input [7:0]Data;
  output reg [7:0]Q;
  
  reg [7:0] mem [15:0];
  
  always @(posedge CLK)
    begin
      if(WEN)
        mem[Addr] <=Data;
      else
        Q <= mem[Addr];
    end
endmodule
      
