module FIFO (
  input CLK, RST, FULL, EMPTY,
  output reg [WIDTH-1:0] Q,
  input [WIDTH-1:0] D,
  input REN, WEN
);

  parameter DEPTH = 16;
  parameter WIDTH = 8;
  parameter ADDR = 4;

  reg [WIDTH-1:0] mem[DEPTH-1:0];
  reg [ADDR-1:0] wr_pointer, rd_pointer;
  reg [ADDR:0] status_cnt;

  // Write address generator in FIFO
  always @(posedge CLK) begin
    if (RST == 1)
      wr_pointer <= 4'b0000;
    else if (WEN)
      wr_pointer <= wr_pointer + 1;
  end

  // Read address generator in the FIFO
  always @(posedge CLK) begin
    if (RST == 1)
      rd_pointer <= 4'b0000;
    else if (REN)
      rd_pointer <= rd_pointer + 1;
  end

  // Write and read operation in FIFO
  always @(posedge CLK) begin
    if (WEN)
      mem[wr_pointer] <= D;
    if (REN)
      Q <= mem[rd_pointer];
  end

  // Status counter in FIFO
  always @(posedge CLK) begin
    if (RST)
      status_cnt = 0;
    else begin
      if (WEN && !REN && status_cnt != DEPTH)
        status_cnt = status_cnt + 1;
      if (REN && !WEN && status_cnt == 0)
        status_cnt = status_cnt - 1;
      if (REN && WEN)
        status_cnt = status_cnt;
    end
  end

  assign FULL = (status_cnt == DEPTH) ? 1'b1 : 1'b0;
  assign EMPTY = (status_cnt == 0) ? 1'b1 : 1'b0;

endmodule
