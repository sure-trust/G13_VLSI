module full_adder(
    input A,
    input B,
    input Cin,
    output sum,
    output Cout
);

    assign sum = A ^ B ^ Cin;
    assign Cout = (A & B) | (B & Cin) | (A & Cin);

endmodule

