module encodertb();
reg [7:0]a;
wire [2:0]Y;
reg EN;
encoder dut(.a(a),.Y(Y),.EN(EN));
initial 
  begin
        $monitor("time=%0t , EN=%0b , A=%0b , Y=%0b",$time,EN,a,Y);
	
	a = 8'b00000001;
	#50;
    a = 8'b00000010;
	#50;
	a = 8'b00000100;
	#50;
	a = 8'b00001000;
	#50;
	a = 8'b00010000;
	#50;
	a = 8'b00100000;
	#50;
	a = 8'b01000000;
	#50
	a = 8'b10000000;
	#50
end 
endmodule
