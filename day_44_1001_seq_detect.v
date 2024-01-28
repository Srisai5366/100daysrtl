module fsm_1001(input clk,rst,ip,output seq_det);
reg [1:0] pr_st,nx_st;
parameter s0=2'b00;
parameter s1=2'b01;
parameter s2=2'b10;
parameter s3=2'b11;
always @(posedge clk )begin
if(rst)
pr_st<=s0;
else
pr_st<=nx_st;
end
assign seq_det=((pr_st==s3)&&(ip==1))?1'b1:1'b0;
always @(pr_st,ip)begin
case(pr_st)
s0:if(ip==1)
nx_st<=s1;
else
nx_st<=s0;
s1:if(ip==1)
nx_st<=s1;
else
nx_st<=s2;
s2:if(ip==1)
nx_st<=s1;
else
nx_st<=s3;
s3:if(ip==1)
nx_st<=s0;
else
nx_st<=s0;
default:nx_st<=s0;
endcase
end
endmodule




module tb;
reg clk,rst,ip;
wire seq_det;
fsm_1001 dut(clk,rst,ip,seq_det);
always #5 clk = ~clk;
initial begin
clk=0;rst=1;
#10 rst=0;ip=0;
#10 ip=1;
#10 ip=0;
#10 ip=0;
#10 ip=1;
#10 ip=0;
#10 ip=0;
#10 ip=1;
#10 ip=0;
#150 $finish();
end
initial
$monitor($time,"clk=%b,rst=%b,ip=%b,seq_det=%b",clk,rst,ip,seq_det);
endmodule
