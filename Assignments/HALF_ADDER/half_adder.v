// ASSIGNMENT 1 HALF ADDER
module ha_beh(input A,B, output reg sum, carry);
  
  always@(A,B)
    begin
           // {carry,sum}=A+B;
      case({A,B})
        2'b00: begin sum=0; carry=0; end 
        2'b01: begin sum=1; carry=0; end 
        2'b10: begin sum=1; carry=0; end
        2'b11: begin sum=0; carry=1; end
      endcase
    end
  
endmodule

