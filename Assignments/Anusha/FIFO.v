module FIFO(CLK,RST,D,Q,WEN,REN,FULL,EMPTY);//synchronus

parameter width = 8;
parameter depth = 16;
parameter addr = 4;


input CLK,RST,WEN,REN;
input [width-1:0]D;
output reg FULL;
output reg EMPTY;
output [width-1:0]Q;

reg [addr-1:0]wr_pointer;
reg [addr-1:0]rd_pointer;
reg status_counter;

reg [width-1:0]mem[depth-1:0];

//write_addr generator
always @(posedge CLK)
begin
if(RST)
wr_pointer <= 0;
else
begin
if(WEN)
wr_pointer <= wr_pointer+1;
end
end

//read_addr generator
always @(posedge CLK)
begin
if(RST)
rd_pointer <= 0;
else 
begin
if(REN)
rd_pointer <= rd_pointer+1;
end
end

//write_read operation
always @(posedge CLK)
begin
if(WEN)
mem[wr_pointer] <= D;
if(REN)
Q <= mem[rd_pointer];
end

//status counter
always @(posedge CLK)
begin
if(RST)
status_counter <=0;
else
begin
if((WEN && !REN) && (status_counter != depth));
status_counter <= status_counter+1;
if((!WEN && REN) && (status_counter != 0);
status_counter <= status_counter-1;
if((WEN && REN) || (!WEN && !REN))
status_counter <= status_counter;
end
end

assign FULL = (status_counter == depth) ? 1'b1 :1'b0;
assign EMPTY = (status_counter == 0) ? 1'b1 : 1'b0;

endmodule
