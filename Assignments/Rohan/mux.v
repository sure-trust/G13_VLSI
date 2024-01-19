
 module mux_8_1_df(Y,I,S);
 	input [7:0]I;
 	input [2:0]S;
 	output Y;

 assign Y= I[S];


 endmodule
