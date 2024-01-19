module scan_dff (
  input wire clk,         
  input wire reset,     
  input wire d,           
  input wire se,    
  inout wire so,   
  output reg q            
);

  always @(posedge clk) begin
    if (reset) begin
      q <= 1'b0;          
    end else if (se) begin
      q <= so;      
    end else begin
      q <= d;          
    end
  end
