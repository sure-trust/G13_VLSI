module chip_top_wrapper(
    input TCK, TMS, TDI,
    output TDO
);
    wire CAPTURE_DR;
    wire SHIFT_DR;
    wire UPDATE_DR;
    wire CAPTURE_IR;
    wire SHIFT_IR;
    wire UPDATE_IR;
    wire [4:0] IR_OUT;
    wire IR_S0, DR_S0;
    reg tdr_select;

    tap_fsm tap(
        .TCK(TCK),
        .TMS(TMS),
        .TRST(), 
        .TEST_LOGIC_RESET_OUT(),
        .RUN_TEST_IDLE_OUT(),
        .SELECT_DR_SCAN_OUT(),
        .CAPTURE_DR_OUT(CAPTURE_DR),
        .SHIFT_DR_OUT(SHIFT_DR),
        .EXIT1_DR_OUT(),
        .PAUSE_DR_OUT(),
        .EXIT2_DR_OUT(),
        .UPDATE_DR_OUT(UPDATE_DR),
        .SELECT_IR_SCAN_OUT(),
        .CAPTURE_IR_OUT(CAPTURE_IR),
        .SHIFT_IR_OUT(SHIFT_IR),
        .EXIT1_IR_OUT(),
        .PAUSE_IR_OUT(),
        .EXIT2_IR_OUT(),
        .UPDATE_IR_OUT(UPDATE_IR)
    );

    INSTRUCTION_REGISTER ir(
        .CAPTURE_IR(CAPTURE_IR),
        .SHIFT_IR(SHIFT_IR),
        .UPDATE_IR(UPDATE_IR),
        .TCK(TCK),
        .TDI(TDI),
        .TDO(IR_S0),
        .IR_OUT(IR_OUT)
    );

    DATA_REGISTER dr(
        .TDR_SELECT(tdr_select), 
        .CAPTURE_DR(CAPTURE_DR),
        .UPDATE_DR(UPDATE_DR),
        .SHIFT_DR(SHIFT_DR),
        .TDI(TDI),
        .TDO(DR_S0),
        .TCK(TCK)
    );


    always @(IR_OUT)
    begin
        case(IR_OUT)
            5'b11111: tdr_select = 1'b1;
            default: tdr_select = 1'b0;
        endcase
    end

    assign TDO = ((SHIFT_IR & IR_S0) | (SHIFT_DR & DR_S0));

endmodule
