// ASSIGNMENT 2 FULL ADDER
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

module fa(input A,B,CIN, output SUM,COUT);
  
  wire w1,w2,w3;
//   ha_beh inst1(A,B,w1,w2);
//   ha_beh inst2(w1,CIN,SUM,w3);
    ha_beh inst1(.A(A), .B(B), .sum(w1),.carry(w2));
    ha_beh inst2(.A(w1), .B(CIN), .sum(SUM),.carry(w3));
  
  assign COUT=w2|w3;
  
endmodule
