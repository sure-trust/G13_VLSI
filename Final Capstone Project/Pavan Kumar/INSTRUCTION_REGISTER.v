module INSTRUCTION_REGISTER(
UpdateIR,
CaptureIR,
ShiftIR,
TDI,
TDO,
IR_OUT,
TCK);

localparam IR_LENGTH = 5;
//input and output varialbes declaring
input UpdateIR, CaptureIR, ShiftIR;
input TDI, TCK;
output TDO;
  output [IR_LENGTH-1 : 0] IR_OUT;

reg [IR_LENGTH-1 : 0] shift_reg, update_reg;

always @ (posedge TCK)
	begin
		if (CaptureIR)
			shift_reg <= {IR_LENGTH{1'b1}};
		else if (ShiftIR)
			shift_reg <= {shift_reg[IR_LENGTH-2 : 0], TDI};
		else if (UpdateIR)
			update_reg <= shift_reg;
		end

assign TDO = shift_reg[IR_LENGTH-1];
assign IR_OUT = update_reg;

endmodule
