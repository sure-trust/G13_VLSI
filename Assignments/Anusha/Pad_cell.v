module PAD_cell(pad,Y,A,IE,OE);
input A,IE,OE;
output Y;
inout pad;

bufif1 g1((Y,pad,IE);
bufif1 g2(pad,A,OE);

endmodule

module PAD_cell_tb();
reg A,IE,OE;
wire Y;
wire pad;
reg pad_temp;

assign pad = (IE==1 && OE==0)?pad_temp:1'bz;

PAD_cell uut(.pad(pad),.Y(Y),.A(A),.IE(IE),.OE(OE));

initial begin
//case 1
IE=1 ; OE=0 ; pad_temp=1; 
#10;
//case 2
IE=0 ;OE=1; A=0;
#10;
//case 1.1
IE=1 ;OE=0 ;pad_temp=0;
#10;
//case 2.1
IE=0 ; OE=1; A=1;
#10;

end
endmodule
