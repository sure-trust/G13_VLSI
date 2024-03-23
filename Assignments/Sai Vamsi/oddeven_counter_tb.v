`include"OE_counter.v"
module tb;

reg CLK,OE,RST;

wire [2:0] out;
  integer i;
parameter s0=3'b000;
parameter s1=3'b001;
parameter s2=3'b010;
parameter s3=3'b011;
parameter s4=3'b100; 
parameter s5=3'b101; 
parameter s6=3'b110; 
parameter s7=3'b111;

odd_even_counter dut(CLK,RST,OE,out);

initial begin
CLK=0;
forever #5 CLK=~CLK;
end

 task intialise;
 begin
    RST=1'b0;
	OE=1'b0;
	end
 endtask

 task reset;
  begin
@(posedge CLK)
    RST=1;
  @(posedge CLK);
    RST=0;
 end
 endtask
 task OEC(input i);
    begin
	@(posedge CLK)
     OE=i;
    end
  endtask

initial begin
  intialise;
  reset;
  oec(1'b1);//S0 TO S1
  oec(1'b1);//S1 TO S3;
  oec(1'b1);//S3 TO S5
  oec(1'b1);//S5 TO S7
  oec(1'b1);//S7 TO S0
  //EVEN MODE
   /*repeat(4)begin
    OEC(1'b0);
   end

#100 $finish;
end
//  initial begin
  //  $dumpfile("dump.vcd");
    //$dumpvars;
 // end
 endmodule
