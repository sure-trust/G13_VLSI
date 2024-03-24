module IR_Decoder #(parameter IR_Inputs = 5 ) (input [IR_Inputs-1:0] IR_input , output reg TDR_select);
     always @(IR_input)
    begin
        case(IR_input)
          // 5'b00000 : tdr_select =1'b1;  
           5'b11111 : TDR_select =1'b1;  
           default : TDR_select = 'h0;
        endcase
    end
endmodule
