module Even_Odd_Counter(CLK,OE,RST,OUT);
input CLK,OE,RST;
output reg [2:0] OUT;

parameter S0 = 3'b000,
		  S1 = 3'b001,
		  S2 = 3'b010,
		  S3 = 3'b011,
		  S4 = 3'b100,
		  S5 = 3'b101,
		  S6 = 3'b110,
		  S7 = 3'b111;


  reg [2:0] state,next_state;

// updating state

always @(posedge CLK or RST)
	begin
		if (RST)
			state <= S0;
		else
			state <= next_state;
	end

//updating next_state

always @(state,OE)
begin
case(state)
S0: if (OE)
      next_state <= S1;
    else
      next_state <= S2;
S1: if (OE)
      next_state <= S3;
    else 
      next_state <= S2;
S2: if (OE)
      next_state <= S3;
    else 
      next_state <= S4;
S3: if (OE)
      next_state <= S5;
    else 
      next_state <= S4;
S4: if (OE)
      next_state <= S5;
    else 
      next_state <= S6;
S5: if (OE)
      next_state <= S7;
    else 
      next_state <= S6;
S6: if (OE)
      next_state <= S7;
    else 
      next_state <= S0;
S7: if (OE)
      next_state <= S1;
    else 
      next_state <= S0;
endcase
end

// output 

always@(state)
begin
	case(state)
		S0: OUT=0;
		S1: OUT=1;
		S2: OUT=2;
		S3: OUT=3;
		S4: OUT=4;
		S5: OUT=5;
		S6: OUT=6;
		S7: OUT=7;
	endcase
end


endmodule
