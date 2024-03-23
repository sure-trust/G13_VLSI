module Chip_Top_Wrapper(input TCK,TMS,TDI,output TDO);
reg tdr_select;
wire IR_S0,DR_S0;
wire I_CAPTURE_IR_OUT,
     I_CAPTURE_DR_OUT,
     I_UPDATE_IR_OUT,
     I_UPDATE_DR_OUT,
     I_SHIFT_IR_OUT,
     I_SHIFT_DR_OUT;
 
wire [4:0] I_IR_OUT,I_DR_OUT;
     
tap_fsm fsm(  .TCK(TCK) ,
              .TMS(TMS),
              .TEST_LOGIC_RESET_OUT(),
              .RUN_TEST_OUT(),
              .SELECT_DR_SCAN_OUT(),
              .SELECT_IR_SCAN_OUT(),
              .CAPTURE_DR_OUT(I_CAPTURE_DR_OUT),
              .CAPTURE_IR_OUT(I_CAPTURE_IR_OUT),
              .SHIFT_DR_OUT(I_SHIFT_DR_OUT),
              .SHIFT_IR_OUT(I_SHIFT_IR_OUT),
              .EXIT1_DR_OUT(),
              .EXIT1_IR_OUT(),
              .EXIT2_DR_OUT(),
              .EXIT2_IR_OUT(),
              .PAUSE_DR_OUT(),
              .PAUSE_IR_OUT(),
              .UPDATE_DR_OUT(I_UPDATE_DR_OUT),
              .UPDATE_IR_OUT(I_UPDATE_IR_OUT
));   
              
INSTRUCTION_REGISTER dut( .TDI(TDI), 
                      .TCK(TCK),
.SHIFT_IR(I_SHIFT_IR_OUT),
.CAPTURE_IR(I_CAPTURE_IR_OUT), 
.UPDATE_IR(I_UPDATE_IR_OUT),
.TDO(IR_S0),
.IR_OUT(I_IR_OUT));


DATA_REGISTER uut(.TDI(TDI),
              .tdr_select(tdr_select), 
             .TCK(TCK), 
.SHIFT_DR(I_SHIFT_DR_OUT), 
.CAPTURE_DR(I_CAPTURE_DR_OUT),
.UPDATE_DR(I_UPDATE_DR_OUT),
.TDO(DR_S0),
.DR_OUT(I_DR_OUT));

                   
 always @(I_IR_OUT)
    begin
        case(I_IR_OUT)
           5'b00000 : tdr_select =1'b1;  
           default : tdr_select = 'hz;
        endcase
    end

assign TDO = (I_SHIFT_IR_OUT & IR_S0) | ( I_SHIFT_DR_OUT & DR_S0);
endmodule
