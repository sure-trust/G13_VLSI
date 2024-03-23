module toss_tb;

reg clk, rst, toss;
wire OUT;
  
parameter clk_prd = 10;

  toss dut(.clk(clk),.rst(rst), .toss(toss), .OUT(OUT));

always
begin
  #(clk_prd/2);
	clk = 1'b1;
  #(clk_prd/2);
  clk = 1'b0;
end
 
task coin_toss (input i);
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
  coin_toss(0);
  coin_toss(1);
  coin_toss(1);
  coin_toss(1);
  coin_toss(1);
  coin_toss(0);
  coin_toss(1);
  $finish;
end
  initial begin 
    $dumpfile("dump.vcd"); $dumpvars;
    
  end 

endmodule
