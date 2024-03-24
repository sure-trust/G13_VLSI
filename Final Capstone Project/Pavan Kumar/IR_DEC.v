module IR_DECODER  (IR_input,tdr_Select);
parameter IR_Inputs = 5;

input [IR_Inputs-1:0] IR_input;
output reg tdr_Select;
always @(IR_input)
    begin
        case(IR_input)  
           5'b11111 : tdr_Select =1'b1;  
           default : tdr_Select = 1'h0;
        endcase
    end
endmodule

