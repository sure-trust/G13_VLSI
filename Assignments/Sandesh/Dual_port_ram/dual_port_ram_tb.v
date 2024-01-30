module tb;
  parameter Addr_Width = 4;
  parameter Data_Width = 8;
  
  reg clk1,clk2,we1,we2;
  reg [Addr_Width-1:0] Ad1,Ad2;
  reg [Data_Width-1:0] Din1,Din2;
  wire [Data_Width-1:0] Dout1,Dout2;
  
  
  parameter CLK_PERIOD = 20;
  parameter WRITE_DLY = 10;
  parameter READ_DLY= 10;
  
  
  dual_port_ram DUT(.Dout1(Dout1),.Dout2(Dout2),.Din1(Din1),.Din2(Din2),.clk1(clk1),.clk2(clk2),.Ad1(Ad1),.Ad2(Ad2),.we1(we1),.we2(we2));
  
//clock generation clk1, clk2  
  always  #(CLK_PERIOD/2)  clk1 = ~ clk1;
  always  #(CLK_PERIOD/2)  clk2 = ~ clk2;
//always # 5 clk1 = ~clk1; 
//always # 5 clk2 = ~clk2;

// Task initialise 
 task initialize();
 begin
   clk1 = 0;
   clk2 = 0;
   we1 = 0;
   we2 = 0;
   Ad1 = 0;
   Ad2 = 0;
   Din1 = 0;
   Din2 = 0;
 end
 endtask
  
  

// Task write operation port 1
  task write_operation_port1;
    input [Addr_Width-1:0] address;
    input [Data_Width-1:0] data;
    
    begin
      @ (posedge clk1)
      begin
        we1 = 1;
        Ad1 <= address;
        Din1 <= data;   
        #(WRITE_DLY);  // Wait 
      end
    end
  endtask

// Task write operation port 2
  task write_operation_port2;
    input [Addr_Width-1:0] address;
    input [Data_Width-1:0] data;
    
    begin
      @ (posedge clk2)
      begin
        we2 = 1;
        Ad2 <= address;
        Din2 <= data;   
        #(WRITE_DLY);  // Wait
      end
    end
  endtask

// Task read operation port 1
  task read_operation_port1;
    input [Addr_Width-1:0] address;
    begin
      @ (posedge clk1)
      begin
        we1 <= 0;
	    Ad1 <= address;
      #(READ_DLY);
      //$display("READ :: Address:%0d  data: %0h",A,Dout);
	  end
	end
  endtask

// Task read operation port 2
  task read_operation_port2;
    input [Addr_Width-1:0] address;
    begin
      @ (posedge clk2)
      begin
        we2 <= 0;
	    Ad2 <= address;
      #(READ_DLY);
      //$display("READ :: Address:%0d  data: %0h",A,Dout);
	  end
	end
  endtask

  
  initial
    begin
      initialize();
      //repeat (5) begin
        repeat (3) begin
            write_operation_port1($random, $random);
            write_operation_port2($random, $random);
        end

      repeat (3) begin
            read_operation_port1($random);
            read_operation_port2($random);
        end
      //end
      
      $finish;
    end

  
  initial begin
   $dumpfile("dump.vcd");
   $dumpvars; 
   //#800 $finish;
end
    
endmodule
