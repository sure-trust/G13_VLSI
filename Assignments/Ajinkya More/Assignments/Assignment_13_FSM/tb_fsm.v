`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/23/2024 10:00:57 PM
// Design Name: 
// Module Name: tb_fsm
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


/*
module tb_fsm();
reg tb_clk,tb_arstn,tb_in;
wire [2:0] tb_out;

parameter clock = 5;

always #(clock/2) tb_clk<=~tb_clk;

fsm dut(tb_arstn,tb_in,tb_clk,tb_out);

task initialize;
  begin
    tb_arstn<=0;
    tb_clk<=0;
    tb_in<=0;
    #2 tb_arstn<=1;
  end
endtask

integer i;
initial 
    begin
        #5 initialize;
           for(i=0;i<50;i=i+1) 
            begin
                tb_in <= $urandom_range(0,1);
                #6;
            end
        #20 $finish;  
    end
endmodule
*/



module tb_fsm();
reg clk,oe,rst;
wire [2:0] out;

parameter clock = 5;

always #(clock/2) clk<=~clk;

fsm dut(clk,oe,rst,out);

task initialize;
  begin
    rst<=1;
    clk<=0;
    oe<=0;
    #2 rst<=0;
  end
endtask

integer i;
initial 
    begin
        #5 initialize;
           for(i=0;i<50;i=i+1) 
            begin
                oe <= $urandom_range(0,1);
                #6;
            end
        #20 $finish;  
    end
endmodule
