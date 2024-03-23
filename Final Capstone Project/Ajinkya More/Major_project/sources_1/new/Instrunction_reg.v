`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2024 08:04:03 AM
// Design Name: 
// Module Name: Instrunction_reg
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


module Instrunction_reg #(parameter IR_Length = 5) (input TDI , TCK , Shift_IR , Capture_IR , Update_IR , output  TDO , output [IR_Length-1:0] IR_OUT);

reg [IR_Length-1:0] Shift_reg,Update_IR_reg;

always @(posedge TCK)
    begin
        if(Capture_IR)
            begin
                Shift_reg <= {IR_Length{1'b1}};
            end
        else if(Shift_IR)  
            begin
              // Shift_reg[0] <= TDI; 
              Shift_reg  <= {Shift_reg[IR_Length-2:0],TDI};
             //  Shift_reg <= Shift_reg << 1;
            end  
        else if(Update_IR)
            begin
                Update_IR_reg <= Shift_reg;
            end        
    end
 assign TDO = Shift_reg[4];
 assign IR_OUT = Update_IR_reg;
endmodule
