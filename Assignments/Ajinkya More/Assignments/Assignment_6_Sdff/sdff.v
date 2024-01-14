module sdff(Se,Si,Clk,D,Q,So);
 input Se,Si,Clk,D;
 output So,Q;
 always @(posedge Clk);
  begin
	  if(Rst)
	  begin
		  Q=1'b0;
	  end
	  else
	  begin
		  if(Se)
		  begin
			  Q<=Si;
		  end
		  else
			  Q<=D;
	  end
  end
  endmodule



module sdff(Se,Si,Clk,D,Q,So);
 input Se,Si,Clk,D;
 output So,Q;
 always @(posedge Clk);
  begin
	  if(Rst)
	  begin
		  Q=1'b0;
	  end
	  else
	  begin
		  Q=(Se)?Si:D;
	  end
  end
  endmodule



