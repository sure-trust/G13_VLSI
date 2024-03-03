// Code your testbench here
// or browse Examples
module tb();
  reg clk,wren;
  reg [3:0] a;
  reg [7:0] d;
  wire [7:0]q;
  
  parameter clk_period=20;
   parameter write_delay=10;
  parameter read_delay=10;

 // int i=0,j=0;
  spr_16_8q d1(.clk(clk),.d(d),.q(q),.a(a),.wren(wren));
  
  // clock generation 
  always
    begin
      #(clk_period/2);
      clk=0;
      #(clk_period/2);
      clk=1;
    end
  
  task initialise;    //initialise task
begin
	wren = 0;
	d = 0;
	a = 0;
end
endtask
  // task for write
  task write_op(input [3:0]A, input [7:0]D);
    begin
      @(posedge clk) begin
      wren=1;
      a<=A;
      d<=D;
      #(write_delay);
      end
    end
    endtask
  
      // task for read
  task read_op(input [3:0]A);
    begin
      @(posedge clk)
      begin
      wren=0;
      a<=A;
      #(read_delay);
    end
    end
  endtask
  
  initial
        begin
          initialise(); 
 /* i am giving individyual inputs 
          write_op(4'b0000, 8'h07);
          write_op(4'b0011, 8'h08);
          read_op(4'b0000);
          read_op(4'b0011);
          write_op(4'b0111, 8'h03);
          write_op(4'b1111, 8'h01);
          read_op(4'b0111);
          read_op(4'b1111); */
          
          // i am using random values to generate the inputs
          for(int i=0; i<16; i++)
            begin
              write_op(i,$random);
            end
          for (int j=0; j<16; j++)
            begin
              read_op(j);
            end
              #500;  $finish;
          
          
         // repeat(10)
           // begin
          //write_op($random,$random);
          //read_op($random);
            //end
       
        end
  initial begin
          $dumpfile("dump.vcd");
          $dumpvars();
      
        end
  
  
 endmodule
      
           
