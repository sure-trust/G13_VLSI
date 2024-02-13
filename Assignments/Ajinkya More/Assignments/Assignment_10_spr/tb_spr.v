`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/11/2024 07:36:10 PM
// Design Name: 
// Module Name: tb_spr
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module tb_spr();
  reg clk,Wen;
  reg [7:0] D;
  reg [3:0] A;
  wire [7:0] Q;
  
  parameter clock = 5;
  parameter WRITE_DLY = 2;
  parameter READ_DLY = 2;
  
  spr dut(.clk(clk),.D(D),.A(A),.Q(Q),.Wen(Wen));
  
  always 
    begin
      #(clock/2);
      clk=~clk;
    end
  
task initialise;    //initialise task
begin
	Wen = 0;
	D = 0;
	A = 0;
end
endtask
  
  initial 
    begin
      clk=0;
    end
  
  initial 
    $monitor("Time = %0d , D = %d, A = %d , Wen = %d , Q = %d ",$time,D,A,Wen,Q);
  
task write_task (input [3:0] a, input [7:0] d);   //write task   
	begin
      @ (posedge clk)
	begin
        Wen = 1;
        A<=a;
        D<=d;
        #(WRITE_DLY);
      end
    end
endtask
  
task read_op (input [3:0] a);  //read task
	begin
      @ (posedge clk)
      begin
        Wen = 0;
        A<=a;
        #(READ_DLY);
      end
    end
endtask
    
   initial 
     begin
       write_task(8'h01,8'b10000001);
       read_op(8'h01);
       write_task(8'h02,8'b11111111);
       read_op(8'h02);
       write_task(8'h03,8'b10101111);
       read_op(8'h03);
       write_task(8'h04,8'b10001001);
       read_op(8'h04);
       #10 $finish;
     end
endmodule
