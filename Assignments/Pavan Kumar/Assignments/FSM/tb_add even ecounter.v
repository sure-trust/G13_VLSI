// Code your testbench here
// or browse Examples
//odd even coun ter testbnench

module tb();
  wire [2:0] OUT;
  reg CLK,OE,RST;
  
  odd_even_counter DUT(.CLK(CLK),.OUT(OUT),.OE(OE),.RST(RST));
  
  
  parameter CLK_PERIOD=10;
  parameter delay=10;
  //task for clock
  
  always
    begin
      CLK=0;
      #CLK_PERIOD;
      CLK=1;
      #CLK_PERIOD;
    end
  
  // rest task
  
  task reset;
    begin
      @(posedge CLK)
      RST=1;
      @(posedge CLK)
      RST=0;
    end
  endtask
    //task for odd even signal
    task odd_even(input i);
      begin
        @(posedge CLK)
        OE=i;
      end
      
    endtask
    
      // task for initialization
      
      task initialize;
        begin
          OE<=0;
          RST<=0;
        end
        
      endtask
  
      //main thimng begins here
      
      initial
        begin
          initialize();
          reset();
          
           odd_even(1);
           odd_even(1);
           odd_even(1);
           odd_even(1);
           odd_even(1);
       

          
         repeat(4)
          odd_even(0); // even mode
          
          repeat(10) 
            begin
             odd_even(1);
          #delay;
          odd_even(0);
          #delay;
            end
          $finish;
          
        end
        
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars();
      
    end
  
      
        
        endmodule
        
      
