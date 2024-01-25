module PBIDIR_tb();
reg IE, OE, A;
wire PAD;
wire Y;
reg PAD_temp;
//dut instance
PBIDIR dut(.IE(IE),.OE(OE),.PAD(PAD),.Y(Y),.A(A));

assign PAD = (IE == 1 && OE == 0)? PAD_temp : 1'bz;

intial begin
	//case 1
	IE = 1;
	OE = 0;
	PAD_temp = 0;
	#10;
	PAD_temp = 1;
	#10;

	// case 2
	IE = 0;
	OE = 1;
	A = 0;
	#10;
	A = 1;
	#10;

	//case 1.1
	IE = 1;
	OE = 0;
	PAD_temp = 0;
	#10;
	A = 1;
	#10;

	//case 2.1
	IE = 0;
	OE = 1;
	A = 0;
	#10;
	A = 1;
	#10;



end
endmodule
