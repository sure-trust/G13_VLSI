module paritygen(clk,a,rst,b);
input clk,rst,a;
output reg b;
localparam s0=3'b000,s1=3'b001,s2=3'b010,s3=3'b011,s4=3'b100,s5=3'b101,s6=3'b110,s7=3'b111;
reg [2:0]state,nxt_state;
always @(posedge clk , posedge rst)
begin
	if (rst)
	begin
		state<= s0;
                
	end
	else 
		state<= nxt_state;
end

always@(state)
begin
	case(state)
		s0: b=0;
		s1: b=0;
		s2: b=0;
		s3: b=0;
		s4: b=0;
		s5: b=0;
		s6: b=1;
	endcase
  b <= (nxt_state==s6);

end
endmodule


