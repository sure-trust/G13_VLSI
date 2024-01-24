module mux8x1_tb;
  reg [7:0]i;
  reg [2:0]s;
  wire y;
  integer x;
  
  mux8x1 dut(.i(i),.s(s),.y(y));
  initial
  begin
    for(x=0;x<8;x=x+1)
      begin
        s=x;
        i[x]=1'b0;
        #10;
        i[x]=1'b1;
        #10;
      end
  end
endmodule
