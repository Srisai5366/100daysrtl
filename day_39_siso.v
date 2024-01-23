module dff(input clk,rst,din,output reg q,output qbar);
always @(posedge clk)begin
if(rst)
q<=0;
else
q<=din;
end
assign qbar=~q;
endmodule
module siso(input clk,rst,si,output out);
wire q1,q2,q2;
dff f1(clk,rst,si,q1);
dff f2(clk,rst,q1,q2);
dff f3(clk,rst,q2,q3);
dff f4(clk,rst,q3,out);
endmodule


module tb;
reg clk,rst,si;
wire out;
siso dut(clk,rst,si,out);
always #5 clk = ~clk;
initial begin
clk=0;rst=1;
#10 rst=0;si=1;
#10 si=0;
#10 si=1;
#10 si=1;
#100 $finish();
end
initial
$monitor($time,"clk=%b,rst=%b,si=%b,out=%b",clk,rst,si,out);
endmodule
