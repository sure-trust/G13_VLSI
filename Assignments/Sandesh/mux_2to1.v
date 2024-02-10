module mux2_1(
  input i0,
  input i1,
  input s,
  output out);

assign out = (~s)?i0:i1;

endmodule
