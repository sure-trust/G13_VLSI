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

