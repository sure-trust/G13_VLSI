module dff(d,ck,rst,q);
input wire ck,rst,d;
output reg q;
always@(posedge clk or negedge rst)
   begin
     if(!rst)
         q<=1'b0;
       else
           q<=d;
   end 
endmodule
