module fifo(clk,d,q,wen,ren,rst,full,empty);

paramter depth = 16;
paramter width = 8;
parametr addr = 4;

input clk,wen,ren,rst;
input [width-1 :0] d;

output reg [width-1 : 0] q;
output full empty;

//pointer reg

reg [addr-1 : 0] we_pointer;
reg [addr-1 : 0] rd_pointer;
reg [addr-1 : 0] status_counter;

reg [width-1 : 0] mem [depth-1 : 0];

//write addr generator

always@(posedge clk)
	begin
		if(rst)
			wr_pointer <= wr_pointer+1;
		end
	end

//read addr generator
always@(posedge clk)
	begin
		if(rst)
			rd_pointer <= rd_pointer+1;
		end
	end

//write & read operation

always@(posedge clk)
	begin
		if(wen)
			me,[wr_pointer] <= d;
			if(ren)
			q <= mem[rd_pointer];
		end

//status counter logic

always@(posedge clk)
	begin
		if(rst)
			status_counter <= 0;
		else
		begin
			if((wen && !ren) && (status_counter != depth))
				status_counter <= status_counter+1;
			if((ren && !wen) && (status_counter == 0 ))
				status_counter <= status_counter-1;
			if(wen && ren)
				status_counter <= status_counter
			end
		end
assign full = (status_counter ==depth) ? 1'b1 : 1'b0;
assign empty = (status_counter ==0) ? 1'b1 : 1'b0;

endmodule






























