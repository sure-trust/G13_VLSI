// Code your design here
// Code your design here
module CHIP_TOP_WRAPPER(input TCK,TMS,TDI,
                        output TDO);
  wire Capture_DR,Shift_DR,Update_DR,Capture_IR,Shift_IR,Update_IR;
  reg tdr_Select;
  wire IR_SO,DR_SO;
  wire [4:0]IR_out;

  TAP_FSM tap(.TCK(TCK),.TMS(TMS), .Test_Logic_Reset_out(), .Run_Test_Idle_out(), .Select_DR_Scan_out(), .Capture_DR_out(Capture_DR),.Shift_DR_out(Shift_DR),.Exit1_DR_out(),.Pause_DR_out(),.Exit2_DR_out(),.Update_DR_out(Update_DR),.Select_IR_Scan_out(),.Capture_IR_out(Capture_IR),.Shift_IR_out(Shift_IR),.Exit1_IR_out(), .Pause_IR_out(),.Exit2_IR_out(),.Update_IR_out(Update_IR));

 INSTRUCTION_REGISTER ir(.TCK(TCK),.TDI(TDI),.Capture_IR(Capture_IR),.Shift_IR(Shift_IR),.Update_IR(Update_IR),.IR_TDO(IR_SO));

  BYPASS_DR dr(.tdr_Select(tdr_Select),.TCK(TCK),.TDI(TDI),.Capture_DR(Capture_DR),.Shift_DR(Shift_DR),.Update_DR(Update_DR),.DR_TDO(SO_DR_OUT));

    always@(IR_out)
begin
  case(IR_out)
    //setting ir as 1111 for bypass
		5'b11111: tdr_Select=1'b1;     
		default: tdr_Select= 1'b0;
    endcase
end

//////////////////////////////////////////////////////////////////////

endmodule


  //tdo control box
  module TDO_CONTROL_BOX(input Shift_IR,SO,Shift_DR,
output TDO);

wire w1,w2;

    and g1(w1,SO,Shift_IR);
    and g2(w2,SO,Shift_DR);
or g3(TDO,w1,w2);

endmodule
//////////////////////////////////////////////////////////////////

// Code your design here
//TAP_FSM

module TAP_FSM( 
   input TRST,TCK,TMS,
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
// 4 bit intermediate states
   reg[3:0]state,nxt_state;
// defining parameters for every output
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
//updation of state
always @(posedge TCK or negedge TRST)
begin
if(!TRST)
	state <= Test_Logic_Reset;
else
	state <= nxt_state;
end


  //transistion of states main block
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

// for moore based fsm defining the outputs
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
////////////////////////////////////////////////////////////////////
////new IR MODULE STARTS
module INSTRUCTION_REGISTER(
Update_IR,
Capture_IR,
Shift_IR,
TDI,
TDO,
IR_TDO,
TCK);

localparam IR_LENGTH = 5;
//input and output varialbes declaring
input Update_IR, Capture_IR, Shift_IR;
input TDI, TCK;
output TDO;
  output [IR_LENGTH-1 : 0] IR_TDO;

reg [IR_LENGTH-1 : 0] shift_reg, update_reg;

always @ (posedge TCK)
	begin
      if (Capture_IR)
			shift_reg <= {IR_LENGTH{1'b1}};
      else if (Shift_IR)
			shift_reg <= {shift_reg[IR_LENGTH-2 : 0], TDI};
      else if (Update_IR)
			update_reg <= shift_reg;
		end

assign TDO = shift_reg[IR_LENGTH-1];
assign IR_TDO = update_reg;

endmodule
  ///////////////////////////////////////////////////////////////
  //BYPADSS_MODULE UNIT
module BYPASS_DR(
Shift_DR,
Capture_DR, 
Update_DR,
TDI,
TCK,
tdr_Select,
DR_TDO);

parameter DR_LENGTH = 5;

input TDI ,tdr_Select, TCK , Shift_DR , Capture_DR , Update_DR;
output  DR_TDO;

reg [DR_LENGTH-1:0] Shift_reg,Update_DR_reg;

always @(posedge TCK)
    begin
       if(tdr_Select)
       begin
         if(Capture_DR)
            begin
                Shift_reg <= {DR_LENGTH{1'b1}};
            end
        else if(Shift_DR)  
            begin
               Shift_reg<={ Shift_reg[DR_LENGTH-2:0] ,TDI}; 
            end  
        else if(Update_DR)
            begin
                Update_DR_reg <= Shift_reg;
            end        
        end
    end
 assign DR_TDO = Shift_reg[DR_LENGTH-1];
endmodule
  

  
