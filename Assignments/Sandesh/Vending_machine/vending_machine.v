module vending(
input CLK,RST,
  input [2:0] IN,
output reg OUT
);
  reg [2:0]state,nxt_state;
  localparam IDLE=3'D0, S1=3'D1, S2=3'D2, S3=3'D3, S4=3'D4;
  
  //present state
  always@(posedge CLK)
   begin
      if(RST==1)
        state<=0;
      else
        state<=nxt_state;
  end
  
  //updation of next state
  always@(state,IN)
    begin
      case(state)
        IDLE: begin
          if(IN==3'D1)
            nxt_state<=S1;
          else if(IN==3'D5)
            nxt_state<=IDLE;
          else if(IN==3'd2) 
            nxt_state<=S2;
         //  else 
           // nxt_state<=IDLE;
        end
        S1: begin
          if(IN==3'd2)
            nxt_state<=S3;
          else if(IN==3'd1)
            nxt_state<=S1;
         // else 
          //  nxt_state<=S1;
          
        end
        
          S2: begin
            if(IN==3'D2)
            nxt_state<=S4;
           else
              nxt_state<=S3;
          end
            
        
        S3: begin
          if(IN==3'd2)
            nxt_state<=IDLE;
         // else
            //nxt_state<=S3;
        end
        
           
        S4: begin
          if(IN==3'd1)
            nxt_state<=IDLE;
          else if(IN==3'd2)
            nxt_state<=IDLE;
         // else
            //nxt_state<=S4;
        end
      endcase
    end
  
        
        // assing the outputs now its a bit difficult (mealy)
  always@(posedge CLK)
    begin
      case(state)
        IDLE: begin
          if(IN==3'd1)
            OUT<= 0;
          else if(IN==3'd5)
            OUT<= 1;
          else if(IN==3'd2)
            OUT<= 0;
        end
        
        S1:begin
          if(IN==3'd2)
            OUT<=0;
          else if(IN==3'd1)
            OUT<=0;
          else
            OUT<=0;
        end
        
          S2: begin
            if(IN==3'D2)
          OUT<=0;
            else
            OUT<=0;
          end
           
           
        S3: begin
          if(IN==3'd2)
        OUT<=1;
          else
        OUT<=0;
        end
        
            
        S4: begin
          if(IN==3'd1)
             OUT<=1;
          else if(IN==3'd2)
             OUT<=1;
          else
              OUT<=0;
        end
      endcase
    end
endmodule


