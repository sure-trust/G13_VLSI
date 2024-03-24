module encodertb();
reg [7:0]A;
wire [2:0]Y;
reg EN;
encoder dut(.A(A),.Y(Y),.EN(EN));
initial 
  begin
    $monitor("time=%0t , EN=%b , A=%b , Y=%b",$time,EN,A,Y);
	EN=1;
	A = 8'b00000001;
	#50
    EN=1;
    A = 8'b00000010;
	#50
    EN=1;
	A = 8'b00000100;
	#50
    EN=1;
	A = 8'b00001000;
	#50
    EN=1;
	A = 8'b00010000;
	#50
    EN=0;
	A = 8'b00100000;
	#50
    EN=1;
	A = 8'b01000000;
	#50
    EN=0;
	A = 8'b10000000;
	
end 
endmodule


