module encoder(a,Y);
input [7:0]a;
input EN;
output reg [2:0]Y;
  always@(*)
    begin
	  if (EN==1)
	    begin
		  else if (a[7]==1)begin
		  Y=3'b111;
		  end
          else if(a[6]==1)begin
		  Y=3'b110;
		  end
	      else if(a[5]==1)begin
		  Y=3'b101;
		  end
       	  else if(a[4]==1)begin 
		  Y=3'b100;
		  end
	      else if([a3]==1)begin 
		  Y=3'b011;
		  end		
	      else if([a2]==1)begin 
		  Y=3'b010;
		  end		
	      else if([a1]==1)begin 
		  Y=3'b001;
		  end
		  else if(a[0]==0) Y=3'b000;
		  end
		  else
		    begin
		     Y=3b'zzz;
		    end
endmodule		 
		   
		   
	      	
