module spr_16X8_tb();
reg CLK, WEN;
reg [7:0] Din;
reg [3:0] A;
wire [7:0] Dout;

parameter CLK_PERIOD = 20;
parameter WRITE_DLY = 10;
parameter READ_DLY= 10;

  
spr_16x8 DUT(CLK, Din, A, WEN, Dout);

always        //clock generation
begin
	#(CLK_PERIOD/2);
	CLK = 0;
	#(CLK_PERIOD/2);
	CLK = 1;
end
  
initial begin
  CLK =0;
end

task initialise;    //initialise task
begin
	WEN = 0;
	Din = 0;
	A = 0;
end
endtask


task write_op (input [3:0] a, input [7:0] d);   //write task   
	begin
	@ (posedge CLK)
	begin
		WEN = 1;
		A <= a;
		Din <= d;
		#(WRITE_DLY);
      //$display("WRITE :: Address:%0d  data: %0h",A,Din);
	end
	end
endtask

 
  
task read_op (input [3:0] a);  //read task
	begin
	@ (posedge CLK)
	begin
	  WEN = 0;
	  A <= a;
      #(READ_DLY);
      //$display("READ :: Address:%0d  data: %0h",A,Dout);
	end
	end
endtask

initial
begin
  initialise;
  write_op(4'b0001, 8'h10);
  write_op(4'b0010, 8'h12);
  write_op(4'b0100, 8'h14);
  write_op(4'b1000, 8'h16);
  read_op(4'b0001);
  read_op(4'b0010);
  read_op(4'b0100);
  read_op(4'b1000);
end
  
initial begin
   $dumpfile("dump.vcd");
   $dumpvars; 
   #250 $finish;
end
  
endmodule


