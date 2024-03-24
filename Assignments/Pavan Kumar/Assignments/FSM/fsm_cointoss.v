// using mealy machine  written code of tossing haed 3 times continuously
module fsm_coin_toss(clk,rst,toss, OUT);
    input clk, rst;
    input toss;
    output reg OUT; 
  reg [1:0] state, nxt_state;

localparam S0 = 0;
localparam S1 = 1;
localparam S2 = 2;
localparam S3 = 3;

 
always @(posedge clk )
	begin
      if (rst)
			state <= S0;
		else
			state <= nxt_state;
	end

  always @(state,toss) 
  begin 
    case (state)
    	S0: begin
            if (toss) begin
                nxt_state <= S1; //Head
            end
          else
            begin
                nxt_state <= S0; //Tail
            end
        end
      
        S1: begin
            if (toss) begin
                nxt_state <= S2; //Head
            end
          else
            begin
                nxt_state <= S0; //Tail
            end
        end
        S2: begin
            if (toss) begin
                nxt_state <= S3; //Head
              
            end
          else
            begin
                nxt_state <= S0; //Tail
            end
        end
      	S3: begin
            if (toss) begin
                nxt_state <= S1;
           
            end
          else
            begin
                nxt_state <= S0;
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

