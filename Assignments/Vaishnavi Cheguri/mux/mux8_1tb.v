	module mux8_1tb;
	 reg [7:0] i;
	 reg [2:0] s;
	 wire y;
	 mux8_1 uut(.i(i),.s(s),.y(y));
	 initial
	 begin
		 $monitor("s=%d,i=%d,t=%s",s,i,y,$time);

                  s=3'b000;
		 #10 s=3'b001;
		 #10 s=3'b010;
		 #10 s=3'b011;
		 #10 s=3'b100;
		 #10 s=3'b101;
		 #10 s=3'b110;
		 #10 s=3'b111;
		 #100 $finish;
	 end
	 initial
	 begin
		 $dumpfile("dump.vcd");
		 $dumpvars();
	 end
	 endmodule
	 

