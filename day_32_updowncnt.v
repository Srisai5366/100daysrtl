`timescale 1ns/1ps
module up4down(input clk,rst,updown,output reg [3:0]cnt);
always @(posedge clk)begin
if(rst)
cnt<=0;
else if(updown==1 && cnt>=0 && cnt<16)
cnt<=cnt-1'b1;
else if(updown==0 && cnt>=0 && cnt<16)
cnt<=cnt-1'b1;
else
cnt<=0;
end
endmodule


module tb;
reg clk,rst,updown;
wire [3:0] cnt;
up4down dut(clk,rst,updown,cnt);
always #5 clk=~clk;
initial begin
clk=0;rst=1;
#10 rst=0;updown=1;
#60 updown=0;
#200 $finish();
end
initial
$monitor($time,"clk=%b,rst=%b,cnt=%b",clk,rst,cnt);
endmodule
