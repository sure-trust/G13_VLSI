  module FullAdder_TB();
  reg A,B,Cin;
  wire Sum,Cout;

FullAdder Dut(.A(A),.B(B),.Cin(Cin),.Sum(Sum),.Cout(Cout));
  initial begin
	  $monitor ($time ,"a=%b,B=%b,Cin=%b,Sum=%b,Cout=%b",A,B,Cin,Sum,Cout);

	  #5 A=0;B=0;Cin=0;
	  #5 A=0;B=0;Cin=1;
          #5 A=0;B=1;Cin=0;
	  #5 A=0;B=1;Cin=1;
          #5 A=1;B=0;Cin=0;
          #5 A=1;B=0;Cin=1;
          #5 A=1;B=1;Cin=0;
	  #5 A=1;B=1;Cin=1;
	 #5 $finish;
 end 
 endmodule


//  module FullAdder_TB();
//  reg A,B,Cin;
//  wire Sum,Cout;
//  integer i;
//
//  Full_Adder Dut(Sum.(Sum),Cout.(Cout),A.(A),B.(B),Cin(Cin);
//   initial 
//    begin
//	    for(i=0;i<8;i=i+1)
//	     begin 
//	      (A,B,C) = i;
//	      #5;
//	      $display(" T = %2d,A=%b,B=%b,C=%b,Sum=%b,Cout=%b",$time,A,B,C,Sum.Cout);
//      end
//      #5 $finish;
// end 
// endmodule
