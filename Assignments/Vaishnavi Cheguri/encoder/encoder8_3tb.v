module tb_encoder;
reg [7:0]y;
reg en;
wire [2:0]a;
encoder8_3 uut(.y(y),.en(en),.a(a));
initial
begin
EN=1;
y=8'h0_1;
 #30;y=8'h0_2;
#30;y=8'h0_4;
#30;y=8'h0_8;
#30;y=8'h1_0;
#30;y=8'h2_0;
#30;y=8'h4_0;
#30;y=8'h8_0;
end
initial begin
$monitor($time,"\tEN=%0b,a=%b,y=%b",en,a,y);
#300 $finish;
end
initial begin
$dumpfile("dump.vcd");
$dumpvars;
end 
endmodule
