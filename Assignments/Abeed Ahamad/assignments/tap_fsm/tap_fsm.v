module TAP_FSM(
  input TMS,TCLK,TMS
  output Test_Logic_Reset_out,
  Run_Test_out,
   Select_DR_Scan_out,
   Capture_DR_out,
   Shift_DR_out,
   Exitl_DR_out,
   Pause_DR_out,
   Exit2_DR_out,
   Update_DR_out,
   Select_IR_out,
   Capture_IR_out,
   Shift_IR_out,
   Exitl_IR_out,
   Pause_IR_out,
   Exit2_IR_out,
   Update_IR_out);
  reg[3:0] tap_state,next_state;
  
localparam Test_Logic_Reset=4'b0000;
localparam Run_Test=4'b0001;
localparam Select_DR_Scan=4'b0010;
localparam Capture_DR=4'b0011;
localparam Shift_DR=4'b0100;
localparam Exitl_DR=4'b0101;
localparam Pause_DR=4'b0110;
localparam Exit2_DR=4'b0111;
localparam Update_DR=4'b1000;
localparam Select_IR_Scan=4'b1001;
localparam Capture_IR=4'b1010;
localparam Shift_IR=4'b1011;
localparam Exitl_IR=4'b1100;
localparam Pause_IR=4'b1101;
localparam Exit2_IR=4'b1110;
localparam Update_IR=4'b1111;
  always @(tap_state,TMS)
    begin
      case(tap_state)//state assginment
      
      Test_Logic_Reset:begin
        if(TMS==1)
          next_state=Test_Logic_Reset;
        else
          next_state=Select_IR_Scan;
      end


       Run_Test:begin
        if(TMS==1)
          next_state=Select_DR_Scan;
        else
          next_state=Run_Test;
      end


       Select_DR_Scan:begin
        if(TMS==1)
          next_state=Select_IR_Scan;
        else
          next_state=Capture_DR;
      end


      Capture_DR:begin
        if(TMS==1)
          next_state=Exitl_DR;
        else
          next_state=Shift_DR;
      end


      Shift_DR:begin
        if(TMS==1)
          next_state=Exitl_DR;
        else
          next_state=Shift_DR;
      end


      Exitl_DR:begin
        if(TMS==1)
          next_state=Update_DR;
        else
          next_state=Pause_DR;
      end


      Pause_DR:begin
        if(TMS==1)
          next_state=Exit2_DR;
        else
          next_state=Pause_DR;
      end


      Exit2_DR:begin
        if(TMS==1)
          next_state=Update_DR;
        else
          next_state=Shift_DR;
      end


      Update_DR:begin
        if(TMS==1)
          next_state=Select_DR_Scan;
        else
          next_state=Run_Test;
      end


      Select_IR_Scan:begin
        if(TMS==1)
          next_state=Test_Logic_Reset;
        else
          next_state=Capture_IR;
      end

      Capture_IR:begin
        if(TMS==1)
          next_state=Exitl_IR;
        else
          next_state=Shift_IR;
      end


        Shift_IR:begin
        if(TMS==1)
          next_state=Exitl_IR;
        else
          next_state=Shift_IR;
      end


       Exitl_IR:begin
        if(TMS==1)
          next_state=Update_IR;
        else
          next_state= Pause_IR;
      end


        Pause_IR:begin
        if(TMS==1)
          next_state=Exit2_IR;
        else
          next_state=Pause_IR;
      end

      
       Exit2_IR:begin
        if(TMS==1)
          next_state=Update_IR;
        else
          next_state=Shift_IR;
      end


        Update_IR:begin
        if(TMS==1)
          next_state=Run_Test;
        else
          next_state=Run_Test;
      end
        endcase
      end

        assign Test_Logic_Reset_out=(TMS==Test_Logic_Reset_out)? 1'b1:1'b0;
        assign Run_Test_out=(TMS==Run_Test)? 1'b1:1'b0;
        assign Select_DR_Scan_out=(TMS==Select_DR_Scan)? 1'b1:1'b0;
        assign Capture_DR_out=(TMS==Capture_DR)? 1'b1:1'b0;
        assign Shift_DR_out=(TMS==Shift_DR)? 1'b1:1'b0;
        assign Exitl_DR_out=(TMS== Exitl_DR)? 1'b1:1'b0;
        assign Pause_DR_out=(TMS==Pause_DR)? 1'b1:1'b0;
        assign Exit2_DR_out=(TMS==Exit2_DR)? 1'b1:1'b0;
        assign Update_DR_out=(TMS==Update_DR)? 1'b1:1'b0;
        assign Select_IR_Scan_out=(TMS==Select_IR_Scan)? 1'b1:1'b0;
        assign  Capture_IR_out=(TMS== Capture_IR)? 1'b1:1'b0;
        assign Shift_IR_out=(TMS==Shift_IR)? 1'b1:1'b0;
        assign Exitl_IR_out=(TMS==Exitl_IR)? 1'b1:1'b0;
        assign Pause_IR_out=(TMS==Pause_IR)? 1'b1:1'b0;
        assign Exit2_IR_out=(TMS==Exit2_IR)? 1'b1:1'b0;
        assign Update_IR_out=(TMS==Update_IR)? 1'b1:1'b0;
        endmodule
