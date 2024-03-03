vlog -work work -vopt -stats=none {C:/Users/ABEED AHAMAD/OneDrive/Desktop/mux2x1/mux2to1_tb.v}
vsim -voptargs=+acc work.mux2to1_tb
add wave -position insertpoint sim:/mux2to1_tb/*
run -all
