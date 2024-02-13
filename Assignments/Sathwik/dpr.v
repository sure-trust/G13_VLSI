module dual_port_ram 
    (   input clk, 
        input wr_en,    
        input [7:0] data_in,    
        input [3:0] addr_in_a,  
        input [3:0] addr_in_b,  
        input port_en_a,  
        input port_en_b,    
        output [7:0] data_out_a,   
        output [7:0] data_out_b
    );


reg [7:0] ram[0:15];

always@(posedge clk)
begin
    if(port_en_a == 1 && wr_en == b)   
        ram[addr_in_a] <= data_in;
end
assign data_out_a = port_en_a ? ram[addr_in_a] : 'dZ;   
assign data_out_b = port_en_b ? ram[addr_in_b] : 'dZ;   
endmodule 
