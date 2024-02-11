module FIFO(CLK, D, Q, WEN, REN, RST, FULL, EMPTY);
  parameter DEPTH = 16;
  parameter ADDR = 4;
  parameter WIDTH = 8;

  input CLK, WEN, REN, RST;
  input [WIDTH-1:0] D;
  output reg [WIDTH-1:0] Q;
  output FULL, EMPTY;

  reg [ADDR-1:0] wr_pointer;
  reg [ADDR-1:0] rd_pointer;
  reg [ADDR:0] status_counter;
  reg [WIDTH-1:0] mem [DEPTH-1:0];

  // Write address generator
  always @(posedge CLK) begin
    if (RST)
      wr_pointer <= 0;
    else begin
      if (WEN)
        wr_pointer <= wr_pointer + 1;
    end
  end

  // Read address generator
  always @(posedge CLK) begin
    if (RST)
      rd_pointer <= 0;
    else begin
      if (REN)
        rd_pointer <= rd_pointer + 1;
    end
  end

  // Write & read operation
  always @(posedge CLK) begin
    if (WEN)
      mem[wr_pointer] <= D;
    if (REN)
      Q <= mem[rd_pointer];
  end

  // Status counter logic
  always @(posedge CLK) begin
    if (RST)
      status_counter <= 0;
    else begin
      if ((WEN && !REN) && (status_counter != DEPTH))
        status_counter <= status_counter + 1;
      if ((REN && !WEN) && (status_counter == 0))
        status_counter <= status_counter - 1;
      if (WEN && REN)
        status_counter <= status_counter;
    end
  end

  assign FULL = (wr_pointer == DEPTH-1) ? 1 : 0;
  assign EMPTY = (wr_pointer == rd_pointer) ? 1 : 0;
endmodule
