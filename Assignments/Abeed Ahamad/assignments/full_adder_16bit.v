////////////////////////////////////////////
///16 BIT FULL ADDER USING GENERATE BLOCK///
///////////////////////////////////////////
module fa(cin,a,b,s,cout);
parameter n=32;
input cin; 
input [n-1:0]a,b;                                 
output [n-1:0]s;
output cout;
wire [n:0]c;

genvar k; 
assign c[0]=cin;
assign cout=c[n];

generate 
for(k=0;k<n;k=k+1)
begin:fa
wire z1,z2,z3;
xor(s[k],a[k],b[k],c[k]);
and(z1,a[k],b[k]);
and(z2,a[k],c[k]);
and(z3,c[k],b[k]);
or(c[k+1],z1,z2,z3);
end
endgenerate 
endmodule
