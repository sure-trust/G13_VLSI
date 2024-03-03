'timescale 1ns/1ps
module tb;
reg PI,PSI,PSE,PCK;
wire PSO,PO;

parameter CYCLE=4;

shift_reg(.pi(PI),.psi(PSI),.pse(PSE),.po(PO),.pso(PSO),.pclk(PCK));

//generater PCK

 always
   begin
     PCK=1;
	 #5;
     PCK=0;
     #5;
   end 

   task ShiftEnable();
   begin
     repeat(CYCLE)
	   begin
	     PSE=1;
		 #10;
	   end
	  PSE=0;
	  #10;
	 end
	endtask

task ShiftIn(input in);
  begin
    repeat(CYCLE)
	  begin
	     PSI=in;
		 #10;
	  end
  end
  endtask

  initial 
      begin
	     ShiftEnable();  //set the SE
		 ShiftIn(0);
   end
   endmodule
     
