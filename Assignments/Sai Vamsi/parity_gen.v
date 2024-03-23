module ParityGenerator(input w, input clk, output reg p);

// Define states
typedef enum logic [1:0] {
    S0,
    S1
} state_t;

// Define state register and next state logic
state_t current_state, next_state;

always @(posedge clk) begin
    // State transition and output generation logic
    case (current_state)
        S0: begin
            if (w) begin
                next_state = S1;
                p = 0; // Output parity not computed yet
            end else begin
                next_state = S0;
            end
        end
        S1: begin
            if (w) begin
                next_state = S0;
                p = 1; // Output parity computed (odd number of 1's)
            end else begin
                next_state = S1;
            end
        end
        default: next_state = S0;
    endcase
end

// State register update
always @(posedge clk) begin
    current_state <= next_state;
end

endmodule

