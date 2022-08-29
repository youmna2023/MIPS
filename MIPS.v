module MIPS(clk,reset,int_four,int31,instruction,pc_branch,pc_plus4,pc_jump,pc,pc_before_clk,final_pc,data_result,write_to_register,register_RD1,register_RD2,mem_to_reg,reg_dest,alu_op,
jump,mem_write_en,reg_write_en,branch,ori_ctrl,alu_src,zero,pc_source,sourceB,alu_control,alu_output,mem_data_out,extended_imm,extended_imm_by_four);
  input clk,reset;
  input [31:0] int_four,int31;
  inout[31:0] instruction;
  inout [31:0] pc_branch,pc_plus4,pc_jump,pc,pc_before_clk,final_pc;
  inout [31:0] register_RD1,register_RD2;
  inout [31:0] extended_imm,extended_imm_by_four;
  inout [4:0] write_to_register;
  inout [1:0] mem_to_reg,reg_dest,alu_op;
  inout jump,mem_write_en,reg_write_en,branch,ori_ctrl,alu_src,zero,pc_source,sourceB;
  inout [2:0] alu_control;
  inout [31:0] alu_output,mem_data_out,data_result;
  //************************* Signals**************************
  wire [31:0] pc_branch,pc_jump,pc_plus4,pc,pc_before_clk,final_pc;//PC wires
  wire [31:0]int_four;//adder 
  wire [31:0] int31;
  assign int31=32'd31;
  assign int_four=32'b100;
  wire [31:0] instruction;//instruction memory
  wire [4:0]write_to_register;//register file
  wire[31:0] register_RD1,register_RD2;//register_file
  wire[31:0]extended_imm,extended_imm_by_four;  //extension
  wire[1:0]mem_to_reg,reg_dest,alu_op;//control unit
  wire jump,mem_write_en,reg_write_en,branch,ori_ctrl,alu_src,zero,pc_source,sourceB;
  wire[2:0] alu_control;//alu 
  wire[31:0] alu_output,mem_data_out,data_result;//result
  //**************************** connection***************************************
  Mux_2 PCSource(pc_plus4, pc_branch, pc, pc_source);
  assign pc_jump[31:28]=pc_plus4[31:28];
  Mux_2 PCJump(pc, pc_jump, pc_before_clk, jump);
  PC final_PC (final_pc,pc_before_clk,clk,reset);
  adder PCPlus4 (final_pc,int_four,pc_plus4);
  instr_mem instruction_mem(final_pc,instruction);
  Shift_Left_Two_Jump shifter1 (instruction[25:0], pc_jump[27:0]);
  extension extend_address(instruction[15:0], extended_imm,ori_ctrl);
  Shift_Left_Two shifter2(extended_imm_by_four,extended_imm); 
  adder PCBranch(extended_imm_by_four,pc_plus4,pc_branch);
 controlunit main_decoder(instruction[31:26],instruction[5:0], mem_write_en,mem_to_reg,branch,alu_src,reg_dest,reg_write_en,alu_op,jump,ori_ctrl);
 aludec decoder (instruction[31:26],instruction[5:0],alu_op,alu_control);
  Mux_2 Source_B(register_RD2, extended_imm, sourceB, alu_src);
  alu ALU(register_RD1, sourceB,alu_control,alu_output,zero);
  assign pc_source=branch && zero;
  Data_Memory memory (mem_data_out,clk,mem_write_en,alu_output,register_RD2);
  Mux_3 resulted_data(alu_output,mem_data_out,pc_plus4, data_result, mem_to_reg);
  register_file RegisterFile (instruction[25:21], instruction[20:16], write_to_register, register_RD1, register_RD2,data_result,reg_write_en, clk);
  Mux_3 register_dst(instruction[20:16], instruction[15:11],int31, write_to_register, reg_dest);
 
endmodule
