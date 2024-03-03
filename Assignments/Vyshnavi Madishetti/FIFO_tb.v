module FIFO_tb;
  parameter DEPTH = 16;
  parameter ADDR = 4;
  parameter WIDTH = 8;
  
  reg CLK, WEN, REN, RST;
  wire FULL, EMPTY;
  reg [WIDTH-1:0] D;
  wire [WIDTH-1:0] Q;
  
  FIFO dut(.CLK(CLK), .WEN(WEN), .D(D), .Q(Q), .RST(RST), .REN(REN), .FULL(FULL), .EMPTY(EMPTY));
  
  // Clock generation
  always
    begin
      #(CLK_PERIOD/2);
      CLK = 0;
      #(CLK_PERIOD/2);
      CLK = 1;
    end
  
  task initialize;
    begin
      WEN = 0;
      REN = 0;
      RST = 0;
      D = 0;
    end
  endtask
  
  task write_op(input [WIDTH-1 : 0]i, input a);
 
       begin
         @(posedge CLK)
           begin
             D<=i;
             WEN=1;
           end
       end
  endtask
     
  task read_op;
       begin
         @(posedge CLK)
           REN <=1;
       end
  endtask
        
  // Task for reset
  task reset;
    begin
      @(posedge CLK)
        RST <= 1;
      @(posedge CLK)
        RST <= 0;
    end
  endtask

 
  initial
    begin
      initialize;
      reset;
      read_op;
      for (int i = 0; i < DEPTH; i = i + 1)
        write_op($random, 1);
      
      reset;
      write_op(0, 0);
      read_op;
      
      reset;
      write_op(0, 0);
      read_op;
      reset;
      write_op($random, 1);
      write_op($random, 1);
      write_op($random, 1);
      read_op;
    end
endmodule
