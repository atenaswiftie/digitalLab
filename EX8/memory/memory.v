module ram (Data, address, data_out);
    
    parameter address_size = 64;
    parameter data_size    = 32;
    
    input [address_size-1:0] address;
    output [data_size-1:0] data_out;
    
    input reg [address_size-1:0] Data [data_size-1 : 0];
    
    always @(*)
    begin
        data_out = Data[address]
    end
    
endmodule
