module fulladder(input a,b,cin,output s,cout);
 assign {cout,s}=a+b+cin;
endmodule
module sub4bit(a,b,m,s,cout);
 input [3:0] a,b;
 input m;
 output [3:0] s;
 output cout;
 wire c1,c2,c3;
 fulladder s1(a[0],m^b[0],m,s[0],c1);
 fulladder s2(a[1],m^b[1],c1,s[1],c2);
 fulladder s3(a[2],m^b[2],c2,s[2],c3);
 fulladder s4(a[3],m^b[3],c3,s[3],cout);
 
endmodule

 reg [3:0] a,b;
 reg m;
 wire [3:0] s;
 wire cout;
 sub4bit dut(a,b,m,s,cout);
initial begin
 a=4'b1000;b=4'b1010;m=1'b1;//subtraction if x=1
 #10 a=4'b1000;b=4'b1010;m=1'b1;//subtraction if x=0
 #30 $finish();
end
 initial 
$monitor($time,"a=%b,b=%b,m=%b,sub=%b,cout=%b",a,b,m,s,cout);
endmodule
