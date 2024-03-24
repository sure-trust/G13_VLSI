module JTAG_interface(input TCK,TMS,TDI,output TDO);
  wire Capture_DR,Shift_DR,Update_DR,Capture_IR,Shift_IR,Update_IR;
  wire [4:0]IR_out;
  wire IR_s0,DR_s0;
  reg tdr_select;
  tap_fsm tap(.TCK(TCK),.TMS(TMS), .Test_Logic_Reset_out(), .Run_Test_Idle_out(), .Select_DR_Scan_out(), .Capture_DR_out(Capture_DR),.Shift_DR_out(Shift_DR),.Exit1_DR_out(),.Pause_DR_out(),.Exit2_DR_out(),.Update_DR_out(Update_DR),.Select_IR_Scan_out(),.Capture_IR_out(Capture_IR),.Shift_IR_out(Shift_IR),.Exit1_IR_out(), .Pause_IR_out(),.Exit2_IR_out(),.Update_IR_out(Update_IR));
  
 instruction_reg ir(.TCK(TCK),.TDI(TDI),.Capture_IR(Capture_IR),.Shift_IR(Shift_IR),.Update_IR(Update_IR),.IR_TDO(IR_s0),.IR_out(IR_out));
  
bypass dr(.tdr_select(tdr_select),.TCK(TCK),.TDI(TDI),.Capture_DR(Capture_DR),.Shift_DR(Shift_DR),.Update_DR(Update_DR),.DR_TDO(DR_s0));
  
    always@(IR_out)
begin
  case(IR_out)
		5'b11111: tdr_select=1'b1;     // goes to bypass register
		default: tdr_select= 1'b0;
    endcase
end

// IR decoder end


//TDO control box

  assign TDO=((Shift_IR && IR_s0) || (Shift_DR && DR_s0));
  
endmodule



module tap_fsm(input TCK,TMS, output reg Test_Logic_Reset_out,Run_Test_Idle_out,Select_DR_Scan_out,Capture_DR_out,Shift_DR_out,Exit1_DR_out,Pause_DR_out,Exit2_DR_out,Update_DR_out,Select_IR_Scan_out,Capture_IR_out,Shift_IR_out,Exit1_IR_out,Pause_IR_out,Exit2_IR_out,Update_IR_out);
  reg IR_s0,DR_s0;
  reg tdr_select;
  reg [4:0]IR_out;
reg [3:0]state,nxt_state;
  
  localparam Test_Logic_Reset=4'b0000, Run_Test_Idle=4'b0001, Select_DR_Scan=4'b0010,  Capture_DR=4'b0011, Shift_DR=4'b0100, Exit1_DR=4'b0101, Pause_DR=4'b0110, Exit2_DR=4'b0111, Update_DR=4'b1000, Select_IR_Scan=4'b1001, Capture_IR=4'b1010, Shift_IR=4'b1011, Exit1_IR=4'b1100, Pause_IR=4'b1101, Exit2_IR=4'b1110, Update_IR=4'b1111;
always@(posedge TCK)
begin
		state<= nxt_state  ;
end

  always @(TMS,state)
begin
	case(state)
		Test_Logic_Reset: nxt_state= TMS? Test_Logic_Reset: Run_Test_Idle;
		Run_Test_Idle: nxt_state= TMS? Select_DR_Scan: Run_Test_Idle;
		Select_DR_Scan: nxt_state= TMS? Select_IR_Scan: Capture_DR;
		Capture_DR: nxt_state= TMS? Exit1_DR: Shift_DR;
		Shift_DR: nxt_state= TMS? Exit1_DR: Shift_DR;
		Exit1_DR: nxt_state= TMS? Update_DR: Pause_DR;
		Pause_DR: nxt_state= TMS? Exit2_DR : Pause_DR;
		Exit2_DR: nxt_state= TMS? Update_DR : Shift_DR;
		Update_DR: nxt_state= TMS? Select_DR_Scan : Run_Test_Idle;
		Select_IR_Scan: nxt_state= TMS? Test_Logic_Reset: Capture_IR;
		Capture_IR: nxt_state= TMS? Exit1_IR: Shift_IR;
		Shift_IR: nxt_state= TMS? Exit1_IR: Shift_IR;
		Exit1_IR: nxt_state= TMS? Update_IR: Pause_IR;
		Pause_IR: nxt_state= TMS? Exit2_IR : Pause_IR;
		Exit2_IR: nxt_state= TMS? Update_IR : Shift_IR;
		Update_IR: nxt_state= TMS? Select_DR_Scan : Run_Test_Idle;
		default : nxt_state= Test_Logic_Reset;
	endcase
