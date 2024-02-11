module dpr_32x8_tb;
  reg CLKA, WENA, CLKB, WENB;
  reg [3:0] AddrA, AddrB;
  reg [7:0] DataA, DataB;
  wire [7:0] QA, QB;
  
  parameter CLK_PERIOD = 20;
  parameter WRITE_DLY = 10;
  parameter READ_DLY = 10;
  
  dpr_32x8 dut(.CLKA(CLKA), .WENA(WENA), .AddrA(AddrA), .DataA(DataA), .QA(QA), .CLKB(CLKB), .WENB(WENB), .AddrB(AddrB), .DataB(DataB), .QB(QB));
  
  // Clock generation
  always
    begin
      #(CLK_PERIOD/2);
      CLKA = 0;
      #(CLK_PERIOD/2);
      CLKA = 1;
    end
  
  always
    begin
      #(CLK_PERIOD/2);
      CLKB = 0;
      #(CLK_PERIOD/2);
      CLKB = 1;
    end

  //write operation
  task write_opa(input [3:0] a, input [7:0] d);
    begin
      @(posedge CLKA)
      begin
        WENA = 1;
        AddrA <= a;
        DataA <= d;
      end
      #WRITE_DLY;
      WENA = 0;
    end
  endtask
  
  task write_opb(input [3:0] a, input [7:0] d);
    begin
      @(posedge CLKB)
      begin
        WENB = 1;
        AddrB <= a;
        DataB <= d;
      end
      #WRITE_DLY;
      WENB = 0;
    end
  endtask

  //read operation
  task read_opa(input [3:0] a);
    begin
      @(posedge CLKA)
      begin
        WENA = 0;
        AddrA <= a;
      end
      #READ_DLY;
    end
  endtask
  
  task read_opb(input [3:0] a);
    begin
      @(posedge CLKB)
      begin
        WENB = 0;
        AddrB <= a;
      end
      #READ_DLY;
    end
  endtask

  
  initial
    begin
      
      write_opa(4'b0000, 8'h00);
      #10;
      
      read_opa(4'b0000);
      #10;
      
      write_opa(4'b0010, 8'h01);
      #10;
      
      write_opb(4'b0100, 8'h10);
      #10;
      
      read_opb(4'b0100);
      #10;
      
      write_opb(4'b0011, 8'h01);

      
      $finish;
    end
endmodule
