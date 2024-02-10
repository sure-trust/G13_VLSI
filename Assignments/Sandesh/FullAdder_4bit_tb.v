module tb;
reg [3:0] a, b;
reg cin;
wire [3:0] sum;
wire cout;
four_bit_adder f1 (a, b, cin, sum, cout);
initial 
begin
$monitor (“time = %0d”, $time, “ns”, “a = %0b”, a, “b = %0b”, b, “cin = %0b”, cin, “sum =
%0b”, sum, “cout = %0b”, cout);
#30 $finish;
end
initial
begin
a = 4’b0011; b = 4’b0011; cin = 1’b0; 
#10; a = 4’b1011; b = 4’b1000; cin = 1’b1;
#10; a = 4’b1111; b = 4’b1100; cin = 1’b1;
end
endmodule
