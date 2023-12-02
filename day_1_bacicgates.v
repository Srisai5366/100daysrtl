module basicgates(input a,b,output y1,y2,y3_bar,y4,y5,y6,y7);
  and a1(y1,a,b);
  or o1(y2,a,b);
  not n1(y3_bar,a);
  nand na1(y4,a,b);//universal gates
  nor no1(y5,a,b);//universal gate
  xor x1(y6,a,b);
  xnor xn1(y7,a,b);
endmodule

module tb;
  reg a,b;
  wire y1,y2,y3_bar,y4,y5,y6,y7;
  basicgates bs(a,b,y1,y2,y3_bar,y4,y5,y6,y7);
  initial begin
    a=1'b0;b=1'b0;
  #5 a=1'b0;b=1'b1;
  #5 a=1'b1;b=1'b0;
  #5 a=1'b1;b=1'b1;
  #25 $finish();
  end
  initial
    $monitor($time,"a=%b,b=%b,y1=%b,y2=%b,y3_bar=%b,y4=%b,y5=%b,y6=%b,y7=%b",a,b,y1,y2,y3_bar,y4,y5,y6,y7);
endmodule
    
  
  
