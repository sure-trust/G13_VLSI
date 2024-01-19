module fa16_1_tb;
reg[15:0] a,b;
reg c;
wire [15:0] sum;
wire cout;

fa16_1 s1(.a(a),.b(b),.c(c),.sum(sum),.cout(cout));

initial
begin
$monitor($time , "a =%b ","b=%b ","c=%b ","sum = %d","cout= %b",a,b,c,sum,cout);

repeat(5)
begin
a=$random;
b=$random;
c=$random;
#5;
#100; $finish;


end

end

endmodule

