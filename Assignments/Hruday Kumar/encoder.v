module encoder(A,Y);
input [7:0]A;
input EN;
output reg [2:0]Y;
  always@(*)
    begin
	  if (EN==1)
	    begin
		  else if (A[7]==1)begin
		  Y=3'b111;
		  end
          else if(A[6]==1)begin
		  Y=3'b110;
		  end
	      else if(A[5]==1)begin
		  Y=3'b101;
		  end
       	  else if(A[4]==1)begin 
		  Y=3'b100;
		  end
	      else if([A3]==1)begin 
		  Y=3'b011;
		  end		
	      else if([A2]==1)begin 
		  Y=3'b010;
		  end		
	      else if([A1]==1)begin 
		  Y=3'b001;
		  end
		  else if(A[0]==0) Y=3'b000;
		  end
		  else
		    begin
		     Y=3b'zzz;
		    end
endmodule		 
		   
		   
	      	
