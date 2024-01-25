//SDFF
module sdff(d,clk,r,si,se,so,q,w);
input d,si,clk,r,se;
output reg q;
output so;
wire w;
assign w=(se)?si:d;

always@(posedge clk)
begin
if(r==1)
q=1'b0;
else
q=w;
end
assign so=q;
endmodule
//DFF
module dff(d,clk,r,q);
input d,clk,r;
output reg q;

always@(posedge clk)

begin
if(r==1)
q=1'b0;
else
q=d;
end
endmodule
//SHIFTREG
module shift_reg(pi,psi,pse,po,pso,pclk);
input pi,psi,pse,pclk;
output po,pso;
wire w1,w2,w3;
sdff a1(.d(pi),.si(psi),.se(pse),.q(w1),.clk(pclk));
sdff a2(.se(pse),.si(w3),.d(w3),.clk(pclk),.q(po),.so(pso));
dff  a3(.d(w1),.q(w2),.clk(pclk));
dff  a4(.d(w2),.q(w3),.clk(pclk));
sdff a2(.se(pse),.si(w3),.d(w3),.clk(pclk),.q(po),.so(pso));
endmodule
