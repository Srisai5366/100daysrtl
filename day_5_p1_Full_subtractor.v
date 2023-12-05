module fullsub_bev(a,b,bin,diff,bor);
    input a,b,bin;
    output bor,diff;
    reg bor,dff;
    always @(a or b or bin)
    begin
       {bor,diff}=a-b-bin;
    end
endmodule

module tb;
  reg a,b,bin;
  wire bor,diff;
  fullsub_bev dut(a,b,bin,diff,bor);
  initial begin
     a=1'b0;b=1'b0;bin=1'b0;
  #5 a=1'b0;b=1'b0;bin=1'b1;
  #5 a=1'b0;b=1'b1;bin=1'b0;
  #5 a=1'b0;b=1'b1;bin=1'b1;
  #5 a=1'b1;b=1'b0;bin=1'b0;
  #5 a=1'b1;b=1'b0;bin=1'b1;
  #5 a=1'b1;b=1'b1;bin=1'b0;
  #5 a=1'b1;b=1'b1;bin=1'b1;
  #50 $finish();
  end
  initial 
    $monitor($time,"a=%b,b=%b,bin=%b,bor=%b,diff=%b",a,b,bor,diff);
endmodule
