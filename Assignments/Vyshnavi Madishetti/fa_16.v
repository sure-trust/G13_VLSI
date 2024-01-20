module fa_16(a,b,cin,s,cout);
  parameter n=16;
  input [n-1:0]a,b;
  input cin;
  output [n-1:0]s;
  output cout;
  wire [n:0]c;
  
  genvar i;
  generate
    for(i=0;i<n-1;i=i+1)
      begin:fa
       wire w1,w2,w3;
        xor(s[i],a[i],b[i],c[i]);
        and(w1,a[i],b[i]);
        and(w2,a[i],c[i]);
        and(w3,c[i],b[i]);
        or(c[i+1],w1,w2,w3);
      end
  endgenerate
endmodule
