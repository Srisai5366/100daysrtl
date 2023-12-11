module mux21(i0,i1,s,y);
input i0,i1,s;
output y;
assign y=s?i1:i0;//conditi onal operator
endmodule

module txtb;
 reg i0,i1,s;
 wire y;
 mux21 xr(i0,i1,s,y);
 initial begin
 i0=1'b1;i1=1'b0;s=1'b0;
 #5 i0=1'b0;i1=1'b1;s=1'b1;
 end
 initial
 $monitor($time,"i0=%b,i1=%b,s=%b,y=%b",i0,i1,s,y);
endmodule
