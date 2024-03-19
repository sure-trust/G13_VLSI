`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/29/2024 08:59:24 PM
// Design Name: 
// Module Name: tb_FSM111
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


module tb_FSM111();
reg clk,w,arstn;
wire q;

parameter clock = 10;

always #(clock/2) clk<=~clk;

Fsm dut(w,clk,arstn,q);

task initialize;
  begin
    arstn<=0;
    clk<=0;
    w<=0;
    #2 arstn<=1;
  end
endtask

integer i;
initial 
    begin
        #5 initialize;
           for(i=0;i<50;i=i+1) 
            begin
                w <= $urandom_range(0,1);
                #6;
            end
        #20 $finish;  
    end
endmodule


