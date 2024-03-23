module vending(input [2:0] in , input clk,arstn,output reg out);

localparam Idle=0,
s1=1,
s2=2,
s3=3,
s4=4;
reg [2:0] state,next_state;
reg count = 0;
 always @(posedgeclk , negedgearstn)


 begin
        if(~arstn)  state<=Idle;

        else
            state<=next_state;
    end

 always @(*)

    begin

        case(state)

            Idle : begin
                    if(in == 3'b101)
                        next_state=Idle;
                    else if(in ==3'b001)
                        next_state = s1;
                    else if(in ==3'b010)
                        next_state = s2;
                    else
                        next_state = Idle;
                   end
            s1 :   begin
                    if(count == 3'b010) 
                        begin
                            next_state = Idle;
                            count = 0;
                        end
                    else if (in == 3'b001) 
                        begin
                            next_state = s1;
                            count = count +1;
                        end
                    else if (in == 3'b010)
                        next_state = s3;
                   end
            s2 : begin
                    if(in == 3'b010)
                        next_state = s4;
                    else if(in == 3'b001)
                        next_state = s3;
                 end

            s3 : begin 
                    if(in == 3'b010) 
                        next_state = Idle;

                 end
            s4 : begin
                    if(in == 3'b010)
					next_state = Idle;
                    else if(in == 3'b001)
					next_state = Idle;
                 end          
        endcase

    end

 always @(*)


 begin
       case(state)
         Idle : begin
                    if(in == 3'b101)
                        out = 1; 
                 end
         s1  :  begin
                  if(in == 3'b010)
                    out = 0;  
                end
         s2  :  begin
                  out = 0;  
                end      
         s3  :  begin
                  if (in == 3'b010)
                     out = 1;  
                  else 
                     out = 0;                  
                end 
         s4  :  begin
                  if(in == 3'b010 || in == 3'b001)
                    out = 1;

                end
         default : out = 'hz; 
        endcase  
    end

endmodule


// testbench
module tb();
reg clk;
reg [2:0] in;
reg arstn;
wire  out;

parameter clock = 10;

always #(clock/2) clk<=~clk;

vending dut(.clk(clk),.in(in),.arstn(arstn),.out(out));

task initialize;
  begin
    arstn<=0;
    clk<=0;
    in<=0;
    #2 arstn<=1;
  end
endtask



integer i;
initial 
    begin
        #5 initialize;
        @(posedge clk) in<=0;
        @(posedge clk) in<=3'd1; 
        @(posedge clk) in<=3'd1;
        @(posedge clk) in<=3'd1;
        @(posedge clk) in<=3'd2;
        @(posedge clk) in<=3'd2;  

        #20 $finish;  
    end

endmodule
