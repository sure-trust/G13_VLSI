module vending_machine_tb();
   parameter CLK_PERIOD = 10; 
   reg CLK;
   reg RST;
   reg [2:0] IN;
   wire OUT;
 
   vending_machine uut (
      .CLK(CLK),
      .RST(RST),
      .IN(IN),
      .OUT(OUT)
   );

   
   always #((CLK_PERIOD/2)) CLK = ~CLK;

   initial begin
      CLK = 0;
      RST = 1;
      IN = 3'b000;

      #10 RST = 0;
      #20 IN = 3'd1;
      #10 IN = 3'd2;
      #10 IN = 3'd5;
      #10 IN = 3'd1;
      #10 IN = 3'd2;
      #10 IN = 3'd5;
     
   end

   always @(posedge CLK) begin
      $display("Time %0t: State = %b, Input = %b, Output = %b", $time, uut.current_state, IN, OUT);
   end
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars;
      	#300 $finish;
    end

endmodule
