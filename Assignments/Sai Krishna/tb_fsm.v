`timescale 1ns / 1ps
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
