module TAP_FSM_tb;
    reg TCK;
    reg TMS;
    wire Test_Logic_Reset_out, Run_Test_Idle_out, Select_DR_Scan_out, Capture_DR_out, Shift_DR_out, Exit1_DR_out, Pause_DR_out, Exit2_DR_out, Update_DR_out, Select_IR_Scan_out, Capture_IR_out, Shift_IR_out, Exit1_IR_out, Pause_IR_out, Exit2_IR_out, Update_IR_out;

    TAP_FSM fsm (
        .TCK(TCK),
        .TMS(TMS),
        .Test_Logic_Reset_out(Test_Logic_Reset_out),
        .Run_Test_Idle_out(Run_Test_Idle_out),
        .Select_DR_Scan_out(Select_DR_Scan_out),
        .Capture_DR_out(Capture_DR_out),
        .Shift_DR_out(Shift_DR_out),
        .Exit1_DR_out(Exit1_DR_out),
        .Pause_DR_out(Pause_DR_out),
        .Exit2_DR_out(Exit2_DR_out),
        .Update_DR_out(Update_DR_out),
        .Select_IR_Scan_out(Select_IR_Scan_out),
        .Capture_IR_out(Capture_IR_out),
        .Shift_IR_out(Shift_IR_out),
        .Exit1_IR_out(Exit1_IR_out),
        .Pause_IR_out(Pause_IR_out),
        .Exit2_IR_out(Exit2_IR_out),
        .Update_IR_out(Update_IR_out)
    );
  
  always
	begin
		TCK = 0;
		#10;
		TCK = 1;
		#10;
	end

  
    initial 
    begin
    @(posedge TCK) TMS=0;   
	#10;
	@(posedge TCK) TMS=1;
	#10;
    @(posedge TCK) TMS=1;
    #10;
    @(posedge TCK) TMS=0;
    #10;
    @(posedge TCK) TMS=0;
    #10;
    @(posedge TCK) TMS=1;
    #10;
    @(posedge TCK) TMS=1;
    #10;
    @(posedge TCK) TMS=1;
    #10;
    @(posedge TCK) TMS=1;
    #10;
    @(posedge TCK) TMS=0;
    #10;
    @(posedge TCK) TMS=0;  
    #10;
    @(posedge TCK) TMS=1;
    #10;
    @(posedge TCK) TMS=1;
    #10;
    @(posedge TCK) TMS=1;
    #10;
    @(posedge TCK) TMS=0;
    #10;
    @(posedge TCK) TMS=0;   
    #10; 
    @(posedge TCK) TMS=1;
    #10;
    @(posedge TCK) TMS=1;
    #10;
    @(posedge TCK) TMS=1;
    #10;
    @(posedge TCK) TMS=1;
    #10;
    @(posedge TCK) TMS=1;
    #10;
    $finish;
    end

  initial
    begin
      $dumpfile("dump.vcd"); $dumpvars;
    end
endmodule

