vlog mux2to1_tb.v
vsim -novopt -supress 12110 mux2to1_tb
add wave -position insertpoint sim:/mux2to1_tb/*
run -all

