// or browse Examples
module tb;
  reg [0:15]a,b;
  reg cin;
  wire [0:15]s;
  wire cout;
  
  bit_16_fa inst(.A(a), .B(b), .Cin(cin), .Sum(s), .Cout(cout));
  
  initial begin
    $monitor("time=%0t\t", $time," a=%b, b=%b,cin=%b, sum=%b, carry=%b ",a,b,cin,s,cout);

    repeat(10)
      begin
         a=$random();
         b=$random();
         cin=$random();
       #5; 
      end
  end
  
endmodule 
