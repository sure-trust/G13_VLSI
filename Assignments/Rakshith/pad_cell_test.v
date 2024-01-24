module pad_cell_tb;

    reg ie, oe, in;
    wire out, pad;
    reg pad_temp;

 
    pad_cell uut (
        .out(out),
        .in(in),
        .ie(ie),
        .oe(oe),
        .pad(pad)
    );

    assign pad = (ie == 1 && oe == 0) ? pad_temp : 1'bz;

    initial begin
    
        ie = 1; oe = 0; pad_temp = 1;
        #10;
        pad_temp = 0;
        #10;
        pad_temp = 1;
        #10;

        ie = 0; oe = 1; in = 0;
        #10;
        in = 1;
        #10;

        ie = 1; oe = 1; pad_temp = 0;
        #10;
        pad_temp = 1;
        #10;

       
        ie = 1; oe = 1; in = 0;
        #10;
        in = 1;
        #10;
    end

endmodule
