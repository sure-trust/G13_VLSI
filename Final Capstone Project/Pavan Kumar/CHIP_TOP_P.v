module CHIP_TOP(input TCK,TMS,TDI,
                        output TDO);
  wire Capture_DR,Shift_DR,Update_DR,Capture_IR,Shift_IR,Update_IR;
  reg tdr_Select;
  wire [4:0]IR_out;

  TAP_FSM tap(.TCK(TCK),.TMS(TMS), .Test_Logic_Reset_out(), .Run_Test_Idle_out(), .Select_DR_Scan_out(), .Capture_DR_out(Capture_DR),.Shift_DR_out(Shift_DR),.Exit1_DR_out(),.Pause_DR_out(),.Exit2_DR_out(),.Update_DR_out(Update_DR),.Select_IR_Scan_out(),.Capture_IR_out(Capture_IR),.Shift_IR_out(Shift_IR),.Exit1_IR_out(), .Pause_IR_out(),.Exit2_IR_out(),.Update_IR_out(Update_IR));

 INSTRUCTION_REGISTER ir(.TCK(TCK),.TDI(TDI),.Capture_IR(Capture_IR),.Shift_IR(Shift_IR),.Update_IR(Update_IR),.IR_TDO(IR_SO));

  BYPASS_DR dr(.tdr_Select(tdr_Select),.TCK(TCK),.TDI(TDI),.Capture_DR(Capture_DR),.Shift_DR(Shift_DR),.Update_DR(Update_DR),.DR_TDO(SO_DR_OUT));

  
 IR_DECODER ird (.IR_input(IR_out),
				.tdr_Select(tdr_Select));
  
  
endmodule


