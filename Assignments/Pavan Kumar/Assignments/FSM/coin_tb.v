module coin_tb;

reg clk, rst, toss;
wire OUT;
  
parameter CLK_PRD = 10;

  fsm_coin_toss dut(.clk(clk),.rst(rst), .toss(toss), .OUT(OUT));

always
begin
  #( CLK_PRD/2);
	clk = 1'b1;
  #( CLK_PRD/2);
  clk = 1'b0;
end
 
task toss_op (input i);
	begin
      @(posedge clk)
			toss = i;
	end
endtask

task initialise;
	
	rst = 1'b0;
	toss =1'b0;
     clk=1'b0;
endtask

task reset;
	begin
      @(posedge clk)
		rst = 1'b1;
      @(posedge clk)
		rst = 1'b0;
	end
endtask
  
initial begin
  initialise;
  reset;
toss_op(0);
 toss_op(1);
toss_op(1);
toss_op(1);
 toss_op(1);
 toss_op(0);
 toss_op(1);
  $finish;
end
  initial 
    begin 
    //$dumpfile("dump.vcd");
   // $dumpvars;
    $dumpfile("dump.vcd"); $dumpvars;
  end 

endmodule
