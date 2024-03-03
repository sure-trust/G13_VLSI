module fulladder(A,S,C);
  input [2:0]A;
output reg S,C;

  always @(*)
    begin
      
      if(A==3'b000)
        begin
          S=0;C=0;
        end
      else if(A==3'b001)
        begin
          S=1;C=0;
        end
      else if(A==3'b010)
        begin
          S=1;C=0;
        end
      else if(A==3'b011)
        begin
          S=0;C=1;
        end
      else if(A==3'b100)
        begin
          S=1;C=0;
        end
      else if(A==3'b101)
        begin
          S=0;C=1;
        end
      else if(A==3'b110)
        begin
          S=0;C=1;
        end
      else if(A==3'b111)
        begin
          S=1;C=1;
        end
      else
        begin
        S=1'bx;C=1'bx;
      end
      
    end  
endmodule

