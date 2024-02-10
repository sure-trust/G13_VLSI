module sdff(d,si,se,ck,q,s0,r);
  input d,si,se,ck,r;
  output reg q;
  output s0;
  always @(posedge ck)
    begin
      if(r==1)
        q=0;
      else
        q=(se?si:d);
    end
  assign s0=q;
endmodule

module dff(d,ck,r,q);
  input d,ck,r;
  output reg q;
  
  always @(posedge ck)
  begin
    if(r==1'b1)
      q<=1'b0;
    else
      q<=d;      
    end
endmodule


module siso_register(pi,psi,pse,pck,p0,ps0,r);
  input pi,psi,pse,pck,r;
  output p0,ps0;
  wire w1,w2,w3;
  
  
  sdff dut1(.d(pi),.si(psi),.se(pse),.ck(pck),.q(w1));
  dff dut2(.d(w1),.ck(pck),.q(w2));
  dff dut3(.d(w2),.ck(pck),.q(w3));
  sdff dut4(.d(w3),.si(w3),.se(pse),.ck(pck),.q(p0),.s0(ps0));
 
endmodule
