module Tb();
 reg [7:0]D;
 reg E;
 wire [2:0]Y;
 Encoder dut(.(D),.E(E),.Y(Y));
 initial 
 begin
	 $monitor("T=%t , D=%h , E=%b , Y=%b ",$time,D,E,Y);
	 E=0;
	 D=01;
	 #10;


	 E=1;
	 D=02;
	 #10;



	 E=1;
	 D=02;
	 #10;



	 E=0;
	 D=04;
	 #10;



	 E=0;
	 D=08;
	 #10;



	 E=1;
	 D=10;
	 #10;



	 E=1;
	 D=20;
	 #10;



	 E=1;
	 D=40;
	 #10;



	 E=1;
	 D=80;
	 #10;
 end
 endmodule





