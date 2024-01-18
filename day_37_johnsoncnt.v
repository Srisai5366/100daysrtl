module dff (input clk,rst,din,output reg q,output qbar);
always @(posedge clk or posedge rst)begin
if(!rst)
q<=0;
else
q<=din;
end
assign qbar=~q;
endmodule
module johncnt(input clk,rst,output [3:0] cnt);
wire q0,q0bar,q1,q1bar,q2,q2bar,q3,q3bar;
wire d1,d2,d3;
dff f1(clk,rst,q3bar,q0,q0bar);
dff f2(clk,rst,q0,q1,q1bar);
dff f3(clk,rst,q1,q2,q2bar);
dff f4(clk,rst,q2,q3,q3bar);
assign cnt={q0,q1,q2,q3};
endmodule


module tb;
reg clk,rst;
wire [3:0]cnt;
johncnt dut(clk,rst,cnt);
always #5 clk = ~clk;
initial begin
clk=0;rst=0;
#10 rst=1;
#150 $finish();
end
initial
$monitor($time,"clk=%b,rst=%b,cnt=%b",clk,rst,cnt);
endmodule
