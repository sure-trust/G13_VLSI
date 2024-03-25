module Chip_Top_Wrapper_tb;
    reg TCK_tb, TMS_tb, TDI_tb;
    wire TDO_tb;
    
Chip_Top_Wrapper dut (
        .TCK(TCK_tb),
        .TMS(TMS_tb),
        .TDI(TDI_tb),
        .TDO(TDO_tb));

always
	begin
		TCK_tb = 0;
		#10;
		TCK_tb = 1;
		#10;
	end


task initialize;
    begin
        TDI_tb<=1'b0;
        TCK_tb<=1'b1;
        TMS_tb<=1'b1;
    end
endtask

initial begin
    initialize;
    @(posedge TCK_tb) TMS_tb<=1'b0;
    @(posedge TCK_tb) TMS_tb<=1'b0;
    @(posedge TCK_tb) TMS_tb<=1'b0;
    @(posedge TCK_tb) TMS_tb<=1'b1;
    @(posedge TCK_tb) TMS_tb<=1'b1;
    @(posedge TCK_tb) TMS_tb<=1'b0;
    @(posedge TCK_tb) TMS_tb<=1'b0;
    @(posedge TCK_tb) TMS_tb<=1'b0;   
                      TDI_tb<=1'b1;
    @(posedge TCK_tb) TMS_tb<=1'b0;   
                      TDI_tb<=1'b1;
    @(posedge TCK_tb) TMS_tb<=1'b0;  
                      TDI_tb<=1'b1;
    @(posedge TCK_tb) TMS_tb<=1'b0;  
                      TDI_tb<=1'b1;
    @(posedge TCK_tb) TMS_tb<=1'b0;  
                      TDI_tb<=1'b1;
    @(posedge TCK_tb) TMS_tb<=1'b1;  
    @(posedge TCK_tb) TMS_tb<=1'b1;  
    @(posedge TCK_tb) TMS_tb<=1'b0; 
    @(posedge TCK_tb) TMS_tb<=1'b1;
    @(posedge TCK_tb) TMS_tb<=1'b1;
    @(posedge TCK_tb) TMS_tb<=1'b0;   
                      TDI_tb<=1'b0;
    @(posedge TCK_tb) TMS_tb<=1'b0;   
                      TDI_tb<=1'b0;
    @(posedge TCK_tb) TMS_tb<=1'b0;   
                      TDI_tb<=1'b1;
    @(posedge TCK_tb) TMS_tb<=1'b0;   
                      TDI_tb<=1'b1;
    @(posedge TCK_tb) TMS_tb<=1'b0;   
                      TDI_tb<=1'b1;
    @(posedge TCK_tb) TMS_tb<=1'b0;  
                      TDI_tb<=1'b1;
    @(posedge TCK_tb) TMS_tb<=1'b0;  
                      TDI_tb<=1'b0;
   @(posedge TCK_tb) TMS_tb<=1'b0;  
                      TDI_tb<=1'b1;
    @(posedge TCK_tb) TMS_tb<=1'b1; 
    @(posedge TCK_tb) TMS_tb<=1'b1; 
    @(posedge TCK_tb) TMS_tb<=1'b1; 
    @(posedge TCK_tb) TMS_tb<=1'b0; 
    @(posedge TCK_tb) TMS_tb<=1'b0;      
                      TDI_tb<=1'b1;
    @(posedge TCK_tb) TMS_tb<=1'b0;     
                      TDI_tb<=1'b1;
    @(posedge TCK_tb) TMS_tb<=1'b0;     
                      TDI_tb<=1'b1;
    @(posedge TCK_tb) TMS_tb<=1'b0;      
                      TDI_tb<=1'b1;
    @(posedge TCK_tb) TMS_tb<=1'b1;     
					  TDI_tb<=1'b0;
    @(posedge TCK_tb) TMS_tb<=1'b1;
    @(posedge TCK_tb) TMS_tb<=1'b1; 
    @(posedge TCK_tb) TMS_tb<=1'b1;
    #10 $finish ;
end
  initial begin
  $dumpfile("dump.vcd"); $dumpvars;  
  end
endmodule

