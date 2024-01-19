module 16bitFA(a,b,cin,s,cout);
parameter n=16;
input cin;
input [n-1:o]a,b;
output [n-1:0]s;
output cout;
wire [n-1:0]cin;
assign c[0]=ci;
 genvar i;
generate
for(i=0;i<n-1;i=i+1)
begin:
assign s[i]=a[i]^b[i]^c[i];
assign c[i+1]=(a[i]&b[i])|(a[i]&c[i])|(b[i]&c[i]);
end
endgenerate
assign s[n-1]=a[n-1]^b[n-1]^c[n-1];
assign cout = c[n-1];
endmodule

