`include "ENCODER_8TO3.v";
module ENCODER_8TO3_tb;
reg [7:0]A;
reg E;
wire [2:0]Y;

encoder_8to3 dut(.A(A) , .E(E) , .Y(Y));

initial begin
 $monitor("A=%0b, E=%0b, Y=%0b",A,E,Y);
	E=1;
	 A=8'b00000000;
#10 A=8'b00000001;
#10 A=8'b00000010;
#10 A=8'b00000100;
#10 A=8'b00001000;
#10 A=8'b00010000;
#10 A=8'b00100000;
#10 A=8'b01000000;
#10 A=8'b10000000;
#10 $finish;
		end
	endmodule
