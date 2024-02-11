module PBIDIR_tb();
reg IE,OE,A;
wire Y;
wire PAD;
reg PAD_temp;
PBIDIR dut(.IE(IE),.OE(OE),.PAD(PAD),.Y(Y),.A(A));
assign PAD=(IE==0 && OE=1)? PAD_temp=1'bz;
initial
begin
	$monitor("IE=%b,OE=%b,PAD_temp=%b,Y=%b,A=%b,PAD=%b",IE,OE,PAD_temp,Y,A,PAD);
	//case 1
	IE=1;
	OE=0;
	PAD_temp=0;
	#10;
	PAD_temp=1;
	#10;

	//case 2
	IE=0;
	OE=1;
	A=0;
	#10;
	A=1;
	#10;
        
	//case 1.1
	IE=1;
	OE=0;
	PAD_temp=0;
        A=Y;
	#10;
	PAD_temp=1;
        A=Y;
	#10;
        
	//case 2.1
	IE=0;
	OE=1;
	A=0;
	Y=1'bz;
	#10;
	A=1;
	Y=1'bz;
	#10;
end
endmodule

