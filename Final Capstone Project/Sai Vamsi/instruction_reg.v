module Instruction_reg(input Capture_IR,
          input Shift_IR,
          input Update_IR,
          input TCK,
          input TDI,
          output [4:0]IR_out,
          output TDO);
  
  reg [4:0]Shift_reg,Update_reg;
  
  always@(posedge TCK)
    begin
      if(Capture_IR)
        begin
          Shift_reg <=5'b11111;
        end
      else if(Shift_IR)
        begin
          Shift_reg<={TDI,Shift_reg[4:1]};
        end
      else if(Update_IR)
        begin
          Update_reg<=Shift_reg;
        end
      else
        begin
          Shift_reg <=5'bxxx;
        end
      end
      
  assign TDO = Shift_reg[0];
      assign IR_out = Update_reg;
      
endmodule

