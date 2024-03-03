`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/11/2024 07:15:07 PM
// Design Name: 
// Module Name: tb_fifo
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module fifo_tb;
  parameter DEPTH = 16;
  parameter ADDR = 4;
  parameter WIDTH = 8;
  parameter clock = 10; 
  reg CLK, WEN, REN, RST;
  reg [7:0] D;
  wire [7:0] Q;
  reg [7:0] i;
  reg a;
  
  fifo dut(.CLK(CLK),.D(D),.Q(Q),.WEN(WEN),.REN(REN),.FULL(FULL),.EMPTY(EMPTY),.RST(RST));

  // Clock generation
  always
  begin
	#(clock/2);
	CLK=0;
	#(clock/2);
	CLK=1;
  end

  // Task for initial conditions
  task initialize;
    begin
      WEN <= 0;
      REN <= 0;
      RST <= 0;
      D <= 0;
    end
  endtask

  task write_op(input [7:0]i,input a);
    begin
      @(posedge CLK)
        begin
          D <= i;
          WEN <= a;
        end
    end
  endtask

  // Task for read operation
  task read_op;
    begin
      @(posedge CLK)
        REN <= 1;
    end
  endtask

  // Task for reset
  task reset;
    begin
      @(negedge CLK)
        RST <= 1'b1;
      @(negedge CLK)
        RST <= 1'b0;
    end
  endtask

  // Initial block to perform operations
  initial
  begin
      initialize;
      #10;
      reset;
      #10;
      read_op;
      for (i = 0; i < DEPTH-1; i = i + 1)
        #5 write_op($random, 1);     
      reset;
      write_op(0, 0);
      read_op;
      reset;
      write_op($urandom_range(0,9), 1);
      #10;
      read_op;
      #100 $finish;
  end
endmodule



