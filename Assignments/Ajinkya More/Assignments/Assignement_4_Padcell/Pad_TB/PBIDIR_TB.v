 module PBDIR_Tb ();
    reg IE,OE,A;
	wire Y;
	wire PAD;
	reg PAD_temp;
	assign PAD = (IE==1 && OE ==0)? PAD_temp : 1'bz;
 PBDIR dut(.IE(IE),.OE(OE),.PAD(PAD),.Y(Y));
 initial 
 begin
         // case 1
		 IE = 1 ; OE = 0; PAD_temp = 1;
		 #10;
		 PAD_temp = 0;
		 #10;
		 Pad_temp=1;
		 #10;

		 //case 2
		 IE = 0 ; OE = 1; A = 0;
		 #10;
		 A =1;
		 #10;

		 //case 1.1 
		 IE = 1 ; OE=1; PAD_temp = 0;
		 #10;
		 PAD_temp = 1;
		 #10;
         
          // case 2.1 
		 IE = 1 ; OE= 1; A = 0;
		 #10;
		 A = 1;
		 #10;

   
 end
 endmodule

