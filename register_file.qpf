module register_file (A1, A2, A3, RD1, RD2, WD3, WE3, clk);
	input [4:0] A1, A2, A3;
	input [31:0] WD3;
	input clk, WE3;
	output [31:0] RD1, RD2;

	reg [31:0] regfile [31:0];
	initial
	begin
	  regfile[0]=32'b0;
	end
	assign RD1 = regfile[A1];
	assign RD2 = regfile[A2];

	always @(posedge clk ) 
	begin
		if (WE3 == 1'b1) regfile[A3] = WD3;
	end
endmodule 
