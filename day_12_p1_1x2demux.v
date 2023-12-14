module demux21(input a,s,output y1,y0);
assign {y1,y0} = s?{1'b0,a}:{a,1'b0};
endmodule

module tb;
reg a,s;
wire y1,y0;
demux21 ex(a,s,y1,y0);
initi al begin
s=0;a=1;
#10 s=1;a=1;
#30 $finish();
end
initial
$monitor($ti me,“a=%b,s=%b,y1=%b,y0=%b”,a,s,y1,y0);
endmodule
