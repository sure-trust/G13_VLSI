module encode_8_3_priority_bh_tb;

    reg [7:0] I;
    wire [2:0] Y;
    wire V;

    encode_8_3_priority_bh uut (
        .Y(Y),
        .V(V),
        .I(I)
    );

    initial begin
        I = 8'b00000001; #10;
        I = 8'b00000100; #10;
        I = 8'b00010000; #10;
        I = 8'b11000000; #10;
        I = 8'b00000000; #10;


        $finish;
    end

endmodule

