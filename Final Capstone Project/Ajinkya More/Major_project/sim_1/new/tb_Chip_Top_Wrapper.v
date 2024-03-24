`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2024 06:53:20 PM
// Design Name: 
// Module Name: tb_Chip_Top_Wrapper
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


module tb_Chip_Top_Wrapper();
reg tb_TDI,tb_TCK,tb_TMS;
wire tb_TDO;

parameter clock = 10;

Chip_Top_Wrapper dut(.TCK(tb_TCK),.TMS(tb_TMS),.TDI(tb_TDI),.TDO(tb_TDO));
always #(clock/2) tb_TCK<=~tb_TCK;

task initialize;
    begin
        tb_TDI<=1'b0;
        tb_TCK<=1'b1;
        tb_TMS<=1'b1;
    end
endtask

initial begin
    initialize;
    @(posedge tb_TCK) tb_TMS<=1'b0;
    @(posedge tb_TCK) tb_TMS<=1'b0;
    @(posedge tb_TCK) tb_TMS<=1'b0;
    @(posedge tb_TCK) tb_TMS<=1'b1;
    @(posedge tb_TCK) tb_TMS<=1'b1;
    @(posedge tb_TCK) tb_TMS<=1'b0;
    @(posedge tb_TCK) tb_TMS<=1'b0;
    @(posedge tb_TCK) tb_TMS<=1'b0;   //1
                      tb_TDI<=1'b1;
    @(posedge tb_TCK) tb_TMS<=1'b0;   //2
                      tb_TDI<=1'b1;
    @(posedge tb_TCK) tb_TMS<=1'b0;  //3
                      tb_TDI<=1'b1;
    @(posedge tb_TCK) tb_TMS<=1'b0;  //4
                      tb_TDI<=1'b1;
    @(posedge tb_TCK) tb_TMS<=1'b0;  //5
                      tb_TDI<=1'b1;
    @(posedge tb_TCK) tb_TMS<=1'b1;  //3
    @(posedge tb_TCK) tb_TMS<=1'b1;  // exit 
    @(posedge tb_TCK) tb_TMS<=1'b1;  // updateIR
    @(posedge tb_TCK) tb_TMS<=1'b0;
    @(posedge tb_TCK) tb_TMS<=1'b0;
    @(posedge tb_TCK) tb_TMS<=1'b0;   //shift reg 1f
                      tb_TDI<=1'b0;
    @(posedge tb_TCK) tb_TMS<=1'b0;   //shift reg 1E
                      tb_TDI<=1'b0;
    @(posedge tb_TCK) tb_TMS<=1'b0;   //shift reg  1c
                      tb_TDI<=1'b1;
    @(posedge tb_TCK) tb_TMS<=1'b0;   //shift reg  18
                      tb_TDI<=1'b1;
    @(posedge tb_TCK) tb_TMS<=1'b0;   //shift reg  10
                      tb_TDI<=1'b1;
    @(posedge tb_TCK) tb_TMS<=1'b0;   //shift reg  00
                      tb_TDI<=1'b1;
    @(posedge tb_TCK) tb_TMS<=1'b0;   //shift reg  00
                      tb_TDI<=1'b0;
   @(posedge tb_TCK) tb_TMS<=1'b0;   //shift reg  00
                      tb_TDI<=1'b1;
    @(posedge tb_TCK) tb_TMS<=1'b1; 
    @(posedge tb_TCK) tb_TMS<=1'b1; 
    @(posedge tb_TCK) tb_TMS<=1'b1; 
    @(posedge tb_TCK) tb_TMS<=1'b0; 
   /* @(posedge tb_TCK) tb_TMS<=1'b0;      //entered into shift reg with tdi data 
                      tb_TDI<=1'b1;
    @(posedge tb_TCK) tb_TMS<=1'b0;      //entered into shift reg with tdi data 
                      tb_TDI<=1'b1;
    @(posedge tb_TCK) tb_TMS<=1'b0;      //entered into shift reg with tdi data 
                      tb_TDI<=1'b1;
    @(posedge tb_TCK) tb_TMS<=1'b0;      //entered into shift reg with tdi data 
                      tb_TDI<=1'b1;
    @(posedge tb_TCK) tb_TMS<=1'b1;      //entered into shift reg with tdi data 
                      tb_TDI<=1'b0;
    @(posedge tb_TCK) tb_TMS<=1'b1;
    @(posedge tb_TCK) tb_TMS<=1'b1; 
    @(posedge tb_TCK) tb_TMS<=1'b1;*/
    #10 $finish ;
end
endmodule
