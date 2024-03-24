`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/23/2024 09:51:54 PM
// Design Name: 
// Module Name: IR_Decoder
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



module IR_Decoder #(parameter IR_Inputs = 5 ) (input [IR_Inputs-1:0] IR_input , output reg TDR_select);
     always @(IR_input)
    begin
        case(IR_input)
          // 5'b00000 : tdr_select =1'b1;  
           5'b11111 : TDR_select =1'b1;  
           default : TDR_select = 'h0;
        endcase
    end
endmodule
