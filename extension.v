module extension (imm, sign_imm,logic);
 input [15:0] imm;
 input logic;
 output reg[31:0] sign_imm;
 always@(*)begin
 sign_imm[15:0]=imm[15:0];
 if(logic)  sign_imm[31:16]=16'b0;
 else
 sign_imm[31:16]=imm[15]?16'b1111111111111111:16'b0;
end
endmodule
