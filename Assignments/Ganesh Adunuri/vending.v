module vending (clk,rst,in,out);
input clk;
input rst;
output reg out;
localparam idle=3'b000;
localparam s1=3'b001;
localparam s2=3'b010;
localparam s3=3'b011;
localparam s4=3'b100;

reg [2:0] state, next_state;

always@(posedge clk)
	begin
	if(rst)
		state<=idle;
	else
		state<=next_state;
	end
always@(state,in)
	begin
	case(state)
	idle : if(in==3'b001)
			next_state<=s1;
		else if (in==3'b010)
			next_state<=s2;
		else if (in==3'b101)
			next_state<=idle;

	s1 : if(in==3'b001)
			next_state<=s1;
		else if (in==3'b010)
			next_state<=s2;
		else if (in==3'b101)
			next_state<=s1;

	s2 : if(in==3'b001)
			next_state<=s1;
		else if (in==3'b010)
			next_state<=s2;
		else if (in==3'b101)
			next_state<=s2;

	s3 : if(in==3'b001)
			next_state<=s1;
		else if (in==3'b010)
			next_state<=s2;
		else if (in==3'b101)
			next_state<=s3;

	s4 : if(in==3'b001)
			next_state<=s1;
		else if (in==3'b010)
			next_state<=s2;
		else if (in==3'b101)
			next_state<=s4;
	endcase
endmodule






