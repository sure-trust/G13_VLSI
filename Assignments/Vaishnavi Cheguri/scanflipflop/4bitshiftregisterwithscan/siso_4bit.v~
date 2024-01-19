module siso_4bit(pi,psi,se,po,pso);
input pi,se,psi;
output po,pso;
wire w1,w2,w3;
sdff dut1(.clk(pclk),.psi(si),.d(pi),,q(w1),se(se));
sdff dut2(.clk(pclk),.d(w1),.q(w2));
sdff dut3(.clk(pclk),.d(w2),.q(w3));
sdff dut4(.clk(pclk),.so(pso),.d(w3),.q(po),se(se));
endmodule
