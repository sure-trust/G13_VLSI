`include "fa_1.v"
module fa_tb;
reg a,b,ci;
wire s,co;
//module_name instantation_name (ports conections);
fa_1 dut (a,b,ci,s,co);
initial begin
repeat(10) begin
    {a,b,ci}=$random;
	#2;
	$display("time=%0t a=%b,b=%b,ci=%b , s=%b,co=%b",$time,a,b,ci,s,co);
	end
end
endmodule
