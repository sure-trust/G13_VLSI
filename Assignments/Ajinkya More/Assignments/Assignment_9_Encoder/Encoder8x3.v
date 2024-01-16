module Encoder(D,E,Y);
 input [7:0]D;
 input E;
 output [2:0]Y;
always @(D,E)
begin
	if(E==1)
	begin
		case(D)
		begin
			2'h01:begin
				Y=3'b000;
			end

			2'h02:begin
				Y=3'b001;
			end

			2'h04:begin
				Y=3'b010;
			end

			2'h08:begin
				Y=3'b011;
			end

			2'h10:begin
				Y=3'b100;
			end

			2'h20:begin
				Y=3'b101;
			end

			2'h40:begin
				Y=3'b110;
			end

			2'h80:begin
				Y=3'b111;
			end
		endcase
	end
	else
	begin
		Y=3'b000;
	end
end
endmodule


		



