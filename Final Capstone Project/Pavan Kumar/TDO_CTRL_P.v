  //tdo control box
  module TDO_CONTROL_BOX(input Shift_IR,SO,Shift_DR,
output TDO);

wire w1,w2;

    and g1(w1,SO,Shift_IR);
    and g2(w2,SO,Shift_DR);
or g3(TDO,w1,w2);

endmodule
