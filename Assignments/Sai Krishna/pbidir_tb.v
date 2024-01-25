module pbidir_tb();
  reg IE,OE,A; 
  wire Y;
  wire PAD;
  reg PAD_temp;
   
   pbidir dut(.IE(IE), .OE(OE), .PAD(PAD), .Y(Y), .A(A));
   assign PAD = (IE == 1 && OE == 0)?PAD_temp : 1'bz;

   initial 
   	begin 
	  IE=1; OE=0;PAD_temp=1; #10;
	  IE=0; OE=1;PAD_temp=0; #10;
	  IE=0; OE=1;A=0; #10;
	  IE=1; OE=0;A=1; #10;	  
	end  
endmodule
