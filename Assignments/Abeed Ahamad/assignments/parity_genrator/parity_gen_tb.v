module paritygen_tb;
reg clk,rst;
reg a;
wire b;
integer i;
  paritygen dut(clk,a,rst,b);
always #5 clk=~clk;
initial begin
	clk=1;
	rst=1;
	a=1;
	#10;
	
  rst=0;
 
  for(i=0;i<50;i=i+1) 
            begin
              a <= $urandom_range(0,1);
              #10;
            end
        #20 $finish;
end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule

