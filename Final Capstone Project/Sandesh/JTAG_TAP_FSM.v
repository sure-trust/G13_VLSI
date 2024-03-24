module TAP_FSM (
  input  TCK, TMS,                
  output reg  Test_Logic_Reset_out,      
  Run_Test_Idle_out,
  Select_DR_Scan_out,
  Capture_DR_out,
  Shift_DR_out,
  Exit1_DR_out,
  Pause_DR_out,
  Exit2_DR_out,
  Update_DR_out,
  Select_IR_Scan_out,
  Capture_IR_out,
  Shift_IR_out,
  Exit1_IR_out,
  Pause_IR_out,
  Exit2_IR_out,
  Update_IR_out);
      

localparam Test_Logic_Reset= 4'b0000,      
  Run_Test_Idle=4'b0001,
  Select_DR_Scan=4'b0010,
  Capture_DR=4'b0011,
  Shift_DR=4'b0100,
  Exit1_DR=4'b0101,
  Pause_DR=4'b0110,
  Exit2_DR=4'b0111,
  Update_DR=4'b1000,
  Select_IR_Scan=4'b1001,
  Capture_IR=4'b1010,
  Shift_IR=4'b1011,
  Exit1_IR=4'b1100,
  Pause_IR=4'b1101,
  Exit2_IR=4'b1110,
  Update_IR=4'b1111;
  
reg [3:0] tap_state, next_state;


always @(posedge TCK)  
  begin
    tap_state <= next_state;
  end

always @(tap_state, TMS)
begin
  case (tap_state)
  Test_Logic_Reset: next_state = TMS ? Test_Logic_Reset : Run_Test_Idle;
  Run_Test_Idle: next_state = TMS ? Select_DR_Scan :  Run_Test_Idle;
  Select_DR_Scan: next_state = TMS ? Select_IR_Scan : Capture_DR;
  Capture_DR: next_state = TMS ? Exit1_DR : Shift_DR;
  Shift_DR: next_state = TMS ? Exit1_DR : Shift_DR;
  Exit1_DR: next_state = TMS ? Update_DR : Pause_DR;			
  Pause_DR: next_state = TMS ? Exit2_DR : Pause_DR;
  Exit2_DR: next_state = TMS ? Update_DR : Shift_DR;			 
  Update_DR: next_state = TMS ? Select_DR_Scan : Run_Test_Idle;			 
  Select_IR_Scan: next_state = TMS ? Test_Logic_Reset : Capture_IR;
  Capture_IR: next_state = TMS ? Exit1_IR : Shift_IR;
  Shift_IR: next_state = TMS ? Exit1_IR : Shift_IR;
  Exit1_IR: next_state = TMS ? Update_IR : Pause_IR;
  Pause_IR: next_state = TMS ? Exit2_IR : Pause_IR;
  Exit2_IR: next_state = TMS ? Update_IR : Shift_IR;
  Update_IR: next_state = TMS ?Select_DR_Scan : Run_Test_Idle;
  default: next_state = Test_Logic_Reset;
  endcase
end

always @ (tap_state)
begin
  case (tap_state)
  Test_Logic_Reset:Test_Logic_Reset_out = (tap_state == Test_Logic_Reset)? 1'b1 : 1'b0; 
  Run_Test_Idle: Run_Test_Idle_out =(tap_state ==Run_Test_Idle )? 1'b1 : 1'b0;
  Select_DR_Scan:Select_DR_Scan_out =(tap_state ==Select_DR_Scan )? 1'b1 : 1'b0;
  Capture_DR:Capture_DR_out =(tap_state ==Capture_DR )? 1'b1 : 1'b0;
  Shift_DR:Shift_DR_out =(tap_state ==Shift_DR )? 1'b1 : 1'b0;
  Exit1_DR: Exit1_DR_out  = (tap_state == Exit1_DR)? 1'b1: 1'b0;			
  Pause_DR: Pause_DR_out = (tap_state == Pause_DR)? 1'b1: 1'b0;
  Exit2_DR: Exit2_DR_out = (tap_state == Exit2_DR)? 1'b1: 1'b0;		 
  Update_DR: Update_DR_out = (tap_state == Update_DR)? 1'b1: 1'b0;		 
  Select_IR_Scan:  Select_IR_Scan_out = (tap_state == Select_IR_Scan)? 1'b1: 1'b0;
  Capture_IR:Capture_IR_out  = (tap_state == Capture_IR)? 1'b1: 1'b0;
  Shift_IR:Shift_IR_out = (tap_state == Shift_IR)? 1'b1: 1'b0;
  Exit1_IR:Exit1_IR_out = (tap_state ==Exit1_IR)? 1'b1: 1'b0;
  Pause_IR: Pause_IR_out =  (tap_state== Pause_IR)? 1'b1: 1'b0;
  Exit2_IR: Exit2_IR_out = (tap_state == Exit2_IR)? 1'b1: 1'b0;
  Update_IR: Update_IR_out = (tap_state ==Update_IR)? 1'b1: 1'b0;
  endcase
end

endmodule


