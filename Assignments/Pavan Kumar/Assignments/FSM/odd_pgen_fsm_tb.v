// Code your testbench here
// or browse Examples
module tb_op_gen();
reg clk,in,rst;
wire  out;

parameter clock_prd = 10;

always
  begin
    clk=1;
    #(clock_prd/2);
    clk=0;
      #(clock_prd/2);
  end
  

odd_parity dut(.clk(tb_clk),.in(tb_in),.arstn(tb_arstn),.out(tb_out));

task initialize;
  begin
   rst<=0;
   clk<=0;
   in<=0;
    #1 rst<=1;
  end
endtask

task even_op;
    begin
      @(posedge clk) in <= 1'b0;
      @(posedge clk) in <= 1'b0;
      @(posedge clk) in <= 1'b1;
      @(posedge clk) in <= 1'b0;
      @(posedge clk) in <= 1'b0;
      @(posedge clk) in <= 1'b0;
      @(posedge clk) in <= 1'b1;   
      @(posedge clk) in <= 1'b1;
      @(posedge clk) in <= 1'b1;
      @(posedge clk) in <= 1'b0; 
      @(posedge clk) in <= 1'b0;
      @(posedge clk) in <= 1'b0;
      @(posedge clk) in <= 1'b1;
      @(posedge clk) in <= 1'b1;
      @(posedge clk) in <= 1'b0;
      @(posedge clk) in <= 1'b0;
      @(posedge clk) in <= 1'b0;
      @(posedge clk) in <= 1'b1;
    end
 endtask


task odd_op;
    begin
      @(posedge clk) in <= 1'b0;
      @(posedge clk) in <= 1'b0;
      @(posedge clk) in <= 1'b1;
      @(posedge clk) in <= 1'b1;
      @(posedge clk) in <= 1'b0;
      @(posedge clk) in <= 1'b0;
      @(posedge clk) in <= 1'b0;   
      @(posedge clk) in <= 1'b1;
      @(posedge clk) in <= 1'b1;
      @(posedge clk) in <= 1'b0;
      @(posedge clk) in <= 1'b0;
      @(posedge clk) in <= 1'b1;
      @(posedge clk) in <= 1'b1;
      @(posedge clk) in <= 1'b1;
      @(posedge clk) in <= 1'b0;
      @(posedge clk) in <= 1'b0;
      @(posedge clk) in <= 1'b0;
      @(posedge clk) in <= 1'b1;
    end
 endtask

integer i;
initial 
    begin
        #5 initialize;
           even_op;
           odd_op;
      for(i=0;i<100;i=i+1) 
            begin
            in <= $random(0,1);
             #5;
            end
        #50 $finish;  
    end
endmodule

