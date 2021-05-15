module N_bit_adder(carryin,input1,input2,answer,carryout);
parameter N=64;
input carryin;
input [N-1:0] input1,input2;
   output [N-1:0] answer;
   output carryout;
   wire [N-1:1] carry;

   genvar i;
   generate 
   for(i=0;i<N;i=i+1)
     begin: generate_N_bit_Adder
   if(i==0) 
  full_adder f(carryin,input1[0],input2[0],answer[0],carry[1]);
   else
  full_adder f(carry[i],input1[i],input2[i],answer[i],carry[i+1]);
     end
  assign carryout = carry[N];
   endgenerate
endmodule 

module full_adder(c_in,x,y,s,c_out);
   input x,y,c_in;
   output s,c_out;
 assign s = x ^ y ^ c_in;
 assign c_out = (y&c_in)| (x&y) | (x&c_in);
endmodule
