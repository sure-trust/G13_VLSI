module CoinTossDetector( input  coin_toss,input  reset,output reg detected);

// Define states
parameter [1:0]
    S_START = 2'b00,
    S_H1    = 2'b01,
    S_H2    = 2'b10,
    S_H3    = 2'b11;

// Define signals
reg [1:0] state;
reg [1:0] next_state;

always @* begin
    next_state = state;

    case (state)
        S_START: begin
            if (coin_toss) begin
                next_state = S_H1;
            end
        end

        S_H1: begin
            if (coin_toss) begin
                next_state = S_H2;
            end else begin
                next_state = S_START;
            end
        end

        S_H2: begin
            if (coin_toss) begin
                next_state = S_H3;
            end else begin
                next_state = S_START;
            end
        end

        S_H3: begin
            if (coin_toss) begin
                detected = 1'b1;
            end else begin
                next_state = S_START;
            end
        end
    endcase
end

always @(posedge clk or posedge reset) begin
    if (reset) begin
        state <= S_START;
        detected <= 1'b0;
    end else begin
        state <= next_state;
    end
end

endmodule
