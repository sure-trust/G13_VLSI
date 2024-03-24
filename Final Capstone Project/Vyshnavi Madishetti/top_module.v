module top_module (TCK,TMS,TDI,TDO);
input TCK,TMS,TDI;
output TDO;
wire Capture_DR,Shift_DR,Update_DR,Capture_IR,Shift_IR,Update_IR;
wire [4:0]IR_out;
wire IR_TDO,DR_TDO;
reg TDR_Select;
  
  tap_fsm dut0(.TCK(TCK), .TMS(TMS), .TEST_LOGIC_RESET_OUT(), .RUN_TEST_OUT(), .SELECT_DR_SCAN_OUT(), .CAPTURE_DR_OUT(Capture_DR), .SHIFT_DR_OUT(Shift_DR), .EXIT1_DR_OUT(), .PAUSE_DR_OUT(), .EXIT2_DR_OUT(), .SELECT_IR_SCAN_OUT(), .UPDATE_DR_OUT(Update_DR), .CAPTURE_IR_OUT(Capture_IR), .SHIFT_IR_OUT(Shift_IR), .EXIT1_IR_OUT(), .PAUSE_IR_OUT(), .EXIT2_IR_OUT(), .UPDATE_IR_OUT(Update_IR));
  
  Ir_jtag dut1(.TCK(TCK), .TDI(TDI), .Capture_IR(Capture_IR), .Shift_IR(Shift_IR), .Update_IR(Update_IR), .IR_out(IR_out), .IR_TDO(IR_TDO));
  
  dr_jtag dut2(.TCK(TCK), .TDR_Select(TDR_Select), .Capture_DR(Capture_DR), .Shift_DR(Shift_DR), .Update_DR(Update_DR), .TDI(TDI), .DR_out(), .DR_TDO(DR_TDO));
  
  ir_decoder dut3(.IR_out, .TDR_Select);
  
  TDO_control_box dut4(Shift_IR,Shift_DR,IR_TDO,DR_TDO,TDO);
  
endmodule



////////////////////tap fsm  ////////////////////

module tap_fsm (
  input TCK, 
  input TMS, 
  output TEST_LOGIC_RESET_OUT, 
  output RUN_TEST_OUT,
  output SELECT_DR_SCAN_OUT,
  output CAPTURE_DR_OUT,
  output SHIFT_DR_OUT,
  output EXIT1_DR_OUT,
  output PAUSE_DR_OUT,
  output EXIT2_DR_OUT,
  output UPDATE_DR_OUT,
  output SELECT_IR_SCAN_OUT,
  output CAPTURE_IR_OUT,
  output SHIFT_IR_OUT,
  output EXIT1_IR_OUT,
  output PAUSE_IR_OUT,
  output EXIT2_IR_OUT,
  output UPDATE_IR_OUT
);

  localparam TEST_LOGIC_RESET = 4'b0000;
  localparam RUN_TEST = 4'b0001;
  localparam SELECT_DR_SCAN = 4'b0010;
  localparam CAPTURE_DR = 4'b0011;
  localparam SHIFT_DR = 4'b0100;
  localparam EXIT1_DR = 4'b0101;
  localparam PAUSE_DR = 4'b0110;
  localparam EXIT2_DR = 4'b0111;
  localparam UPDATE_DR = 4'b1000;
  localparam SELECT_IR_SCAN = 4'b1001;
  localparam CAPTURE_IR = 4'b1010;
  localparam SHIFT_IR = 4'b1011;
  localparam EXIT1_IR = 4'b1100;
  localparam PAUSE_IR = 4'b1101;
  localparam EXIT2_IR = 4'b1110;
  localparam UPDATE_IR = 4'b1111;

  reg [3:0] state, next_state;

  always @(posedge TCK) 
    begin 
        state <= next_state;
     end

  always @(state,TMS)
    begin
    if (state == TEST_LOGIC_RESET) 
      begin
      next_state = TMS ?  TEST_LOGIC_RESET:RUN_TEST;
      end 
     else if (state == RUN_TEST)
       begin
         next_state= TMS ? SELECT_DR_SCAN: RUN_TEST;
       end
    else if (state == SELECT_DR_SCAN) 
      begin
      next_state = TMS ? SELECT_IR_SCAN : CAPTURE_DR;
      end 
    else if (state == CAPTURE_DR)
      begin
      next_state = TMS ? EXIT1_DR: SHIFT_DR;
      end 
     else if (state == SHIFT_DR)
       begin
       next_state = TMS ? EXIT1_DR:SHIFT_DR;
       end 
      else if (state == EXIT1_DR) 
        begin
        next_state = TMS ? UPDATE_DR : PAUSE_DR;
        end 
      else if (state == PAUSE_DR)
        begin
        next_state = TMS ? EXIT2_DR : PAUSE_DR;
        end 
      else if (state == EXIT2_DR) 
        begin
        next_state = TMS ? UPDATE_DR:SHIFT_DR;
        end 
      else if (state == UPDATE_DR)
        begin
        next_state = TMS ? SELECT_DR_SCAN : RUN_TEST;
        end 
      else if (state == SELECT_IR_SCAN)
        begin
        next_state = TMS ? TEST_LOGIC_RESET : CAPTURE_IR;
        end 
      else if (state == CAPTURE_IR) 
        begin
        next_state = TMS ? EXIT1_IR:SHIFT_IR;
        end 
      else if (state == SHIFT_IR) 
        begin
        next_state = TMS ? EXIT1_IR:SHIFT_IR;
        end 
      else if (state == EXIT1_IR)
        begin
        next_state = TMS ? UPDATE_IR : PAUSE_IR;
        end
      else if (state == PAUSE_IR)
        begin
        next_state = TMS ? EXIT2_IR : PAUSE_IR;
        end 
      else if (state == EXIT2_IR)
        begin
        next_state = TMS ? UPDATE_IR:SHIFT_IR;
        end 
      else if (state == UPDATE_IR)
        begin
        next_state = TMS ? SELECT_DR_SCAN : RUN_TEST;
        end 
      else 
        begin
        next_state = TEST_LOGIC_RESET;
        end
    end
 
      assign TEST_LOGIC_RESET_OUT = (state == TEST_LOGIC_RESET) ? 1'b1 : 1'b0;
      assign RUN_TEST_OUT = (state == RUN_TEST) ? 1'b1 :1'b0;
      assign SELECT_DR_SCAN_OUT =(state == SELECT_DR_SCAN) ? 1'b1:1'b0;
  	  assign CAPTURE_DR_OUT = (state == CAPTURE_DR) ? 1'b1:1'b0;
  	  assign SHIFT_DR_OUT =(state == SHIFT_DR) ? 1'b1:1'b0;
  	  assign EXIT1_DR_OUT =(state == EXIT1_DR) ? 1'b1:1'b0;
  	  assign PAUSE_DR_OUT =(state == PAUSE_DR ) ? 1'b1:1'b0;
  	  assign EXIT2_DR_OUT =(state == EXIT2_DR) ? 1'b1:1'b0;
  	  assign UPDATE_DR_OUT =(state == UPDATE_DR) ? 1'b1:1'b0;
      assign SELECT_IR_SCAN_OUT =(state == SELECT_IR_SCAN) ? 1'b1:1'b0;
  	  assign CAPTURE_IR_OUT =(state == SELECT_DR_SCAN) ? 1'b1:1'b0;
  	  assign SHIFT_IR_OUT =(state == SHIFT_IR) ? 1'b1:1'b0;
  	  assign EXIT1_IR_OUT =(state == EXIT1_IR) ? 1'b1:1'b0;
  	  assign PAUSE_IR_OUT =(state == PAUSE_IR ) ? 1'b1:1'b0;
   	  assign EXIT2_IR_OUT =(state == EXIT2_IR) ? 1'b1:1'b0;
  	  assign UPDATE_IR_OUT =(state == UPDATE_IR) ? 1'b1:1'b0;
  
