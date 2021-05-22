module imm_gen(instruction,
               immediate);

    input [31:0] instruction;
    output [63:0] immediate;
    
    always @(instruction)

    begin

    casex(instruction[6:0])
        7'b0000011: immediate <= {53{instruction[31]},instruction[30:20]};  // ld
        7'b0100011: immediate <= {53{instruction[31]}, instruction[30:25], instruction[11:7]};  // sd
        7'b1100011: immediate <= {53{instruction[31]}, instruction[7], instruction[30:25], instruction[11:8]};  // beq
        default: immediate <= 64'bx;

    end
    
    endmodule
