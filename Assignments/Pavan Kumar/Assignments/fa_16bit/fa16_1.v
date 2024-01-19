module fa16_1(a,b,c,sum,cout);
input a,b,c;
output sum,cout;
assign sum=a^b^c;
assign cout=(a&b)|(b&c)|(c&a);
endmodule

module fa16a(a,b,c,sum,cout);
input [15:0] a,b;
input c;
output [15:0] sum;
output cout;
wire w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,w15;
fa16_1 fa0 (.a(a[0]),.b(b[0]),.c(c),.sum(sum[0]),.w1(w1));
fa16_1 fa1 (.a(a[1]),.b(b[1]),.w1(w1),.sum(sum[1]),.w2(w2));
fa16_1 fa2 (.a(a[2]),.b(b[2]),.w2(w2),.sum(sum[2]),.w3(w3));
fa16_1 fa3 (.a(a[3]),.b(b[3]),.w3(w3),.sum(sum[3]),.w4(w4));
fa16_1 fa4 (.a(a[4]),.b(b[4]),.w4(w4),.sum(sum[4]),.w5(w5));
fa16_1 fa5 (.a(a[5]),.b(b[5]),.w5(w5),.sum(sum[5]),.w6(w6));
fa16_1 fa6 (.a(a[6]),.b(b[6]),.w6(w6),.sum(sum[6]),.w7(w7));
fa16_1 fa7 (.a(a[7]),.b(b[7]),.w7(w7),.sum(sum[7]),.w8(w8));
fa16_1 fa8 (.a(a[8]),.b(b[8]),.w8(w8),.sum(sum[8]),.w9(w9));
fa16_1 fa9 (.a(a[9]),.b(b[9]),.w9(w9),.sum(sum[9]),.w10(w10));
fa16_1 fa10(.a(a[10]),.b(b[10]),.w10(w10),.sum(sum[10]),.w11(w11));
fa16_1 fa11(.a(a[11]),.b(b[11]),.w11(w11),.sum(sum[11]),.w12(w12));
fa16_1 fa12(.a(a[12]),.b(b[12]),.w12(w12),.sum(sum[12]),.w13(w13));
fa16_1 fa13(.a(a[13]),.b(b[13]),.w13(w13),.sum(sum[13]),.w14(w14)); 
fa16_1 fa14(.a(a[14]),.b(b[14]),.w14(w14),.sum(sum[14]),.w15(w15));
fa16_1 fa15(.a(a[15]),.b(b[15]),.w15(w15),.sum(sum[15]),.cout(cout));
assign cout=cout;
endmodule

