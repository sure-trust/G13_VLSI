module FullAdder(A,B,Cin,Sum,Cout);
 input A,B,Cin;
 output Sum , Cout;
 assign Sum = A^B^Cin;
 assign Cout = (A&B)|(B&Cin)|(A&Cin);
 endmodule


module FullAdder(A,B,Cin,Sum,Cout);
 input A,B,Cin;
 output Sum , Cout;
 always @(A,B,Cin)
 begin
	 casex({A,B,Cin})
		 3'b00x:begin
			 Sum=Cin;
			 Cout = 0;
		 end
		 3'b01x:begin
			 Sum=~Cin;
			 Cout=Cin;
		 end

			 
		 3'b10x:begin
			 Sum=~Cin;
			 Cout =Cin;
		 end
		 3'b11x:begin
			 Sum=Cin;
			 Cout=B;
		 end
		endcase
end
endmodule


module FullAdder(A,B,Cin,Sum,Cout);
 input A,B,Cin;
 output Sum , Cout;
 always @(A,B,Cin)
 begin
	 if({A,B,Cin}==(3'b010||3'b001||3'b100))
	 begin
		 Sum=1;
		 Cout = 0;
	 end
	 else if({A,B,Cin}==(3'b011||3'b101||3'b110))
	 begin
		 Sum=0;
		 Cout=1;
	 end
	 else if({A,B,Cin}==(3'b111))
	 begin
		 Sum=1;
		 Cout=1;
	 end
	 else 
	 begin
		 Sum=0;
		 Cout=0;
	 end
 end
 endmodule

	
			 
