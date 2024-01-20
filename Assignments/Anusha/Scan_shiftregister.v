module D_ff(d,clk,rst,q);
input d,clk,rst;
output reg q;

always @(posedge clk)
   begin
     if(rst)
	 q <= 1'b0;
     else
	 q <= d;
   end
endmodule

module sdff(D,SI,SE,CLK,RST,SO,Q);
input D,SI,SE,CLK,RST;
output SO;
output reg Q;

always @(posedge clk)
  begin
    if(rst)
        Q <= 1'b0;
    else 
        Q <= (SE ? SI: D);
  end
assign SO = Q;
endmodule

module Scan_Shift_register(Pi,PSi,PSe,PClk,PRst,PSo,Po);
input Pi,PSi,PSe,PClk,PRst;
output PSo,Po;
wire w1,w2,w3;

sdff sdff1(.D(Pi),.SI(PSi),.SE(PSe),.CLK(PClk),.RST(PRst),.SO(w1),.Q(w1));
dff dff1(d(w1),.clk(PClk),.rst(PRst),.q(w2));
dff dff2(d(w2),.clk(PClk),.rst(PRst),.q(w3));
sdff sdff2(.D(w3),.SI(w3),.SE(PSe),.CLK(PClk),.RST(PRst),.SO(PSo),.Q(Po));

endmodule

module Scan_Shift_register_tb;
reg Pi,PSi,PSe,PClk,PRst;
wire PSo,Po;
parameter cycle =4;

Scan_Shift_register uut(Pi,PSi,PSe,PClk,PRst,PSo,Po);

initial
   begin
       	PClk = 0;
   end
always #5 PClk = ~ PClk;

task ShiftEnable();
  begin
      repeat(cycle)
          begin
	     PSe =1;
	     #10;
	  end
      PSe=0;
      #10;
  end
endtask

task ShiftIn(input in);
    begin
       repeat(cycle)
          begin
	    PSi =in;
	    #10;
          end
    end	    
endtask

fork
 ShiftEnable();
 ShiftIn(0);
 Pi=1;
join

endmodule

