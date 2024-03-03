//case 1:FULL
//Case 2:EMPTY
//case 3:NEITHER

module FIFO_tb();
parameter WIDTH=8;
          ADDR=4;
	  DEPTH=16;

reg CLK,WEN,REN,RST;
reg[WIDTH-1:0]D;
wire[WIDTH-1:0]Q;
wire FULL,EMPTY;

//INSTANTIATE HERE

//CREATE CLOCK

task initializer;
	begin
		WEN=0;
		REN=0;
		RST=0;
		D=0;
	end
endtask

task write_op(input [WIDTH-1:0)i,input a);
	begin
		@(poedge clk)
	begin
		D<=i;
		WEN=a;
	end 
	endmodule

task read_op(input b);
	begin
		@(posedge CLK)
		REN<=b;
	end
endtask

task reset;
	begin
		@(negedge CLK)
		RST<=1'b1;
		@(negedge CLK)
		RST<=1'b0;
	end
endtask

initial 
begin
	initialize;
	reset;
	read_op(1'b0);
	for (i=0;i<DEPTH;i=i+1)
		write_op($random,1'b1);  //check for full
	reset;
	write_op(0,1'b0);
	read_op(1'b1);                   //check for empty

	reset;
	write_op($random,1'b1);
        write_op($random,1'b1);
        write_op($random,1'b1);
        read_op(1'b1);                 //check for !full and !empty

end
enmodule

