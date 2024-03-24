  //BYPADSS_MODULE UNIT
module BYPASS_DR(
Shift_DR,
Capture_DR, 
Update_DR,
TDI,
TCK,
tdr_Select,
DR_TDO);

parameter DR_LENGTH = 5;

input TDI ,tdr_Select, TCK , Shift_DR , Capture_DR , Update_DR;
output  DR_TDO;

reg [DR_LENGTH-1:0] Shift_reg,Update_DR_reg;

always @(posedge TCK)
    begin
       if(tdr_Select)
       begin
         if(Capture_DR)
            begin
                Shift_reg <= {DR_LENGTH{1'b1}};
            end
        else if(Shift_DR)  
            begin
               Shift_reg<={ Shift_reg[DR_LENGTH-2:0] ,TDI}; 
            end  
        else if(Update_DR)
            begin
                Update_DR_reg <= Shift_reg;
            end        
        end
    end
 assign DR_TDO = Shift_reg[DR_LENGTH-1];
endmodule
  
