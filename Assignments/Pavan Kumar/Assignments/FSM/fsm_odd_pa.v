// Code your design here

module fsm_odd_parity(clk,in,rst,out);
input clk,rst,in;
output reg out;

parameter s0=3'b000,s1=3'b001,s2=3'b010,s3=3'b011,s4=3'b100,s5=3'b101,s6=3'b110;

  reg [2:0] state,nxt_state;

always @(posedge clk , negedge rst)
    begin
        if(rst)
            state<=s0;
        else
            state<=n_state;
    end
    
 always @(*)
    begin
        case(state)
            s0 : nxt_state = in ? s2:s1;
            s1 : nxt_state = in ? s4:s3;
            s2 : nxt_state = in ? s4:s3; 
            s3 : nxt_state = in ? s5:s6;
            s4 : nxt_state = in ? s6:s5;
            s5 : nxt_state = in ? s0:s0;
            s6 : nxt_state = in ? s0:s0;  
        endcase
    end
 
 always  @(state)
    begin
        case(state)
            s0 : out = 0;
            s1 : out = 0;
            s2 : out = 0;
            s3 : out = 0;
            s4 : out = 0;
            s5 : out = 0;
            s6 : out = 1; 
            default : out = 'hz;   
        endcase
    end
endmodule
