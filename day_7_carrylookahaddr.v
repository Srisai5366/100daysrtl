module lookaheadcaryad(a,b,cin,s,cout);
 input [3:0] a,b;
  input cin;
  output [3:0] s;
  output cout;
  wire c1,c2,c3,c4;
  wire [3:0] p,g;
  assign p=a^b;
  assign g=a&b;
  assign c1=g[0]|(p[0]&cin);
  assign c2=g[1]|(p[1]&g[0])|(p[0]&p[1]&cin);
  assign c3=g[2]|(p[2]&g[1])|(p[1]&p[2]&g[0])|(p[0]&p[1]&p[2]&cin);
  assign c4=g[3]|(p[3]&g[2])|(p[2]&p[3]&g[1])|(p[1]&p[2]&p[3]&g[0])|(p[0]&p[1]&p[2]&p[3]&cin);
  assign {cout,s} = a+b+cin; //fulladder
endmodule

module tb;
  reg [3:0] a,b;
  reg cin;
  wire [3:0] s;
  wire cout;
  lookaheadcaryad dut(a,b,cin,s,cout);
initial begin
      a=4'b1010;b=4'b1001;cin=1'b0;
   #5 a=4'b1011;b=4'b1010;cin=1'b1;
  #25 $finish();
end
  initial 
    $monitor($time,"a=%b,b=%b,cin=%b,s=%b,cout=%b",a,b,cin,s,cout);
endmodule
