
module dualportram(clk1,clk2,di1,di2,a1,a2,wen1,wen2,do1,do2);       
input clk1,clk2,wen1, wen2;
parameter a_width=4;
parameter d_width=8;
parameter a_depth=16;

  input [d_width-1:0]di1,di2;      
  input [a_width-1:0]a1,a2;
  output reg [7:0]do1,do2;

reg [d_width-1:0]mem[a_depth-1:0];

always@(posedge clk1)
begin
	if (wen1)
      mem[a1]<=di1;         // writing into the memory
	else 
		do1<=mem[a1];         // reading out off the memory 
end

always@(posedge clk2)
begin
	if (wen2)
      mem[a2]<=di2;         // writing into the memory
	else 
		do2<=mem[a2];         // reading out off the memory 
end

endmodulee
