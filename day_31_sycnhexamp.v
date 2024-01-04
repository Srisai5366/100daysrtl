module dff (input clk,rst,d,output reg q,output qbar);
always @(posedge clk)begin
if(rst)
q<=0;
else
q<=d;
end
assign qbar=~q;
endmodule

module cnt(input clk,rst,output q,qbar,output [2:0] cnt);
wire [2:0]d;
wire q0,q0bar,q1,q1bar;
dff f0(clk,rst,d[0],q0,q0bar);
dff f1(clk,rst,d[1],q1,q1bar);
dff f2(clk,rst,d[2],q,qbar);
assign d[0]=q0&q1bar| q0bar&q1&q;
assign d[1]=q1bar&q;
assign d[2]=q1bar;
assign cnt={q0,q1,q};
endmodule



module tb;
reg clk,rst;
wire q,qbar;
wire [2:0]cnt;
cnt dut(clk,rst,q,qbar,cnt);
always #5 clk=~clk;
initial begin
clk=0;rst=1;
#10 rst=0;
#100 $finish();
end
initial
$monitor($time,"clk=%b,rst=%b,d=%b",clk,rst,cnt);
endmodule


