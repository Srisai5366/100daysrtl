module pipo(clk,rst,d,q);
  input clk,rst;
  input [3:0]d;
  output reg [3:0]q;
  integer i;
  always @(posedge clk)begin
    if(rst)
      q<=0;
    else begin
      for(i=3;i>=0;i=i-1)begin
        q[i]<=d[i];
      end
    end
  end
endmodule




TestBench:
module tb;
  reg clk,rst;
  reg [3:0]d;
  wire [3:0]q;

  pipo dut(clk,rst,d,q);

  always #5 clk=~clk;
  initial begin
    clk=0;rst=1;
    #10 rst=0;d=4'b1010;
    #10 d=4'b1110;
    #50 $finish();
  end
  initial
    $monitor($time,"clk=%b,rst=%b,d=%b,q=%b",clk,rst,d,q);
endmodule
