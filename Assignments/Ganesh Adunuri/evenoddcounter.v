module evenoddcounter(clk,oe,rst,out);
input clk;
input oe;
input rst;
output reg [2:0]out;
localparam s0=3'b000,
localparam s1=3'b001,
localparam s2=3'b010,
localparam s3=3'b011,
localparam s4=3'b100,
localparam s5=3'b101,
localparam s6=3'b110,
localparam s7=3'b111;
reg [2:0]state,next_state;
always @(posedge clk , posedge rst)
begin
	if (rst)
	begin
		state<= s0;
                
	end
	else 
		state<= next_state;
end

always@ (state)
begin
	case(state)
		s0: next_state=oe?s1:s2;
		s1: next_state=oe?s3:s2;
		s2: next_state=oe?s3:s4;
		s3: next_state=oe?s5:s4;
		s4: next_state=oe?s5:s6;
		s5: next_state=oe?s7:s6;
		s6: next_state=oe?s7:s0;
		s7: next_state=oe?s0:s2;
	endcase
end

always@(state,oe)
begin
	case(state)
		s0: out=0;
		s1: out=1;
		s2: out=2;
		s3: out=3;
		s4: out=4;
		s5: out=5;
		s6: out=6;
		s7: out=7;
		default: out=0;
	endcase
end
endmodule
