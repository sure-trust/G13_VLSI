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

