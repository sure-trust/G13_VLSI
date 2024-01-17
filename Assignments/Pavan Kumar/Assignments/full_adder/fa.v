module fa(A,B,C,SUM,COUT);
input A,B,C;
output SUM,COUT;
assign SUM=A^B^C;
assign COUT=(A&B)|(B&C)|(C&A);
endmodule
