module sdflop(D, SI, SE, CK, RST, Q, SO);
	input wire D, CK, SI, SE, RST;
	output Q,SO;
	
	always @ (posedge CK)
	begin 
	  if(RST)
	    Q <= 1'b0;
	  else if (SE) 	
	    Q <= SO;
	  else
	    Q <= D;
	  end
endmodule	  
