module dff (input clk,rst,din,output reg q,output qbar);
 always @(posedge clk)begin
 if(rst)
 q<=0;
 else
 q<=din;
 end
 assign qbar=~q;
endmodule

module mod2(input clk,rst,output cnt,output q,qbar);
 wire d;
 dff f1(clk,rst,d,q,qbar);
 assign d=qbar;
 assign cnt=q;
endmodule

module tb;
 reg clk,rst;
 wire cnt,q,qbar;
 mod2 dut(clk,rst,cnt,q,qbar);
 always #5 clk=~clk;
 initial begin
 clk=0;rst=1;
 #20 rst=0;
 #100 $finish();
 end
 initial
 $monitor($time," clk=%b,rst=%b,cnt=%b",clk,rst,cnt);
endmodule
