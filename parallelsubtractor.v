module fulladder(input a,b,cin,output s,cout);
  assign {cout,s}=a+b+cin;
endmodule
module sub4bit(a,b,cin,s,cout);
  input [3:0] a,b;
  input cin;
  output [3:0] s;
  output cout;
  wire b1,b2,b3;
  fulladder s1(a[0],~b[0],cin,s[0],c1);
  fulladder s2(a[1],~b[1],c1,s[1],c2);
  fulladder s3(a[2],~b[2],c2,s[2],c3);
  fulladder s4(a[3],~b[3],c3,s[3],cout);
  
endmodule

module tb;
  reg [3:0] a,b;
  reg cin;
  wire [3:0] s;
  wire cout;
  sub4bit dut(a,b,cin,s,cout);
initial begin
      a=4'b1101;b=4'b1011;cin=1'b1;
   #5 a=4'b1001;b=4'b1111;cin=1'b1;
  #25 $finish();
end
  initial 
    $monitor($time,"a=%b,b=%b,cin=%b,sub=%b,bor=%b",a,b,cin,s,cout);
endmodule
