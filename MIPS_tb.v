module MIPS_tb;
reg clk=0;
reg reset=1;
reg [31:0] int_four,int31;
reg [31:0] instruction,pc_branch,pc_plus4,pc_jump,pc,pc_before_clk,final_pc;
reg [31:0] register_RD1,register_RD2;
reg [31:0] extended_imm,extended_imm_by_four;
reg [4:0] write_to_register;
reg [1:0] mem_to_reg,reg_dest,alu_op;
reg jump,mem_write_en,reg_write_en,branch,ori_ctrl,alu_src,zero,pc_source,sourceB;
reg [2:0] alu_control;
reg [31:0] alu_output,mem_data_out,data_result;

MIPS dut(.clk(clk),.reset(reset),.int_four(int_four),.int31(int31),.instruction(instruction),.pc_branch(pc_branch),.pc_plus4(pc_plus4),.pc_jump(pc_jump),.pc(pc),.pc_before_clk(pc_before_clk),.final_pc(final_pc),.data_result(data_result),.write_to_register(write_to_register),.register_RD1(register_RD1),.register_RD2(register_RD2),.mem_to_reg(mem_to_reg),.reg_dest(reg_dest),.alu_op(alu_op),
.jump(jump),.mem_write_en(mem_write_en),.reg_write_en(reg_write_en),.branch(branch),.ori_ctrl(ori_ctrl),.alu_src(alu_src),.zero(zero),.pc_source(pc_source),.sourceB(sourceB),.alu_control(alu_control),.alu_output(alu_output),.mem_data_out(mem_data_out),.extended_imm(extended_imm),.extended_imm_by_four(extended_imm_by_four));

always
#5 clk=~clk;
always
#5 reset=~reset;

initial 
begin
#5 pc_before_clk = 32'b10001100000100010000000000000100; reg_write_en=1'b1; 
mem_to_reg=1'b1; int_four=32'b100; alu_control=3'b010;
end

initial 
begin 
$monitor("time=%g, instruction=%b, alu_control=%b, zero=%b, data_result=%b",$time,instruction,alu_control,zero,data_result);
end 
endmodule

