module tff (input clk,rst,input t,output reg q,output qbar);
 always @(posedge clk)begin
 if(rst)
 q<=0;
 else
 q<=t?~q:q;
 end
 assign qbar = ~q;
endmodule
module asycnt(input ck,rst,input [1:0]t,output q,qbar,output [1:0]cnt);
 wire q0,q0bar;
 tff f1(clk,rst,t[0],q0,q0bar);
 tff f2(q0bar,rst,t[1],q,qbar);
 assign cnt={q,q0};
endmodule



module tb;
 reg clk,rst;
 wire q,qbar;
 wire [1:0] cnt;
 reg [1:0] t;
 asycnt as(clk,rst,t,q,qbar,cnt);
 always #5 clk = ~clk;
 initial begin
 clk=0;rst=1;
 #20 rst=0;
 t=2'b00;
 #20 t=2'b11;
 #100 $finish();
 end
 initial
 $monitor($time,"clk=%b,rst=%b,cnt=%b",clk,rst,cnt);
endmodule
