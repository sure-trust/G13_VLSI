module fulladdertb()
reg a,b,cin;
wire sum,cout;
fulladdertb uut(.a(a),.b(b),.cin(cin),.sum(sum),.cout(cout));
initial begin
  $dumpfile("test.vcd");
  $dumpvars(1);
   a=1'b0; b=1'b; cin=1'b0;
#200 $finish;
end

