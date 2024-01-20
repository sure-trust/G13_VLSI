module full_adder_tb;

    reg A, B, Cin;
    wire sum, Cout;

  
    full_adder uut(
        .A(A),
        .B(B),
        .Cin(Cin),
        .sum(sum),
        .Cout(Cout)
    );

  
    initial begin
        $display("A\tB\tCin\tSum\tCout");
        $monitor("%b\t%b\t%b\t%b\t%b", A, B, Cin, sum, Cout);

        A = 0; B = 0; Cin = 0; #10;
        A = 0; B = 0; Cin = 1; #10;
        A = 0; B = 1; Cin = 0; #10;
        A = 0; B = 1; Cin = 1; #10;
        A = 1; B = 0; Cin = 0; #10;
        A = 1; B = 0; Cin = 1; #10;
        A = 1; B = 1; Cin = 0; #10;
        A = 1; B = 1; Cin = 1; #10;

        $finish;
    end

endmodule

