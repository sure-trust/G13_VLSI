module FullAdder_1bit (
    input A,
    input B,
    input Cin,
    output Sum,
    output Cout
);

    assign {Cout, Sum} = A + B + Cin;

endmodule

module FullAdder_16bit (
    input [15:0] A,
    input [15:0] B,
    input Cin,
    output [15:0] Sum,
    output Cout
);

    genvar i;
    generate
        for (i = 0; i < 16; i = i + 1)
			begin : gen_loop
            FullAdder_1bit U1 (.A(A[i]),
			.B(B[i]),
			.Cin((i == 0) ? Cin : U1.Cout),
			.Sum(Sum[i]),
			.Cout(U1.Cout));
       		end
    endgenerate

endmodule
