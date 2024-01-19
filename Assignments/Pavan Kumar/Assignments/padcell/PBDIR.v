module PBDIR(input IE,OE,A,
 			output Y,
			inout PAD);
bufif0 g1(PAD,OE,A);
bufif1 g2(Y,IE,PAD);
endmodule

