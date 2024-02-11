//structural model of half adder
module halfadder(A,B,S,Co);
input A,B;
output S,Co;

and G1(Co,A,B);
xor G2(S,A,B);

endmodule


