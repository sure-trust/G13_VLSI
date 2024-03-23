module IR_Decoder(IR_out,tdr_Select);
input {4:0]IR_out;
output tdr_Select;

always @(IR_out)
begin
case(IR_out)
5'b11111: tdr_Select = 1;
default : tdr_Select = 0;
endcase
end
endmodule
