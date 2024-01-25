module dff (input clk,rst,d,output reg q,output qbar);
always @(posedge clk)begin
if(rst)
q<=0;
else
q<=d;
end
assign qbar = ~q;
endmodule
module piso(input clk,rst,x,a,b,c,d,output q);
wire d3,d2,d1,d0;
wire q3,q2,q1;
dff f3(clk,rst,d3,q3);
dff f2(clk,rst,d2,q2);
dff f1(clk,rst,d1,q1);
dff f0(clk,rst,d0,q);
assign d3=x?0:a;
assign d2=x?q3:b;
assign d1=x?q2:c;
assign d0=x?q1:d;
endmodule



module tb;
reg clk,rst,x,a,b,c,d;
wire q;
piso dut(clk,rst,x,a,b,c,d,q);
always #5 clk = ~clk;
initial begin
clk=0;rst=1;x=1;
#15 rst=0;x=1;{a,b,c,d}=4'b1010;
#30 x=0;
#40 x=1;
#100 $finish();
end
initial
$monitor($time,"clk=%b,rst=%b,x=%b,a=%b,b=%b,c=%b,d=%b,q=%b",clk,rst,x,a,b,c,d,q);
endmodule
