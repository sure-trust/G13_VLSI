module INSTRUCTION_REG(TCK,TDI,Capture_IR,Shift_IR,Update_IR,IR_out,tdo);
input Capture_IR,Shift_IR,Update_IR,TCK,TDI;
output tdo;
output [4:0]IR_out;

reg [4:0] Shift_reg,Update_reg;

always @(posedge TCK)
begin
if (Capture_IR)
          begin
            Shift_reg <= 5'b11111;
          end
else if (Shift_IR)
        begin
          Shit_reg <= {Shift_reg[3:0],TDI};
        end
else if (Update_IR)
         begin
          Update_reg <= Shift_reg;
         end
end

assign tdo = Shift_reg[4];
assign [4:0]IR_out =Update_reg;
endmodule


