module mux_2x1_tb();
reg a,b,s;
wire y ;
mux_2x1 dut(a,b,s,y);  
initial
begin
s=0;a=0;b=0;
#100 s=0;a=0;b=1;
#100 s=0;a=1;b=0;
#100 s=0;a=1;b=1;
#100 s=1;a=0;b=0;
#100 s=1;a=0;b=1;
#100 s=1;a=1;b=0;
#100 s=1;a=1;b=1;
end
endmodule

