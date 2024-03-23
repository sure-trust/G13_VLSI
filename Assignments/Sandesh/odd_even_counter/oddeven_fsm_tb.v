module Even_Odd_counter_TB();
reg CLK,RST,OE;
wire [2:0] OUT;

parameter CLK_PRD =10;

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
even_odd(1'b0);  //even mode
end
reset;
  
repeat(5)
begin
  even_odd(1'b1);  //odd mode
end
  
reset;
even_odd(1'b1); // S0 to S1
even_odd(1'b0); // S1 to S2
even_odd(1'b1); // S2 to S3
even_odd(1'b0); // S3 to S4
even_odd(1'b1); // S4 to S5
even_odd(1'b0); // S5 to S6
even_odd(1'b1); // S6 to S7
even_odd(1'b0); // S7 to S0 
$finish;
end
  
initial begin
$dumpfile("dump.vcd");
$dumpvars;

end
  
endmodule
