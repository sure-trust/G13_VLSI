module tb();
  reg CLK,RST;
  reg [2:0]IN;
  wire OUT;
  
  vending DUT1(.CLK(CLK),.RST(RST),.IN(IN),.OUT(OUT));
    
  //localparam delay=5;
  localparam CLK_PERIOD=10;
  // task dor clock initialize
  task initi();
    IN=0;
  endtask
  
  //task for dribing input signal
  task rupee_in(input i);
    @(posedge CLK)
    IN=i;
  endtask

   
  task reset;
    begin
      @(posedge CLK)
      RST<=1;
      @(posedge CLK)
      RST<=0;
    end
  endtask
  //task for clock_gen();
  always 
    begin
      CLK=1'B0;
      #(CLK_PERIOD/2);
      CLK=1'B1;
      #(CLK_PERIOD/2);
    end
 
  
  initial
    begin
         initi();
      reset();
   
      rupee_in(1);
     // #delay;
      rupee_in(2);
      rupee_in(2);
      rupee_in(1);
      rupee_in(1);
      rupee_in(1);
      rupee_in(5);
      rupee_in(1);
      rupee_in(2);
       rupee_in(2);
       rupee_in(2);
       $finish;
     // repeat(10)
       // rupee_in($random);
    end
  
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars;
   
    end
endmodule
