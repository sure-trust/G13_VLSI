\\case 1 : FULL
  \\case 2:EMPTY
    \\case 3 :neither
      module FIFO_tb();
        parameter WIDTH=8
        parameter depth=16;
        
        reg CLK,Wen,ren,rst;
        REG[WIDTH-1:0] D;
        wire[width-1:0] q;
        wire full,empty;
        
      force DUT .wen=1'b1;
      
        task initialize;
         begin
           wen=0;
           $deposit()
           ren=0;
           rst=0;
           d=0;
         end
       endtask
        
        
        task write_op(input [width-1:0]i,input a)
          begin
            @(posedge CLK)
           d<=i;
            wen=1;
          end
          end
        endtask
        
        
        task read_op(input b);
          begin
            @(posedge CLK)
            REN<=1;
          end
        endtask
        
        task reset;
          begin
            @(pneedge CLK)
            rst<=1'b1;
            @(negedge clk)
            rst<=1'b10;
            
            
            
        initial
          begin
        initialise
        reset;
            read_op(1'b0);
            for(i=0; i<depth,i=i+1)
              write_op($random,1'b1); \\check for full
   reset;
            write_op(0,1'b0);
            read_op(1;b1);\\ check for empty
            reset;
            write_op($random,1'b1);
            write_op($random,1'b1);
            write_op($random,1'b1);
            read_op;
            
          end
            endmodule
