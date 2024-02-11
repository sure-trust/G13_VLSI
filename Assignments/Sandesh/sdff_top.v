module top(Pi,Psi,Pclk,Pse,Po,Pso);
 input Pi,Pclk,Pse,Psi;
 output Po,Pso;
 sdff f1(D(Pi),.Si(Psi),.Se(Pse),.Clk(Pclk),.Q(w1));

 dff f2(D(w1),.clk(Pclk),Q(w2));
 dff f3(D(w2),.Clk(Pclk),.Q(w3));
 sdff f4(D(w3),.Si(w3),.Se(Pse),.Clk(Pclk),.Q(Po),So(Pso));
 endmodule
