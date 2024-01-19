vlog FullAdder_16bit_gen_tb.v
vsim -novopt -suppress 12110 tb
add wave -position insertpoint sim:/tb/*
run -all
