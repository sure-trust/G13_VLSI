module testbench;

    reg A, B;
    wire sum, carry;

    half_adder uut(
        .A(A),
        .B(B),
        .sum(sum),
        .carry(carry)
    );

    initial begin
        $display("A\tB\tSum\tCarry");
        $monitor("%b\t%b\t%b\t%b", A, B, sum, carry);

        A = 0; B = 0; #10;
        A = 0; B = 1; #10;
        A = 1; B = 0; #10;
        A = 1; B = 1; #10;

        $finish;
    end

endmodule

