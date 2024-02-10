`include "mux2x1.v"
module tb;
reg a,b,s;
wire y;
mux dut(a,b,s,y);
initial begin
 repeat(10)begin
   a=$random;
   b=$random;
   s=$random;
   #5;
   $display("a=%0b b=%0b s=%0b y=%0b",a,b,s,y);
   
 end
 end

initial begin
#100;
$finish;

end

endmodule
