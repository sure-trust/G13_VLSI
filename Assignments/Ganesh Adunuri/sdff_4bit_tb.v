module sdff_4bit_tb();
reg pi,psi,pclk,pse;
wire po,pso;
parameter cycle =5;
sdff_4bit dut (.pi(pi),.psi(psi),.pclk(pclk),.pse(pse),.po(po),.pso(pso));
//generating the clk
always 
	begin
#10 pclk =~pclk;
	end

task se()
	begin
		 repeat(cycle)
		 	begin 
					pse=1;
					#10;
			end
		pse=0;
		#10;
	end
endtask

task si(input in)
	begin
			repeat(cycle)
				begin 
				psi=in;
				end
	end

intial 
	fork 
		se();
		si();
	join 
endmodule

