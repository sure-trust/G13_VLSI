 module halfadder_tb;
 reg a;
 reg b;
 wire sum,carry;
 halfadder uut(.a(a),.b(b),.sum(sum),.carry(carry));
 initial begin
	 #10 a=1'b0; b=1'bo;
	 a=0,b=0
	 #10 a=1'b1; b=1'b0;
	 a=1,b=0
	 #10 $stop;
 end 
 endmodule
