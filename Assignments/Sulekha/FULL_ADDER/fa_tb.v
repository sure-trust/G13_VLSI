// or browse Examples
module tb;
  reg a,b,cin;
  wire s,c;
  
  fa inst(.A(a), .B(b), .CIN(cin), .SUM(s), .COUT(c));
  
  initial begin
    $monitor("time=%0t\t", $time," a=%b, b=%b,cin=%b, sum=%b, carry=%b ",a,b,cin,s,c);

    repeat(10)
      begin
         a=$random();
         b=$random();
         cin=$random();
       #5; 
      end
  end
  
endmodule 
