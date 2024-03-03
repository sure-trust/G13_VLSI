module MEM8X16(CLK,wr_rd_en,addr,wdata,rdata);
input CLK;
input wr_rd_en;
input [3:0]addr;
input [7:0]wdata;
output reg [7:0]rdata;

 reg [7:0]mem[15:0];
  always @(posedge CLK)begin
    if(wr_rd_en==1)begin
	  mem[addr]=wdata;
	end
	else begin
	  rdata=mem[addr];
	end
  end
endmodule

