module DATA_REG(TCK,TDI,tdr_Select,Capture_DR,Shift_DR,Update_DR,tdo);
input Capture_DR,Shift_DR,Update_DR,TCK,TDI,tdr_Select;
output tdo;
output [4:0]DR_out;

reg [4:0] Shift_reg,Update_reg;

always @(posedge TCK)
begin
if(tdr_Select)
 begin
if (Capture_DR)
          begin
            Shift_reg <= 5'b11111;
          end
else if (Shift_DR)
        begin
          Shit_reg <= {Shift_reg[3:0],TDI};
        end
else if (Update_DR)
         begin
          Update_reg <= Shift_reg;
         end
end
end

assign tdo = Shift_reg[4];
endmodule


