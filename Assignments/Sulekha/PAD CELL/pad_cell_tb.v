// Code your testbench here

module pad_tb;
  reg A,IE,OE;
  wire Y;
  wire PAD;

  reg PAD_temp;

  pad_rtl inst(.A(A), .IE(IE), .OE(OE), .PAD(PAD), .Y(Y));
  
  assign PAD= PAD_temp;
 
initial
 begin
   $monitor("IE=%b , OE=%b ,PAD=%b , A=%b ,Y=%b\t",IE,OE,PAD,A,Y,$time);
     // case1
  	 IE=1;
	 OE=0;
	 PAD_temp=1;
	 A=0;
	 #10;
	 
	 //case2

	 IE=0;
	 OE=1;
	 PAD_temp=1;
	 A= 1;
	 #10;

 end

  assign PAD= PAD_temp;

  initial
    #30 $finish();
  
endmodule

