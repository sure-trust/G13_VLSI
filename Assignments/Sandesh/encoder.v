module encoder8_3(A, Y);
input [7:0] A;
input En;
output [2:0] Y;
reg [2:0] Y;
always @(A,En)
begin
if(En==1)
begin
case (A)
8'b10000000:Y=3'd7;
8'b01000000:Y=3'd6;
8'b00100000:Y=3'd5;
8'b00010000:Y=3'd4;
8'b00001000:Y=3'd3;
8'b00000100:Y=3'd2;
8'b00000010:Y=3'd1;
 8'b00000001:Y=3'd0;
default:Y=3'bXXX; 
endcase
end
endmodule
