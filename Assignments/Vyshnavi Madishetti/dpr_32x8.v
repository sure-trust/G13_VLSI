module dpr_32x8(CLKA,CLKB,AddrA,AddrB,DataA,DataB,WENA,WENB,QA,QB);
  input CLKA, CLKB, WENA, WENB;
  input [3:0]AddrA, AddrB;
  input [7:0]DataA, DataB;
  output reg [7:0]QA, QB;
  
  reg [7:0] mem [31:0];
  
  always @(posedge CLKA)
    begin
      if(WENA)
        mem[AddrA] <=DataA;
      else
        QA <= mem[AddrA];
        end
  always @(posedge CLKB)
    begin
      if(WENB)
        mem[AddrB] <=DataB;
      else
        QB <=mem[AddrB];
    end
 
endmodule

