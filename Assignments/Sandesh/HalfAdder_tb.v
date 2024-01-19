module TB_halfadder();
  reg A,B;
  wire S,C;
 HaF Int1(.A(A),.B(B),.C(C),.S(S));
  initial begin
A = 0; B = 0;
#10
A = 0; B = 1;
#10
A = 1; B = 0;
#10
A = 1; B = 1;
#10
$monitor
end
endmodule
