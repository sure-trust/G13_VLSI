module moore_fsm (clk,rest,x,y);
  input clk;
  input rst,
  input x,
  output reg y;


  parameter
    STATE_A = 3'b000,
    STATE_B = 3'b001,
    STATE_C = 3'b010,
    STATE_D = 3'b011;
  

  reg [2:0] state, nxt_state;

  always_ff @(posedge clk or posedge rst) begin
    if (rst)
      state <= STATE_A;
    else
      state <= nxt_state;
  end

  always_comb begin
    case (state)
      STATE_A: begin
        nxt_state = x ? STATE_B : STATE_A;
      end
      STATE_B: begin
        nxt_state = x ? STATE_C : STATE_A;
      end
      STATE_C: begin
        nxt_state = x ? STATE_D : STATE_A;
      end
      STATE_D: begin
        nxt_state = x ? STATE_D : STATE_A;
      end
    endcase
    y <= (nxt_state == STATE_D);
  end

endmodule
