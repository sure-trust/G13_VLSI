module encoder8_3( input [7:0]y, input en, output reg [2:0]a);

always @(*)
begin
if (en)
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
else q=3'b000 ;
end
endmodule

//TEST BENCH
`timescale 1ns / 1ps
module test_encoder;
reg [7:0]Y;
reg EN;
wire [2:0]A;
encoder8_3 uut(.y(Y), .en(EN),.a(A));
initial
begin
EN=1;
Y=8'h0_1;
#30;
Y=8'h0_2;
#30;
Y=8'h0_4;
#30;
Y=8'h0_8;
#30;
Y=8'h1_0;
#30;
Y=8'h2_0; #30;
Y=8'h4_0;
#30; Y=8'h8_0;
#30; 
$finish; 
end
endmodule
