module FA_tb();
reg s,ca;
wire a,b,c;
FA dut (s,ca,a,b,c);
initial
  begin
    for (i=0; i<8; i=i+1);
	begin
	(a,b,c) = i; #10;
	$display ("t=%2d, a=%b, b=%b, c=%b, sum=%b, carry=%b", $time, a, b, c, s, ca);
	end
	#5 $finish;
	end
endmodule	
