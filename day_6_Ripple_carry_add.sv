module fulladder(input a,b,cin,output s,cout);
 assign {cout,s}=a+b+cin;
endmodule


module adder4bit(a,b,cin,s,cout);
 input [3:0] a,b;
 input cin;
 output [3:0] s;
 output cout;
 wire c1,c2,c3;
 fulladder fa1(a[0],b[0],cin,s[0],c1);
 fulladder fa2(a[1],b[1],c1,s[1],c2);
 fulladder fa3(a[2],b[2],c2,s[2],c3);
 fulladder fa4(a[3],b[3],c4,s[3],cout);
endmodule


//Testbench

module tb;
 reg [3:0] a,b;
 reg cin;
 wire [3:0] s;
 wire cout;
 adder4bit dut(a,b,cin,s,cout);
initial begin
 a=1'b1001;b=4'b1001;cin=1'b0;
 #5 a=1'b1101;b=4'b1001;cin=1'b1;
 #50 $finish();
end
 initial 
 $monitor($time,"a=%b,b=%b,cin=%b,s=%b,cout=%b",a,b,cin,s,cout);
endmodule
