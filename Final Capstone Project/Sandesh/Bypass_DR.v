module Bypass_DR(
Shift_DR,
Capture_DR, 
Update_DR,
TDI,
TCK,
tdr_Select,
SO_DR_OUT);

parameter DR_LENGTH = 5;

input TDI ,tdr_Select, TCK , Shift_DR , Capture_DR , Update_DR;
output  SO_DR_OUT;

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
 assign SO_DR_OUT = Shift_reg[DR_LENGTH-1];
endmodule

