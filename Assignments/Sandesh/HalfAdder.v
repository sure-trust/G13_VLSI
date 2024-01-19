module halfadder(A,B,S,C);
 input A,B;
 output S,C;
 assign {C,S} =A+B;
 endmodule

 module HalfAdder(A,B,S,C);
 input A,B;
 output S,C;
 assign S = A^B;
 assign S = A&B;
 endmodule


module halfadder(A,B,S,C);
 input A,B;
 output S,C;
 always @(A,B)
 begin
	 case({A,B})
		 2'b00 : begin
			 S=0;
			 C=0;
		 end
		 
		 2'b01 : begin
			 S=1;
			 C=0;
		 end
		 2'b10 : begin
			 S=1;
			 C=0;
		 end

		 2'b11 : begin
			 S=0;
			 C=1;
		 end
	 endcase
 end
 endmodule


module ha(a,b,s,c);
input a,b;
output reg s,c;
always @(*)
begin
		casex({a,b}) 
		0x:begin 
			s=b;
		    c=0;
		   end
		1x:begin 
			s=~b;
		    c=b;
		   end
		endcase
end 
endmodule
