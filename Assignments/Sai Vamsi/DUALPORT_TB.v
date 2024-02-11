
module tb;
  
  reg CLKA,CLKB,WENA,WENB;
  reg [4]AA,AB;
  reg  [8]DA,DB;
  wire [8]QA,QB;
   
  parameter CLK_PERIOD = 20;
  parameter WRITE_DLY = 10;
  parameter READ_DLY= 10;
  
  
  dual_port_ram DUT(CLKA,CLKB,WENA,WENB,AA,AB,DA,DB,QA,QB);
   
  always  #(CLK_PERIOD/2)  CLKA = ~ clk1;
  always  #(CLK_PERIOD/2)  CLKB = ~ clk2;
  
  

//WRITE FOR CLKA
  task write_port1;
        
    begin
	for(i=0;i<32;i=i+1)begin
      @ (posedge CLKA)
      begin
        WENA = 1;I
        AA <= i;
        DA <= $random;   
        #(WRITE_DLY);  
      end
	  end
    end
  endtask

//write CLKB
  task write_port2;
       begin
	   for(i=0;i<32;i=i+1)begin
      @ (posedge CLKB)
      begin
        WENB = 1;
        AB<=i;
        DB <= $random;   
        #(WRITE_DLY);  // Wait
      end
	  end
    end
  endtask

// READ FOR CLKA
  task read_port1();
    begin
      @ (posedge CLKA)
      begin
	  for(i=0;i<32;i=i+1)begin
        WENA <= 0;
	    AA <= i;
      #(READ_DLY);
      	  end
	  end
	end
  endtask

// READ FOR CLKB
  task read_port2();
       begin
      @ (posedge CLKB)
      begin
        WENB <= 0;
	   AB<=i;
	   #(READ_DLY);
     	  end
	end
  endtask

  
  initial
    begin
     
        repeat (5) begin
            write_port1();
            write_port2();
        end

      repeat (5) begin
            read_port1();
            read_port2();
        end
     
       
      $finish;
    end

  
  initial begin
   $dumpfile("dump.vcd");
   $dumpvars(); 
end
    
endmodule

