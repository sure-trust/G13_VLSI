module dual_port_ram(Dout1,Dout2,Din1,Din2,clk1,clk2,Ad1,Ad2,we1,we2);
  parameter Addr_Width = 4;
  parameter Data_Width = 8;
  
  input clk1,clk2,we1,we2;
  input [Addr_Width-1:0] Ad1,Ad2;
  input [Data_Width-1:0] Din1,Din2;
  output reg [Data_Width-1:0] Dout1,Dout2;
  
  parameter Width = 8;
  parameter Depth = 32;
  
  reg [Width-1:0] mem [Depth:0];
  
  always @(posedge clk1)
    begin
      if (we1)
        mem[Ad1] <= Din1;
      else
        Dout1 <= mem[Ad1];
    end
  
  always @(posedge clk2)
    begin
      if (we2)
        mem[Ad2] <= Din2;
      else
        Dout2 <= mem[Ad2];
    end
endmodule
