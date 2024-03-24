`include"TAP_FSM.v"
`include"instruction_reg.v"
`include"Bypass_Data_Reg.v"

module Chip_Top_Wrapper(input TCK,TMS,TDI,output TDO);
reg tdr_select;
wire IR_S0,DR_S0;
wire Capture_IR_out,
     Capture_DR_out,
     Update_IR_out,
     Update_DR_out,
     Shift_IR_out,
     Shift_DR_out; 
wire [4:0] IR_out;
     
TAP_FSM inst1(.TCK(TCK) ,
              .TMS(TMS),
              .Test_Logic_Reset_out(),
              .Run_Test_out(),
              .Select_DR_Scan_out(),
              .Select_IR_Scan_out(),
              .Capture_DR_out(Capture_DR_out),
              .Capture_IR_out(Capture_IR_out),
              .Shift_DR_out(Shift_DR_out),
              .Shift_IR_out(Shift_IR_out),
              .Exit1_DR_out(),
              .Exit1_IR_out(),
              .Exit2_DR_out(),
              .Exit2_IR_out(),
              .Pause_DR_out(),
              .Pause_IR_out(),
              .Update_DR_out(Update_DR_out),
              .Update_IR_out(Update_IR_out));   
              
Instrunction_reg inst2( .TDI(TDI), 
                      .TCK(TCK),
                      .Shift_IR(Shift_IR_out),
                      .Capture_IR(Capture_IR_out), 
                      .Update_IR(Update_IR_out),
                      .TDO(IR_S0),
                      .IR_OUT(IR_out));

Bypass_Data_Reg inst3(.TDI(TDI),
              .tdr_select(tdr_select), 
              .TCK(TCK), 
              .Shift_DR(Shift_DR_out), 
              .Capture_DR(Capture_DR_out),
              .Update_DR(Update_DR_out),
              .TDO(DR_S0),
              .DR_OUT(DR_out));
              
              
 always @(IR_out)
    begin
        case(IR_out)
           5'b11111 : tdr_select =1'b1;  
           default : tdr_select = 'h0;
        endcase
    end
//Decoder circuit
assign TDO = (Shift_IR_out & IR_S0) | (Shift_DR_out & DR_S0);
endmodule
