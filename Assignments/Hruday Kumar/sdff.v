module scan_dff (
  input wire clk,         
  input wire reset,     
  input wire d,           
  input wire scan_en,    
  inout wire scan_out,   
  output reg q            
);

  always @(posedge clk) begin
    if (reset) begin
      q <= 1'b0;          
    end else if (scan_en) begin
      q <= scan_out;      
    end else begin
      q <= d;          
    end
  end
