module fsm_1110(input clk,rst,ip,output seq_detect);
reg [1:0] pr_st,nx_st;
always @(posedge clk)begin
if(rst)
pr_st<=2'b00;
else
pr_st<=nx_st;
end
always @(pr_st,ip)begin
case(pr_st)
2'b00:if(ip==1)
nx_st<=2'b00;
else
nx_st<=2'b01;
2'b01:if(ip==1)
nx_st<=2'b10;
else
nx_st<=2'b00;
2'b10:if(ip==1)
nx_st<=2'b11;
else
nx_st<=2'b00;
2'b11:if(ip==0)
nx_st<=2'b00;
else
nx_st<=2'b11;
default:nx_st<=2'b00;
endcase
end
assign seq_detect=((pr_st==2'b11)&&(ip==0))?1'b1:1'b0;
endmodule


module tb;
reg clk,rst,ip;
wire seq_detect;
fsm_1110 dut(clk,rst,ip,seq_detect);
always #5 clk=~clk;
initial begin
clk=0;rst=1;
#10 rst=0;ip=0;
#10 ip=1;
#10 ip=1;
#10 ip=1;
#10 ip=0;
#10 ip=1;
#10 ip=0;
#10 ip=1;
#10 ip=1;
#10 ip=1;
#10 ip=0;
#200 $finish();
end
initial
$monitor($time,"clk=%b,rst=%b,ip=%b,seq_detect=%b",clk,rst,ip,seq_detect);
endmodule
