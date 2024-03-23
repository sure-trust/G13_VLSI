module vendingmachine(CLK,RST,IN,OUT);
 input CLK,RST;
 input [2:0]IN;
 output OUT;

 localparam IDLE =3'b000;
 localparam S1=3'b001;
 localparam S2=3'b010;
 localparam S33'b011;
 localparam S4=3'b100;

 reg [2:0]state,nxt_state;

 always @(posedge CLK)begin
   if(RST)
      state<=IDLE;
   else state<=nxt_state;	  
 end

 always @(state,IN)begin
   case(state)
    IDLE:if(IN==3'd1)
	   nxt_state<=<=S1;
	   else if(IN==3'd2)
	   nxt_state<=S2;
	   else if(IN==3'd5)
	    nxt_state<=IDLE;
    S1:if(IN==3'd1)
	   nxt_state<=S1;
	   else if(IN==3'd2)
	   nxt_state<=S3;
	 
    S2:if(IN==3'd1)
	   nxt_state<=S3;
	   else if(IN==3'd2)
	   nxt_state<=S4;
	  
    S3:if(IN==3'd1)
	   nxt_state<=<=S4;
	   else if(IN==3'd2)
	   nxt_state<=IDLE;
	  
    S4:if(IN==3'd1)
	   nxt_state<=IDLE;
	   else if(IN==3'd2)
	   nxt_state<=S3;
	 
	 endcase
end
always @(posedge CLK)begin
  case(state)
   IDLE:if(IN==3'd1)
    OUT<=0;
	else if(IN==3'd2)
	OUT<=0;
   else if(IN==3'd5)
    OUT<=1;
S1:if(IN==3'd1)
    OUT<=0;
	else if(IN==3'd2)
	OUT<=0;
   
S2:if(IN==3'd1)
    OUT<=0;
	else if(IN==3'd2)
	OUT<=0;
   
S3:if(IN==3'd1)
    OUT<=0;
	else if(IN==3'd2)
	OUT<=1;
   
S4:if(IN==3'd1)
    OUT<=1;
	else if(IN==3'd2)
	OUT<=1;
  endcase
end
 endmodule
