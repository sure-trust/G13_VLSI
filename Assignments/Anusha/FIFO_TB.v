//case_1 - EMPTY
//case_2 - FULL 
//case_3 - Neither

module FIFO_TB();

parameter width = 8;
parameter depth = 16;
parameter addr = 4;
parameter clk_period =10;
integer i;

reg CLK,RST,WEN,REN;
reg [width-1:0]D;
output reg FULL;
output reg EMPTY;
output [width-1:0]Q;

reg [addr-1:0]wr_pointer;
reg [addr-1:0]rd_pointer;
reg status_counter;

reg [width-1:0]mem[depth-1:0];

FIFO uut(CLK,RST,D,Q,WEN,REN,FULL,EMPTY);

// clk generation
always #(clk_period/2) CLK <= ~ CLK;

//initialization
task initialize();
begin
CLK =0;
RST =0;
WEN =0;
REN =0;
D =0;
end
endtask

//reset 
task reset();
begin
@(negedge CLK)
RST<=1'b1;
@(negedge CLK)
RST<=1'b0;
end
endtask

//write operation
task write();
@(posedge CLK);
WEN <=1;
D <=$random%256;
endtask

//read operation
task read();
@(posedge CLK);
REN <=1;
endtask

initial begin
initialize();
reset();
for(i=0; i<=depth-1 ; i=i+1)
begin
write(); // full case

reset();
read(); // empty case

reset();
write();
read(); // Neither FUll nor Empty case

end
endmodule

      

