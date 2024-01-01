module tff (input clk,rst,t,output reg q,output qbar);
always @(posedge clk) begin
if(rst)
q<=0;
else
q<=t?~q:q;
end
assign qbar=~q;
endmodule

module bit4syn(input clk,rst,output q,qbar,output [3:0] cnt);
wire [3:0]t;
wire q0,q0bar,q1,q1bar,q2,q2bar;
tff f1(clk,rst,t[0],q0,q0bar);
tff f2(clk,rst,t[1],q1,q1bar);
tff f3(clk,rst,t[2],q2,q2bar);
tff f4(clk,rst,t[3],q,q3bar);
assign t[0]=1;
assign t[1]=q0;
assign t[2]=q1&q0;
assign t[3]=q1&q2&q0;
assign cnt={q,q2,q1,q0};
endmodule

module tb;
 reg clk,rst;
 wire q,qbar;
 wire [3:0] cnt;
 bit4syn dut(clk,rst,q,qbar,cnt);
 always #5 clk=~clk;
 initial begin
 clk=0;rst=1;
 #20 rst=0;
 #150 $finish();
 end
 initial
 $monitor($time,"clk=%b,rst=%b,cnt=%b",clk,rst,cnt);
endmodule
