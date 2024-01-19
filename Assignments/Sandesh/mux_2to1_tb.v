`include"mux_2to1.v"
module tb;

  reg i0, i1, s;
  wire out;

  mux2_1 mux(.i0(i0),.i1(i1),.s(s),.out(out));

  initial begin
    i0 = 0;
    i1 = 0;
    s = 0;
	#10;
    i0 = 0;
    i1 = 1;
    s = 0;
	#10;
    i0 = 1;
    i1 = 0;
    s = 1;
	#10;
	i0 = 1;
    i1 = 1;
    s = 1;
	#10;
    $finish;
  end

  always @(posedge out) begin
    $display("out = %d", out);
  end
  endmodule
