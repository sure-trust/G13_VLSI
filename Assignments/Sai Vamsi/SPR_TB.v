module memory_tb;
parameter WIDTH=32;
parameter DEPTH=2**7;
parameter ADDR_SIZE=$clog2(DEPTH);
reg clk_i;
reg [ADDR_SIZE-1:0]addr;
reg [WIDTH-1:0]wdata;
integer i;
reg wr_rd_en;

wire [WIDTH-1:0]rdata;

memory dut(clk,wr_rd_en,addr,wdata,rdata);
initial begin
	clk_i=0;
	forever #5 clk_i=~clk_i;
end
initial begin

	write_mem(0,15);
	read_mem(0,15);
	#100;
	$finish;
end
task write_mem(input reg [ADDR_SIZE-1:0]start_loc,input reg [ADDR_SIZE-1:0]num_locations);
begin
	for(i=0;i<num_locations;i=i+1)begin//0,1,2==3;
		@(posedge clk);
			addr=start_loc+i;//1+2=
			wdata=$random;
			wr_rd_en=1;
			
	end
	end
endtask
task read_mem(input reg [ADDR_SIZE-1:0]start_loc,input reg [ADDR_SIZE-1:0]num_locations);
begin
	for(i=0;i<num_locations;i=i+1)begin
		@(posedge clk)
			addr_i=start_loc+i;
			wr_rd_en=0;
				end
		end
endtask
endmodule
