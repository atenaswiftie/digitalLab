module mux (X,Y,select,outPut)

    parameter n = 64;
    input[n-1:0] X,Y;
    input select;
    output[n-1:0] outPut;
    assign outPut = (select == 0) ? X : Y;
    
endmodule