endmodule


///////////////////  IR Register //////////////////

module Ir_jtag(input Capture_IR,
          input Shift_IR,
          input Update_IR,
          input TCK,
          input TDI,
          output [4:0]IR_out,
          output IR_TDO);
  
  reg [4:0]Shift_reg,Update_reg;
  
  always@(posedge TCK)
    begin
      if(Capture_IR)
          Shift_reg <=5'b11111;
        
      else if(Shift_IR)
          Shift_reg<={Shift_reg[3:0],TDI};
     
      else if(Update_IR)
          Update_reg<=Shift_reg;
      end
      
  assign IR_TDO = Shift_reg[4];
  assign IR_out = Update_reg;
      
endmodule


/////////////////////   DR Register  //////////////////

module dr_jtag(input TDR_Select,
          input Capture_DR,
          input Shift_DR,
          input Update_DR,
          input TCK,
          input TDI,
          output [4:0] DR_out,
          output DR_TDO);
  
  reg [4:0]Shift_reg,Update_reg;
  
  always@(posedge TCK)
    begin
      if(TDR_Select)
        begin
      		if(Capture_DR)
          		Shift_reg <=5'b11111;
        		
      		else if(Shift_DR)
          		Shift_reg<={Shift_reg[3:0],TDI};
        		
      		else if(Update_DR)
          		Update_reg<=Shift_reg;
     	 end
    end
      
  assign DR_TDO = Shift_reg[4];
  assign DR_out = Update_reg;
      
endmodule


//////////////////////   IR Decoder   ////////////////

module ir_decoder(IR_out,TDR_Select);
  input [4:0] IR_out;
  output reg TDR_Select;
  
  always @(*)
    case(IR_out)
      5'b11111:TDR_Select='d1; 
      default:TDR_Select='d0;
    endcase
endmodule



//////////////////  control box   ///////////////////

module TDO_control_box(Shift_IR,Shift_DR,IR_TDO,DR_TDO,TDO);
  input Shift_IR,Shift_DR;
  input IR_TDO,DR_TDO;
  output TDO;
  reg w1,w2;
  
  always @(*)
    begin
   	  w1 <= Shift_IR & IR_TDO;
   	  w2 <= Shift_DR & DR_TDO;
    end
  assign TDO = w1 | w2;
endmodule
