// ASSIGNMENT 3 16 BIT FULL ADDER
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

module bit_16_fa(A,B,Cin,Sum,Cout);
  input wire[0:15] A,B;
  input Cin;
  output reg[0:15] Sum;
  output reg Cout;
  
  wire [0:14] w;
  
  fa fa0(.A(A[0]), .B(B[0]), .CIN(Cin), .SUM(Sum[0]), .COUT(w[0]));
  fa fa1(.A(A[1]), .B(B[1]), .CIN(w[0]), .SUM(Sum[1]), .COUT(w[1]));
  fa fa2(.A(A[2]), .B(B[2]), .CIN(w[1]), .SUM(Sum[2]), .COUT(w[2]));
  fa fa3(.A(A[3]), .B(B[3]), .CIN(w[2]), .SUM(Sum[3]), .COUT(w[3]));
  fa fa4(.A(A[4]), .B(B[4]), .CIN(w[3]), .SUM(Sum[4]), .COUT(w[4]));
  fa fa5(.A(A[5]), .B(B[5]), .CIN(w[4]), .SUM(Sum[5]), .COUT(w[5]));
  fa fa6(.A(A[6]), .B(B[6]), .CIN(w[5]), .SUM(Sum[6]), .COUT(w[6]));
  fa fa7(.A(A[7]), .B(B[7]), .CIN(w[6]), .SUM(Sum[7]), .COUT(w[7]));
  fa fa8(.A(A[8]), .B(B[8]), .CIN(w[7]), .SUM(Sum[8]), .COUT(w[8]));
  fa fa9(.A(A[9]), .B(B[9]), .CIN(w[8]), .SUM(Sum[9]), .COUT(w[9]));
  fa fa10(.A(A[10]), .B(B[10]), .CIN(w[9]), .SUM(Sum[10]), .COUT(w[10]));
  fa fa11(.A(A[11]), .B(B[11]), .CIN(w[10]), .SUM(Sum[11]), .COUT(w[11]));
  fa fa12(.A(A[12]), .B(B[12]), .CIN(w[11]), .SUM(Sum[12]), .COUT(w[12]));
  fa fa13(.A(A[13]), .B(B[13]), .CIN(w[12]), .SUM(Sum[13]), .COUT(w[13]));
  fa fa14(.A(A[14]), .B(B[14]), .CIN(w[13]), .SUM(Sum[14]), .COUT(w[14]));
  fa fa15(.A(A[15]), .B(B[15]), .CIN(w[14]), .SUM(Sum[15]), .COUT(Cout));
  
endmodule
