

module dual_port_ram(CLKA,CLKB,WENA,WENB,AA,AB,DA,DB,QA,QB);

input CLKA,CLKB;
input WENA,WENB;
input [4]AA,AB;
input [8]DA,DB;
output reg [8]QA,QB;

 reg [8]mem[32];
  always @(posedge CLKA)begin
    if(WENA==1)begin
	  mem[AA]=DA;
	end
	else begin
	  QA=mem[AA];
	end
  end
always @(posedge CLKB)begin
    if(WENB==1)begin
	  mem[AB]=DB;
	end
	else begin
	  QB=mem[AB];
	end
  end 
endmodule

