module mux(A,S,Y);
	input [7:0]A;
	input [2:0]S;
	output reg Y;
	always @(*)
	 begin
	  if( S == 3'b000)
	   	 Y = A[0];
        else if(S == 3'b001) 
         Y = A[1];
        else if(S == 3'b010) 
         Y = A[2]; 
        else if(S == 3'b011) 
         Y = A[3];
        else if(S == 3'b100) 
         Y = A[4];
        else if(S == 3'b101) 
         Y = A[5];
        else if(S == 3'b110) 
         Y = A[6];
        else if(S == 3'b111) 
         Y = A[7];
      else 
         Y = 3'b000; 
   end 
endmodule	
