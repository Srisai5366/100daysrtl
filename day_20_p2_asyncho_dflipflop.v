always @(posedge clk or negedge rst)begin
if(rst)
q<=0;
else
q<=din;
end
endmodule

module tbx;
reg clk,rst,din;
wire q;
dff asy f1(clk,rst,din,q);
always #5 clk=~clk;
initial begin
clk=1;rst=1;
#10 rst=0;din=0;
#10 din=1;
#30 $finish();
end
initial
$monitor($time,"clk=%b,rst=%b,din=%b,q=%b",clk,rst,din,q);
endmodule
