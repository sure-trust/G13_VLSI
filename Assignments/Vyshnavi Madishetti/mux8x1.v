module mux8x1(i,s,y);
  input [7:0]i;
  input [2:0]s;
  output reg y;
  
  always @(*)
    begin
      if(s==3'b000)
        y=i[0];
      else if(s==3'b001)
        y=i[1];
      else if(s==3'b010)
        y=i[2];
      else if(s==3'b011)
        y=i[3];
      else if(s==3'b100)
        y=i[4];
      else if(s==3'b101)
        y=i[5];
      else if(s==3'b110)
        y=i[6];
      else if(s==3'b111)
        y=i[7];
      else
        y=1'bx;
    end
endmodule
