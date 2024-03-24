`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2024 06:24:58 PM
// Design Name: 
// Module Name: Chip_Top_Wrapper
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


module Chip_Top_Wrapper(input TCK,TMS,TDI,output TDO);
wire w_tdr_select;
wire IR_S0,DR_S0;
wire W_Capture_IR_out,
     W_Capture_DR_out,
     W_Update_IR_out,
     W_Update_DR_out,
     W_Shift_IR_out,
     W_Shift_DR_out; 
wire [4:0] W_IR_out;
     
TAP_FSM fsm(  .TCK(TCK) ,
              .TMS(TMS),
              .Test_Logic_Reset_out(),
              .Run_Test_out(),
              .Select_DR_Scan_out(),
              .Select_IR_Scan_out(),
              .Capture_DR_out(W_Capture_DR_out),
              .Capture_IR_out(W_Capture_IR_out),
              .Shift_DR_out(W_Shift_DR_out),
              .Shift_IR_out(W_Shift_IR_out),
              .Exit1_DR_out(),
              .Exit1_IR_out(),
              .Exit2_DR_out(),
              .Exit2_IR_out(),
              .Pause_DR_out(),
              .Pause_IR_out(),
              .Update_DR_out(W_Update_DR_out),
              .Update_IR_out(W_Update_IR_out));   
              
Instrunction_reg dut( .TDI(TDI), 
                      .TCK(TCK),
                      .Shift_IR(W_Shift_IR_out),
                      .Capture_IR(W_Capture_IR_out), 
                      .Update_IR(W_Update_IR_out),
                      .IR_TDO(IR_S0),
                      .IR_OUT(W_IR_out));

Data_Reg data(.TDI(TDI),
              .tdr_select(w_tdr_select), 
              .TCK(TCK), 
              .Shift_DR(W_Shift_DR_out), 
              .Capture_DR(W_Capture_DR_out),
              .Update_DR(W_Update_DR_out),
              .DR_OUT(DR_S0));
              
IR_Decoder decoder(.IR_input(W_IR_out),.TDR_select(w_tdr_select));          

assign TDO = (W_Shift_IR_out && IR_S0) || ( W_Shift_DR_out && DR_S0);
endmodule
