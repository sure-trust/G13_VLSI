module pad_tb;
reg IE,OE,a;
wire y;
wire pad;
reg temp_pad;
assign pad=(IE==1&&OE==0)? temp_pad: 1'bz»
 pad dut(.pad(pad),.IE(IE),.OE(OE),.y(y),.a(a));
 initial
 begin
	 $monitor("T=%0t IE=%B, OE=%B , temp_pad=%b,pad=%b,y=%b,a=%b",$time,IE,OE, temp_pad,pad,y,a)
	 IE=1; OE=0;
	 temp_pad=1;
	 #10
	 IE=0;OE=1;
	 a=0
	 #10
	 IE=1;OE=0;
	 temp_pad=1;
	 #10
	 IE=0;OE=1
	 a=1;

 end
 initial begin
	 $dumpfile("dump.vcd");
	 $dumpvars;

 end 
 endmodule
