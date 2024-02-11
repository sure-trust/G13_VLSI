`include "halfadder.v";
module halfadder_tb();
reg a,b;
wire s,co;
HA dut(.a(a), .b(b), .s(s), .co(co));
initial 
	begin
	//	$monitor("Time=%0b, a=%0b, b=%0b, s=%0b, co=%0b",$time,a,b,s,co);
     
	  a=0;b=0;#10;
	  a=0;b=1;#10;
	  a=1;b=0;#10;
	  a=1;b=1;#10;
	  $stop;
	end
endmodule

