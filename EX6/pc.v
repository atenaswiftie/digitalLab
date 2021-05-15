`include "./full_adder.v"
`include "./shift_register.v"

module counter (input clk, input reset, input s[1:0], input data_in, input SISR, input SISL, output data_out);

    input wire  [63:0] data_in;
    output wire [63:0] data_out;
    
    counter #(parameter = 64)usr(.data_in(data_in), .clk(clk), .reset(reset), .s(s), .SIFSR(SIFSR), .SIFSL(SIFSL), .data_out(data_out));
    N_bit_adder(.c_in(1'b0) , .s(data_in) , .a(data_out) , .b(4))
    
endmodule
