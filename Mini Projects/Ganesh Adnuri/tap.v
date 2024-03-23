module tap_fsm(TCK,TMS,TRST,TEST_LOGIC_RESET_OUT,RUN_TEST_IDLE_OUT,SELECT_DR_SCAN_OUT,CAPTURE_DR_OUT,SHIFT_DR_OUT,EXIT1_DR_OUT,PAUSE_DR_OUT,EXIT2_DR_OUT,UPDATE_DR_OUT,SELECT_IR_SCAN_OUT,CAPTURE_IR_OUT,SHIFT_IR_OUT,EXIT1_IR_OUT,PAUSE_IR_OUT,EXIT2_IR_OUT,UPDATE_IR_OUT);
input TCK,TMS,TRST;
output reg TEST_LOGIC_RESET_OUT,RUN_TEST_IDLE_OUT,SELECT_DR_SCAN_OUT,CAPTURE_DR_OUT,SHIFT_DR_OUT,EXIT1_DR_OUT,PAUSE_DR_OUT,EXIT2_DR_OUT,UPDATE_DR_OUT,SELECT_IR_SCAN_OUT,CAPTURE_IR_OUT,SHIFT_IR_OUT,EXIT1_IR_OUT,PAUSE_IR_OUT,EXIT2_IR_OUT,UPDATE_IR_OUT;
reg [3:0]state,next_state;

localparam TEST_LOGIC_RESET=4'h0;
localparam RUN_TEST_IDLE=4'h1; 
localparam SELECT_DR_SCAN=4'h2;  
localparam CAPTURE_DR=4'h3; 
localparam SHIFT_DR=4'h4;
localparam EXIT1_DR=4'h5; 
localparam PAUSE_DR=4'h6; 
localparam EXIT2_DR=4'h7;
localparam UPDATE_DR=4'h8;
localparam SELECT_IR_SCAN=4'h9;
localparam CAPTURE_IR=4'hA;
localparam SHIFT_IR=4'hB; 
localparam EXIT1_IR=4'hC; 
localparam PAUSE_IR=4'hD; 
localparam EXIT2_IR=4'hE;
localparam UPDATE_IR=4'hF;

always@(posedge TCK or negedge TRST)
begin
if(~TRST)
begin 
state <= TEST_LOGIC_RESET;
end
else begin

state <= next_state;
end
end

always@(*)
begin 
case(state)
 TEST_LOGIC_RESET : 
 if(TMS)
state <= TEST_LOGIC_RESET;
else 
state <= RUN_TEST_IDLE;
 
 RUN_TEST_IDLE :
if(TMS)
state <= SELECT_DR_SCAN;
else 
state <= RUN_TEST_IDLE;

SELECT_DR_SCAN :
if(TMS)
state <= SELECT_IR_SCAN;
else 
state <= CAPTURE_DR;
 
 CAPTURE_DR  :
 if(TMS)begin
state <= EXIT1_DR;
end
else 
state <= SHIFT_DR;
 
 
 SHIFT_DR   :
 if(TMS) begin
state <= EXIT1_DR;
end
else 
state <= SHIFT_DR;
 
 
 EXIT1_DR  :
if(TMS)
state <= UPDATE_DR;
else 
state <= PAUSE_DR;
 

 PAUSE_DR :
if(TMS)
state <= EXIT2_DR;
else
state <= PAUSE_DR;
 
 
 EXIT2_DR  : 
 if(TMS)
state <= UPDATE_DR;
else 
state <= SHIFT_DR;

 
 UPDATE_DR: 
if(TMS)begin
state <= SELECT_DR_SCAN;
end
else 
state <= RUN_TEST_IDLE;
 
 //Instruction 
 
 SELECT_IR_SCAN:
 if(TMS)
state <= TEST_LOGIC_RESET;
else 
state <= CAPTURE_IR;

 
 CAPTURE_IR  :
 if(TMS) begin
state <= EXIT1_IR;
end
else 
state <= SHIFT_IR;
 
 SHIFT_IR :
if(TMS) begin
state <= EXIT1_IR;
end
else 
state <= SHIFT_IR;
 
 EXIT1_IR  :
 if(TMS)
state <= UPDATE_IR;
else 
state <= PAUSE_IR;
 
 
 PAUSE_IR  :
 if(TMS)
state <= EXIT2_IR;
else 
state <= PAUSE_IR;
 
 
 EXIT2_IR  :
 if(TMS)
 state <= UPDATE_IR;
 else 
 state <= SHIFT_IR;
 
 
 UPDATE_IR :
if(TMS) begin
state <= SELECT_DR_SCAN;
end
else 
state <= RUN_TEST_IDLE;
default : next_state = TEST_LOGIC_RESET;
endcase
end
always@ (*)
begin
	TEST_LOGIC_RESET_OUT=0;
	RUN_TEST_IDLE_OUT=0;
	SELECT_DR_SCAN_OUT=0;
	CAPTURE_DR_OUT=0;
	SHIFT_DR_OUT=0;
	EXIT1_DR_OUT=0;
	PAUSE_DR_OUT=0;
	EXIT2_DR_OUT=0;
	UPDATE_DR_OUT=0;
	SELECT_IR_SCAN_OUT=0;
	CAPTURE_IR_OUT=0;
	SHIFT_IR_OUT=0;
	EXIT1_IR_OUT=0;
	PAUSE_IR_OUT=0;
	EXIT2_IR_OUT=0;
	UPDATE_IR_OUT=0;

	case(state)
		TEST_LOGIC_RESET: TEST_LOGIC_RESET_OUT=1;
		RUN_TEST_IDLE: RUN_TEST_IDLE_OUT=1;
		SELECT_DR_SCAN: SELECT_DR_SCAN_OUT=1;
		CAPTURE_DR: CAPTURE_DR_OUT=1;
		SHIFT_DR: SHIFT_DR_OUT=1;
		EXIT1_DR: EXIT1_DR_OUT=1;
		PAUSE_DR: PAUSE_DR_OUT=1;
		EXIT2_DR: EXIT2_DR_OUT=1;
		UPDATE_DR: UPDATE_DR_OUT=1;
		SELECT_IR_SCAN: SELECT_IR_SCAN_OUT=1;
		CAPTURE_IR: CAPTURE_IR_OUT=1;
		SHIFT_IR: SHIFT_IR_OUT=1;
		EXIT1_IR: EXIT1_IR_OUT=1;
		PAUSE_IR: PAUSE_IR_OUT=1;
		EXIT2_IR: EXIT2_IR_OUT=1;
		UPDATE_IR: UPDATE_IR_OUT=1;
	endcase
end
endmodule
