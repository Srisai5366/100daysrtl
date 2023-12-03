module fulladderuhalf_ha(a,b,c,s,cout);
  input a,b,c;
  output s,cout;
  wire s,c1,c2;
  halfadder_gt ha1(.a(a),.b(b),.s(s1),.c(c1));
  halfadder_gt ha2(.a(s1),.b(c),.s(c),.c(c2));
  or o1(cout,c1,c2);
endmodule

module tb;
  reg a,b,c;
  wire s,cout;
  fulladderuhalf_ha  dut(a,b,c,s,cout);
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
