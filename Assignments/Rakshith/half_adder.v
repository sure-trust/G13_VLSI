module half_adder(
    input A,
    input B,
    output sum,
    output carry
);

    assign sum = A ^ B;
    assign carry = A & B;

endmodule

