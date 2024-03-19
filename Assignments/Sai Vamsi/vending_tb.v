module tb;
 reg CLK,RST;
 reg [2:0]IN;
 wire OUT;

 localparam IDLE =3'b000;
 localparam S1=3'b001;
 localparam S2=3'b010;
 localparam S33'b011;
 localparam S4=3'b100;

vending dut(CLK,RST,IN,OUT);

initial begin
 CLK=0;
 forever #5 CLK=~CLK;
end

initial begin
  RST=1;
  @(posedge CLK);
  RST=0;
  repeat(10)begin
    IN=$random;
  end
 #100 $finish;
 endmodule
