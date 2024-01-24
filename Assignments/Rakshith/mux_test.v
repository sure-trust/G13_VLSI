module mux_8_1_df_tb;

    reg [7:0] I;
    reg [2:0] S;
    wire Y;

    mux_8_1_df uut (
        .Y(Y),
        .I(I),
        .S(S)
    );

    initial begin
        I = 8'b10101010; S = 3'b000; #10;
        I = 8'b11001100; S = 3'b010; #10;
        I = 8'b11110000; S = 3'b111; #10;
        I = 8'b01010101; S = 3'b001; #10;
        I = 8'b00110011; S = 3'b011; #10;
        I = 8'b11111111; S = 3'b101; #10;
        I = 8'b00000000; S = 3'b110; #10;

        $finish;
    end

endmodule

