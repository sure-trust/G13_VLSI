module top_tb;
reg TCK,TMS,TDI;
  wire TDO;
  top_module uut(TCK,TMS,TDI, TDO); 

  initial
    begin
      main;
    end
  
  task main;
    fork
      clk_gen;
      operation;
      simulation;
    join
  endtask
  
  task clk_gen;
    begin
    TCK=1;
    forever #5 TCK = ~TCK; 
    end
  endtask
  
  task operation ;
    begin
      
  TMS=0;   
	#10;
	TMS=1;
	#10;
    TMS=1;
    #10;
    TMS=0;
  //capture_IR;
    #10;
    TMS=0;
  
  TDI=0;
  TDI=0;
  TDI=0;
  TDI=0;
  TDI=0;
  #50;
    TMS=1;
    #10;
    TMS=1;
  //update_IR;
    #10;
    TMS=1;
    #10;
 // TMS=1;
  //#10;
  TMS=0;
  #10;
  TMS=0;
  //shift_DR;
 // #10;
 // TMS=0;
  //#10;
  //TMS=1;
  //#10;
  //TMS=1;
  //#10;
    //TMS=0;
    //#10;
    //TMS=0;
  // shifting DR
  TDI=0;
  TDI=0;
  TDI=0;
  TDI=0;
  TDI=0;
  
    #20; 
    TMS=1;
    #10;
    TMS=1;
  //update_DR
    #10;
    TMS=1;
    #10;
    TMS=1;
    #10;
    TMS=1;
    end
  endtask

  task 	simulation;
    begin
    $dumpfile("dump.vcd");
    $dumpvars;               
    #400 $finish;
    end
  endtask
endmodule
