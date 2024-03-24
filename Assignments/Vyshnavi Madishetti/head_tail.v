module head_tail (y,clk,rst,a);
  input clk,rst,a;
  output reg y;

  typedef enum logic [2:0] {
    State_W = 3'b000,
    State_X = 3'b001,
    State_Y = 3'b010,
    State_Z = 3'b011
  } state_t;

  reg [2:0] state, nxt_state;

  always_ff @(posedge clk or posedge rst) begin
    if (rst)
      state <= State_W;
    else
      state <= nxt_state;
  end

  always_comb begin
    case (state)
      State_W: begin
        nxt_state = a ? State_X : State_W;
      end
      State_X: begin
        nxt_state = a ? State_Y : State_W;
      end
      State_Y: begin
        nxt_state = a ? State_Z : State_W;
      end
      State_Z: begin
        nxt_state = a ? State_Z : State_W;
      end
    endcase
    y <= (nxt_state == State_Z);
  end

endmodule
