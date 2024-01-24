module pbidir_tb;
  reg ie,oe,a;
  wire y;
  wire pad;
  reg temp_pad;
  assign pad=(ie==1 && oe==0)?  temp_pad: 1'bz;
  pbidir dut(.pad(pad), .ie(ie), .oe(oe), .y(y), .a(a));
  initial
    begin
      $monitor("ie=%b, oe=%b, temp_pad=%b, pad=%b,y=%b, a=%b", ie,oe, temp_pad, pad,y,a);
      
      ie=1; oe=0;
      temp_pad=1;
      #10
      
      ie=0;oe=1;
      a=0;
      #10
      
      ie=1;oe=0;
      temp_pad=1;
      #10
      
      ie=0;oe=1;
      a=1;
      
    end
endmodule
