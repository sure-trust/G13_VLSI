module inst _register(
  input TCK,
  input TDI,
  input update_ir
  input capture_ir,
  input shift_ir,
  output TDO
  output ir_out,);

parameter SHIFT = 2'b10;
parameter UPDATE = 2'b11;

parameter IDLE = 2'b00;
parameter CAPTURE = 2'b01;
reg [4:0] ir_register;
reg [1:0] state;
  
always @(posedge tck) begin
    case (state)
        IDLE: begin
            ir_out <= 1'b0; 
            TDO <= 1'b0;
            if (capture_ir)
                state <= CAPTURE;
        end
       
        SHIFT: begin
          ir_register <= {ir_register[3:0], TDI}; 
            if (update_ir)
                state <= UPDATE;
        end

CAPTURE: begin
          ir_register <= {ir_register[3:0], TDI}; 
            if (!shift_ir)
                state <= SHIFT;
        end

 UPDATE: begin
          ir_out <= ir_register[4];
          TDO <= ir_register[4]; 
            state <= IDLE; 
        end
    endcase
end

endmodule
