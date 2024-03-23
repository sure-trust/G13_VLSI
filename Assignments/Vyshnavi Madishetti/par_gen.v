module par_gen(y,clk,rst,a);
  input clk,rst,a;
  output reg y;


 typedef enum logic [2:0] {
    S0, S1, S2, S3, S4, S5, S6
  } state_t;


  reg [2:0] state, nxt_state;

  always @(posedge clk or posedge rst) 
    begin
    if (rst)
      state <= S0;
    else
      state <= nxt_state;
  end

  always begin
    case (state)
      S0: nxt_state = a ? S4 : S1;
      S1: nxt_state = a ? S5 : S2;
      S2: nxt_state = a ? S6 : S3;
      S3: nxt_state = a ? S0 : S0;
      S4: nxt_state = a ? S2 : S5;
      S5: nxt_state = a ? S3 : S6;
      S6: nxt_state = a ? S0 : S0;
    endcase
    y = (nxt_state == S6);
  end

endmodule
