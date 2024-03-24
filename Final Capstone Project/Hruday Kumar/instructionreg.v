module Instrunction_reg (
    input TDI, TCK, Shift_IR, Capture_IR, Update_IR,
    output TDO,
    output [4:0] IR_OUT
);

reg [4:0] Instrunction_IR_reg;
reg [4:0] Update_IR_reg;

always @(posedge TCK) begin
    case ({Capture_IR, Shift_IR, Update_IR})
        3'b100: Instrunction_IR_reg <= 5'b11111;
        3'b010: Instrunction_IR_reg <= {TDI, Instrunction_IR_reg[3:0]};
        3'b001: Update_IR_reg <= Instrunction_IR_reg;
        default: begin end
    endcase
end

assign TDO = Instrunction_IR_reg[0];
assign IR_OUT = Update_IR_reg;

endmodule
