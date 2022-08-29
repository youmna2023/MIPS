module Data_Memory(output [31:0] Read_Data,input clk,WE,output reg[31:0] ALU_Result,output reg[31:0]Write_Data);
  reg [31:0] Memory[63:0];
  //wire [31:2] memory_add;
  
  assign Read_Data=Memory[ALU_Result[31:2]];
  always @(posedge clk)
  begin
  if(WE)
  Memory[ALU_Result[31:2]]<=Write_Data;
  end
endmodule
