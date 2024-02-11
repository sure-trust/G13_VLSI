module PBIDIR_tb();
reg IE,OE,A;
wire Y;
wire PAD;
PBDIR dut (.IE(IE),.OE(OE),.PAD(PAD,.Y(Y),.A(A));
assign PAD=(IE==1 && OE==0)?PAD_temp:z'bz;
intial
begin
//case:1
IE=1;
OE=0;
PAD_temp=0;
#10;
PAD_temp=1;
#10;
//case:2
IE=0;
OE=1;
PAD_temp=0;
#10;
PAD_temp=1;
#10;
end
//case:3
begin
IE=1;
OE=1;
PAD_temp=0;
#10;
PAD_temp=1;
#10;
//case:4
IE=0;
OE=1;
PAD_temp=0;
#10;
PAD_temp=1;
#10;
end;
endmodule;

