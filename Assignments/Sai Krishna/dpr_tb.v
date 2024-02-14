`include "dpr.v";
module dpr_tb();

    // Parameters
    parameter CLK_PERIOD = 10; // Clock period in time units
    
    // Inputs
    reg CLKA, CLKB, WEN_A, WEN_B;
    reg [7:0] D_A, D_B;
    reg [4:0] A, B;
    
    // Outputs
    wire [7:0] Q_A, Q_B;
    
    // Instantiate the dpr_32x8 module
    dpr_32x8 dut (
        .CLKA(CLKA),
        .CLKB(CLKB),
        .WEN_A(WEN_A),
        .WEN_B(WEN_B),
        .D_A(D_A),
        .D_B(D_B),
        .A(A),
        .B(B),
        .Q_A(Q_A),
        .Q_B(Q_B)
    );
    
    // Clock generation
    initial begin
        CLKA = 0;
        CLKB = 0;
        forever #((CLK_PERIOD / 2)) CLKA = ~CLKA;
        forever #((CLK_PERIOD)) CLKB = ~CLKB;
    end
    
    // Stimulus
    initial begin
        // Initialize inputs
        WEN_A = 1;
        WEN_B = 1;
        D_A = 8'h00;
        D_B = 8'h00;
        A = 5'b00000;
        B = 5'b00001;
        
        // Apply stimulus
        #10 WEN_A = 1; WEN_B = 1; D_A = 8'h0A; D_B = 8'h0B; A = 5'b00000; B = 5'b00001;
        #10 WEN_A = 1; WEN_B = 1; D_A = 8'h0C; D_B = 8'h0D; A = 5'b00001; B = 5'b00010;
        #10 WEN_A = 1; WEN_B = 1; D_A = 8'h0E; D_B = 8'h0F; A = 5'b00010; B = 5'b00011;
        
        // Add more test cases as needed
        
        #100 $finish; // Finish the simulation after some time
    end
    
endmodule

