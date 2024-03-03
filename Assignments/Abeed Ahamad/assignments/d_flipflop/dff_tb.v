module tb;module d_flip_flop (Q,D,clk,reset);
input D;
input clk;
input reset;
output reg Q;

always @(posedge clk or posedge reset)
  begin
    if (reset == 1'b1 )
        Q <= 1'b0;
    else
        Q <= D;
  end
endmodule        
reg D;
reg clk;
reg reset;
wire Q;

d_flip_flop d1(Q,D,clk,reset);

initial 
  begin 
    clk = 1'b0;
    forever #20 clk = ~clk ;
  end
  
initial 
  begin
    reset = 1'b1;
    #40;
    reset = 1'b0;
    #40;
    D = 1'b0;
    #40;
    D = 1'b1;
    #40;
    
    $finish ;
  end
  initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars;
   end
endmodule   
