module alu
(

input [31:0] srcA , srcB,
input [2:0] alucontrol,
output reg [31:0] aluresult,
output reg zero

);

always @(*) begin

  case (alucontrol)
   3'b010: aluresult <= srcA + srcB; // add
   3'b110: aluresult <= srcA + (~srcB) + 1; // sub
   3'b000: aluresult <= srcA & srcB; // and
   3'b001: aluresult <= srcA | srcB; // or
         3'b111: aluresult <=((srcA[31] != srcB[31]) && srcA<srcB ) ? 1 : 0; // slt
   default: aluresult <=0;
     endcase
end

always @(aluresult) begin
if(aluresult==0)
    begin
        zero<=1;
    end
else begin
        zero<=0;
end
end
endmodule

module alu_tb;
reg [31:0] srcA,srcB;
reg [2:0] alucontrol;
wire [31:0] aluresult;
wire zero;

alu dut(.srcA(srcA),.srcB(srcB),.alucontrol(alucontrol),.aluresult(aluresult),.zero(zero));

initial 
begin 
#5 srcA=32'b0001_1000_0100_1111_0000_0001_0100_0010;srcB=32'b0001_0010_0101_1001_0001_0001_0011_0000; alucontrol=010; 
#5 srcA=32'b0011_1010_0101_1001_0001_0011_0101_0100;srcB=32'b0001_0010_0111_1001_0001_0101_0011_0100; alucontrol=000;
#5 srcA=32'b0001_1000_0100_1111_0000_0001_0100_0010;srcB=32'b0001_0010_0101_1001_0001_0001_0011_0000; alucontrol=100;
#5 srcA=32'b0001_1000_0100_1111_0000_0001_0100_0010;srcB=32'b0001_0010_0101_1001_0001_0001_0011_0000; alucontrol=001;
end

initial 
begin 
$monitor("time=%g, srcA=%b, srcB=%b, alucontrol=%b, aluresult=%b, zero=%b",$time,srcA,srcB,alucontrol,aluresult,zero);
end 
endmodule
