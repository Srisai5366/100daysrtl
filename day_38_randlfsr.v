module rlfsr(input clk,rst,xin,output reg [3:0] cnt);
 always @(posedge clk or posedge rst)begin
 if(rst)
 cnt<=0;
 else
 cnt<={cnt[3]^xin,cnt[3]^cnt[0],cnt[1],cnt[2]^cnt[3]};
 end
endmodule


module tb;
 reg clk,rst,xin;
 wire [3:0] cnt;
 rlfsr dut(clk,rst,xin,cnt);
 always #5 clk = ~clk;
 initial begin
 clk=0;rst=1;
 #20 rst=0;
 repeat(10)begin
 xin=1;
 #20 xin=0;
 #20 xin=1;
 end
 #250 $finish();
 
 end
initial
 $monitor($time,"clk=%b,rst=%b,xin=%b,cnt=%b",clk,rst,xin,cnt);
endmodule
