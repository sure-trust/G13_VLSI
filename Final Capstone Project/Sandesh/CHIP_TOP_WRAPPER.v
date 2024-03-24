module Chip_Top_Wrapper(TCK,TMS,TDI, TDO);
input TCK,TMS,TDI;
output TDO;

wire W_tdr_Select,
	 W_SO_DR_OUT,
	 W_SO_IR_OUT;

wire W_Capture_IR_out,
   	 W_Shift_IR_out,
     W_Update_IR_out,
	 W_Capture_DR_out,
	 W_Shift_DR_out,
	 W_Update_DR_out;
wire [4:0] W_IR_out;
     
TAP_FSM fsm(  .TCK(TCK) ,
              .TMS(TMS),
              .Test_Logic_Reset_out(),
              .Run_Test_out(),
              .Select_DR_Scan_out(),
              .Select_IR_Scan_out(),
              .Capture_DR_out(W_Capture_DR_out),
              .Capture_IR_out(W_Capture_IR_out),
              .Shift_DR_out(W_Shift_DR_out),
              .Shift_IR_out(W_Shift_IR_out),
              .Exit1_DR_out(),
              .Exit1_IR_out(),
              .Exit2_DR_out(),
              .Exit2_IR_out(),
              .Pause_DR_out(),
              .Pause_IR_out(),
              .Update_DR_out(W_Update_DR_out),
              .Update_IR_out(W_Update_IR_out));   
              
INSTRUCTION_REGISTER ir( .TDI(TDI), 
                      .TCK(TCK),
                      .Shift_IR(W_Shift_IR_out),
                      .Capture_IR(W_Capture_IR_out), 
                      .Update_IR(W_Update_IR_out),
                      .SO_IR_OUT(W_SO_IR_OUT),
                      .IR_OUT(W_IR_out));

IR_DECODER ird (.IR_input(W_IR_out),
				.tdr_Select(W_tdr_Select));

				
Bypass_DR byp(.TDI(TDI),
              .tdr_Select(W_tdr_Select), 
              .TCK(TCK), 
              .Shift_DR(W_Shift_DR_out), 
              .Capture_DR(W_Capture_DR_out),
              .Update_DR(W_Update_DR_out),
              .SO_DR_OUT(W_SO_DR_OUT));
              
TDO_CONTROL_BOX tcb (.Shift_IR(W_Shift_IR),
					 .Shift_DR(W_Shift_DR),
					 .SO_DR_OUT(W_SO_DR_OUT),
					 .SO_IR_OUT(W_SO_IR_OUT),
					 .TDO(TDO));

 
endmodule
