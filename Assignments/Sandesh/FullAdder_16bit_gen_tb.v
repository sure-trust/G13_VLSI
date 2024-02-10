`include "FullAdder_16bit_gen.v"
module tb;

    reg [15:0] A, B;
    reg Cin;
    wire [15:0] Sum;
    wire Cout;

    // Instantiate the 16-bit full adder
    FullAdder_16bit UUT (.A(A),.B(B), .Cin(Cin), .Sum(Sum), .Cout(Cout));
initial
begin
$monitor("time=%0b",$time,"ns","A=%0b",A,"B=%0b",B,"Cin=%0b",Cin,"Sum=%0b",Sum,"Cout=%0b",Cout);
$50;
end
initial
begin
A = 8'b11010110;B = 8'b10101101; Cin = 0; #10;
A = 8'b11110000;B = 8'b00001111; Cin = 1; #10;
// End simulation 
$finish; 
end

endmodule
