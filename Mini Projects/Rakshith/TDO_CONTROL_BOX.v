module TDO_CONTROL_BOX(input Shift_IR,Shift_DR,SO_DR_OUT,SO_IR_OUT
output TDO);

wire w1,w2;

and g1(w1,SO_DR_OUT,Shift_IR);
and g2(w2,SO_IR_OUT,Shift_DR);
or g3(TDO,w1,w2);

endmodule
