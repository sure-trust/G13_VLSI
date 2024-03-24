module data_reg_tb;
  reg tdr_select,TDI,TCK,Capture_DR,Shift_DR,Update_DR;
  parameter DR_length=5;
  wire TDO;
  wire [DR_length-1:0]DR_out;
  reg [DR_length-1:0] Shift_reg;
  initial begin
	TCK=1;
	forever #5 TCK=~TCK;
  end
  data_reg dut(.tdr_select(tdr_select),.TCK(TCK),.TDI(TDI),.Capture_DR(Capture_DR),.Shift_DR(Shift_DR),.Update_DR(Update_DR),.TDO(TDO),.DR_out(DR_out));

task initialize ; 
    begin
        TCK<=1;
        TDI<=0;
        tdr_select<=0;
        Shift_DR<=0;
        Capture_DR<=0;
        Update_DR<=0;
    end
endtask

task capture;
    begin
        Capture_DR<=1;
        #10; 
        Capture_DR<=0;
    end
endtask


  task shift(input i);
    begin
       Shift_DR<=1;
       TDI<=i;    
    end
endtask

  
task update;
    begin
        Update_DR<=1;
        #10; 
        Update_DR<=0;
    end
endtask

initial begin
    initialize;
    tdr_select<=0;
    @(posedge TCK) capture;
    @(posedge TCK) shift(1);
    @(posedge TCK) shift(0);
    @(posedge TCK) shift(0);
    @(posedge TCK) shift(1);
    @(posedge TCK) shift(0);
    #10; Shift_DR<=0;
    @(posedge TCK) update;


  tdr_select<=1;
    @(posedge TCK) capture;
  @(posedge TCK)  shift(0);
  @(posedge TCK)  shift(0);
  @(posedge TCK)  shift(0);
  @(posedge TCK)  shift(0);
  @(posedge TCK)  shift(0);
  #10;Shift_DR<=0;
    @(posedge TCK) update;
    #10;
    @(posedge TCK) capture;
  @(posedge TCK)  shift(0);
  @(posedge TCK)  shift(0);
  @(posedge TCK)  shift(0);
  @(posedge TCK)  shift(1);
  @(posedge TCK)  shift(0);
  #10;Shift_DR<=0;
  @(posedge TCK) update;
  #10;
    
   @(posedge TCK) capture;
  @(posedge TCK)  shift(0);
  @(posedge TCK)  shift(1);
  @(posedge TCK)  shift(0);
  @(posedge TCK)  shift(0);
  @(posedge TCK)  shift(0);
  
  #10;Shift_DR<=0;
    @(posedge TCK) update;
    #10 $finish;
end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule
