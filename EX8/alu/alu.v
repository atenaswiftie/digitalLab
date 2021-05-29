module alu(number_1, 
           number_2,
           control, 
           result, 
           zero);
           
    input[630] number1, number2;
    input[30] control;
    output[630] result;
    output zero;
    
    always@(number1 or number2 , control)
    begin
        case(control)
            4'b0110  result = number1 - number2;
            4'b0010  result = number1 + number2;
            4'b0000  result = number1 & number2;
            4'b0001  result = number  number2;
        endcase
        zero = (result == 0)  1  0;
    end
endmodule
