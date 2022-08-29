module PC(out,in,clk,reset);
  output [31:0] out;
  input [31:0] in ;
  input clk,reset;
  reg [31:0] out;

  initial begin
    out =32'b0;
  end

  always@(posedge clk or posedge reset)
  begin
    if (reset == 1'b1)
      out<=32'b0;
    else
      out <= in;
  end
endmodule

module PC_tb;
reg CLK =0 ;
reg RST=1;
reg [31:0]IN;
wire [31:0]OUT;

PC dut(.out(OUT),.in(IN),.clk(CLK),.reset(RST));

always 
#10 CLK = ~ CLK;
always
#10 RST = ~ RST;

initial 
begin 
#10 IN=32'b00100000000010010000000000110111;
#20 IN=32'b00000001000010011000000000100100;

end

initial 
begin 
$monitor("time=%g, CLK=%b, RST=%b, IN=%b, OUT=%b",$time,CLK,RST,IN,OUT);
end 
endmodule
