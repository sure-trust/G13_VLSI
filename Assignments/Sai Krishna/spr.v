module spr_16x8 (CLK, D, A, WEN, Q);
	input CLK;
	input WEN;
	input [7:0] D;
	input [3:0] A;
	output [7:0] Q;

	reg [7:0] mem [15:0];
	
	always @(posedge CLK)
	    begin
		if (WEN) 
		    mem[A] <= D;
		else if (!WEN)	
	   	    Q <= mem[A];
	    end	
endmodule

