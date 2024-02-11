module fulladder(input  [15:0] a, b, input cin,
                 output [15:0] sum, output cout);

  wire [16:0] c;	// carry bits
  assign c[0] = cin;	// carry input
  assign cout = c[16];	// carry output

  // assignment of 16-bit vectors
  assign sum[15:0] = (a[15:0] ^ b[15:0]) ^ c[15:0];
  assign c[16:1]   = (a[15:0] & b[15:0]) | 
                     (a[15:0] ^ b[15:0]) & c[15:0];

endmodule


//TESTBENCH
module fulladder_tb;
reg a,b,cin;
wire sum,cout;
//module_name instantation_name (ports conections);
fulladder dut(a,b,cin,sum,cout);
initial begin
repeat(10) begin
    {a,b,cin}=$random;
	#2;
	$display("time=%0t a=%b,b=%b,cin=%b , sum=%b,cout=%b",$time,a,b,cin,sum,cout);
	end
end
endmodule
