module tb;
  reg [7:0] in;
  reg [2:0] sel;
  wire y;
  mux uut(.in(in),.sel(sel),.y(y));
  initial begin
    $monitor("selected=%d, input=%d, output=%s" ,sel,in,y,$time);
     sel=3'b000;
    #10 sel=3'b001;
      #10 sel=3'b001;
      #10 sel=3'b010;
      #10 sel=3'b011;
      #10 sel=3'b100;
      #10 sel=3'b101;
      #10 sel=3'b110;
      #10 sel=3'b111;
  end
initial
  begin
    $dumpfile("dump.vcd");
    $dumpvars();
    end
  endmodule  
