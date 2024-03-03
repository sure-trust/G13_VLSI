module mux(A,B,S,Y);
input A,B,S;
output reg Y;
always @(*)
	begin
		case (S)
			0 : Y=A;
			1 : Y=B;
			default : $display("Error");
		endcase
	end
endmodule
