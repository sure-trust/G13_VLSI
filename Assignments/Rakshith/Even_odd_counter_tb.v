module tb();
reg CLK,RST,OE;
wire [2:0] OUT;

localparam CLK_PRD =10;

Even_Odd_Counter dut(CLK,OE,RST,OUT);

always 
begin
#(CLK_PRD/2);
CLK= 1'b0;
#(CLK_PRD/2);
CLK= 1'b1;
end

task even_odd( input i);
begin
 @(posedge CLK)
   OE = i;
end
endtask

task initialise;
begin
RST=1'b0;
OE= 1'b0;
end
endtask

task reset;
begin
@(posedge CLK)
RST=1'b1;
@(posedge CLK)
RST=1'b0;
end
endtask

initial
begin
initialise;
reset;
  
repeat(5)
begin
even_odd(1'b0);
end
reset;
  
repeat(5)
begin
  even_odd(1'b1);  
end
  
reset;
even_odd(1'b1); 
even_odd(1'b0);
even_odd(1'b1); 
even_odd(1'b0);
even_odd(1'b1); 
even_odd(1'b0);
even_odd(1'b1); 
even_odd(1'b0); 
$finish;
end
  
initial begin
$dumpfile("dump.vcd");
$dumpvars;

end
  
endmodule
