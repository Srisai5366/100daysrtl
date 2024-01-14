module ring(input clk,rst,output reg [3:0]cnt);
  integer i;
  always @(posedge clk or posedge rst)begin
    if(!rst)
      cnt<=4'b1000;
    else begin
      cnt[3]<=cnt[0];
      for(i=0;i<3;i=i+1)begin
      cnt[i]<=cnt[i+1];
    end
    end
      
  end
endmodule


module tb;
  reg clk,rst;
  wire [3:0]cnt;
  ring dut(clk,rst,cnt);
  always #5 clk = ~clk;
  initial begin
    clk=0;rst=0;
    #20 rst=1;
    #250 $finish();
  end
  initial
    $monitor($time,"clk=%b,rst=%b,cnt=%b",clk,rst,cnt);
endmodule
