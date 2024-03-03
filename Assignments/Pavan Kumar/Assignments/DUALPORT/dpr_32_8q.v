module dpr_32_8q(DA,DB,CLKA,CLKB,QA,QB,AA,AB,WENA,WENB);
  input [7:0] DA,DB;
  input [4:0] AA,AB;
  output  reg [7:0] QA,QB;
input CLKA,CLKB,WENA,WENB;
parameter depth=32;
parameter width=8;
reg [width-1:0] mem[depth-1:0];
  
  always@(posedge CLKA)
begin
  if(WENA==1)
    mem[AA]<=DA;
else
  QA<=mem[AA];
end
  always@(posedge CLKB)
begin
  if(WENB==1)
    mem[AB]<=DB;
else
  QB<=mem[AB];
end
endmodule

