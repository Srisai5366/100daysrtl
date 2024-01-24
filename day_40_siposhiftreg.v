module sipo(input clk,rst,din,output reg [3:0]q);
  always @(posedge clk)begin
    if(rst)
      q<=0;
    else begin
      q[3]<=din;
      q[2]<=q[3];
      q[1]<=q[2];
      q[0]<=q[1];
    end
  end
endmodule


module tb;
  reg clk,rst,din;
  wire [3:0]q;
  
  sipo dut(clk,rst,din,q);
  always #5 clk = ~clk;
  initial begin
    clk=0;rst=1;
    #10 rst=0;din=0;
    #10 din=1;
    #10 din=1;
    #10 din=0;
    #100 $finish();
  end
  initial
    $monitor($time,"clk=%b,rst=%b,din=%b,q=%b",clk,rst,din,q);
endmodule
