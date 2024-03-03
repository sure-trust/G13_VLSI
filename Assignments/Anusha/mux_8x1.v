module mux_8x1(I,S,Out);
input {7:0]I;
input [2:0]S;
output reg Out;

always @(I or S)
  begin
    case(S)
      3'b000: Out <= I[0];
      3'b001: Out <= I[1];
      3'b010: Out <= I[2];
      3'b011: Out <= I[3];
      3'b100: Out <= I[4];
      3'b101: Out <= I[5];
      3'b110: Out <= I[6];
      3'b111: Out <= I[7];
      default: Out <= 1'bx;
     endcase
  end
endmodule 
      
