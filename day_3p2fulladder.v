module fulladder_gt(a,b,c,s,cout);
  input a,b,c;
  output s,cout;
  wire s,cout;
  assign {cout,s}=a+b+c;
endmodule

module tb;
  reg a,b,c;
  wire s,cout;
  fulladder_gt dut(a,b,c,s,cout);
  a=1'b0;b=1'b0;c=1'b0;
  #5 a=1'b0;b=1'b0;c=1'b1;
  #5 a=1'b0;b=1'b1;c=1'b0;
  #5 a=1'b0;b=1'b1;c=1'b1;
  #5 a=1'b1;b=1'b0;c=1'b0;
  #5 a=1'b1;b=1'b0;c=1'b1;
  #5 a=1'b1;b=1'b1;c=1'b0;
  #5 a=1'b1;b=1'b1;c=1'b1;
  #100 $finish();
  end
  initial 
$monitor($time,"a=%b,b=%b,c=%b.,s=%b,cout=%b",a,b,c,s,cout);
endmodule
