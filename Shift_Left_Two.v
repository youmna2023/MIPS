module Shift_Left_Two(output [31:0] Output,input[31:0] Input);
  assign Output={Input[29:0] ,2'b00};
endmodule
