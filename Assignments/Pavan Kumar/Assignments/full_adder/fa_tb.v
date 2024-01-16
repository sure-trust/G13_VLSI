module fa_tb();
reg A,B,C;
wire SUM,COUT;
integer i;

fa dut(.A(A),.B(B),.C(C),.SUM(SUM),.COUT(COUT));

initial
begin
for(i=0;i<4;i=i+1)
begin
#10; {A,B,C}=i;

end
end

initial
begin
$monitor ($time , "A= ",A,"B= ",B,"C= ",C," SUM= ",SUM,"COUT= ",COUT);

#100; $finish;
end

endmodule

end

endmodule


