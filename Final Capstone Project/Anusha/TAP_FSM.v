module TAP_FSM ( TCK,TMS,Test-Logic-Reset_out,Run-Test-Idle_out,Select-DR-Scan_out,Capture-DR_out,Shift-DR_out,Exit1-DR_out,Pause-DR_out,Exit2-DR_out,Update-DR_out,Select-IR-Scan_out,Capture-IR_out,Shift-IR_out,Exit1-IR_out,Pause-IR_out,Exit2-IR_out,Update-IR_out);

input TCK,TMS;
output Test-Logic-Reset_out,
Run-Test-Idle_out,
Select-DR-Scan_out,
Capture-DR_out,
Shift-DR_out,
Exit1-DR_out,
Pause-DR_out,
Exit2-DR_out,
Update-DR_out,
Select-IR-Scan_out,
Capture-IR_out,
Shift-IR_out,
Exit1-IR_out,
Pause-IR_out,
Exit2-IR_out,
Update-IR_out;

reg[3:0]state,next_state;

localparam Test-Logic-Reset=4'b0000;
localparam Run-Test-Idle=4'b0001;
localparam Select-DR-Scan=4'b0010;
localparam Capture-DR=4'b0011;
localparam Shift-DR=4'b0100;
localparam Exit1-DR=4'b0101;
localparam Pause-DR=4'b0110;
localparam Exit2-DR=4'b0111;
localparam Update-DR=4'b1000;
localparam Select-IR-Scan=4'b1001;
localparam Capture-IR=4'b1010;
localparam Shift-IR=4'b1011;
localparam Exit1-IR=4'b1100;
localparam Pause-IR=4'b1101;
localparam Exit2-IR=4'b1110;
localparam Update-IR=4'b1111;

always @(posedge TCK )
begin
state <= nxt_state;
end

// TAP_FSM state transition
always @(state,TMS)
begin
case(state)
Test-Logic-Reset:begin
if(TMS==1)
state <= Test-Logic-Reset;
else
state <= Run-Test-Idle;
end
                 
Run-Test-Idle:begin
if(TSM==1)
state <= Select_IR;
else
state <= Run-Test-Idle;
end

Select-DR-Scan:begin
if(TSM==1)
state <=Select-IR;
else
state <= Capture-IR;
end

Capture-DR:begin
if(TSM==1)
state <= Exit1-DR;
else
state <= Shift-DR;
end

Shift-DR:begin
if(TSM==1)
state <= Exit1-DR;
else
state <= Shift-DR;
end

Exit1-DR:begin
if(TSM==1)
state <= Update-DR;
else
state <= Pause-DR;
end

Pause-DR:begin
if(TSM==1)
state <= Exit1-DR;
else
state <= Pause-DR;
end

Exit2-DR:begin
if(TSM==1)
state <= Update-DR;
else
state <= Shift-DR;
end

Update-DR:begin
if(TSM==1)
state <= Select-DR;
else
state <= Run-Test-Idle
end

Select-IR-Scan:begin
if(TSM==1)
state <= Test-Logic-Reset;
else
state <= Capture-IR;
end

Capture-IR:begin
if(TSM==1)
state <= EXit1-IR;
else
state <= Shift-IR;
end

Shift-IR:begin
if(TSM==1)
state <= EXit1-IR;
else
state <= Shift-IR;
end

Exit1-IR:begin
if(TSM==1)
state <= Update-IR;
else
state <= Pause-IR;
end

Pause-IR:begin
if(TSM==1)
state <= Exit1-IR;
else
state <= Pause-IR;
end

Exit2-IR:begin
if(TSM==1)
state <= Update-IR;
else
state <= Shift-IR;
end

Update-IR:begin
if(TSM==1)
state <= Select-DR;
else
state <= Run-Test-Idle;
end
default:nxt_state=Test-Logic-Reset;
endcase
end

assign Test-Logic-Reset_out=(state==Test-Logic-Reset)?1'b1:1'b0;
assign Run-Test-Idle_out=(state==Run-Test-Idle)?1'b1:1'b0;
assign Select-DR-Scan_out=(state==Select-DR-Scan)?1'b1:1'b0;
assign Capture-DR_out=(state==Capture-DR)?1'b1:1'b0;
assign Shift-DR_out=(state==Shift-DR)?1'b1:1'b0;
assign Exit1-DR_out=(state==EXit1-DR)?1'b1:1'b0;
assign Pause-DR_out=(state==Pause-DR)?1'b1:1'b0;
assign Exit2-DR_out=(state==Exit2-DR)?1'b1:1'b0;
assign Update-DR_out=(state==Update-DR)?1'b1:1'b0;
assign Select-IR-Scan_out=(state==Select-IR-Scan)?1'b1:1'b0;
assign Capture-IR_out=(state==Capture-IR)?1'b1:1'b0;
assign Shift-IR_out=(state==Shift-IR)?1'b1:1'b0;
assign Exit1-IR_out=(state==EXit1-IR)?1'b1:1'b0;
assign Pause-IR_out=(state==Pause-IR)?1'b1:1'b0;
assign Exit2-IR_out=(state==Exit2-IR)?1'b1:1'b0;
assign Update-IR_out=(state==Update-IR)?1'b1:1'b0;

endmodule
