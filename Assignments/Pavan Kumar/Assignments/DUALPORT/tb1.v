// Code your testbench here
// or browse Examples
module tb1();
  reg WENA,WENB,CLKA,CLKB;
  reg [5:0]AA,AB;
  reg [7:0] DA,DB;
  wire [7:0]QA,QB;
  
  parameter clk_period=20;
   parameter write_delay=10;
  parameter read_delay=10;
  //int i=0,j=0;
  dpr_32_8 dut(DA,DB,CLKA,CLKB,QA,QB,AA,AB,WENA,WENB);
  
  // clock generation FOR CLKA,CLKB
      always
    begin
      #(clk_period/2);
      CLKA=0;
      #(clk_period/2)
      CLKA=1;
    end
  
    always
    begin
      #(clk_period/2);
      CLKB=0;
      #(clk_period/2)
      CLKB=1;
    end
  
  task initialise;    //initialise task AB_in,DB_in
begin
  WENA=0; WENB=0;
  DA=0; DB=0;
  AA=0; AB=0;
end
endtask
  
  // task for write in port1 
  task write_port1(input [4:0]A_in, 
                input [7:0]D_in);
    begin
      @(posedge CLKA) 
      begin
      WENA=1;
      AA<=A_in;
      DA<=D_in;
      #(write_delay);
      end
    end
    endtask
  
      // task for read IN PORT1
  task read_port1(input [4:0]A_in );
    begin
      @(posedge CLKA)
     begin
       WENA=0;
      AA<=A_in;
      #(read_delay);
     end
    end
  endtask
  // task for wrtiting in port2
  task write_port2(input [4:0]A_in, 
                   input [7:0]D_in);
    begin
      @(posedge CLKB) 
      begin
      WENB=1;
      AB<=A_in;
      DB<=D_in;
      #(write_delay);
      end
    end
    endtask
  // TASK FOR READING IN PORT2
    task read_port2(input [4:0]A_in );
    begin
      @(posedge CLKB)
     begin
       WENB=0;
      AB<=A_in;
      #(read_delay);
     end
    end
  endtask
      
      initial
        begin
          initialise(); 
        /* repeat(10);
		 write_op({$random}%256,{$random}%32,1'b1,1'b0);
        repeat(10);
		read_op({$random}%32,1'b1);
  
  */
          
            
    for (int i = 0; i < 16; i++) 
      begin
      write_port1(i, $random);
      end
 
    for (int j = 16; j < 32; j++) 
      begin
      write_port2(j, $random);
      end
  
           
    for (int i = 0; i < 16; i++) 
      begin
      read_port1(i);
      end
    
    for (int j = 16; j < 32; j++) 
      begin
      read_port2(j);
      end
        end
  
  initial begin
            $dumpfile("dpr_32_8.vcd");
             $dumpvars();
            #2000;  $finish;
end

  
      endmodule
      
      
