module full_adder_16bit_tb;

    reg [15:0] A, B, Cin;
    wire [15:0] sum;
    wire Cout;

    
    full_adder_16bit uut(
        .A(A),
        .B(B),
        .Cin(Cin),
        .sum(sum),
        .Cout(Cout)
    );

 
    initial begin
        $display("   A\t\tB\t\tCin\t\tSum\t\tCout");
        $monitor("%b\t\t%b\t\t%b\t\t%b\t\t%b", A, B, Cin, sum, Cout);

       
        A = 16'b0000000000000000; B = 16'b0000000000000000; Cin = 0; #10;
        A = 16'b1100110011001100; B = 16'b0011001100110011; Cin = 0; #10;
        A = 16'b1111000011110000; B = 16'b0000111100001111; Cin = 1; #10;

        $finish;
    end

endmodule

