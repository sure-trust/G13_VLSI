//tdo control box
module TDO_CONTROL_BOX(input Shift_IR,So,Shift_DR,
output TDO);

wire w1,w2;

and g1(w1,So,Shift_IR);
and g2(w2,So,Shift_DR);
or g3(TDO,w1,w2);

endmodule


