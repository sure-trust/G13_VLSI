`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/29/2024 08:38:42 PM
// Design Name: 
// Module Name: Fsm111
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


module Fsm(input w,clk,arstn,output reg q);
parameter s0=2'b00,s1=2'b01,s2=2'b10,s3=2'b11;
reg [1:0] c_state,n_state;

always @(posedge clk,negedge arstn)
    begin
        if(~arstn) c_state<=s0;
        else 
            c_state<=n_state;
    end

always @(*)
    begin
        case(c_state)
            s0: n_state=w?s1:s0;
            s1: n_state=w?s2:s0;
            s2: n_state=w?s3:s0;
            s3: n_state=w?s1:s0; 
         endcase  
    end
    
    
 always @(c_state)
    begin
        case(c_state)
           s0:q=0;
           s1:q=0;
           s2:q=0;
           s3:q=1;
        endcase
    end
    
 
endmodule

