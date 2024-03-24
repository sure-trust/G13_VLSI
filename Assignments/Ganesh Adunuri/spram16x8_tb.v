module spram16x8_tb();
  reg CLK;
  reg [7:0] A;
  reg [3:0] D;
  reg WEN;
  wire [7:0] Q;
  parameter CLK_PERIOD = 20;
  parameter WRITE_DELAY = 10;
  parameter READ_DELAY = 10;

 sp_ram_16x8 dut (.A(A), .D(D), .WEN(WEN), .Q(Q), .CLK(CLK));

  //TASK INITIALIZE 
  task initialize();
    begin
      CLK=0;
      WEN=0;
      A=0;
      D=0;
    end
  endtask
  
  always@(posedge CLK)
begin
CLK=~CLK;
end
  
  task write_operation(input [3:0] a, input [7:0] d);
    @(posedge CLK)
    begin
      WEN=1;
    for (A=0; A<=7; A=A+1)
    	begin
      A <= A;
      D<=$random;
   	 end
    end
  endtask
    
   task read_operation(input [3:0] a, input [7:0] d);
    @(posedge CLK)
    begin
      WEN=0;
    for (A=0; A<=7; A=A+1)
    	begin
      A <= A;
      D<=$random;
   	 end
    end
  endtask

  initial 
    begin
      initialize;
      write();
      read();
    end
      
  
  initial 
    begin
      $dumpfile("dump.vcd");
      $dumpvars();
    end
  
endmodule


