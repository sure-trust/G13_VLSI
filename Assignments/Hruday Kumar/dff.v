module dff(d,clk,rst,q);
input clk,rst,d;
output reg q;
always@(posedge clk)
   begin
     if(rst)
       begin
         q<=1'bo;
        end
       else
         begin
           q<=d;
             end
end 
endmodule
