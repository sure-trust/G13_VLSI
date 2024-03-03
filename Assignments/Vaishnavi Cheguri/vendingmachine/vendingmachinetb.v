
module vendingtb();

   // Parameters
   parameter CLK_PERIOD = 10; // Clock period in time units

   // Signals
   reg CLK;
   reg RST;
   reg [2:0] IN;
   wire OUT;

   // Instantiate the vending module
   vending uut (
      .CLK(CLK),
      .RST(RST),
      .IN(IN),
      .OUT(OUT)
   );

   // Clock generation
   always #((CLK_PERIOD/2)) CLK = ~CLK;

   // Initial block for reset and stimulus
   initial begin
      // Initialize signals
      CLK = 0;
      RST = 1;
      IN = 3'b000;

      // Apply reset
      #10 RST = 0;

      // Stimulus
      #20 IN = 3'd1;
      #10 IN = 3'd2;
      #10 IN = 3'd5;
      #10 IN = 3'd1;
      #10 IN = 3'd2;

      // Finish simulation
      #10 $finish;
   end

   // Monitor for displaying results
   always @(posedge CLK) begin
      $display("Time %0t: State = %b, Input = %b, Output = %b", $time, uut.current_state, IN, OUT);
   end

endmodule
