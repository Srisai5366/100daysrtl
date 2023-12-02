module halfadder_bev(a,b,s,c);
  input a,b;
  output s,c;
  reg s,c;
  always @(a or b)
    begin
      {c,s} = a + b;
    end
endmodule

module tb;
  reg a,b;
  wire s,c;
  halfadder_bev dut(a,b,s,c);
  a=1'b0;b=1'b0;
  #5 a=1'b0;b=1'b1;
  #5 a=1'b1;b=1'b0;
  #5 a=1'b1;b=1'b1;
  #50 $finish();
  end
  initial 
    $monitor($time,"a=%b,b=%b,s=%b.,c=%b",a,b,s,c);
endmodule
