module comp(input [1:0]a,b,output grt,lst,equ);
wire grt,lst,equ;
assign grt=(a>b)?1'b1:1'b0;
assign lst=(a<b)?1'b1:1'b0;
assign equ=(a==b)?1'b1:1'b0;
endmodule




module tb;
reg [1:0]a,b;
wire grt,lst,equ;
comp c1(a,b,grt,lst,equ);
initial begin
repeat(5)begin
a=$random;b=$random;
#10;
end
#10 a=2'b11;b=2'b10;
#100 $finish();
end
initial
$monitor($time,"a=%b,b=%b,grt=%b,lst=%b,equ=%b",a,b,grt,lst,equ);
endmodule
