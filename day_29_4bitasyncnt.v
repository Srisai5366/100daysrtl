module dff(input clk,rst,d,output reg q,output qbar);
  always @(negedge clk)begin
    if(rst)
      q<=0;
    else
      q<=d;
  end
  assign qbar=~q;
endmodule

module bit4asy(input clk,rst,output q,qbar,output [3:0]cnt);
  wire q0,q0bar,q1,q1bar,q2,q2bar;
  wire d0,d1,d2,d3;
  dff f0(clk,rst,d0,q0,q0bar);
  dff f1(q0,rst,d1,q1,q1bar);
  dff f2(q1,rst,d2,q2,q2bar);
  dff f3(q2,rst,d3,q,qbar);
  //toggle condition for d flipflop
  assign d0=q0bar;
  assign d1=q1bar;
  assign d2=q2bar;
  assign d3=qbar;
  assign cnt={q,q2,q1,q0};
endmodule


TestBench:
module tb;
  reg clk,rst;
  wire q,qbar;
  wire [3:0] cnt;
  bit4asy dut(clk,rst,q,qbar,cnt);
  always #5 clk = ~clk;
  initial begin
        clk=0;rst=1;
    #10   rst=0;
    #200 $finish();
  end
  initial 
    $monitor($time,"clk=%b,rst=%b,cnt=%b",clk,rst,cnt);
endmodule
