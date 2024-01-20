module sdff (D, SE, SI, R, Clk,Q);
  input D, SE, SI, R, Clk;
  output reg Q;

always @(posedge Clk) begin
  if (R == 1)
    Q <= 0;
  else
    Q <= (SE ? SI : D);
end

endmodule

module shift_reg(D,SE,SI,R,Clk,Q);
  input [3:0] SI,D;
  input R,SE;
  input Clk;
  output [3:0] Q;
  //always @(posedge Clk)
     //initial begin
       sdff du0(.D(D[0]), .SE(SE), .SI(SI[0]), .R(R), .Clk(Clk), .Q(Q[0]));
       sdff du1(.D(D[1]), .SE(SE), .SI(Q[0]), .R(R), .Clk(Clk), .Q(Q[1]));
       sdff du2(.D(D[2]), .SE(SE), .SI(Q[1]), .R(R), .Clk(Clk), .Q(Q[2]));
       sdff du3(.D(D[3]), .SE(SE), .SI(Q[2]), .R(R), .Clk(Clk), .Q(Q[3]));
     //end
endmodule

