module demux41(input d,s0,s1,output i0,i1,i2,i3);
wire s0_bar,s1_bar;
not no(s0_bar,s0);
not n1(s1_bar,s1);
and a0(i0,s0_bar,s1_bar,d);
and a1(i1,s0_bar,s1,d);
and a2(i2,s0,s1_bar,d);
and a3(i3,s0,s1,d);
endmodule



module tb;
reg d,s0,s1;
wire i0,i1,i2,i3;
demux41 ex(d,s0,s1,i0,i1,i2,i3);
initi al begin
d=1'b1;s0=1'b0;s1=1'b0;
#5 d=1'b1;s0=1'b0;s1=1'b1;
#5 d=1'b1;s0=1'b1;s1=1'b0;
#5 d=1'b1;s0=1'b1;s1=1'b1;
#25 $finish();
end
initi al
$monitor($ti me,“d=%b,s0=%b,s1=%b,i0=%b,i1=%b,i2=%b,i3=%b”,d,s0,s1,i0,i1,i2,i3);
endmodule
