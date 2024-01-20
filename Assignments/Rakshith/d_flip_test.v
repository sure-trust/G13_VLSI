module dffb(q, d, clk, rst);
    input d, clk, rst;
    output reg q;

    always @(posedge clk or negedge rst)
        if (!rst)
            q <= 1'b0;
        else
            q <= d;
endmodule

module dffb_tb;
    reg d, clk, rst;
    wire q;

    dffb uut (
        .q(q),
        .d(d),
        .clk(clk),
        .rst(rst)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        d = 1; rst = 0; #5;
        rst = 1; #5;

        d = 0; #5;
        d = 1; #5;
        d = 0; #5;

        rst = 0; #5;
        rst = 1; #5;
        d = 1; #5;
        d = 0; #5;
        rst = 0; #5;
        rst = 1; #5;

        d = 0; #5;
        d = 1; #5;
        clk = 0; #5;
        d = 0; #5;
        d = 1; #5;
        clk = 1; #5;

        $finish;
    end
endmodule

