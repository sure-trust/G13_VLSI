`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/15/2024 08:55:58 PM
// Design Name: 
// Module Name: TAP_FSM
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module TAP_FSM(
                input TCK , TMS,
                output reg
                    Test_Logic_Reset_out,          //1
                       Run_Test_out,                  //2
                       Select_DR_Scan_out,            //3
                       Select_IR_Scan_out,            //4
                       Capture_DR_out,                //5
                       Capture_IR_out,                 //6
                       Shift_DR_out,                  //7
                       Shift_IR_out,                   //8
                       Exit1_DR_out,                  //9
                       Exit1_IR_out,                  //10
                       Exit2_DR_out,                 //11
                       Exit2_IR_out,                 //12
                       Pause_DR_out,                 //13
                       Pause_IR_out,                 //14                //9
                       Update_DR_out,                //15
                       Update_IR_out                //16
                       );   
                       
 localparam Test_Logic_Reset = 4'b0000,
            Run_Test =4'b0001,
            Select_DR_Scan =4'b0010,
            Select_IR_Scan =4'b0011,
            Capture_DR=4'b0100,
            Capture_IR=4'b0101,
            Shift_DR=4'b0110,
            Shift_IR=4'b0111,
            Exit1_DR=4'b1000,
            Exit1_IR=4'b1001,
            Pause_DR=4'b1010,
            Pause_IR=4'b1011,
            Exit2_DR=4'b1100,
            Exit2_IR=4'b1101,
            Update_DR=4'b1110,
            Update_IR=4'b1111;
            
reg [3:0] c_state,n_state;

 always @(posedge TCK)
    begin
        c_state = n_state;
    end

  always @(TMS,c_state)
begin
	case(c_state)
		Test_Logic_Reset: n_state= TMS? Test_Logic_Reset: Run_Test;
		Run_Test: n_state= TMS? Select_DR_Scan: Run_Test;
		Select_DR_Scan: n_state= TMS? Select_IR_Scan: Capture_DR;
		Capture_DR: n_state= TMS? Exit1_DR: Shift_DR;
		Shift_DR: n_state= TMS? Exit1_DR: Shift_DR;
		Exit1_DR: n_state= TMS? Update_DR: Pause_DR;
		Pause_DR: n_state= TMS? Exit2_DR : Pause_DR;
		Exit2_DR: n_state= TMS? Update_DR : Shift_DR;
		Update_DR: n_state= TMS? Select_DR_Scan : Run_Test;
		Select_IR_Scan: n_state= TMS? Test_Logic_Reset: Capture_IR;
		Capture_IR: n_state= TMS? Exit1_IR: Shift_IR;
		Shift_IR: n_state= TMS? Exit1_IR: Shift_IR;
		Exit1_IR: n_state= TMS? Update_IR: Pause_IR;
		Pause_IR: n_state= TMS? Exit2_IR : Pause_IR;
		Exit2_IR: n_state= TMS? Update_IR : Shift_IR;
		Update_IR: n_state= TMS? Select_DR_Scan : Run_Test;
		default : c_state= Test_Logic_Reset;
	endcase
end

always@ (c_state)
begin
	Test_Logic_Reset_out=0;
	Run_Test_out=0;
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

	case(c_state)
		Test_Logic_Reset: Test_Logic_Reset_out=1'b1;
		Run_Test: Run_Test_out=1'b1;
		Select_DR_Scan: Select_DR_Scan_out=1'b1;
		Capture_DR: Capture_DR_out=1'b1;
		Shift_DR: Shift_DR_out=1'b1;
		Exit1_DR: Exit1_DR_out=1'b1;
		Pause_DR: Pause_DR_out=1'b1;
		Exit2_DR: Exit2_DR_out=1'b1;
		Update_DR: Update_DR_out=1'b1;
		Select_IR_Scan: Select_IR_Scan_out=1'b1;
		Capture_IR: Capture_IR_out=1'b1;
		Shift_IR: Shift_IR_out=1'b1;
		Exit1_IR: Exit1_IR_out=1'b1;
		Pause_IR: Pause_IR_out=1'b1;
		Exit2_IR: Exit2_IR_out=1'b1;
		Update_IR: Update_IR_out=1'b1;
	endcase
end
endmodule

