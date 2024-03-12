module tb_fifo;

  // Parameters
  parameter depth = 16;
  parameter width = 8;
  parameter addr = 4;

  reg clk, wen, ren, rst;
  reg [width-1:0] d;
  wire [width-1:0] q;
  wire full, empty;

  // Instantiate FIFO module
  fifo uut (.clk(clk), .wen(wen),.ren(ren),.rst(rst), .d(d),.q(q), .full(full),.empty(empty));

  // Clock Generation
  initial 
    begin
    clk = 0;
  #5 clk = ~clk;
  end

  // Task to perform FIFO write operation
  task write_operation input [width-1:0] data;
  begin
  @(posedge clk)
 		 begin
    wen = 1;
    d <= data;
    #20 wen = 0;
		end
	end
  endtask

  // Task to perform FIFO read operation
 
  task read_operation output [width-1:0] data;
  begin
  @(posedge clk)
    ren = 1;
    #20 ren = 0;
    data = q;
	end
  endtask
 
 task reset; 
   initial 
    begin
	@(negedge clk)
     rst = 1;
    #10 rst = 0;
	endtask

initial 
	begin 
	rest;
	read_operation (1'b0);
	for (i=0; i<depth; i=i+1)
		write_operation ($random, 1'b1);
		
		reset
		write_operation(0,1'b0);
		read_operation(1'b1);

		reset;
		write_operation ($random, 1'b1);
		write_operation ($random, 1'b1);
		write_operation ($random, 1'b1);
		read_operation(1'b1);
		end 

      // End simulation
    #50 $finish;
  end

endmodule



