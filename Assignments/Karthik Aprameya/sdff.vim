 module sdff(D,SE,SI,R,Clk,Q);
  input SE,SI,R,D,Clk;
  ouput Q;
  always @(posedge Clk)
    initial begin
      if(R==1)
        Q=0;
      else
        Q=(SE?SI :D);
    end
endmodule 
