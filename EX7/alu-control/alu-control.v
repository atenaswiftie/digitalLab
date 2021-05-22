module alu_control (alu_op, 
                    func7 , 
                    func3, 
                    alu_control);
    
    input[1:0] alu_op;
    input[6:0] func7;
    input[2:0] func3;
    output reg[3:0] alu_control;
    
    reg[3:0] SUB_TRACK = 4'b0110;
    reg[3:0] ADD       = 4'b0010;
    reg[3:0] AND       = 4'b0000;
    reg[3:0] OR        = 4'b0001;
    always @(alu_op or func7 or func3)
    begin
    case (alu_op)
        2'b00: alu_control <= ADD;
        2'b01: alu_control <= SUB_TRACK;
        2'b10: begin
            case(func3)
                3'b000 : begin
                    case (func7)
                        7'b0000000: alu_control <= ADD;
                        7'b0100000: alu_control <= SUB_TRACK;
                    endcase
                end
                3'b111 : alu_control <= AND;
                3'b110 : alu_control <= OR;
            endcase
        end
    endcase
    end
    
endmodule
