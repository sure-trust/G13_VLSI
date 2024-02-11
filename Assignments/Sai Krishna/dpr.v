module dpr_32x8 (CLKA,CLKB, D_A, D_B, WEN_A,WEN_B,A,B,Q_A,Q_B);
	input CLKA;
	input CLKB;
	input WEN_A;
	input WEN_B;
	input [7:0] D_A;
	input [7:0] D_B;
	input [4:0] A;
	input [4:0] B;
	output reg [7:0] Q_A;
	output reg [7:0] Q_B;

	reg [7:0] mem [31:0];
	
	always @(posedge CLKA)
	    begin
			if (WEN_A) 
		   		 mem[A] <= D_A;
			else 
				Q_A <= mem[A];
		end
		 
	always @(posedge CLKB)
	    begin
			if (WEN_B) 
		   		 mem[B] <= D_B;
			else 
				Q_B <= mem[B];
		end
endmodule		
