module test_encoder;
reg [7:0]Y;
reg EN;
wire [2:0]A;
encoder8_3 dut(.y(Y), .en(EN),.a(A));
//dummp signal to waveform  
  initial begin
    $dumpfile("dump.vcd");
              $dumpvars(1);
              end

initial
begin
    EN=1;
    Y=8'h0_1;#30;
    Y=8'h0_2;#30;
    Y=8'h0_4;#30;
    Y=8'h0_8;#30;
    Y=8'h1_0;#30;
    Y=8'h2_0; #30;
    Y=8'h4_0;#30; 
    Y=8'h8_0;#30;  
end
endmodule
