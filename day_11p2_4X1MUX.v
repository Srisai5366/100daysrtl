module mux41(input s0,s1,i0,i1,i2,i3,i4,output reg y);
always @(*)begin
if({s0,s1}==2'b00)
y=i0;
else if({s0,s1}==2'b01)
y=i1;
else if({s0,s1}==2'b10)
y=i2;
else
y=i3;
end
endmodule


module tb;
reg s0,s1,i0,i1,i2,i3;
wire y;
mux41 x(s0,s1,i0,i1,i2,i3,y);
initi al begin
s0=1'b0;s1=1'b0;i0=1'b1;i1=1'b0;i2=1'b0;i3=1'b0;
#5 s0=1'b0;s1=1'b1;i0=1'b0;i1=1'b1;i2=1'b0;i3=1'b0;
#5 s0=1'b1;s1=1'b0;i0=1'b0;i1=1'b0;i2=1'b1;i3=1'b0;
#5 s0=1'b1;s1=1'b1;i0=1'b0;i1=1'b0;i2=1'b0;i3=1'b1;
#25 $finish();
end
initi al
$monitor($ti me,"s0=%b,s1=%b,i0=%b,i1=%b,i2=%b,i3=%b,y=%b",s0,s1,i0,i1,i2,i3,y);
endmodule
