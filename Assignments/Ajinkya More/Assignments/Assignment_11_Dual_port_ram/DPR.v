`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/09/2024 11:20:21 PM
// Design Name: 
// Module Name: DPR
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



module DPR #(parameter Depth = 16,Width = 8)(clkA,clkB,arstnA,arstnB,addA,addB,WenA,WenB,RenA,RenB,dinA,dinB,q_outA,q_outB);

 input clkA,clkB,WenA,WenB,RenA,RenB,arstnA,arstnB;

 input [Width-1:0]dinA,dinB;

 reg [Width-1:0] mem[Depth-1:0];

 input [3:0]addA,addB;

 output reg [Width-1:0]q_outA,q_outB;

 always @(posedge clkA, negedge arstnA)
        begin
                 if(~arstnA)
                         begin
                                 mem[addA]<=0;
                         end
                 else if(WenA && (RenA==0))
                            begin
                                mem[addA]=dinA;
                            end
                 else if((WenA==0)&&RenA)
                            begin
                                q_outA=mem[addA];
                            end
                 else
                        begin
                            q_outA='hz;
                        end
       end

 always @(posedge clkB, negedge arstnB)
       begin
                 if(~arstnB)
                         begin
                                 mem[addB]<=0;
                         end
                 else if(WenB && (RenB==0))
                            begin
                                mem[addB]=dinB;
                            end
                 else if((WenB==0)&&RenB)
                            begin
                                q_outB=mem[addB];
                            end
                 else
                        begin
                            q_outB='hz;
                        end
       end
endmodule    