module padcell_tb;
reg IE,OE,A;
wire Y;
wire PAD;//inout port special one
reg PAD_temp;
PBDIR inst(.OE(OE),.IE(IE),.A(A),.PAD(PAD),.Y(Y));

initial //case1
begin
OE=0;
IE=1;
PAD_temp =0;
#10;
A=0;
PAD_temp =1;
#10;
end

initial //case2
begin
OE=1;
IE=0;
PAD_temp =0;
#10;
A=1;
PAD_temp =1;
end

initial //case3
begin
IE=1;
OE=1;
PAD_temp=1;
A=1;
end


initial //case4
begin
IE=0;
OE=0;
PAD_temp=1;
end

endmodule
