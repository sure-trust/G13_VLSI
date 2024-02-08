module dpr_16x8(CLKA,CLKB,AA,AB,DA,DB,WENA,WENB,QA,QB);

input CLKA,CLKB,WENA,WENB;
input[7:0]DA,DB;
input[3:0]AA,AB;
  output reg[7:0]QA,QB;

reg[7:0]mem[31:0];
always @(posedge CLKA)
begin
if(WENA)
  mem[AA]<=DA;
else
QA<=mem[AA];
end

always@ (posedge CLKB)
begin
  if(WENB)
    mem[AB]<=DB;
else
QB<=mem[AB];
end
endmodule
