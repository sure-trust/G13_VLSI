module evenoddcountertb();
reg clk,rst,Oe;
wire [2:0] out;

parameter clock = 5;

always #(clock/2) clk<=~clk;

evenoddcounter dut(clk,Oe,rst,out);

task initialize;
  begin
    rst<=0;
    clk<=0;
    Oe<=0;
  end
endtask

task reset;
	begin
		@(posedge clk)
		rst=1;
		@(posedge clk)
		rst=0;
	end
endtask
task odd_even(input i);
	begin
		@(posedge clk)
		Oe=i;
	end
endtask

initial 
begin
	initialize;
	reset;
	//odd transition
	odd_even(1);   //s0 to s1;
	odd_even(1);   //s1 to s3;
	odd_even(1);    // s3 to s5;
        odd_even(1);    //s5 to s7
	odd_even(1);    //s7 to s0

	// even transition
       	repeat(5)
		begin
			odd_even(0);	
		end

	//repeated transition
	odd_even(1); 
	odd_even(0); 
	odd_even(1); 
	odd_even(0); 
	odd_even(1); 
	odd_even(0); 
	odd_even(1); 
	odd_even(0); 
	odd_even(1);
        odd_even(0);
	$finish;
end
endmodule
