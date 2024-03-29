module paritygenerator(clk,rst,x,y);
input clk,rst,x;
output reg y;
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

always@ (*)
begin
	case(state)
		s0: nxt_state=x?s4:s1;
		s1: nxt_state=x?s5:s2;
		s2: nxt_state=x?s6:s3;
		s3: nxt_state=x?s0:s0;
		s4: nxt_state=x?s2:s5;
		s5: nxt_state=x?s3:s6;
		s6: nxt_state=x?s0:s0;
	endcase
  y <= (nxt_state==s6);

end
 
endmodule

