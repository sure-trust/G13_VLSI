module dual_port_ram(QA,QB,DA,DB,CLKA,CLKB,AA,AB,WENA,WENB);
  parameter Addr_Width = 5;
  parameter Data_Width = 8;
  
  input CLKA,CLKB,WENA,WENB;
  input [Addr_Width-1:0] AA,AB;
  input [Data_Width-1:0] DA,DB;
  output reg [Data_Width-1:0] QA,QB;
  
  parameter Width = 8;
  parameter Depth = 32;
  
  reg [Width-1:0] mem [0:Depth-1];
  
  always @(posedge CLKA)
    begin
      if (WENA)
        mem[AA] <= DA;
      else
        QA <= mem[AA];
    end
  
  always @(posedge CLKB)
    begin
      if (WENB)
        mem[AB] <= DB;
      else
        QB <= mem[AB];
    end
endmodule

