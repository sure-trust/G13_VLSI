`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2024 07:19:25 AM
// Design Name: 
// Module Name: odd_parity
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


module odd_parity(clk,in,arstn,out);
input clk,arstn,in;
output reg out;

localparam s0=3'b000,s1=3'b001,s2=3'b010,s3=3'b011,s4=3'b100,s5=3'b101,s6=3'b110;

reg [2:0] c_state,n_state;

always @(posedge clk , negedge arstn)
    begin
        if(~arstn)
            c_state<=s0;
        else
            c_state<=n_state;
    end
    
 always @(*)
    begin
        case(c_state)
            s0 : n_state = in ? s2:s1;
            s1 : n_state = in ? s4:s3;
            s2 : n_state = in ? s4:s3; 
            s3 : n_state = in ? s5:s6;
            s4 : n_state = in ? s6:s5;
            s5 : n_state = in ? s0:s0;
            s6 : n_state = in ? s0:s0;  
        endcase
    end
 
 always  @(c_state)
    begin
        case(c_state)
            s0 : out = 0;
            s1 : out = 0;
            s2 : out = 0;
            s3 : out = 0;
            s4 : out = 0;
            s5 : out = 0;
            s6 : out = 1; 
            default : out = 'hz;   
        endcase
    end
endmodule
