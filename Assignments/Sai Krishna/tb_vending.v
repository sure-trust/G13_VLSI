`timescale 1ns / 1ps
module tb_vending();
reg tb_clk;
reg [2:0]tb_in;
reg tb_arstn;
wire  tb_out;

parameter clock = 10;

always #(clock/2) tb_clk<=~tb_clk;

fsm_vending dut(.clk(tb_clk),.in(tb_in),.arstn(tb_arstn),.out(tb_out));

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
        @(posedge tb_clk) tb_in<=0;
        @(posedge tb_clk) tb_in<=3'd1; 
        @(posedge tb_clk) tb_in<=3'd1;
        @(posedge tb_clk) tb_in<=3'd1;
        @(negedge tb_clk) tb_in<=3'd2;
        @(posedge tb_clk) tb_in<=3'd2;  
        
        #20 $finish;  
    end
endmodule
