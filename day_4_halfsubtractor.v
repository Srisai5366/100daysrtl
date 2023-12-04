module halfsub_bev(a,b,diff,bar);
  input a,b;
   output bar,diff;
   reg bar,dff;
  always @(a or b)
  begin
    diff = a ^ b;
    bar  = (~a) & b;
  end
endmodule

module tb;
  reg a,b;
  wire bar,diff;
  halfsub_bev dut(a,b,diff,bar);
  initial begin
     a=1'b0;b=1'b0;
  #5 a=1'b0;b=1'b1;
  #5 a=1'b1;b=1'b0;
  #5 a=1'b0;b=1'b1;
  #25 $finish();
  end
  initial 
     $monitor($time,"a=%b,b=%b,bar=%b,diff=%b",a,b,bar,diff);
endmodule
