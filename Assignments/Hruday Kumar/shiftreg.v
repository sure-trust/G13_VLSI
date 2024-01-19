
 module top(Pi,Psi,Pclk,Pse,Po,Pso);
 input Pi,Psi,Se,Pclk;
 output Pso,Po;
 sdff f1(.D(Pi),.Si(Psi),.Clk(Pclk),.Se(Pse)),Q(w1));
 dff f2(.D(w1),.Q(w2),.Clk(Pclk));
 dff f3(.D(w2),.Q(w3),.Clk(Pclk));
 sdff f4(.D(w3),.Si(w3),.Se(Pse),.Q(Po),.So(Pso),.Clk(Pclk));
 endmodule
