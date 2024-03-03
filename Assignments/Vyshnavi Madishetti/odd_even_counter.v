module odd_even_counter(CLK, OE, OUT, RST);
  input CLK, OE, RST;
  output [2:0] OUT;
  localparam s0 = 3'b000,
            s1 = 3'b001,
            s2 = 3'b010,
            s3 = 3'b011,
            s4 = 3'b100,
            s5 = 3'b101,
            s6 = 3'b110,
            s7 = 3'b111;
  reg [2:0] state, nxt_state;

  always @(posedge CLK or posedge RST)
    begin
      if (RST)
        state <= s0;
      else
        state <= nxt_state;
    end

  always @(state or OE)
    begin
      case (state)
        s0: if (OE) nxt_state = s1;
        else nxt_state = s2;
        s1: if (OE) nxt_state = s3; 
        else nxt_state = s2;
        s2: if (OE) nxt_state = s3;
        else nxt_state = s4;
        s3: if (OE) nxt_state = s4;
        else nxt_state = s5;
        s4: if (OE) nxt_state = s5; 
        else nxt_state = s6;
        s5: if (OE) nxt_state = s7; 
        else nxt_state = s6;
        s6: if (OE) nxt_state = s7; 
        else nxt_state = s0;
        s7: if (OE) nxt_state = s0; 
        else nxt_state = s2;
        default: nxt_state = s0;
      endcase
    end

  assign OUT = (state == s0) ? 3'b000 :
               (state == s1) ? 3'b001 :
               (state == s2) ? 3'b010 :
               (state == s3) ? 3'b011 :
               (state == s4) ? 3'b100 :
               (state == s5) ? 3'b101 :
               (state == s6) ? 3'b110 :
               (state == s7) ? 3'b111 : 3'b000;
endmodule

