module dff(input clk,rst,d,output reg q,output qbar);
 always @(negedge clk)begin
 if(rst)
 q<=0;
 else
 q<=d;
 end
 assign qbar=~q;
endmodule

module mod3(input clk,rst,output reg [1:0] cnt,output out,output q,qbar);
 always @(posedge clk or posedge rst)begin
 if(rst)
 cnt<=0;
 else if(cnt==2'b10)
 cnt<=0;
 else
 cnt<=cnt+1;
 end
 wire d;
 dff f1(clk,rst,d,q,qbar);
 assign d=cnt[1];
 assign out=cnt[1]|q;
endmodule



module tb;
reg clk,rst;
wire [1:0]cnt;
wire out;
wire q,qbar;
mod3 dut(clk,rst,cnt,out,q,qbar);
always #5 clk=~clk;
initial begin
clk=0;rst=1;
#20 rst=0;
#150 $finish();
end
initial
$monitor($time,"clk=%b,rst=%b,cnt=%b,out=%b",clk,rst,cnt,out);
endmodule
