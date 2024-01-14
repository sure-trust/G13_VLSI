module dff(D,clk,Rst,Q);
 input D,clk,Rst;
 output Q;

 always @(posedge clk)
 begin
	 case(Rst)
		 1'b1 : Q<=1'b0;
		 1'b0 : Q<=D;
	 endcase

 end
 endmodule
	 
