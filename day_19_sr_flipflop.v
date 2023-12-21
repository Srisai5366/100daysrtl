module srff (input clk,rst,s,r,output reg q,output qb);
always @(posedge clk)begin
if(rst)
q<=0;
else
begin
case({s,r})
2'b00:q<=q;
2'b01:q<=1'b0;
2'b10:q<=1'b1;
2'b11:q<=1'bx;
endcase
end
end
assign qb=~q;
endmodule


module tbx;
reg clk,rst,s,r;
wire q,qb;
srff f1(clk,rst,s,r,q,qb);
always #5 clk=~clk;
initial begin
clk=0;rst=1;
#10 rst=0;s=0;r=0;
#10 s=0;r=1;
#10 s=1;r=0;
#10 s=1;r=1;
#50 $finish();
end
initial
$monitor($time,"clk=%b,rst=%b,s=%b,r=%b,q=%b,qb=%b",clk,rst,s,r,q,qb);
endmodule
