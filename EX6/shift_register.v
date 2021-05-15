module DFlipFlop(input D, input Clock, output reg Q);
	always @(posedge Clock)
		Q = D;
endmodule

module shift_register(enable, reset, Load, data_in, dir, leftInput, rightInput, Clock, Q);
parameter n = 4;
input [n-1:0] data_in;
input enable, reset, Load, dir, leftInput, rightInput, Clock;
reg [n-1:0] In;
output wire [n-1:0] Q;

genvar i;
generate
	for(i=0; i < n; i=i+1)
		DFlipFlop dff(.D(In[i]), .Clock(Clock), .Q(Q[i]));
endgenerate

always @(posedge Clock or posedge reset)
begin
	if(reset)
		In = 0;
	else if (Load)
		In = data_in;
	else if (enable)
	begin
		if (dir)
			In = {Q[n-2:0], rightInput};
		else
			In = {leftInput, Q[n-1:1]};
	end
end
endmodule
