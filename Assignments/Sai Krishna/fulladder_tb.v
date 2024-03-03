module FA_tb();
reg sum,carry;
wire a,b,c;
FA dut (sum,carry,a,b,c);
initial
  begin
    for (i=0; i<=7; i=i+1);
	begin
	(a,b,c) = i;
	#10;
	$display ("t=%2d, a=%b, b=%b, c=%b, sum=%b, carry=%b", $time, a, b, c, sum, carry);
	end
	#10
	$finish;
	end
endmodule	
