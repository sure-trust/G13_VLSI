module sdff(D,SI,SE,CLK,RST,SO,Q);
input D,SI,SE,CLK,RST;
output SO;
output reg Q;

always @(posedge clk)
  begin
    if(rst)
        Q <= 1'b0;
    else 
        Q <= (SE ? SI: D);
  end
assign SO = Q;
endmodule
    
 
