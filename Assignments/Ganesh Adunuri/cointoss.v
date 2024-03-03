module toss(clk,rst,toss,out);
    input clk, rst;
    input toss;
    output reg out; 
  reg [1:0] state, next_state;

parameter S0 = 0;
parameter S1 = 1;
parameter S2 = 2;
parameter S3 = 3;

 
always @(posedge clk )
	begin
      if (rst)
			state <= S0;
		else
			state <= next_state;
	end

  always @(state,toss) 
  begin 
    case (state)
    	S0: begin
            if (toss) begin
                next_state <= S1; //Head
            end
          else
            begin
                next_state <= S0; //Tail
            end
        end
      
        S1: begin
            if (toss) begin
                next_state <= S2; //Head
            end
          else
            begin
                next_state <= S0; //Tail
            end
        end
        S2: begin
            if (toss) begin
                next_state <= S3; //Head
              
            end
          else
            begin
                next_state <= S0; //Tail
            end
      	S3: begin
            if (toss) begin
                next_state <= S1;
           
            end
          else
            begin
                next_state <= S0;
            end
        end
    endcase
end
      always@(state)
begin
	case(state)
		S0: OUT=0;
		S1: OUT=0;
		S2: OUT=0;
		S3: OUT=1;

	endcase
end

endmodule
