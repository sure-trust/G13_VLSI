module mux(D,S,Y);
 input [7:0]D;
 input [2:0]S;
 output reg Y;
 always @(*)
 begin
	 case(S)
		 2'b000 : begin
			 Y = D[0];
		 end

		 2'b001 : begin
			 Y = D[1];
		 end

		 2'b010 : begin
			 Y = D[2];
		 end

		 2'b011 : begin
			 Y = D[3];
		 end

		 2'b100 : begin
			 Y = D[4];
		 end

		 2'b101 : begin
			 Y = D[5];
		 end

		 2'b110 : begin
			 Y = D[6];
		 end

		 2'b111 : begin
			 Y = D[7];
		 end
		 default : Y =1'b0;
	 endcase
 end
 endmodule


