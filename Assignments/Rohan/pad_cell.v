module pad_cell (
    output out,
    input in,
    input ie,
    input oe,
    inout pad
);
    bufif1 g1(out, pad, ie);
    bufif1 g2(pad, in, oe);
endmodule

