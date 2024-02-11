`include "mux.v"
module mux_Tb();
 reg A,B,S;
 wire Y;
 mux Dut(.A(A),.B(B),.S(S),.Y(Y));
  initial 
  begin

          $monitor("A=%0b , B=%0b , S=%0b,Y=%0b",A,B,S,Y);
		  #10 A=1;B=0;S=0;
		  #10 A=0;B=0;S=1;
		  #10 A=0;B=1;S=1;
		  #10 A=1;B=0;S=0;
		  #10 A=1;B=1;S=0;
         
  end
  initial 
		  #100 $finish;
  endmodule
