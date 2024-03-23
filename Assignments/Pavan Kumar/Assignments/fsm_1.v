module odd_even_counter(
input CLK,OE,RST,
output OUT
);
localparam S0 = 3'b000,
		  S1 = 3'b001,
		  S2 = 3'b010,
		  S3 = 3'b011,
		  S4 = 3'b100,
		  S5 = 3'b101,
		  S6 = 3'b110,
		  S7 = 3'b111;

//introducing our intermediate state pointers
reg [2:0] state, next_state;

// updation of state

always @(posedge CLK or posedge RST)
	begin
		if (RST)
		begin
			state <= S0;
			next_state<=S1;
			end
		else
			state <= next_state;
	end

//updation of  next state

always @ (*)
	begin
		case(state)
			S0 : begin 
					if (OE)
					next_state <= S1;
				   else
					next_state <= S2;
					end
					
			S1 : begin 
			if (OE)
					next_state <= S3;
				else
					next_state <= S2;
					end
					
			S2 : begin 
			if (OE)
					next_state <= S3;
				else
					next_state <= S4;
					end
			S3 : begin if (OE)
					next_state <= S5;
				else
					next_state <= S4; end
			S4 :  begin if (OE)
					next_state <= S5;
				else
					next_state <= S6; end
			S5 :  begin if (OE)
					next_state <= S7;
				else
					next_state <= S6; end
			S6 : begin if (OE)
					next_state <= S7;
				else
					next_state <= S0; end
			S7 :  begin if (OE)
					next_state <= S0;
				else
					next_state <= S2; end
	
	endcase
end         

assign OUT = (state == S0)? 3'b000:3'bzzz;
assign OUT = (state == S1)? 3'b001:3'bzzz;
assign OUT = (state == S2)? 3'b010:3'bzzz;
assign OUT = (state == S3)? 3'b011:3'bzzz;
assign OUT = (state == S4)? 3'b100:3'bzzz;
assign OUT = (state == S5)? 3'b101:3'bzzz;
assign OUT = (state == S6)? 3'b110:3'bzzz;
assign OUT = (state == S7)? 3'b111:3'bzzz;

endmodule

