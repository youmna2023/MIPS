module Mux_3 (input0, input1,input2, mux_out, control);
	input [31:0] input0, input1,input2;
	output reg [31:0] mux_out;
	input[1:0]control;
	always@(*) begin
	if (control[1])
	   mux_out=input2;
	else if (control[1]!=1)
	  mux_out=control[0]?input1:input0;
end
endmodule
