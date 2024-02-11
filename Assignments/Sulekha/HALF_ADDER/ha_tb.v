// Code your testbench here

module tb;
  reg a,b;
  wire s,c;
  
 ha_beh inst(.A(a), .B(b), .sum(s), .carry(c));
  
  initial begin
    $monitor("time=%0t\t", $time," a=%b, b=%b, sum=%b, carry=%b ",a,b,s,c);
   a=0; b=0;
 #2a=0; b=1;
 #2a=1; b=0;
 #2a=1; b=1;
    
  end
  
endmodule 
