module bcdseven(input [3:0]data,output reg a,b,c,d,e,f,g);
always @(*)begin
case (data)
4'b0000:begin a=1'b1;b=1'b1;c=1'b1;d=1'b1;e=1'b1;f=1'b1;g=1'b0;end
4'b0001:begin a=1'b0;b=1'b1;c=1'b1;d=1'b0;e=1'b0;f=1'b0;g=1'b0;end
4'b0010:begin a=1'b1;b=1'b1;c=1'b0;d=1'b1;e=1'b1;f=1'b0;g=1'b1;end
4'b0011:begin a=1'b1;b=1'b1;c=1'b1;d=1'b1;e=1'b0;f=1'b0;g=1'b1;end
4'b0100:begin a=1'b0;b=1'b1;c=1'b1;d=1'b0;e=1'b0;f=1'b1;g=1'b1;end
4'b0101:begin a=1'b1;b=1'b0;c=1'b1;d=1'b1;e=1'b0;f=1'b1;g=1'b1;end
4'b0110:begin a=1'b1;b=1'b0;c=1'b1;d=1'b1;e=1'b1;f=1'b1;g=1'b1;end
4'b0111:begin a=1'b1;b=1'b1;c=1'b1;d=1'b0;e=1'b0;f=1'b0;g=1'b1;end
4'b1000:begin a=1'b1;b=1'b1;c=1'b1;d=1'b1;e=1'b1;f=1'b1;g=1'b1;end
4'b1001:begin a=1'b1;b=1'b1;c=1'b1;d=1'b1;e=1'b0;f=1'b1;g=1'b1;end
endcase
end
endmodule
 

module tb;
 reg [3:0] data;
 wire a,b,c,d,e,f,g;
 bcdseven bcd(data,a,b,c,d,e,f,g);
 initial begin
 data=0;
 #5 data=1;
 #5 data=2;
 #5 data=3;
 #5 data=4;
 #5 data=5;
 #5 data=6;
 #5 data=7;
 #5 data=8;
 #5 data=9;
 #5 data=1;
 #100 $finish();
 end
 initial
 $monitor($time,"data=%b,a=%b,b=%b,c=%b,d=%b,e=%b,f=%b,g=%b",data,a,b,c,d,e,f,g);
endmodule
