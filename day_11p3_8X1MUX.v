module mux81(input s0,s1,s2,i0,i1,i2,i3,i4,i5,i6,i7,output reg y);
always @(*)begin
case ({s0,s1,s2})
3'b000:y=i0;
3'b001:y=i1;
3'b010:y=i2;
3'b011:y=i3;
3'b100:y=i4;
3'b101:y=i5;
3'b110:y=i6;
3'b111:y=i7;
endcase
end
endmodule


module tb;
reg s0,s1,s2,i0,i1,i2,i3,i4,i5,i6,i7;
wire y;
mux81 x(s0,s1,s2,i0,i1,i2,i3,i4,i5,i6,i7,y);
initi al begin
s0=1'b0;s1=1'b0;s2=1'b0;i0=1'b1;i1=1'b0;i2=1'b0;i3=1'b0;i4=1'b0;i5=1'b0;i6=1'b0;i7=1'b0;
#5
s0=1'b0;s1=1'b0;s2=1'b1;i0=1'b0;i1=1'b1;i2=1'b0;i3=1'b0;i4=1'b0;i5=1'b0;i6=1'b0;i7=1'b0;
#5
s0=1'b0;s1=1'b1;s2=1'b0;i0=1'b0;i1=1'b0;i2=1'b1;i3=1'b0;i4=1'b0;i5=1'b0;i6=1'b0;i7=1'b0;
#5
s0=1'b0;s1=1'b1;s2=1'b1;i0=1'b0;i1=1'b0;i2=1'b0;i3=1'b1;i4=1'b0;i5=1'b0;i6=1'b0;i7=1'b0;
#5
s0=1'b1;s1=1'b0;s2=1'b0;i0=1'b0;i1=1'b0;i2=1'b0;i3=1'b0;i4=1'b1;i5=1'b0;i6=1'b0;i7=1'b0;
#5
s0=1'b1;s1=1'b0;s2=1'b1;i0=1'b0;i1=1'b0;i2=1'b0;i3=1'b0;i4=1'b0;i5=1'b1;i6=1'b0;i7=1'b0;
#5
s0=1'b1;s1=1'b1;s2=1'b0;i0=1'b0;i1=1'b0;i2=1'b0;i3=1'b0;i4=1'b0;i5=1'b0;i6=1'b1;i7=1'b0;
#5
s0=1'b1;s1=1'b1;s2=1'b1;i0=1'b0;i1=1'b0;i2=1'b0;i3=1'b0;i4=1'b0;i5=1'b0;i6=1'b0;i7=1'b1;
#50 $finish();
end
initi al
$monitor($ti me,"s0=%b,s1=%b,s2=%b,i0=%b,i1=%b,i2=%b,i3=%b,i4=%b,i5=%b,i6=%b,i7=%b
,y=%b",s0,s1,s2,i0,i1,i2,i3,i4,i5,i6,i7,y);
endmodule
