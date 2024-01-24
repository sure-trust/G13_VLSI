//full adder using data-flow modeling
module full_adder_d (
    input a,b,cin,
    output sum,carry
);

assign sum = a ^ b ^ cin;
assign carry = (a & b) | (b & cin)  | (cin & a) ;

endmodule
