module sram_mem(input clk,we,en,input [7:0]din,input [4:0] addr,output reg [7:0] dout);
 reg [7:0] sram[31:0];
 always @(posedge clk)begin
 if({en,we}==2'b11)
 sram[addr]<=din;
 else if({en,we}==2'b10)
 dout<=sram[addr];
 else
 dout<=8'b0;
 end
endmodule



module tb;
reg clk,we,en;
reg [7:0] din;
reg [4:0]addr;
wire [7:0]dout;
integer i;
sram_mem dut(clk,we,en,din,addr,dout);
always #5 clk = ~clk;
initial begin
clk=0;
for(i=0;i<10;i=i+1)begin
@(negedge clk)
we=1;en=1;din=$random;addr=i;
end
for(i=0;i<10;i=i+1)begin
@(negedge clk)
we=0;en=1;din=$random;addr=i;
end
#200 $finish();
end
initial
$monitor($time,"clk=%b,en=%b,we=%b,din=%d,addr=%d,dout=%d",clk,en,we,din,addr
,dout);
endmodule
