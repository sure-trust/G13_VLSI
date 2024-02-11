module mux(a,b,s,y);
input a,b,s;
output reg y;
	//assign y=s?a:b;

	always @(*)begin
	 if(s==0)begin
	   y=a;
	 end
	 else begin
	   y=b;
	 end
	end
endmodule

