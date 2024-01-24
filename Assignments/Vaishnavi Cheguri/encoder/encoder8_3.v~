module encoder8_3(y,a,en);
input [7:0]y;
input en;
output reg [2:0]a;
always@(*)
begin
if(en)
case (y)
8'b0000_0001: a=3'd0;
8'b0000_0010: a=3'd1;
8'b0000_0100: a=3'd2;
8'b0000_1000: a=3'd3;
8'b0001_0000: a=3'd4;
8'b0010_0000: a=3'd5;
8'b0100_0000: a=3'd6;
8'b1000_0000: a=3'd7;
endcase
else;
end
endmodule
