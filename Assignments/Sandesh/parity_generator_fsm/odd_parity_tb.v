module odd_parity_tb();
reg tb_clk,tb_in,tb_arstn;
wire  tb_out;

parameter clock = 10;

always #(clock/2) tb_clk<=~tb_clk;

odd_parity dut(.clk(tb_clk),.in(tb_in),.arstn(tb_arstn),.out(tb_out));

task initialize;
  begin
    tb_arstn<=0;
    tb_clk<=0;
    tb_in<=0;
    #2 tb_arstn<=1;
  end
endtask

task even;
    begin
        @(posedge tb_clk) tb_in <= 1'b0; @(posedge tb_clk) tb_in <= 1'b0;@(posedge tb_clk) tb_in <= 1'b0; @(posedge tb_clk) tb_in <= 1'b0;   
        @(posedge tb_clk) tb_in <= 1'b1; @(posedge tb_clk) tb_in <= 1'b1;@(posedge tb_clk) tb_in <= 1'b0; @(posedge tb_clk) tb_in <= 1'b0;
        @(posedge tb_clk) tb_in <= 1'b0; @(posedge tb_clk) tb_in <= 1'b1;@(posedge tb_clk) tb_in <= 1'b1; @(posedge tb_clk) tb_in <= 1'b0;
    end
 endtask


task odd;
    begin
        @(posedge tb_clk) tb_in <= 1'b1; @(posedge tb_clk) tb_in <= 1'b0;@(posedge tb_clk) tb_in <= 1'b0; @(posedge tb_clk) tb_in <= 1'b0;   
        @(posedge tb_clk) tb_in <= 1'b1; @(posedge tb_clk) tb_in <= 1'b1;@(posedge tb_clk) tb_in <= 1'b0; @(posedge tb_clk) tb_in <= 1'b0;
        @(posedge tb_clk) tb_in <= 1'b1; @(posedge tb_clk) tb_in <= 1'b1;@(posedge tb_clk) tb_in <= 1'b1; @(posedge tb_clk) tb_in <= 1'b0;
    end
 endtask

integer i;
initial 
    begin
        #5 initialize;
           even;
           odd;
           for(i=0;i<50;i=i+1) 
            begin
                tb_in <= $urandom_range(0,1);
                #6;
            end
        #20 $finish;  
    end
  
  initial 
    begin
    $dumpfile("dump.vcd"); $dumpvars;  
    end
endmodule


