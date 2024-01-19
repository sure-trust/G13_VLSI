`include "mux2to1.v"
module mux2to1_tb();
reg a,b,s;
wire y;
mux2to1 dut(.a(a),.b(b),.s(s),.y(y));
initial
        begin
        a=0;b=0;s=0; #100;
	a=0;b=0;s=1; #100;
        a=0;b=1;s=0; #100;
        a=0;b=1;s=1; #100;
        a=1;b=0;s=0; #100;    
        a=1;b=0;s=1; #100;
        a=1;b=1;s=0; #100;
        a=1;b=1;s=1; #100;
        $finish;
        end
endmodule 
