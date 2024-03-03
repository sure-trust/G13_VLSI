module mem(clk,D,A,Wen,Q);
 input clk;
 input Wen;
 input [7:0]D;
 input [3:0]A;
 output reg [7:0]Q;
 

 reg [7:0] memory[15:0];
  always @(posedge clk)
  begin
	  case(Wen)
		  1'b0: begin
			  Q<=memory[A];
		  end
		  1'b1:begin
			  memory[A]<=D;
		  end
	  endcase
  end
  endmodule

