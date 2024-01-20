`include "mux.v";
module mux_tb();
 reg [7:0]A;
 reg [2:0]S;
 wire Y;
 mux dut(.A(A) , .S(S) , .Y(Y));
	 initial
		 begin
 	$monitor("Time=%0b, A=%0b, S=%0b, Y=%0b",$time,A,S,Y);
	A=8'b00000010;
    S=3'b010;
	#20;
   A=8'b00000010;
    S=3'b001;
	#20;
   A=8'b00000100;
    S=3'b010;
	#20;
   A=8'b00001000;
    S=3'b011;
   
	#20;	
   end
   endmodule

