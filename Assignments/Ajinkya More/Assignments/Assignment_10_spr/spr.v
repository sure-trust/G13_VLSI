`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/11/2024 07:35:03 PM
// Design Name: 
// Module Name: spr
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


module spr(clk,D,A,Wen,Q);         
 input clk;
 input Wen;
 input [7:0]D;
 input [3:0]A;
 output reg [7:0]Q;

 reg [7:0] memory[15:0];                                                                             
  always @(posedge clk)
  begin                                                                                              
         if(Wen)
             begin                                                                        
                Q<=memory[A];                                                              
             end                                                                                
         else
            begin
               memory[A]<=D;                                                              
             end                   
  end                                
  endmodule           
