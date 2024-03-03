`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2024 09:22:22 AM
// Design Name: 
// Module Name: fsm_vending
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


module fsm_vending(input [2:0] in , input clk,arstn,output reg out);

parameter Idle=0,s1=1,s2=2,s3=3,s4=4;
reg [2:0] c_state,n_state;
reg count = 0;
 always @(posedge clk , negedge arstn)
    begin
        if(~arstn)  c_state<=Idle;
        else
            c_state<=n_state;
    end
    
 always @(*)
    begin
        case(c_state)
            Idle : begin
                    if(in == 3'b101)
                        n_state=Idle;
                    else if(in ==3'b001)
                        n_state = s1;
                    else if(in ==3'b010)
                        n_state = s2;
                    else
                        n_state = Idle;
                   end
            s1 :   begin
                    if(count == 3'b010) 
                        begin
                            n_state = Idle;
                            count = 0;
                        end
                    else if (in == 3'b001) 
                        begin
                            n_state = s1;
                            count = count +1;
                        end
                    else if (in == 3'b010)
                        n_state = s3;
                   end
            s2 : begin
                    if(in == 3'b010)
                        n_state = s4;
                    else if(in == 3'b001)
                        n_state = s3;
                 end
                 
            s3 : begin 
                    if(in == 3'b010) 
                        n_state = Idle;
                    
                 end
            s4 : begin
                    if(in == 3'b010) n_state = Idle;
                    else if(in == 3'b001) n_state = Idle;
                 end          
        endcase
    
    end
    
 always @(*)
    begin
       case(c_state)
         Idle : begin
                    if(in == 3'b101)
                        out = 1; 
                 end
         s1  :  begin
                  if(in == 3'b010)
                    out = 0;  
                end
         s2  :  begin
                  out = 0;  
                end      
         s3  :  begin
                  if (in == 3'b010)
                     out = 1;  
                  else 
                     out = 0;                  
                end 
         s4  :  begin
                  if(in == 3'b010 || in == 3'b001)
                    out = 1;
                    
                end
         default : out = 'hz; 
        endcase  
    end
endmodule
