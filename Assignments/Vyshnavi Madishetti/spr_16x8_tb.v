module spr_16x8_tb;
  reg CLK, WEN;
  reg [3:0] Addr;
  reg [7:0] Data;
  wire [7:0] Q;
  
  parameter CLK_PERIOD = 20;
  parameter WRITE_DLY = 10;
  parameter READ_DLY = 10;
  
  spr_16x8 dut(.CLK(CLK), .WEN(WEN), .Addr(Addr), .Data(Data), .Q(Q));
  
  // Clock generation
  always
    begin
      #(CLK_PERIOD/2);
      CLK = 0;
      #(CLK_PERIOD/2);
      CLK = 1;
    end

  //write operation
  task write_op(input [3:0] a, input [7:0] d);
    begin
      @(posedge CLK)
      begin
        WEN = 1;
        Addr <= a;
        Data <= d;
      end
      #WRITE_DLY;
      WEN = 0;
    end
  endtask

  //read operation
  task read_op(input [3:0] a);
    begin
      @(posedge CLK)
      begin
        WEN = 0;
        Addr <= a;
      end
      #READ_DLY;
    end
  endtask

  
  initial
    begin
      write_op(4'b0000, 8'h00);
      #10;

      
      read_op(4'b0000);
      #10;
      
      write_op(4'b0001, 8'h01);

      
      $finish;
    end
endmodule
