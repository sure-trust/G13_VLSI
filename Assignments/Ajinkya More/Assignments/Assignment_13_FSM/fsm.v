`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/23/2024 09:41:24 PM
// Design Name: 
// Module Name: fsm
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


/*module fsm(input arstn , in ,clk,output reg [2:0] out);
reg [2:0] c_state,n_state;
parameter s0=0,s1=1,s2=2,s3=3,s4=4,s5=5,s6=6,s7=7;
always @(posedge clk , negedge arstn)
    begin
        if(~arstn)    c_state<=0;
        else
            c_state<=n_state;
    end
    
 always @(*)
    begin
        case(c_state)
            3'd0 : begin
                     if(in) n_state = s1;
                     else
                        n_state = s2;
                   end
                   
           3'd1 : begin
                     if(in) n_state = s3;
                     else
                        n_state = s2;
                   end
                   
           3'd2 : begin
                     if(in) n_state = s3;
                     else
                        n_state = s4;
                   end 
           3'd3 : begin
                     if(in) n_state = s5;
                     else
                        n_state = s4;
                   end 
           3'd4 : begin
                     if(in) n_state = s5;
                     else
                        n_state = s6;
                   end              
          3'd5 : begin
                     if(in) n_state = s7;
                     else
                        n_state = s6;
                   end        
          3'd6 : begin
                     if(in) n_state = s7;
                     else
                        n_state = s0;
                   end         
          3'd7 : begin
                     if(in) n_state = s0;
                     else
                        n_state = s2;
                   end
          default : n_state = s0;        
        endcase           
    end
  always @(c_state)
    begin
        case(c_state)
            3'd0 : out = 0;
            3'd1 : out = 1;
            3'd2 : out = 2;
            3'd3 : out = 3;
            3'd4 : out = 4;
            3'd5 : out = 5;
            3'd6 : out = 6;
            3'd7 : out = 7;
            default : out = 'hz;
        endcase
    end
endmodule*/


module fsm(clk,oe,rst,out);
input clk,oe,rst;
output reg [2:0]out;
localparam s0=3'b000,s1=3'b001,s2=3'b010,s3=3'b011,s4=3'b100,s5=3'b101,s6=3'b110,s7=3'b111;
reg [2:0]state,nxt_state;
always @(posedge clk , posedge rst)
begin
	if (rst)
	begin
		state<= s0;
                
	end
	else 
		state<= nxt_state;
end

always@ (state)
begin
	case(state)
		s0: nxt_state=oe?s1:s2;
		s1: nxt_state=oe?s3:s2;
		s2: nxt_state=oe?s3:s4;
		s3: nxt_state=oe?s5:s4;
		s4: nxt_state=oe?s5:s6;
		s5: nxt_state=oe?s7:s6;
		s6: nxt_state=oe?s7:s0;
		s7: nxt_state=oe?s0:s2;
	endcase
end

always@(state)
begin
	case(state)
		s0: out=0;
		s1: out=1;
		s2: out=2;
		s3: out=3;
		s4: out=4;
		s5: out=5;
		s6: out=6;
		s7: out=7;
	endcase
end
endmodule
