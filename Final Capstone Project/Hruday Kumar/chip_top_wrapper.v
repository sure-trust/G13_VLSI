module Chip_Top_Wrapper(input TCK,TMS,TDI,output TDO);
reg tdr_select;
wire IR_S0,DR_S0;
wire W_Capture_IR_out,
     W_Capture_DR_out,
     W_Update_IR_out,
     W_Update_DR_out,
     W_Shift_IR_out,
     W_Shift_DR_out; 
wire [4:0] W_IR_out;
     
TAP_FSM fsm(  .TCK(TCK) ,
              .TMS(TMS),
              .Test_Logic_Reset_out(),
              .Run_Test_out(),
              .Select_DR_Scan_out(),
              .Select_IR_Scan_out(),
              .Capture_DR_out(W_Capture_DR_out),
              .Capture_IR_out(W_Capture_IR_out),
              .Shift_DR_out(W_Shift_DR_out),
              .Shift_IR_out(W_Shift_IR_out),
              .Exit1_DR_out(),
              .Exit1_IR_out(),
              .Exit2_DR_out(),
              .Exit2_IR_out(),
              .Pause_DR_out(),
              .Pause_IR_out(),
              .Update_DR_out(W_Update_DR_out),
              .Update_IR_out(W_Update_IR_out));   
              
Instrunction_reg dut( .TDI(TDI), 
                      .TCK(TCK),
                      .Shift_IR(W_Shift_IR_out),
                      .Capture_IR(W_Capture_IR_out), 
                      .Update_IR(W_Update_IR_out),
                      .TDO(IR_S0),
                      .IR_OUT(W_IR_out));

Data_Reg data(.TDI(TDI),
              .tdr_select(tdr_select), 
              .TCK(TCK), 
              .Shift_DR(W_Shift_DR_out), 
              .Capture_DR(W_Capture_DR_out),
              .Update_DR(W_Update_DR_out),
              .TDO(DR_S0),
              .DR_OUT(W_DR_out));
              
              
 always @(W_IR_out)
    begin
        case(W_IR_out)
           5'b00000 : tdr_select =1'b1;  
           default : tdr_select = 'hz;
        endcase
    end

assign TDO = (W_Shift_IR_out & IR_S0) | ( W_Shift_DR_out & DR_S0);
endmodule
