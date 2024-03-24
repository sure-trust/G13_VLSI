module INSTRUCTION_REGISTER (CAPTURE_IR,UPDATE_IR,SHIFT_IR,TDI,TDO,TCK,IR_OUT);
parameter IR_LENGTH = 5;
input CAPTURE_IR,UPDATE_IR,SHIFT_IR;
input TDI, TCK;
output TDO;
output [IR_LENGTH-1: 0] IR_OUT;
reg [IR_LENGTH-1: 0] shift_reg, update_IR_reg;
always @(posedge TCK)
	begin
	if (CAPTURE_IR)
shift_reg <= {IR_LENGTH{1'b1}};
	else if (SHIFT_IR)
shift_reg <= {shift_reg[IR_LENGTH-2: 0],TDI}; 
	else if (UPDATE_IR)
update_IR_reg <= shift_reg;
	end
assign TDO= shift_reg [IR_LENGTH-1];
assign IR_OUT = update_IR_reg;
 endmodule
