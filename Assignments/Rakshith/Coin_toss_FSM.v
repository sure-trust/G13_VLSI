//RTL DESIGN
module toss(input clk,
            input rst,
            input toss,
            output reg OUT);
   
  reg [1:0] state, nxt_state;

localparam S0 = 0;
localparam S1 = 1;
localparam S2 = 2;
localparam S3 = 3;

 
always @(posedge clk )
	begin
      if (rst)
			state <= S0;
		else
			state <= nxt_state;
	end

  always @(state,toss) 
  begin 
    case (state)
    	S0: begin
            if (toss) begin
                nxt_state <= S1; //Head
            end
          else
            begin
                nxt_state <= S0; //Tail
            end
        end
      
        S1: begin
            if (toss) begin
                nxt_state <= S2; //Head
            end
          else
            begin
                nxt_state <= S0; //Tail
            end
        end
        S2: begin
            if (toss) begin
                nxt_state <= S3; //Head
              
            end
          else
            begin
                nxt_state <= S0; //Tail
            end
        end
      	S3: begin
            if (toss) begin
                nxt_state <= S1;
           
            end
          else
            begin
                nxt_state <= S0;
            end
        end
    endcase
end
      always@(state)
begin
	case(state)
		S0: OUT=0;
		S1: OUT=0;
		S2: OUT=0;
		S3: OUT=1;

	endcase
end

endmodule
 
 // Testbench

 module toss_tb;

reg clk, rst, toss;
wire OUT;
  
parameter clk_prd = 10;

  toss dut(.clk(clk),.rst(rst), .toss(toss), .OUT(OUT));

always
begin
  #(clk_prd/2);
	clk = 1'b1;
  #(clk_prd/2);
  clk = 1'b0;
end
 
task coin_toss (input i);
	begin
      @(posedge clk)
			toss = i;
	end
endtask

task initialise;
	
	rst = 1'b0;
	toss =1'b0;
    clk=1'b0;
endtask

task reset;
	begin
      @(posedge clk)
		rst = 1'b1;
      @(posedge clk)
		rst = 1'b0;
	end
endtask
  
initial begin
  initialise;
  reset;
  coin_toss(0);
  coin_toss(1);
  coin_toss(1);
  coin_toss(1);
  coin_toss(1);
  coin_toss(0);
  coin_toss(1);
  $finish;
end
  initial begin 
    $dumpfile("dump.vcd");
	$dumpvars;
    
  end 

endmodule
