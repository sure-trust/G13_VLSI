module mux2x1(Y,A,S,B);
 input A,B,S;
 output reg Y;
 always @(*)
	 begin
		 if(S)
			 Y=A;
		 else
			 Y=B;
	end
 endmodule
