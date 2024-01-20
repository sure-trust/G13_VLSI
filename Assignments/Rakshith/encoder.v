module encode_8_3_priority_bh(Y, V, I);

    input [7:0] I;
    output reg [2:0] Y;
    output reg V;

    always @* begin
        if (I[0]) {V, Y} = 3'b000;
        else if (I[1]) {V, Y} = 3'b001;
        else if (I[2]) {V, Y} = 3'b010;
        else if (I[3]) {V, Y} = 3'b011;
        else if (I[4]) {V, Y} = 3'b100;
        else if (I[5]) {V, Y} = 3'b101;
        else if (I[6]) {V, Y} = 3'b110;
        else if (I[7]) {V, Y} = 3'b111;
        else {V, Y} = 3'b000;
    end

endmodule

