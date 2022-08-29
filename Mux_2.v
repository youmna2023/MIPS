module Mux_2 (input0, input1, mux_out, control);
	input [31:0] input0, input1;
	output [31:0] mux_out;
	input control;
	assign mux_out=control?input1:input0;
endmodule
