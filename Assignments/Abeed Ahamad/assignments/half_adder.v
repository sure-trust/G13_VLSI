module half_adder_dataflow (
  input a,    // Input 'a'
  input b,    // Input 'b'
  output s,   // Output 's' (Sum)
  output c    // Output 'c' (Carry)
);

  assign s = a ^ b;  // Dataflow expression for sum
  assign c = a & b;  // Dataflow expression for carry
endmodule
