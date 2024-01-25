module priority_encodertb;
  reg [7:0] i; 
  wire [2:0] y;
  
  priority_encoder dut(.i(i), .y(y));
initial 
  begin
#0 i=8'b10000000;
#10 i=8'b01000000;
#10 i=8'b00100000;
#10 i=8'b00010000;
#10 i=8'b00001000;
#10 i=8'b00000100;
#10 i=8'b00000010;
#10 i=8'b00000001;
#10 i=8'b00000000;
end
initial
begin
  $monitor("i: %b y: %b ",i, y);
#100 $finish; 
end
endmodule
