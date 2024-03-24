module JTAG_interface_tb;
reg TCK,TMS,TDI;
  JTAG_interface dut(TCK,TMS,TDI, TDO);
  

initial begin
	TCK=1;
	forever #5 TCK=~TCK;
end
  task initialize;
    begin
        TCK<=1;
        TMS<=0;
        TDI<=0;
    end
endtask


  task shift_IR(input i);
    begin
       TDI<=i;    
    end
endtask


  task shift_DR(input i);
    begin
       TDI<=i;    
    end
endtask
  
initial begin
  initialize;
  @(posedge TCK) TMS=0;   
	#10;
	@(posedge TCK) TMS=1;
	#10;
    @(posedge TCK) TMS=1;
    #10;
    @(posedge TCK) TMS=0;
  //capture_IR;
    #10;
    @(posedge TCK) TMS=0;
  
  //shifting IR with 00000
  
  @(posedge TCK) shift_IR(0);
  @(posedge TCK) shift_IR(0);
  @(posedge TCK) shift_IR(0);
  @(posedge TCK) shift_IR(0);
  @(posedge TCK) shift_IR(0);
  #10;
    @(posedge TCK) TMS=1;
    #10;
    @(posedge TCK) TMS=1;
  //update_IR;
    #10;
    @(posedge TCK) TMS=1;
    #10;
  @(posedge TCK) TMS=1;
  #10;
  @(posedge TCK) TMS=0;
  #10;
  @(posedge TCK) TMS=0;
  @(posedge TCK) shift_IR(1);
  #10;
  @(posedge TCK) TMS=1;
  #10;
  @(posedge TCK) TMS=1;
  #10;
  @(posedge TCK) TMS=1;
  #10;
    @(posedge TCK) TMS=0;
    #10;
    @(posedge TCK) TMS=0;
  // shifting DR
  @(posedge TCK) shift_DR(0);
  @(posedge TCK) shift_DR(1);
  @(posedge TCK) shift_DR(1);
  @(posedge TCK) shift_DR(0);
  @(posedge TCK) shift_DR(1);
  @(posedge TCK) shift_DR(1);
  @(posedge TCK) shift_DR(0);
  @(posedge TCK) shift_DR(1);
  @(posedge TCK) shift_DR(0);
  @(posedge TCK) shift_DR(1);
  @(posedge TCK) shift_DR(0);
  @(posedge TCK) shift_DR(0);
  @(posedge TCK) shift_DR(1);
  @(posedge TCK) shift_DR(0);
  @(posedge TCK) shift_DR(1);
  @(posedge TCK) shift_DR(0);
  @(posedge TCK) shift_DR(0);
  @(posedge TCK) shift_DR(1);
  
    #10; 
    @(posedge TCK) TMS=1;
    #10;
    @(posedge TCK) TMS=1;
  //update_DR
    #10;
    @(posedge TCK) TMS=1;
    #10;
    @(posedge TCK) TMS=1;
    #10;
    @(posedge TCK) TMS=1;
    #10 $finish;
end
  
initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
end
endmodule




