module dualportram_tb();
reg clk1,clk2,wen1,wen2;
parameter a_width=4;
parameter d_width=8;
parameter a_depth=16;
  reg [d_width-1:0]di1,di2; 
reg [a_width-1:0]a1,a2;
  wire [d_width-1:0]do1,do2; 
integer i;
  reg [7:0]Di1,Di2;
reg [3:0]a1,a2;
parameter clk_period=20;
parameter write_delay=10;
parameter read_delay=10;

  dualportram dut(clk1,clk2,di1,di2,a1,a2,wen1,wen2,do1,do2); 
always
begin
	#(clk_period/2);
	clk1=0;
	#(clk_period/2);
	clk1=1;
end

always
begin
	#(clk_period/2);
	clk2=1;
	#(clk_period/2);
	clk2=0;
end


// task for initializiing the initial conditions to start from

task initialize;
	begin
		wen1=0;
		wen2=0;
		di1=0;
		di2=0;
		a1=0;
		a2=0;
	end
endtask

// task for writing data into memory_port1

  task mem_writeA(input [3:0]A1, input [7:0]Di1);
begin 
	@(posedge clk1)
	begin
		wen1<=1;
		a1<=A1;
		di1<=Di1;
		#(write_delay);

end
endtask

// task for writing data into memory_port2

  task mem_writeB(input [3:0]A2, input [7:0]Di2);
begin 
	@(posedge clk2)
	begin
		wen2<=1;
		a2<=A2;
		di2<=Di2;
		#(write_delay);
end
endtask

// task for reading data from the memory_port1

task mem_readA(input [3:0]A1);
begin 
	@(posedge clk1)
	begin
		wen1<=0;
		a1<=A1;
		#(read_delay);
	end
end
endtask

// task for reading data from the memory_port2

task mem_readB(input [3:0]A2);
begin 
	@(posedge clk2)
	begin
		wen2<=0;
		a2<=A2;
		#(read_delay);
	end
end
endtask


initial
    begin
      
      write_opa(4'b0000, 8'h00);
      #10;
      
      read_opa(4'b0000);
      #10;
      
      write_opa(4'b0010, 8'h01);
      #10;
      
      write_opb(4'b0100, 8'h10);
      #10;
      
      read_opb(4'b0100);
      #10;
      
      write_opb(4'b0011, 8'h

	
	end

  $monitor("time=%d,di1=%d,di2=%d,a1=%d,a2=%d,wen1=%d,wen2=%d,do1=%d,do2=%d",$time,di1,di2,a1,a2,wen1,wen2,do1,do2);
end
	
 initial begin
   $dumpfile("dump.vcd");
   $dumpvars;
 end
endmodule

