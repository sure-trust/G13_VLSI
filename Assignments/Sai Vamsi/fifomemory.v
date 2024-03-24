module fifomemory(clk_i,rst_i,wr_en_i,wdata_i,rd_en_i,rdata_o,full_o,empty_o,wr_error_o,rd_error_o);
parameter DEPTH=16;
parameter PTR_WIDTH=$clog2(DEPTH);
parameter WIDTH=8;
input clk_i,rst_i;
input wr_en_i,rd_en_i;
input [WIDTH-1:0]wdata_i;
output reg [WIDTH-1:0]rdata_o;
output reg wr_error_o,rd_error_o;
output reg full_o,empty_o;
reg [WIDTH-1:0]mem[DEPTH-1:0];
reg [PTR_WIDTH-1:0]wr_ptr;
reg [PTR_WIDTH-1:0]rd_ptr;
reg wr_toggle_f,rd_toggle_f;
integer i;
always @(posedge clk_i)begin
	if(rst_i==1)begin
		rdata_o=0;
		wr_error_o=0;
		rd_error_o=0;
		wr_ptr=0;
		rd_ptr=0;
		wr_toggle_f=0;
		rd_toggle_f=0;
		for(i=0;i<DEPTH;i=i+1)
			mem[i]=0;
	end
	else begin
		wr_error_o=0;
		rd_error_o=0;
		if(wr_en_i==1)begin
			if(full_o==1)begin
				wr_error_o=1;
			end
			else begin
				//wr_error_o=0;
				mem[wr_ptr]=wdata_i;
				wr_ptr=wr_ptr+1;
				if(wr_ptr==0) wr_toggle_f = ~wr_toggle_f;
			end
		end
		if(rd_en_i==1)begin
			if(empty_o==1)begin
				rd_error_o=1;
			end
			else begin
				//rd_error_o=0;
				rdata_o=mem[rd_ptr];
				rd_ptr=rd_ptr+1;
				if(rd_ptr==0) rd_toggle_f = ~rd_toggle_f;
			end
		end
		else 
			rdata_o=0;
	end
end
assign full_o=(wr_ptr == rd_ptr) && (wr_toggle_f != rd_toggle_f);
assign empty_o=(wr_ptr == rd_ptr) && (wr_toggle_f == rd_toggle_f);
endmodule
