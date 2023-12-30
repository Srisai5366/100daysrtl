module dff (input clk,rst,d,output reg q,output qbar);
 always @(negedge clk)begin
 if(rst)
 q<=0;
 else
 q<=d;
 end
 assign qbar=~q;
endmodule
module syncnt(input clk,rst,output q,qbar,output [1:0] cnt);
 wire d0,d1;
 wire q0,q0bar,q1,q1bar;
 dff f1(clk,rst,d0,q0,q0bar);
 dff f2(clk,rst,d1,q1,q1bar);
 assign d0=q0^q1;
 assign d1=q1bar;
 assign cnt={q0,q1};
endmodule


module tb;
 reg clk,rst,d;
 wire q,qbar;
 wire [1:0] cnt;
 syncnt cn(clk,rst,q,qbar,cnt);
 always #5 clk = ~clk;
 initial begin
 clk=0;rst=1;
 #20 rst=0;
 #150 $finish();
 end
 initial 
 $monitor($time,"clk=%b.rst=%b,cnt=%b",clk,rst,cnt);
endmodule
