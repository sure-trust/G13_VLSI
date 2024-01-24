module SDFF(SE,SI,CLK,D,Q,SO,RST);
 input SE,SI,CLK,D;
 output SO,Q;
 always @(posedge CLK);
  begin
	  if(RST)
	  begin
		  Q=1'b0;
	  end
	  else
	  begin
		  Q=(SE)?SI:D;
	  end
  end
  endmodule
