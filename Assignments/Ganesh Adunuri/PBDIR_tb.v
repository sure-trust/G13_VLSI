module PBDIR_tb();
	reg IE,OE,A;	//input ports
	wire y;			//output port
	wire PAD;		//inout port
	reg PAD_temp;	//inout temp reg
	//dut 
	PBDIR dut(.IE(IE), .OE(OE), .A(A), .Y(Y), .PAD(PAD));
	assign PAD =(IE==1 && OE==0)? PAD_temp:1'bz;
	initial 
	begin 
	$monitor("IE=%0b , OE=%0b , PAD_temp=%0b , Y=%0b , A=%0b, PAD=%0b",IE,OE,PAD_temp,Y,A,PAD); 
	//case-1
	IE=1;
	OE=0;
	PAD_temp=0;
	#20;
	PAD_temp=1;
	#20;
	//case-2
	IE=0;
	OE=1;
	PAD_temp=0;
	#20;
	PAD_temp=1;
	#20;
	//case-1.1
	IE=1;
	OE=0;
	A=~Y;
	PAD_temp=0;
	#20;
	PAD_temp=1;
	#20;
	//case-2.1
	IE=1;
	OE=0;
	A=Y;
	PAD_temp=0;
	#20;
	PAD_temp=1;
	#20;
	end
endmodule

