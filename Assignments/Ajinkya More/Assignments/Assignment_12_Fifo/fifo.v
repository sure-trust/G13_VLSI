`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/11/2024 06:40:24 PM
// Design Name: 
// Module Name: fifo
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module fifo #(parameter DEPTH=16, WIDTH=8,ADDR =4) (CLK,D,Q,WEN,REN,FULL,EMPTY,RST);
input CLK,RST,WEN,REN;
input [WIDTH-1:0]D;
output reg [WIDTH-1:0]Q;
output  FULL,EMPTY;
reg [ADDR-1:0] wr_pointer;    
reg [ADDR-1:0] rd_pointer;   
reg [WIDTH-1:0] mem [DEPTH-1:0];   //MEMORY CORE
reg [ADDR+1:0] status_counter;   //STATUS COUNTER

//WRITE ADDRESS GENERATOR 
always@(posedge CLK)
begin
	if(RST)
		wr_pointer<=0;
	else
	begin
		if (WEN)
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
		if (REN)
			rd_pointer<=rd_pointer+1;
	end
end

// WRITE AND READ OPERATION
always@(posedge CLK)
begin
	if (WEN)
		mem[wr_pointer]<=D;
	if (REN)
		Q<=mem[rd_pointer];
end
//STATUS COUNTER LOGIC 
always@(posedge CLK)
 begin
	if(RST)
		status_counter<=0;
	else
	begin
		if ((WEN && !REN) && (status_counter !=DEPTH))
			status_counter<= status_counter+1;
		if ((REN && !WEN) && (status_counter ==0))
			status_counter<= status_counter-1;
		if (WEN && REN)
			status_counter<= status_counter;
	end
end
assign FULL=(status_counter==DEPTH)? 1'b1:1'b0;
assign EMPTY=(status_counter==0)? 1'b1:1'b0;

endmodule
