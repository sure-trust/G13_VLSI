module encoder_8x3(I,E,Y);
input [7:0]I;
input E;
output reg [2:0] Y;

always @(I or E)
   begin
     if(E)
       begin
 	 case(I)
	   8'b00000000: Y <=3'bxxx;
	   8'b00000001: Y <=3'b000;
           8'b00000010: Y <=3'b001;
           8'b00000100: Y <=3'b010;
	   8'b00001000: Y <=3'b011;
	   8'b00010000: Y <=3'b100;
	   8'b00100000: Y <=3'b101;
           8'b01000000: Y <=3'b110; 
	   8'b10000000: Y <=3'b111;
	  default : Y <= 3'bx;
	 endcase
      end
    end
endmodule

