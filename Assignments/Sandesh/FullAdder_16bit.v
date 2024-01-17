module Full_Adder(a,b,cin,sum,cout);
input [15:0]a,b;
input cin;
output [15:0] sum;
output cout;

wire [15:1] c;

Full_Adder(a[0],b[0],cin,sum[0],c[1]);
Full_Adder(a[1],b[1],c[1],sum[1],c[2]);
Full_Adder(a[2],b[2],c[2],sum[2],c[3]);
Full_Adder(a[3],b[3],c[3],sum[3],c[4]);
Full_Adder(a[4],b[4],c[4],sum[4],c[5]);
Full_Adder(a[5],b[5],c[5],sum[5],c[6]);
Full_Adder(a[6],b[6],c[6],sum[6],c[7]);
Full_Adder(a[7],b[7],c[7],sum[7],c[8]);
Full_Adder(a[8],b[8],c[8],sum[8],c[9]);
Full_Adder(a[9],b[9],c[9],sum[9],c[10]);
Full_Adder(a[10],b[10],c[10],sum[10],c[11]);
Full_Adder(a[11],b[11],c[11],sum[11],c[12]);
Full_Adder(a[12],b[12],c[12],sum[12],c[13]);
Full_Adder(a[13],b[13],c[13],sum[13],c[14]);
Full_Adder(a[14],b[14],c[14],sum[14],c[15]);
Full_Adder(a[15],b[15],c[14],sum[15],cout);

endmodule


