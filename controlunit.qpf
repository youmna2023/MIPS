module controlunit
(
 input [5:0] opcode,
 input [5:0] funct, //we describe main decoder not ALU decoder so this variable is not used
 
 output reg mem_write,
 output reg [1:0]mem_toreg,
 output reg branch,
 output reg alu_src,
 output reg[1:0] reg_dst,
 output reg reg_write,
 output reg [1:0] alu_op,
 output reg jump,
 output reg logic
 
 );
 
 always@(*)
 begin
 if(opcode==6'b000011)
   begin
    mem_toreg[1]=1'b1;
    reg_dst[1]=1'b1; 
   end
 else begin
   mem_toreg[1]=1'b0;
   reg_dst[1]=1'b0;
 end 
 if (opcode==6'b001101)
   logic=1'b1;
 else logic=1'b0;
   
 case(opcode)
 
    6'b000000: //R_Type
 
           begin
 
                  reg_dst[0]=1;
 
                  alu_src=0;
 
                  mem_toreg[0]=0;
 
                  reg_write=1;
 
                  mem_write=0;
 
                  branch=0;
 
                  alu_op=2'b10;
 
                  jump=0;
 
           end
 
    6'b100011: //lw
 
           begin
 
                  reg_dst[0]=0;
 
                  alu_src=1;
 
                  mem_toreg[0]=1;
 
                  reg_write=1;
 
                  mem_write=0;
 
                  branch=0;
 
                  alu_op=2'b00;
 
                  jump=0;
 
           end
 
    6'b101011: //sw
 
           begin
 
                  reg_dst[0]=1'bx;
 
                  alu_src=1;
 
                  mem_toreg[0]=1'bx;
 
                  reg_write=0;
 
                  mem_write=1;
 
                  branch=0;
 
                  alu_op=2'b00;
 
                  jump=0;
 
           end
 
    6'b000010: //jump
 
           begin
 
                  reg_dst[0]=1'bx;
 
                  alu_src=1'bx;
 
                  mem_toreg[0]=1'bx;
 
                  reg_write=0;
 
                  mem_write=0;
 
                  branch=1'bx;
 
                  alu_op=2'bxx;
 
                  jump=1;
 
           end
 
6'b000011: //jal
 
           begin
 
                  reg_dst[0]=1'b0;
 
                  alu_src=1'bx;
 
                  mem_toreg[0]=1'b0;
 
                  reg_write=1;
 
                  mem_write=0;
 
                  branch=1'bx;
 
                  alu_op=2'b00;
 
                  jump=1;
 
           end
 
    6'b000100: //beq
 
           begin
 
                  reg_dst[0]=1'bx;
 
                  alu_src=0;
 
                  mem_toreg[0]=1'bx;
 
                  reg_write=0;
 
                  mem_write=0;
 
                  branch=1;
 
                  alu_op=2'b01;
 
                  jump=0;
 
           end
 
          
 
    6'b001000: //addi

           begin
 
                  reg_dst[0]=0;
 
                  alu_src=1;
 
                 mem_toreg[0]=0;
 
                  reg_write=1;
 
                  mem_write=0;
 
                  branch=0;
 
                  alu_op=2'b11;
 
                  jump=0;
 
           end
 
     6'b001101: //ori

           begin
 
                  reg_dst[0]=0;
 
                  alu_src=1;
 
                  mem_toreg[0]=0;
 
                  reg_write=1;
 
                  mem_write=0;
 
                  branch=0;
 
                  alu_op=2'b11;
 
                  jump=0;
 
           end
   
 
    default://look @ function
 
           begin
 
                  reg_dst[0]=1;
 
                  alu_src=0;

                  mem_toreg[0]=0;
 
                  reg_write=1;
 
                  mem_write=0;
 
                  branch=0;
 
                  alu_op=2'b10;
 
           end
 
 endcase
end
endmodule
