module pror(input [3:0]y,output reg [1:0]a,output reg v);
always @(y)begin
casex(y)
4'b0000:begin
a=2'bxx;v=1'b0;
end
4'b0001:begin
a=2'b00;v=1'b1;
end
4'b001x:begin
a=2'b01;v=1'b1;
end
4'b01xx:begin
a=2'b10;v=1'b1;
end
4'b1xxx:begin
a=2'b11;v=1'b1;
end
endcase
end
endmodule


module tbx;
 reg [3:0]y;
 wire [1:0] a;
 wire v;
 pror pr(y,a,v);
 initial begin
 repeat(10)begin
 y=$random;
 #10;
 end
 end
 initial
 $monitor($time ," y=%b,a=%b,v=%b",y,a,v);
endmodule
