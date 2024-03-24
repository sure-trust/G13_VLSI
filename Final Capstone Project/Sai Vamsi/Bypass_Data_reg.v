module Bypass_Data_reg(tdr_select,TCK,TDI,Capture_DR,Shift_DR,Update_DR,TDO,DR_out);
  input tdr_select,TCK,TDI,Capture_DR,Shift_DR,Update_DR;
  output reg TDO;
  parameter DR_length=5;
  output reg [DR_length-1:0]DR_out;
  reg [DR_length-1:0] Shift_reg, Update_reg;
  always @(posedge TCK)
    begin
      if(tdr_select)
        begin
          if(Capture_DR)
            Shift_reg<= {DR_length{1'b1}};
          else if(Shift_DR)
            Shift_reg<={ Shift_reg[DR_length-2:0] ,TDI}; 
          else if(Update_DR)
            Update_reg<=Shift_reg;
        end	
    end
  always@(posedge TCK)
    begin
      TDO<=Shift_reg[DR_length-1];
      DR_out<= Update_reg;
    end
endmodule
