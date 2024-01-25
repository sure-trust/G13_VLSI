module prtb;
  reg [7:0] A;
  wire [2:0] y;
  
  pren dut(D, y);
  
  initial begin
    $monitor("A = %b::y = %0b", D , y);
    repeat(8) begin
      A=$random; #10;
    end
  end
endmodule
