module mux_8x1(i,s,out); 
input [7:0]i; 
input [2:0]s; 
output reg out; 
always @(*) 
begin
    case(s) 
        3'd0:out=i[0]; 
        3'd1:out=i[1]; 
        3'd2:out=i[2]; 
        3'd3:out=i[3]; 
        3'd4:out=i[4]; 
        3'd5:out=i[5]; 
        3'd6:out=i[6]; 
        3'd7:out=i[7];
		default:out=3'b000;
    endcase 
	end
endmodule 