end
  
  /*assign Test_Logic_Reset_out=(state==Test_Logic_Reset_out)? 1'b1:1'b0;
  assign Run_Test_Idle_out=(state==Run_Test_Idle)? 1'b1:1'b0;
  assign Select_DR_Scan_out=(state==Select_DR_Scan)? 1'b1:1'b0;
  assign Capture_DR_out=(state==Capture_DR)? 1'b1:1'b0;
  assign Shift_DR_out=(state==Shift_DR)? 1'b1:1'b0;
  assign Exit1_DR_out=(state== Exit1_DR)? 1'b1:1'b0;
  assign Pause_DR_out=(state==Pause_DR)? 1'b1:1'b0;
  assign Exit2_DR_out=(state==Exit2_DR)? 1'b1:1'b0;
  assign Update_DR_out=(state==Update_DR)? 1'b1:1'b0;
  assign Select_IR_Scan_out=(state==Select_IR_Scan)? 1'b1:1'b0;
  assign Capture_IR_out=(state== Capture_IR)? 1'b1:1'b0;
  assign Shift_IR_out=(state==Shift_IR)? 1'b1:1'b0;
  assign Exit1_IR_out=(state==Exit1_IR)? 1'b1:1'b0;
  assign Pause_IR_out=(state==Pause_IR)? 1'b1:1'b0;
  assign Exit2_IR_out=(state==Exit2_IR)? 1'b1:1'b0;
  assign Update_IR_out=(state==Update_IR)? 1'b1:1'b0;
  
endmodule*/



always@ (state)
begin
	Test_Logic_Reset_out=0;
	Run_Test_Idle_out=0;
	Select_DR_Scan_out=0;
	Capture_DR_out=0;
	Shift_DR_out=0;
	Exit1_DR_out=0;
	Pause_DR_out=0;
	Exit2_DR_out=0;
	Update_DR_out=0;
	Select_IR_Scan_out=0;
	Capture_IR_out=0;
	Shift_IR_out=0;
	Exit1_IR_out=0;
	Pause_IR_out=0;
	Exit2_IR_out=0;
	Update_IR_out=0;

	case(state)
		Test_Logic_Reset: Test_Logic_Reset_out=1;
		Run_Test_Idle: Run_Test_Idle_out=1;
		Select_DR_Scan: Select_DR_Scan_out=1;
		Capture_DR: Capture_DR_out=1;
		Shift_DR: Shift_DR_out=1;
		Exit1_DR: Exit1_DR_out=1;
		Pause_DR: Pause_DR_out=1;
		Exit2_DR: Exit2_DR_out=1;
		Update_DR: Update_DR_out=1;
		Select_IR_Scan: Select_IR_Scan_out=1;
		Capture_IR: Capture_IR_out=1;
		Shift_IR: Shift_IR_out=1;
		Exit1_IR: Exit1_IR_out=1;
		Pause_IR: Pause_IR_out=1;
		Exit2_IR: Exit2_IR_out=1;
		Update_IR: Update_IR_out=1;
	endcase
end
endmodule



module instruction_reg(TCK,TDI,Capture_IR,Shift_IR,Update_IR,IR_TDO,IR_out);
  input TCK,TDI,Capture_IR,Shift_IR,Update_IR;
  output reg IR_TDO;
  localparam IR_length=5;
  output reg [IR_length-1:0]IR_out;
  reg [IR_length-1:0] Shift_reg_IR, Update_reg_IR;
  always @(posedge TCK)
    begin
      if(Capture_IR)
        Shift_reg_IR<= {IR_length{1'b1}};
      else if(Shift_IR)
        begin
          Shift_reg_IR<={ Shift_reg_IR[IR_length-2:0] ,TDI};
        end   
      else if(Update_IR)
        Update_reg_IR<=Shift_reg_IR;
    end
  //assign TDO=Shift_reg[IR_length-1];
  //assign IR_out= Update_reg;
  always@(posedge TCK)
    begin
      IR_TDO<=Shift_reg_IR[IR_length-1];
      IR_out<= Update_reg_IR;
    end
endmodule


module bypass(tdr_select,TCK,TDI,Capture_DR,Shift_DR,Update_DR,DR_TDO);//,DR_out);
  input tdr_select,TCK,TDI,Capture_DR,Shift_DR,Update_DR;
  output reg DR_TDO;
  parameter DR_length=1;
                //output reg [DR_length-1:0]DR_out;
  reg [DR_length-1:0] Shift_reg_DR, Update_reg_DR;
  always@(posedge TCK)
    begin
      if(tdr_select)
        begin
          if(Capture_DR)
            Shift_reg_DR<= {DR_length{1'b1}};
          else if(Shift_DR)
            Shift_reg_DR<={ Shift_reg_DR[DR_length-2:0] ,TDI}; 
          else if(Update_DR)
            Update_reg_DR<=Shift_reg_DR;
        end	
    end
  always@(posedge TCK)
    begin
      DR_TDO<=Shift_reg_DR[DR_length-1];
      //DR_out<= Update_reg;
    end
endmodule

