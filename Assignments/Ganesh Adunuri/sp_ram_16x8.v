module sp_ram_16x8(A,D,CLK,WEN,Q);
input CLK;
input [7:0] A;
input [3:0] D;
input WEN;
output reg [7:0] Q;
  reg [7:0] mem [15:0];
always@(posedge CLK)
		begin
          if(WEN==1)
	mem[A] <=D;
	else
      Q<=mem[A];
		end
endmodule
