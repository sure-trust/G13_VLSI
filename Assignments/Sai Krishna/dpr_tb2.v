`include "dpr.v";
`timescale 1ns/1ps

module dpr_tb2;

  reg CLKA;
  reg CLKB;
  reg WEN_A;
  reg WEN_B;
  reg [7:0] D_A;
  reg [7:0] D_B;
  reg [4:0] A;
  reg [4:0] B;
  wire [7:0] Q_A;
  wire [7:0] Q_B;

  // Instantiate the dual-port RAM module
  dpr_32x8 uut (
    .CLKA(CLKA),
    .CLKB(CLKB),
   .WEN_A(WEN_A),
    .WEN_B(WEN_B),
    .D_A(D_A),
    .D_B(D_B),
    .A(A),
    .B(B),
    .Q_A(Q_A),
    .Q_B(Q_B)
  );

  // Clock generation
  initial begin
    CLKA = 0;
    CLKB = 0;
    forever #5 CLKA = ~CLKA;
    forever #7 CLKB = ~CLKB;
  end

  // Test sequence
  initial begin
    // Write into all locations
    WEN_A = 1;
    WEN_B = 1;
    for (A = 0; A < 32; A = A + 1) begin
      D_A = $random;
      D_B = $random;
      #10; // Wait for a few cycles
    end

    // Read from all locations
    WEN_A = 0;
    WEN_B = 0;
    for (B = 0; B < 32; B = B + 1) begin
      #10; // Wait for a few cycles
    end

    // Add additional test cases as needed

    $stop; // Stop simulation
  end

endmodule

