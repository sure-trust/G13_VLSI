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


