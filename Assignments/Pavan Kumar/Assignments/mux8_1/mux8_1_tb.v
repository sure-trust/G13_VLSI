module mux8_1_tb;
reg [7:0] d;
reg [2:0] sel;
wire out;

mux8_1 d1(.out(out),.d(d),.sel(sel));

initial
begin
sel=3'b000; in=d[0];
#5; sel=3'b001; in=d[1];
#5; sel=3'b111; in=d[7];
end

initial
begin
$monitor("time=%t",time,"d=%b ",d,"out=%b ",out,"sel=%b ",sel);

#50; $finish;
end
endmodule



