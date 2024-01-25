module HA(a,b,s,co);
	input a,b;
	output wire s,co;
always @(*)
begin
	assign s=a^b;
	assign co=a&b;
end
endmodule
