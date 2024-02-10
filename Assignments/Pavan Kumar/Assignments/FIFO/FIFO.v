module FIFO(CLK,RST,FULL,EMPTY,Q,REN,WEN,D);
parameter DEPTH=16;
parameter WIDTH=8;
parameter ADDR=4;
input CLK,RST,WEN,REN;
input [WIDTH-1:0]D;
output FULL,EMPTY;
output reg [WIDTH-1:0]  Q;

reg [WIDTH-1:0] mem[DEPTH-1:0];
reg [ADDR-1:0]wr_pointer;
reg [ADDR-1:0]rd_pointer;
reg [ADDR:0] status_cnt;


//write address generator in fifo
always@(posedge CLK)
begin
if(RST==1)
wr_pointer<=4'b0000;
else 
begin
if(WEN)
wr_pointer<=wr_pointer+1;
end
end
// read address generator in the fifo
always@(posedge CLK)
begin
if(RST==1)
rd_pointer<=4'b0000;
else 
begin
if(REN)
rd_pointer<=rd_pointer+1;
end
end
//write and read operation in fifo
always@(posedge CLK)
begin
if(WEN)
mem[wr_pointer]<=D;
if(REN)
Q<=mem[rd_pointer];
end

//status counter in fifo

always@(posedge CLK)
begin
if(RST)
status_cnt=0;
else
begin
if(WEN && !REN && status_cnt!=DEPTH)
status_cnt=status_cnt+1;
if(REN && !WEN && status_cnt==0)
status_cnt=status_cnt-1;
if(REN&&WEN)
status_cnt=status_cnt;
end
end
assign FULL=(status_cnt==DEPTH)? 1'b1:1'b0;
assign EMPTY=(status_cnt==DEPTH)? 1'b1:1'b0;

endmodule


