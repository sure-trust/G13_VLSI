module tb_dff;  
    reg clk;  
    reg d;  
    reg rstn;  
    reg [2:0] delay;  
  
    dff  dff0 ( .d(d),  
                .rsnt (rstn),  
                .clk (clk),  
                .q (q));  
  
    // Generate clock  
    always #10 clk = ~clk;  
  
    // Testcase  
    initial begin  
        clk <= 0;  
        d <= 0;  
        rstn <= 0;  
  
        #15 d <= 1;  
        #10 rstn <= 1;  
        for (int i = 0; i < 5; i=i+1) begin  
            delay = $random;  
            #(delay) d <= i;  
        end  
    end  
endmodulemodule tb_dff;  
    reg clk;  
    reg d;  
    reg rstn;  
    reg [2:0] delay;  
  
    dff  dff0 ( .d(d),  
                .rsnt (rstn),  
                .clk (clk),  
                .q (q));  
  
    // Generate clock  
    always #10 clk = ~clk;  
  
    // Testcase  
    initial begin  
        clk <= 0;  
        d <= 0;  
        rstn <= 0;  
  
        #15 d <= 1;  
        #10 rstn <= 1;  
        for (int i = 0; i < 5; i=i+1) begin  
            delay = $random;  
            #(delay) d <= i;  
        end  
    end  
endmodule
