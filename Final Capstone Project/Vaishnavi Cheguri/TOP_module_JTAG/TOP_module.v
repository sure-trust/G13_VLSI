module TOP_module(input TCK,TMS,TDI,
                  output TDO);
  wire Capture_DR,Shift_DR,Update_DR,Capture_IR,Shift_IR,Update_IR;
  wire [4:0]IR_out;
  wire IR_s0,DR_s0;
  reg TDR_select;
  TAPFSM tap(.TCK(TCK),.TMS(TMS), .Test_Logic_Reset_out(), .Run_Test_Idle_out(), .Select_DR_Scan_out(), .Capture_DR_out(Capture_DR),.Shift_DR_out(Shift_DR),.Exit1_DR_out(),.Pause_DR_out(),.Exit2_DR_out(),.Update_DR_out(Update_DR),.Select_IR_Scan_out(),.Capture_IR_out(Capture_IR),.Shift_IR_out(Shift_IR),.Exit1_IR_out(), .Pause_IR_out(),.Exit2_IR_out(),.Update_IR_out(Update_IR));
  
 IR IR(.TCK(TCK),.TDI(TDI),.Capture_IR(Capture_IR),.Shift_IR(Shift_IR),.Update_IR(Update_IR),.IR_TDO(IR_s0),.IR_out(IR_out));
  
  Bypass DR(.TDR_select(TDR_select),.TCK(TCK),.TDI(TDI),.Capture_DR(Capture_DR),.Shift_DR(Shift_DR),.Update_DR(Update_DR),.DR_TDO(DR_s0));
  
    always@(IR_out)
begin
  case(IR_out)
		5'b11111: TDR_select=1'b1;  
		default: TDR_select= 1'b0;
    endcase
end



//TDO control box

  assign TDO=((Shift_IR && IR_s0) || (Shift_DR && DR_s0));
  
endmodule


module TAP_FSM(input TCK,TRST,TMS,output reg Test_Logic_Reset_out,Run_Test_out,Select_DR_Scan_out,Capture_DR_out,Shift_DR_out,Exit1_DR_out,Pause_DR_out,Exit2_DR_out,Update_DR_out,Select_IR_Scan_out,Capture_IR_out,Shift_IR_out,Exit1_IR_out,Pause_IR_out,Exit2_IR_out,Update_IR_out);

localparam Test_Logic_Reset = 4'b0000, 
           Run_Test = 4'b0001,
           Select_DR_Scan = 4'b0010,
           Capture_DR = 4'b0011,
           Shift_DR = 4'b0100,
           Exit1_DR = 4'b0101,
           Pause_DR = 4'b0110,
           Exit2_DR = 4'b0111,
           Update_DR = 4'b1000,
           Select_IR_Scan = 4'b1001,
           Capture_IR = 4'b1010,
           Shift_IR = 4'b1011,
           Exit1_IR = 4'b1100,
           Pause_IR = 4'b1101,
           Exit2_IR = 4'b1110,
           Update_IR = 4'b1111;

  reg [3:0] pres_state,next_state;

  always @(posedge TCK, negedge TRST)
beginy
    if (!TRST)
	
        	pres_state <= Test_Logic_Reset;
			next_state <= Test_Logic_Reset;
	  
	   else
        	pres_state <= next_state;
end
  
  always @(pres_state or TMS) begin
    case (pres_state)
        Test_Logic_Reset: begin
            next_state = TMS ? Test_Logic_Reset : Run_Test;
        end
        Run_Test: begin
            next_state = TMS ? Select_DR_Scan : Run_Test;
        end
        Select_DR_Scan: begin
            next_state = TMS ? Select_IR_Scan : Capture_DR;
        end
        Capture_DR: begin
            next_state = TMS ? Exit1_DR : Shift_DR;
        end
        Shift_DR: begin
            next_state = TMS ? Exit1_DR : Shift_DR;
        end
        Exit1_DR: begin
            next_state = TMS ? Update_DR : Pause_DR;
        end
        Pause_DR: begin
            next_state = TMS ? Exit2_DR : Pause_DR;
        end
        Exit2_DR: begin
            next_state = TMS ? Update_DR : Shift_DR;
        end
        Update_DR: begin
            next_state = TMS ? Select_DR_Scan : Run_Test;
        end
        Select_IR_Scan: begin
            next_state = TMS ? Test_Logic_Reset : Capture_IR;
        end
        Capture_IR: begin
            next_state = TMS ? Exit1_IR : Shift_IR;
        end
        Shift_IR: begin
            next_state = TMS ? Exit1_IR : Shift_IR;
        end
        Exit1_IR: begin
            next_state = TMS ? Update_IR : Pause_IR;
        end
        Pause_IR: begin
            next_state = TMS ? Exit2_IR : Pause_IR;
        end
        Exit2_IR: begin
            next_state = TMS ? Update_IR : Shift_IR;
        end
        Update_IR: begin
            next_state = TMS ? Select_DR_Scan : Run_Test;
        end
        default: begin
            next_state = Test_Logic_Reset;
        end
    endcase
end

  always@ (state,tms)
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




module IR(TCK,TDI,Capture_IR,Shift_IR,Update_IR,IR_TDO,IR_out);
  input TCK,TDI,Capture_IR,Shift_IR,Update_IR;
  output reg IR_TDO;
  parameter IR_LENGTH=5;
  output reg [IR_LENGTH-1:0]IR_out;
  reg [IR_LENGTH-1:0] Shift_reg_IR, Update_reg_IR;
  always @(posedge TCK)
    begin
      if(Capture_IR)
        Shift_reg_IR<= {IR_length{1'b1}};
      else if(Shift_IR)
        begin
          Shift_reg_IR<={ Shift_reg_IR[IR_length-2:0],TDI};
        end   
      else if(Update_IR)
        Update_reg_IR<=Shift_reg_IR;
    end
  assign    IR_TDO=Shift_reg_IR[IR_length-1];
  assign  IR_out= Update_reg_IR;
    end
endmodule


module Bypass(TDR_select,TCK,TDI,Capture_DR,Shift_DR,Update_DR,DR_TDO); 
  input TDR_select,TCK,TDI,Capture_DR,Shift_DR,Update_DR;
  output reg DR_TDO;
  parameter DR_length=1;
                //output reg [DR_length-1:0]DR_out;
  reg [DR_length-1:0] Shift_reg_DR, Update_reg_DR;
  always@(posedge TCK)
    begin
      if(TDR_select)
        begin
          if(Capture_DR)
            Shift_reg_DR<= {DR_length{1'b1}};
          else if(Shift_DR)
            Shift_reg_DR<={ Shift_reg_DR[DR_length-2:0] ,TDI}; 
          else if(Update_DR)
            Update_reg_DR<=Shift_reg_DR;
        end	
    end
   
   assign   DR_TDO=Shift_reg_DR[DR_length-1];
      //DR_out= Update_reg;
    end
endmodule

