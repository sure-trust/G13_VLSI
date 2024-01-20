module dffb(q,d,clk,rst);

	input d,clk,rst;
	output reg q;

	always@(posedge clk, negedge rst)
		if(!rst)
			q <= 1'b0;
		else
			q <= d;

endmodule
