module sdff_4bit(pi,pclk,se,po);
input pi,pclk,se;
output po;
wire w1,w2,w3;

sdff dut1(.clk(pclk),.d(pi),.q(w1),.se(se));
sdff dut2(.clk(pclk),.d(w1),.q(w2),.se(se));
sdff dut3(.clk(pclk),.d(w2),.q(w3),.se(se));
sdff dut4(.clk(pclk),.d(w3),.q(po),.se(se));
endmodule

// scan d flip flop
module sdff (se,si,clk,rst,d,q);
input se,si,clk,rst,d;
output q;
  always @(posedge clk) 
  begin
    if (rst)
      q <= 1'b0;
    else
      q <= d;
  end

endmodule
