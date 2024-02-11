module dff_tb;
  reg D,Clk;
  wire [3:0] Q;
  dff dut(.D(D), .Clk(Clk), .Q(Q));
  initial begin
   D=0;
    #10;
    D=1;
    #10;

    $dumpfile("dump.vcd");
    $dumpvars();
    $finish;
  end

  always begin #5;Clk=1'b0;#5;Clk=1'b1;
    end
endmodule

