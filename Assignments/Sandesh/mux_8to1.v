module mux(A,sel,Y);
 input [7:0]A;
 input [2:0]sel;
 output reg Y;
 always @(sel,A)
 begin
	 case(sel)
		 2'b000 : begin
			 Y = A[0];
		 end

		 2'b001 : begin
			 Y = A[1];
		 end

		 2'b010 : begin
			 Y = A[2];
		 end

		 2'b011 : begin
			 Y = A[3];
		 end

		 2'b100 : begin
			 Y = A[4];
		 end

		 2'b101 : begin
			 Y = A[5];
		 end

		 2'b110 : begin
			 Y = A[6];
		 end

		 2'b111 : begin
			 Y = A[7];
		 end
		 default : Y =1'b0;
	 endcase
 end
 endmodule
