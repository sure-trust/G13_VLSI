module mux8_1(d,sel,out);
input [7:0] d;
output reg out;
input [2:0]sel;

always@(*)
begin
if(sel==3'b000)
out=d[0];
else if(sel==3'b001)
out=d[1];
else if(sel==3'b010)
out=d[2];
else if(sel==3'b011)
out=d[3];
else if(sel==3'b100)
out=d[4];
else if(sel==3'b101)
out=d[5];
else if(sel==3'b110)
out=d[6];
else if(sel==3'b111)
out=d[7];
else
out=d[1];
end
endmodule

