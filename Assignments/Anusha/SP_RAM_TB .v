module SP_RAM_16x8_tb;

parameter Data_width =8;
parameter ADDR_width = 4;
parameter clk_period =10;
parameter write_delay =5;
parameter read_delay =5;
integer adr;
integer i;

reg CLK,WRE;
reg [Data_width-1:0]D;
reg [ADDR_width-1:0]ADR;
wire [Data_width-1:0]Q;

SP_RAM_16x8  spa(.D(D),.CLK(CLK),.ADR(ADR),.WRE(WRE),.Q(Q));
  
//initialize 
  task initialize(input i);
 begin
   CLK =0;
   WRE =0;
   ADR =0;
 end
 endtask
 
 //forever #(clk_period/2)  CLK = ~ CLK;
 
 always  #(clk_period/2)  CLK = ~ CLK;
   
//write operation
  task write(input i);
  begin
 // @(posedge CLK);
  // begin
   WRE = 1;
   begin
   for(adr=0; adr<=7; adr=adr+1)
    begin
    @(posedge CLK);
      ADR <=adr;
      D <= $random;
      //#(write_delay); 
   end
    end
  end
endtask

//read operation
  task read(input i);
  begin
   //@(posedge CLK);
    //begin
    WRE <= 0;
    begin
    for(adr=0; adr<=7; adr=adr+1)
     begin
      @(negedge CLK);
      ADR <=adr;
     end
     end
  end
endtask

initial
  begin
    initialize(0);
    write(0);
    read(0);
  end
endmodule  
