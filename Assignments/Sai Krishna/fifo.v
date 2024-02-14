module fifo_module (
  input wire CLK,
  input wire Wen,
  input wire Ren,
  input wire Rst,
  input wire [WIDTH-1:0] D,
  output reg [WIDTH-1:0] Q,
  output reg Full,
  output reg Empty
);

  parameter WIDTH = 8;
  parameter DEPTH = 16;
  reg [WIDTH-1:0] fifo[DEPTH-1:0];
  reg [4:0] head = 5'b0;
  reg [4:0] tail = 5'b0;

  // Write operation
  always @(posedge CLK) begin
    if (Rst) begin
      for (int i = 0; i < DEPTH; i = i + 1)
        fifo[i] <= 0;
      head <= 0;
      tail <= 0;
    end else if (Wen) begin
      if (head != tail - 1) begin
        fifo[head] <= D;
        head <= head + 1;
      end
    end
  end
  
  // Read operation
  always @(posedge CLK) begin
    if (Ren) begin
      if (head != tail) begin
        Q <= fifo[tail];
        tail <= tail + 1;
      end
    end
  end
  
  // Full and Empty flags
  always @(posedge CLK) begin
    if (head == tail) begin
      Empty <= 1;
      Full <= 0;
    end else if ((head == tail - 1) || ((head == DEPTH - 1) && (tail == 0))) begin
      Empty <= 0;
      Full <= 1;
    end else begin
      Empty <= 0;
      Full <= 0;
    end
  end

endmodule

 
