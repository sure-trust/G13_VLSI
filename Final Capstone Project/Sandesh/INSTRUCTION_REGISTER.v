module INSTRUCTION_REGISTER(
Update_IR,
Capture_IR,
Shift_IR,
TDI,
TDO,
IR_OUT,
TCK);

parameter IR_LENGTH = 5;

input Update_IR, Capture_IR, Shift_IR;
input TDI, TCK;
output TDO;
  output [IR_LENGTH-1 : 0] IR_OUT;

reg [IR_LENGTH-1 : 0] shift_reg, update_reg;

always @ (posedge TCK)
	begin
		if (Capture_IR)
			shift_reg <= {IR_LENGTH{1'b1}};
		else if (Shift_IR)
			shift_reg <= {shift_reg[IR_LENGTH-2 : 0], TDI};
		else if (Update_IR)
			update_reg <= shift_reg;
		end

assign TDO = shift_reg[IR_LENGTH-1];
assign IR_OUT = update_reg;

endmodule
