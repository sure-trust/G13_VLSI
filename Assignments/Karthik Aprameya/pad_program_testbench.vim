module  PBDIR_tb();
  reg IE,OE,A;
  wire Y;
  wire PAD;
  reg PAD_temp;
  assign pad=(IE==1 && OE==0) ? PAD_temp : 1'bz;//high impedence state
  pad_cell(.IE(IE), .OE(OE), .A(A), .PAD(PAD), .Y(Y));
  initial
    begin
      OE=0;//case1
      IE=1;
      PAD_temp=1;
      #10;
      OE=1;//case2
      IE=0;
      A=0;
      #10
      OE=0;//case3
      IE=1;
      PAD_temp=0;
      #10
      OE=1;
      IE=0;
      A=1;
    end
endmodule;
