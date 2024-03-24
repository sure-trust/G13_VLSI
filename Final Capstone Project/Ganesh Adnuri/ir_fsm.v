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


module DATA_REGISTER (TDR_SELECT,CAPTURE_DR,UPDATE_DR,SHIFT_DR,TDI,TDO,TCK,DR_OUT);
 parameter DR_LENGTH = 31;
 input CAPTURE_DR,UPDATE_DR,SHIFT_DR;
 input TDR_SELECT, TDI, TCK;
 output TDO;
 output [DR_LENGTH-1: 0] DR_OUT;
 reg [DR_LENGTH-1: 0] shift_reg, update_DR_reg;
 always @(posedge TCK)
     begin
     if(TDR_SELECT)
     begin
 if (CAPTURE_DR)
 shift_reg <= {DR_LENGTH{1'b1}};
         else if (SHIFT_DR)
 shift_reg <= {shift_reg[DR_LENGTH-2: 0],TDI}; 
         else if (UPDATE_DR)
 update_DR_reg <= shift_reg;
         end
     end
 assign TDO= shift_reg [DR_LENGTH-1];
 assign DR_OUT = update_DR_reg;
  endmodule
  

