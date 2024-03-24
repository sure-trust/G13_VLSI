module odd_even_counter(CLK,RST,OE,OUT);
input CLK,RST,OE;
output reg [2:0]OUT;
parameter  s0=3'b000;
parameter  s1=3'b001;
parameter  s2=3'b010;
parameter  s3=3'b011;
parameter  s4=3'b100; 
parameter  s5=3'b101; 
parameter  s6=3'b110; 
parameter  s7=3'b111;

reg [2:0]state,nxt_state;

always @(posedge CLK or RST)
begin
	if (RST)
	begin
		state= s0;        
	end
	else 
		state= nxt_state;
    end

always @(state,OE)
begin
	case(state)
		s0: nxt_state=OE?s1:s2;
		s1: nxt_state=OE?s3:s2;
		s2: nxt_state=OE?s3:s4;
		s3: nxt_state=OE?s5:s4;
		s4: nxt_state=OE?s5:s6;
		s5: nxt_state=OE?s7:s6;
		s6: nxt_state=OE?s7:s0;
		s7: nxt_state=OE?s0:s2;
		default: nxt_state=s0;
	endcase
end

  always@(state)begin
	case(state)
		s0: OUT=3'b000;
		s1: OUT=3'b001;
		s2: OUT=3'b010;
		s3: OUT=3'b011;
		s4: OUT=3'b100;
		s5: OUT=3'b101;
		s6: OUT=3'b110;
      s7: OUT=3'b111;
		default: OUT=3'b000;
	endcase
end
endmodule
