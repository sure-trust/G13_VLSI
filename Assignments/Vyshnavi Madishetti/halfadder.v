
module halfadder(A,B,S,C);
input A,B;
output reg S,C;

always @(*)
begin
  if(A==1'b0)
    begin
		S=B;
		C=0;
    end
else
  begin
		S=~B;
		C=0;
  end
  if(B==1'b1)
		C=1;
end
endmodule

