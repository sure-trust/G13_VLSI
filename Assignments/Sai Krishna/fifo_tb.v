module FIFO_tb();
  parameter WIDTH = 8;
  parameter DEPTH = 16;
  
  reg CLK, Wen, Ren, Rst;
  reg [WIDTH-1:0] D;
  wire [WIDTH-1:0] Q;
  wire Full, Empty;
  
  // Instantiate the FIFO module under test (DUT)
  // Assuming the FIFO module is named 'fifo_module'
  fifo_module DUT (
    .CLK(CLK),
    .Wen(Wen),
    .Ren(Ren),
    .Rst(Rst),
    .D(D),
    .Q(Q),
    .Full(Full),
    .Empty(Empty)
  );
  
  // Force write enable to 1
  initial begin
    force DUT.Wen = 1'b1;
  end
  
  // Task to initialize signals
  task initialize;
    begin
      CLK = 0;
      Wen = 0;
      Ren = 0;
      Rst = 0;
      D = 0;
      #10; // Delay for a few time units after reset
      Rst = 1;
    end
  endtask

  // Clock generation
  always #5 CLK = ~CLK;

  // Call initialize task at time 0
  initial begin
    $dumpfile("fifo_tb.vcd");
    $dumpvars(0, FIFO_tb);
    CLK = 0;
    initialize;
    #100; // Run simulation for some time
    $finish; // Finish simulation
  end
endmodule

