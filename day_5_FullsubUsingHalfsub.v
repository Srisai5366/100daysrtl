module fullsub_bev(a,b,bin,diff,bor);
  input a,b,bin;
   output bor,diff;
   wire d1,b1,b2;
  halfsub_bev be1(.a(a),.b(b),.diff(d1),.bor(b1));
  halfsub_bev be2(.a(d1),.b(bin),.diff(diff),.bor(b2));
  or o1(bor,b1,b2);
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
