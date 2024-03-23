module Chip_Top_Wrapper(TCK,TMS,TDI,TDO);
input TCK,TMS,TDI;
output TDO;

reg TDR_Select;
wire IR_S0,DR_S0;
wire CAPTURE_IR_OUT,UPDATE_IR_OUT,SHIFT_IR_OUT,CAPTURE_DR_OUT,UPDATE_DR_OUT,SHIFT_DR_OUT;
wire [4:0] IR_OUT;

TAP_FSM tap(.TCK(TCK),.TMS(TMS),.Test-Logic-Reset_out(),.Run-Test-Idle_out(),.Select-DR-Scan_out(),.Capture-DR_out(CAPTURE_DR_OUT),.Shift-DR_out(SHIFT_DR_OUT),.Exit1-DR_out(),.Pause-DR_out(),.Exit2-DR_out(),.Update-DR_out(UPDATE_DR_OUT),.Select-IR-Scan_out(),.Capture-IR_out(CAPTURE_IR_OUT),.Shift-IR_out(SHIFT_IR_OUT),.Exit1-IR_out(),.Pause-IR_out(),.Exit2-IR_out(),.Update-IR_out(UPDATE_IR_OUT));

INSTRUCTION_REG ir(.TCK(TCK),.TDI(TDI),.Capture_IR(CAPTURE_IR_OUT),.Shift_IR(SHIFT_IR_OUT),.Update_IR(UPDATE_IR_OUT),.IR_out(IR_OUT),.tdo(IR_S0));

DATA_REG dr(.TCK(TCK),.TDI(TDI),.tdr_Select(TDR_Select),.Capture_DR(CAPTURE_DR_OUT),.Shift_DR(SHIFT_DR_OUT),.Update_DR(UPDATE_DR_OUT),.tdo(DR_S0));

IR_DECODER decoder(.IR_out(IR_OUT),.tdr_Select(TDR_Select));

assign TDO = (SHIFT_IR_OUT & IR_S0) | (SHIFT_DR_OUT & DR_S0);
endmodule

module Chip_Top_Wrapper_tb;
reg TCK,TMS,TDI;
wire TDO;

reg TDR_Select;
wire IR_S0,DR_S0;
wire CAPTURE_IR_OUT,UPDATE_IR_OUT,SHIFT_IR_OUT,CAPTURE_DR_OUT,UPDATE_DR_OUT,SHIFT_DR_OUT;
wire [4:0] IR_OUT;

Chip_Top_Wrapper dut(TCK,TMS,TDI,TDO);


always #10 TCK = ~TCK;

task initialize();
begin
TCK =1'b0;
TDI = 1'b0;
TMS = 1'b0;
end

task TDI_I(input j);
begin
TDI = j; 
end

task TMS_I(input i);
begin
TMS = i;
end

initial 
begin
initialize;
@(posedge TCK) TMS_I(1'b0);
@(posedge TCK) TDI_I(1'b1);
@(posedge TCK) TMS_I(1'b1);
@(posedge TCK) TDI_I(1'b1);
@(posedge TCK) TMS_I(1'b0);
@(posedge TCK) TMS_I(1'b0);
@(posedge TCK) TMS_I(1'b1);
end
endmodule


