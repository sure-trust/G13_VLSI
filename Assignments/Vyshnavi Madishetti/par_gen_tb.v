module par_gen_tb;

  parameter CLK_PERIOD = 10; 

  reg clk;
  reg rst;
  reg a;
  wire y;

  par_gen uut (
    .y(y),
    .clk(clk),
    .rst(rst),
    .a(a)
  );

  always #((CLK_PERIOD/2)) clk = ~clk;

  initial begin
    clk = 0;
    rst = 1;
    a = 0;

    #10 rst = 0;
    #20 a = 1;
    #10 a = 0;
    #10 a = 1;
    #10 a = 0;
    #10 a = 1;
  end

  always @(posedge clk) 
    begin
    $display("Time %0t: State = %b, Input = %b, Output = %b", $time, uut.state, a, y);
  end
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars;
      	#300 $finish;
    end

endmodule

