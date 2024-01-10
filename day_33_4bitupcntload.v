module bit4upl(input clk,rst,load,count,input [3:0]din,output reg [3:0] cnt);
always @(posedge clk or posedge rst)begin
if(rst)
cnt<=0;
else if(load)
cnt<=din;
else if(count)
cnt<=cnt+1'b1;
else
cnt<=cnt;
end
endmodule



module tb;
 reg clk,rst,count,load;
 reg [3:0]din;
 wire [3:0] cnt;
 bit4upl dut(clk,rst,load,count,din,cnt);
 always #5 clk=~clk;
 initial begin
 clk=0;rst=1;
 #10 rst=0;load=0;
 #60 load=1;din=4'b1010;
 #10 load=0;count=1;
 #10 load=1;din=4'b1111;
 #10 load=0;count=0;
 #10 load=0;count=1;
 #250 $finish();
 end
 initial
$monitor($time,"clk=%b,rst=%b,load=%b,count=%b,din=%b,cnt=%b",clk,rst,load,count,din,c
nt);
endmodule
