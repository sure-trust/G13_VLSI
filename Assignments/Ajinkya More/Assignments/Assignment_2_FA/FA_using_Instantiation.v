module FullAdder(A,B,Cin,Sum,Cout);
input A,B,Cin;
output Sum,Cout;
wire c1,c2;
HA HA1(.A(A),.B(B),.S(S),.C(c1));
HA HA2(.A(S),.B(Cin),.S(Sum),.C(c2));
or g1(Cout,c1,c2);
endmodule

