`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/09/2024 11:32:45 PM
// Design Name: 
// Module Name: tb_DPR_intel
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


module tb_DPR_intel();
 reg tb_clkA,tb_clkB,tb_WenA,tb_WenB,tb_RenA,tb_RenB,tb_arstnA,tb_arstnB;
 
 reg [7:0] tb_dinA,tb_dinB;
 reg [3:0]tb_addA,tb_addB;
 
 wire [7:0]tb_q_outA,tb_q_outB;
 
 parameter clock = 10;
 parameter Write_delay = 10;
 parameter Read_delay = 10;
 
 DPR dut(.clkA(tb_clkA),.clkB(tb_clkB),.WenA(tb_WenA),.WenB(tb_WenB),.RenA(tb_RenA),.RenB(tb_RenB),.arstnA(tb_arstnA),.arstnB(tb_arstnB),.dinA(tb_dinA),.dinB(tb_dinB),.q_outA(tb_q_outA),.q_outB(tb_q_outB),.addA(tb_addA),.addB(tb_addB));
 
 always #(clock/2) tb_clkA=~tb_clkA;
 always #(clock/2) tb_clkB=~tb_clkB;
  
 task initialization ;
    begin
        tb_clkA<=0;
        tb_clkB<=0;
        tb_WenA<=0;
        tb_WenB<=0;
        tb_RenA<=0;
        tb_RenB<=0;
        tb_arstnA<=0;
        tb_arstnB<=0;
        tb_addA<=0;
        tb_addB<=0;
        tb_dinA<=0;
        tb_dinB<=0;
        
        #5      tb_clkA=1;
                tb_clkB=1;
                tb_arstnA=1;
                tb_arstnB=1;
    end
endtask


 task write_operation_A (input [7:0]data,input [3:0]address);
    begin
        @(posedge tb_clkA)
            begin
                tb_WenA<=1;
                tb_addA<=address;  
                tb_dinA<=data;                       
                tb_WenB=0;
                tb_RenA=0;
                tb_RenB=0;
                #(Write_delay);
            end
      end
  endtask
  
   task write_operation_B (input [7:0]dataB,input [3:0]addressB);
    begin
        @(posedge tb_clkB)
            begin
                tb_WenB<=1;
                tb_addB<=addressB;
                tb_dinB<=dataB;                
                tb_WenA=0;
                tb_RenA=0;
                tb_RenB=0;
                #(Write_delay);
            end
      end
  endtask
  
  task read_operation_A (input [3:0] addressA);
      begin
            @(posedge tb_clkA)
                begin
                     tb_RenA=1;
                     tb_addA<=addressA;
                     tb_RenB=0;
                     tb_WenB=0;
                     tb_WenA=0;
                     #(Read_delay);
                end
       end
  endtask
  
   task read_operation_B (input [3:0] addressB);
      begin
            @(posedge tb_clkB)
                begin
                     tb_RenB=1;
                     tb_addB<=addressB;
                     tb_RenA=0;
                     tb_WenB=0;
                     tb_WenA=0;  
                      #(Read_delay);
                end
       end
  endtask              
  
  
  initial 
    begin
        initialization;
        write_operation_A(8'h10,4'h1);
        #5;
        read_operation_A(4'h1);
        #5;
        write_operation_B(8'h11,4'h2);
        #5;
        read_operation_B(4'h2);
        
        #100 $finish;
    end
endmodule
