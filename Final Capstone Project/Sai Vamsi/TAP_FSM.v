
module TAP_FSM(input TRST,TCLK,TMS,
   output Run_Test_Idle_out,
	Test_Logic_Reset_out,
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
   reg[3:0]state,nxt_state;
localparam Test_Logic_Reset=4'd0;
localparam Run_Test_Idle=4'd1;
localparam Select_DR_Scan=4'd2;
localparam Capture_DR=4'd3;
localparam Shift_DR=4'd4;
localparam Exit1_DR=4'd5;
localparam Pause_DR=4'd6;
localparam Exit2_DR=4'd7;
localparam Update_DR=4'd8;
localparam Select_IR_Scan=4'd9;
localparam Capture_IR=4'd10;
localparam Shift_IR=4'd11;
localparam Exit1_IR=4'd12;
localparam Pause_IR=4'd13;
localparam Exit2_IR=4'd14;
localparam Update_IR=4'd15;

always @(posedge TCLK or negedge TRST)
begin
if(!TRST)
	state <= Test_Logic_Reset;
else
	state <= nxt_state;
end

always @(state,TMS)
begin
case(state)
	Test_Logic_Reset:begin
						if(TMS==1)
							state <= Test_Logic_Reset;
						else
							state <= Run_Test_Idle;
					end
                 
	Run_Test_Idle:begin
      if(TMS==1)
        state <= Select_IR_Scan;
					else
						state <= Run_Test_Idle;
    end
	Select_DR_Scan:begin
      if(TMS==1)
						state <=Select_IR_Scan;
					else
						state <= Capture_IR;
    end
	Capture_DR:begin
      if(TMS==1)
						state <= Exit1_DR;
					else
						state <= Shift_DR;
	end

	Shift_DR:begin
      if(TMS==1)
					state <= Exit1_DR;
				else
					state <= Shift_DR;
	end

	Exit1_DR:begin
      if(TMS==1)
					state <= Update_DR;
				else
				state <= Pause_DR;
	end

	Pause_DR:begin
      if(TMS==1)
			state <= Exit1_DR;
				else
			state <= Pause_DR;
	end

	Exit2_DR:begin
      if(TMS==1)
					state <= Update_DR;
				else
					state <= Shift_DR;
	end

	Update_DR:begin
      if(TMS==1)
					state <= Select_DR_Scan;
				else
					state <= Run_Test_Idle;
    end

	Select_IR_Scan:begin
      if(TMS==1)
					state <= Test_Logic_Reset;
				else
					state <= Capture_IR;
	end

	Capture_IR:begin
      if(TMS==1)
					state <= Exit1_IR;
				else
					state <= Shift_IR;
	end

	Shift_IR:begin
      if(TMS==1)
					state <= Exit1_IR;
				else
					state <= Shift_IR;
	end

	Exit1_IR:begin
      if(TMS==1)
					state <= Update_IR;
				else
					state <= Pause_IR;
	end

	Pause_IR:begin
      if(TMS==1)
					state <= Exit1_IR;
				else
					state <= Pause_IR;
	end

	Exit2_IR:begin
      if(TMS==1)
					state <= Update_IR;
	else
					state <= Shift_IR;
	end

	Update_IR:begin
      if(TMS==1)
					state <= Select_DR_Scan;
				else
					state <= Run_Test_Idle;
				end
       default:nxt_state<=Test_Logic_Reset;
      endcase
 
    end

  assign Test_Logic_Reset_out=(state==Test_Logic_Reset)?1'b1:1'b0;
  assign Run_Test_Idle_out=(state==Run_Test_Idle)?1'b1:1'b0;
  assign Select_DR_Scan_out=(state==Select_DR_Scan)?1'b1:1'b0;
  assign Capture_DR_out=(state==Capture_DR)?1'b1:1'b0;
  assign Shift_DR_out=(state==Shift_DR)?1'b1:1'b0;
  assign Exit1_DR_out=(state==Exit1_DR)?1'b1:1'b0;
  assign Pause_DR_out=(state==Pause_DR)?1'b1:1'b0;
  assign Exit2_DR_out=(state==Exit2_DR)?1'b1:1'b0;
  assign Update_DR_out=(state==Update_DR)?1'b1:1'b0;
  assign Select_IR_Scan_out=(state==Select_IR_Scan)?1'b1:1'b0;
  assign Capture_IR_out=(state==Capture_IR)?1'b1:1'b0;
  assign Shift_IR_out=(state==Shift_IR)?1'b1:1'b0;
  assign Exit1_IR_out=(state==Exit1_IR)?1'b1:1'b0;
  assign Pause_IR_out=(state==Pause_IR)?1'b1:1'b0;
  assign Exit2_IR_out=(state==Exit2_IR)?1'b1:1'b0;
  assign Update_IR_out=(state==Update_IR)?1'b1:1'b0;

endmodule 
