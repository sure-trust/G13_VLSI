module D_ff(D,clk,rst,Q);
input D,clk,rst;
output reg Q;

always @(posedge clk)
   begin
     if(rst)
	 Q <= 1'b0;
     else
	 Q <= D;
   end
endmodule
