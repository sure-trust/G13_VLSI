`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2024 06:44:45 PM
// Design Name: 
// Module Name: Data_Reg
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


module Data_Reg #(parameter DR_Length = 5) (input TDI ,tdr_select, TCK , Shift_DR , Capture_DR , Update_DR , output  TDO , output [DR_Length-1:0] DR_OUT);

reg [DR_Length-1:0] Shift_reg,Update_DR_reg;

always @(posedge TCK)
    begin
       if(tdr_select)
       begin
         if(Capture_DR)
            begin
                Shift_reg <= {DR_Length{1'b1}};
            end
        else if(Shift_DR)  
            begin
               Shift_reg<={ Shift_reg[DR_Length-2:0] ,TDI}; 
            end  
        else if(Update_DR)
            begin
                Update_DR_reg <= Shift_reg;
            end        
        end
    end
 assign TDO = Shift_reg[4];
 assign DR_OUT = Update_DR_reg;
endmodule


/*
module data_reg(tdr_select,TCK,TDI,Capture_DR,Shift_DR,Update_DR,TDO,DR_out);
  input tdr_select,TCK,TDI,Capture_DR,Shift_DR,Update_DR;
  output TDO;
  parameter DR_length=5;
  output [DR_length-1:0]DR_out;
  reg [DR_length-1:0] Shift_reg, Update_reg;
  always @(posedge TCK)
    begin
      if(tdr_select)
        begin
          if(Capture_DR)
            Shift_reg<= {DR_length{1'b1}};
          else if(Shift_DR)
            Shift_reg<={ Shift_reg[DR_length-2:0] ,TDI}; 
          else if(Update_DR)
            Update_reg<=Shift_reg;
        end	
    end
  assign TDO=Shift_reg[0];
  assign DR_out= Update_reg;
endmodule


*/