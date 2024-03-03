// Code your design here
module FIFO (clk,D,Q,Wen,Ren,RST,FULL,EMPTY);
parameter DEPTH=16;
parameter WIDTH=8;
parameter ADDR =4;
input CLK,RST,Wen,Ren;
input [WIDTH-1:0]D;
output reg [WIDTH-1:0]Q;
output FULL,EMPTY;
reg [ADDR-1:0] wr_pointer;    
reg [ADDR-1:0] rd_pointer;   
reg [WIDTH-1:0] mem [DEPTH-1:0];   
reg [ADDR:0] status_counter;   

//WRITE ADDRESS GENERATOR 
always@(posedge CLK)
begin
	if(RST)
		wr_pointer<=0;
	else
	begin
      if (Wen)
			wr_pointer<=wr_pointer+1;
	end
end

// READ ADDRESS GENERATOR 
always@(posedge CLK)
begin
	if(RST)
		rd_pointer<=0;
	else
	begin
      if (Ren)
			rd_pointer<=rd_pointer+1;
	end
end

// WRITE AND READ OPERATION
always@(posedge CLK)
begin
  if (Wen)
		mem[wr_pointer]<=D;
  else if (Ren)
		Q<=mem[rd_pointer];
end
  
always@(posedge CLK)
	if(RST)
		status_counter<=0;
	else
	begin
      if ((Wen && !Ren) && (status_counter !=DEPTH))
			status_counter<= status_counter+1;
      if ((Ren && !Wen) && (status_counter ==0))
			status_counter<= status_counter-1;
      if (Wen && Ren)
			status_counter<= status_counter;
	end
end
assign FULL=(status_counter==DEPTH)? 1'b1:1'b0;
assign EMPTY=(status_counter==0)? 1'b1:1'b0;

endmodule
